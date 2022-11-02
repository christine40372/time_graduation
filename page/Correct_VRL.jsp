<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>@import url("../css/home.css");</style>
    <title>確認報名</title>
    <style>
        a:hover {
          text-decoration:underline;
          color:black;
        }
      </style>
</head>
<body style="background-color: #f4f8f9;">
<% request.setCharacterEncoding("UTF-8");%>
<%  	
    try {
//Step 1: 載入資料庫驅動程式 
        	Class.forName("com.mysql.jdbc.Driver");	  
	//使用JDBC去連結MySQL，所以該行語法的意思，就是要告訴電腦我要使用JDBC
        try {
//Step 2: 建立連線 
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");   
		//建立connection(連線)的語法，url代表我所要連結的MySQL所在IP，root是帳號，1234是密碼
		//此連線是指和mySql連線，不是和存在mySql內的特定資料庫連線。	
//Step 3: 選擇資料庫	
                    con.createStatement().execute("USE `project`");
					
%> 
    <header style="background-color: white; width: 100%; height: 70px; position: fixed; top: 0px; z-index: 2;">
        <div class="container">
            <div class="row"> 
              <div class="col">    
                <a href="../html/index.jsp"><img style="width:150%;height: auto;" src="../image/logo.png" ></a>
              </div>
              <div class="col">                  
                </div>
                <div class="col-md-auto">
                  <a href="../page/guide.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">新手指南</b></a>  
                </div>
                <div class="col-md-auto">
                  <a href="../page/search.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">服務查詢</b></a> 
                </div>
                <div class="col-md-auto">
                  <a href="../page/hoursignin.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">時數認證者</b></a>
                </div>
                <div class="col-md-auto">
                  <a href="../page/serversupplysignin.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">服務提供者</b></a>
                </div>
                <div class="col-md-auto">
                  <a href="../page/volunteerserversignin.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">志工服務者</b></a>
                </div>
                <div class="col-md-auto">
                  <a href="../page/aboutus.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">關於我們</b></a>
                </div>
              </div>
          </div>
      </header>
<%
	int i=0;
	String service_name = request.getParameter("service_name");
	String unit_name = request.getParameter("unit_name");
	String service_class = request.getParameter("service_class");
	String service_content = request.getParameter("service_content");
	String service_sdate = request.getParameter("service_sdate");
	String service_edate = request.getParameter("service_edate");


	String student_name = request.getParameter("student_name");
	String student_id = request.getParameter("student_ID");
	String id = request.getParameter("ID");
	String phone = request.getParameter("phone");
	String d_ate[] = request.getParameterValues("date");
	String timeone[] = request.getParameterValues("timeone");
	String timetwo[] = request.getParameterValues("timetwo");
	String timecheck[];
	String reason[] = request.getParameterValues("reason");
	String yes = "";
	String no = "";
	String radiocheck="";
	int count = 0;
	count = d_ate.length;
	timecheck = new String[count];
	
%>	  
      <div style="padding-top: 15ch;"></div>
      <div class="rounded-pill border border-info "style="background-color:white;width: 13%;height: 50px;position: absolute;margin-left:15%;margin-top:-1.5%; "><h3 style="text-align:center;line-height: 50px;"><b ><%=student_name%></b></h3></div>
      <div class="container border border-info" style="padding: 5ch; background-color: white;">
        <form style="font-size: large;" action="Correct_VRL_add.jsp" method="POST">
			<input type="hidden" name="chinese_name" value="<%=student_name%>">
			<input type="hidden" name="service_name" value="<%=service_name%>">
			<input type="hidden" name="unit_name" value="<%=unit_name%>">
			<input type="hidden" name="service_class" value="<%=service_class%>">
			<input type="hidden" name="service_content" value="<%=service_content%>">
			<input type="hidden" name="service_sdate" value="<%=service_sdate%>">
			<input type="hidden" name="service_edate" value="<%=service_edate%>">
			
          <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">學號</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" name="student_ID"  value="<%=student_id%>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">身分證字號</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" name="ID"  value="<%=id%>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">連絡電話</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control-plaintext" name="phone"  value="<%=phone%>">
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">服務時段</label>
            <div class="col-sm-10">
<%			
		for(int a=0;a<count;a++){
			
			timecheck[a]=request.getParameter("timecheck"+a);
			yes="";
			no="";
			radiocheck="";
			if(timecheck[a].equals("Yes")){
				yes="checked";
				radiocheck="Yes";
			}
			else{
				no="checked";
				radiocheck="No";
			}
%>
			<input type="hidden" name="radiocheck<%=a%>" value="<%=radiocheck%>">
              <div class="row">
                <div class="col-sm-2">
                  <input type="text" readonly class="form-control-plaintext" name="date"  value="<%=d_ate[a]%>">
                </div>
				<div class="col-sm-1">
                  <input type="text" readonly class="form-control-plaintext" name="timeone"  value="<%=timeone[a]%>">
                </div>
				<div class="col-sm-1" style="text-align:center;">
                  ~
                </div>
				<div class="col-sm-1">
                  <input type="text" readonly class="form-control-plaintext" name="timetwo"  value="<%=timetwo[a]%>">
                </div>
                <div class="col-sm-1">
                  <input type="radio" class="btn-check" name="timecheck<%=a%>" id="timecheck<%=i%>-agree" value="Yes" autocomplete="off" <%=yes%> disabled>
                  <label class="btn btn-outline-success" for="timecheck<%=i%>-agree">&#10003</label>
                </div>

                <div class="col-sm-1">
                  <input type="radio" class="btn-check" name="timecheck<%=a%>" id="timecheck<%=i%>-disagree" value="No" autocomplete="off" <%=no%> disabled>
                  <label class="btn btn-outline-danger" for="timecheck<%=i%>-disagree">&#10005</label>
                </div>

                <div class="col-sm-4">
                  原因：<input type="text" name="reason" value="<%=reason[a]%>" readonly>
                </div>                
              </div>
<%
	i++;
	}
	
%>
		  
            </div>
          </div>
        
        <div class="row no-gutters">
            <div class="col-12 col-sm-6 col-md-8"></div>
            <script>
                function myalert() { 
                    alert("資料已送出！");
                    }
            </script>
                <div class="col-auto" style="padding-left: 15%;">
                    <button class="btn btn-warning" type="button" style="color: white;" onclick="history.back()">上一步</button>
                    <!--href尚未填寫-->
                    <button class="btn btn-success" type="submit" style="color: white;" onclick="myalert()">確認送出</button>
                </div>
            </div>
			</form>
          </div>       
      </div>
	  
      <!--footer-->
      <img src="../image/newfooter.png"class="img-fluid" style="box-sizing: border-box; bottom: 13ch;">
      <footer style="background-color: #b6c3a7;padding-bottom: 3ch; box-sizing: border-box; bottom: 0;width: 100%;" >
        <div class="container">
          <div class="row">
            <div class="col-8">
              <b style="font-size: 2ch;">聯絡資訊</b>
              <br>
              E-mail : VTimezone@gmail.com<br>
              Tel : 0800-000-888<br>
              Copyright © 2022 CYIM. All Rights Reserved<br>
              歡迎您來到-志工時區X時間銀行
            </div>
            <div class="col-4">
              <b style="font-size: 2ch;">瀏覽人次:6666人</b>
            </div>      
          </div>               
        </div>     
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
      <script src="../js/home.js"></script>                     
      </footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>    
<%
//Step 5: 顯示結果 				
		   //if(con.isClosed())
		//con.isClosed()會回傳True或是false來表示是否連線成功
              //out.println("連線建立失敗");
           //else
              //out.println("連線成功");
//Step 6: 關閉連線
           con.close();
		
        }            
        catch (SQLException sExec) {
           out.println("SQL錯誤!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException err) {
          out.println("class錯誤" + err.toString());
    }    
%>
</body>
</html>