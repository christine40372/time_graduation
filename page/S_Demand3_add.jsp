<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
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
           String service_sdate = request.getParameter("service_sdate");
           String service_edate=request.getParameter("service_edate");
           String service_date=request.getParameter("service_date");
           String service_time1=request.getParameter("service_time1");
           String service_time2=request.getParameter("service_time2");
           String people_number = request.getParameter("people_number");
           String service_content=request.getParameter("service_content");
           String address=request.getParameter ("address") ;
           String volunteers_condition=request.getParameter("volunteers_condition");
		   String memberID=request.getParameter("memberID");
		   String new_name=request.getParameter("unit_name");
           String service_name=request.getParameter("service_name");
		   String serviceclass=request.getParameter("serviceclass");
		   String cer=request.getParameter("cer");
//Step 4: 執行 SQL 指令	
           sql="INSERT into `service` (`unit_name`, `service_name`, `service_class`,`service_sdate`, `service_edate`, `service_date`, `service_time1`, `service_time2`, `people_number`, `service_content`, `address`, `volunteers_condition`, `member_ID`, `certification_ID`)VALUES("+"'"+new_name+"'"+","+"'"+service_name+"'"+","+"'"+serviceclass+"'"+","+"'"+service_sdate+"'"+","+"'"+service_edate+"'"+","+"'"+service_date+"'"+","+"'"+service_time1+"'"+","+"'"+service_time2+"'"+","+"'"+people_number+"'"+","+"'"+service_content+"'"+","+"'"+address+"'"+","+"'"+volunteers_condition+"'"+","+"'"+memberID+"'"+","+"'"+cer+"'"+")";
		   con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("../page/serversupplyself.jsp");
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
