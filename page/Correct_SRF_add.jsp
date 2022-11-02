<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
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
			
			String s_id = request.getParameter("s_id");
			String s_m_id = request.getParameter("s_m_id");
			String c_id = request.getParameter("c_id");
			String chinese_name = request.getParameter("chinese_name");			
			String service_name = request.getParameter("service_name");
			String unit_name = request.getParameter("unit_name");
			String service_class = request.getParameter("service_class");
			String service_content = request.getParameter("service_content");
			String service_sdate = request.getParameter("service_sdate");
			String service_edate = request.getParameter("service_edate");			
			String id = request.getParameter("ID");
			String timecheck[] = request.getParameterValues("timecheck");
			
			int count = 0;
			count = timecheck.length;
			
			
			
			//拿service_id & member_id&student_id&phone
			String service_id="";
			String d_ate = "";
			String timeone = "";
			String timetwo = "";
			for(int a=0;a<count;a++){
				
				//拿member_id
				String member_id="";
				String student_id="";
				String phone="";
				String getmember_id ="SELECT `member_ID`,`student_ID`,`phone` FROM `member` WHERE `ID` ='"+id+"'";
				ResultSet Getmember_id =  con.createStatement().executeQuery(getmember_id);
				while(Getmember_id.next()){
					member_id = Getmember_id.getString(1);
					student_id = Getmember_id.getString(2);
					phone = Getmember_id.getString(3);
					
				}
				
				//分開d_ate/time1/time2
				 d_ate = timecheck[a].substring(0,10);
				 timeone = timecheck[a].substring(11,16);
				 timetwo = timecheck[a].substring(17,22);
				
				//拿service_id
				service_id="";
				String getservice_id ="SELECT `service_ID` FROM `service` WHERE `unit_name` ='"+unit_name+"' AND `service_name`='"+service_name+"' AND `service_date`='"+d_ate+"';";
				ResultSet Getservice_id =  con.createStatement().executeQuery(getservice_id);
				while(Getservice_id.next()){
					service_id = Getservice_id.getString(1);
				}
				
				
				
				
				// out.print("service_id："+service_id);
				// out.print("member_id："+member_id);
				// out.print("student_id："+student_id);
				// out.print("phone："+phone);
				String insertsign_up ="INSERT INTO `sing_up` (`member_ID`,`service_ID`,`service_name`,`unit_name`,`service_class`,`service_content`,`service_date`,`service_sdate`,`service_edate`,`chinese_name`,`student_ID`,`ID`,`phone`,`service_time1`,`service_time2`,`s_member_ID`,`certification_ID`) VALUES ('"+member_id+"','"+s_id+"','"+service_name+"','"+unit_name+"','"+service_class+"','"+service_content+"','"+d_ate+"','"+service_sdate+"','"+service_edate+"','"+chinese_name+"','"+student_id+"','"+id+"','"+phone+"','"+timeone+"','"+timetwo+"','"+s_m_id+"','"+c_id+"');";				
				con.createStatement().execute(insertsign_up);
				//out.print("INSERT INTO `sing_up` (`member_ID`,`service_name`,`unit_name`,`service_class`,`service_content`,`service_date`,`service_sdate`,`service_edate`,`chinese_name`,`student_ID`,`ID`,`phone`,`service_time1`,`service_time2`) VALUES ('"+member_id+"','"+service_name+"','"+unit_name+"','"+service_class+"','"+service_content+"','"+d_ate+"','"+service_sdate+"','"+service_edate+"','"+chinese_name+"','"+student_id+"','"+id+"','"+phone+"','"+timeone+"','"+timetwo+"');");
			}
			
		   
			
				
			}
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          response.sendRedirect("search.jsp");
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
