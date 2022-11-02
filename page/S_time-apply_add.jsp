<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>S_time-apply_add</title>
</head>
<body>

<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use project";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
//Step 4: 執行 SQL 指令	
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();

		   String getvalue = request.getParameter("getvalue");
		   sql="UPDATE `application` SET `audit_status`='審核成功' WHERE `ID` =(";
		   sql+="SELECT `ID` FROM (";
		   sql+="SELECT ROW_NUMBER()  OVER (ORDER BY `service_name`,`service_date`) AS apply_num,";
		   sql+="`chinese_name`,`ID`,`service_name`,`service_class`,`service_date`,";
		   sql+="TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',";
		   sql+="TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`,";
		   sql+="DATE_FORMAT(`apply_date`,'%Y-%m-%d') AS 'apply_date',`Rejection`,`audit_status` ";
		   sql+="FROM project.application WHERE `s_member_ID`= "+ rs5.getString(1) +" AND `audit_status` is null";
		   sql+=")AS nothing WHERE `apply_num`="+getvalue+")";
		   sql+="AND";
		   sql+="`service_name` =(";
		   sql+="SELECT `service_name` FROM( ";
		   sql+="SELECT ROW_NUMBER() OVER (ORDER BY `service_name`,`service_date`) AS apply_num,";
		   sql+="`chinese_name`,`ID`,`service_name`,`service_class`,`service_date`,";
		   sql+="TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',";
		   sql+="TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`,";
		   sql+="DATE_FORMAT(`apply_date`,'%Y-%m-%d') AS 'apply_date',`Rejection`,`audit_status` ";
		   sql+="FROM project.application WHERE `s_member_ID`= "+ rs5.getString(1) +" AND `audit_status`is null";
		   sql+=")AS nothing WHERE `apply_num`="+getvalue+")";
		   sql+="AND";
		   sql+="`service_date` =(";
		   sql+="SELECT `service_date` FROM (";
		   sql+="SELECT ROW_NUMBER()  OVER (ORDER BY `service_name`,`service_date`) AS apply_num,";
		   sql+="`chinese_name`,`ID`,`service_name`,`service_class`,`service_date`,";
		   sql+="TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',";
		   sql+="TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`,";
		   sql+="DATE_FORMAT(`apply_date`,'%Y-%m-%d') AS 'apply_date',`Rejection`,`audit_status` ";
		   sql+="FROM project.application WHERE `s_member_ID`= "+ rs5.getString(1) +" AND `audit_status`is null";
	       sql+=")AS nothing WHERE `apply_num`="+getvalue+")";
           sql+="AND";
           sql+="`audit_status` is null";    
           con.createStatement().execute(sql);
		   //out.print(sql);
		
           
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          response.sendRedirect("S_time-apply.jsp"); 
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
