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
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="服務提供者"){      			
				String chinese_name = request.getParameter("chinese_name");			
				String service_name = request.getParameter("service_name");
				String unit_name = request.getParameter("unit_name");
				String service_class = request.getParameter("service_class");
				String service_content = request.getParameter("service_content");
				String service_sdate = request.getParameter("service_sdate");
				String service_edate = request.getParameter("service_edate");
				
				String student_id = request.getParameter("student_ID");
				String id = request.getParameter("ID");
				String phone = request.getParameter("phone");
				String d_ate[] = request.getParameterValues("date");
				String timeone[] = request.getParameterValues("timeone");
				String timetwo[] = request.getParameterValues("timetwo");
				String reason[] = request.getParameterValues("reason");
				String sing_up_status ="";
				String radiocheck[] = request.getParameterValues("radiocheck");
				int count = 0;
				count = d_ate.length;
				radiocheck = new String[count];
				
	
		
				//拿service_id & member_id
				String service_id="";
				for(int a=0;a<count;a++){
					
					//拿member_id
					String member_id="";
					String getmember_id ="SELECT `member_ID` FROM `member` WHERE `ID` ='"+id+"'";
					ResultSet Getmember_id =  con.createStatement().executeQuery(getmember_id);
					while(Getmember_id.next()){
						member_id = Getmember_id.getString(1);
					}
					
					//拿service_id
					service_id="";
					String getservice_id ="SELECT `service_ID` FROM `service` WHERE `unit_name` ='"+unit_name+"' AND `service_name`='"+service_name+"' AND `service_date`='"+d_ate[a]+"';";
					ResultSet Getservice_id =  con.createStatement().executeQuery(getservice_id);
					while(Getservice_id.next()){
						service_id = Getservice_id.getString(1);
					}
					
					//拿timecheck
					radiocheck[a]=request.getParameter("radiocheck"+a);
					sing_up_status="";
					if(radiocheck[a].equals("Yes")){
						sing_up_status="報名成功";
					}
					else{
						sing_up_status="報名失敗";
					}
					if(reason[a].equals("")){
						reason[a]="無";
					}
					
					
					//out.print("service_id："+service_id);
					String update_safe ="SET SQL_SAFE_UPDATES = 0;";
					con.createStatement().execute(update_safe);					
					String updatesign_up ="UPDATE `sing_up` SET `sing_up_status`='"+sing_up_status+"',`Rejection`='"+reason[a]+"' WHERE `member_ID`='"+member_id+"' AND `service_ID`='"+service_id+"' AND `service_name`='"+service_name+"' AND `service_content`='"+service_content+"' AND `service_date`='"+d_ate[a]+"' AND `service_time1`='"+timeone[a]+"' AND `service_time2`='"+timetwo[a]+"';";				
					con.createStatement().execute(updatesign_up);
					//out.print("UPDATE `sing_up` SET `sing_up_status`='"+sing_up_status+"',`Rejection`='"+reason[a]+"' WHERE `member_ID`='"+member_id+"' AND `service_ID`='"+service_id+"' AND `service_name`='"+service_name+"' AND `service_content`='"+service_content+"' AND `service_date`='"+d_ate[a]+"' AND `service_time1`='"+timeone[a]+"' AND `service_time2`='"+timetwo[a]+"';");
				}				
			}
			else {
				response.sendRedirect("serversupplysignin.jsp");
			}
		}				

			
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          response.sendRedirect("Vol_Reg_List.jsp");
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
