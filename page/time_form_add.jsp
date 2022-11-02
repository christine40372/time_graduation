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
			
			
			String person_id = request.getParameter("person-id");
			String unit_name = request.getParameter("service");
			String service_name = request.getParameter("service-name");
			String service_date = request.getParameter("date");
			String time_number = request.getParameter("time-number");
			String description = request.getParameter("description");
			String c_id = request.getParameter("c_id");
			String s_m_id = request.getParameter("s_m_id");
			
		   
			String select_sql="SELECT  * FROM project.sing_up WHERE `ID` ="+"'"+person_id+"'"+" && `unit_name` ="+"'"+unit_name+"'"+" && `service_name` ="+"'"+service_name+"'"+" && `service_date` ="+"'"+service_date+"'";
			ResultSet tmp =  con.createStatement().executeQuery(select_sql);
			String Member_ID = "";
			String Sing_up_ID = "";
			String Service_ID = "";
			String Chinese_name = "";
			String ID = "";
			String Unit_name = "";
			String Service_name = "";
			String Service_class = "";
			String Service_date = "";
			String Service_sdate = "";
			String Service_edate = "";
			String Service_time1 = "";
			String Service_time2 = "";
			String Service_content = "";
			String insert_sql="";
			while(tmp.next()){
				Member_ID = tmp.getString(2);
				Sing_up_ID = tmp.getString(1);
				Service_ID = tmp.getString(3);
				Chinese_name = tmp.getString(11);
				ID = tmp.getString(13);
				Unit_name = tmp.getString(5);
				Service_name = tmp.getString(4);
				Service_class = tmp.getString(6);
				Service_date = tmp.getString(8);
				Service_sdate = tmp.getString(9);
				Service_edate = tmp.getString(10);
				Service_time1 = tmp.getString(15);
				Service_time2 = tmp.getString(16);
				Service_content = tmp.getString(7);
				insert_sql="INSERT INTO `application` (`member_ID`,`sing_up_ID`,`service_ID`,`chinese_name`,`ID`,`unit_name`,`service_name`,`service_class`,`service_date`,`service_sdate`,`service_edate`,`service_time1`,`service_time2`,`hours`,`service_content`,`time_description`,`certification_ID`, `s_member_ID`)VALUES ("+"'"+Member_ID+"'"+","+"'"+Sing_up_ID+"'"+","+"'"+Service_ID+"'"+","+"'"+Chinese_name+"'"+","+"'"+ID+"'"+","+"'"+Unit_name+"'"+","+"'"+Service_name+"'"+","+"'"+Service_class+"'"+","+"'"+Service_date+"'"+","+"'"+Service_sdate+"'"+","+"'"+Service_edate+"'"+","+"'"+Service_time1+"'"+","+"'"+Service_time2+"'"+","+"'"+time_number+"'"+","+"'"+Service_content+"'"+","+"'"+description+"'"+","+"'"+c_id+"'"+","+"'"+s_m_id+"'"+")";
				con.createStatement().executeUpdate(insert_sql);
				
			}
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("volunteerself.jsp");
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
