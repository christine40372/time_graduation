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
    <title>服務報名清單</title>
    <style>
        a:hover {
          text-decoration:underline;
          color:black;
        }
      </style>
</head>
<script>
  function show() {
   var f = document.forms[0];
   for (var i=0;i<f.elements.length;i++) {
    var e = f.elements[i];
    if (e.type == "checkbox" && e.checked)
     return true;
   }
   alert("服務時段請至少選擇一項！");
   return false;
  }
  </script>
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
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="志工服務者"){
			
		String getmember = "select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
		ResultSet tmp =  con.createStatement().executeQuery(getmember);
		String s_id = request.getParameter("s_id");
		String s_m_id = request.getParameter("s_m_id");
		String c_id = request.getParameter("c_id");
		String unit_name = request.getParameter("unit_name");
		String service_name = request.getParameter("service_name");
		String service_class = request.getParameter("all_service_class");
		String service_content = request.getParameter("service_content");
		String service_sdate = request.getParameter("service_sdate");
		String service_edate = request.getParameter("service_edate");
		String d_ate[] = request.getParameterValues("service_date");
		String timeone[] = request.getParameterValues("timeone");
		String timetwo[] =request.getParameterValues("timetwo");
		int count = 0;
		count = d_ate.length;
		while(tmp.next()){
%>
      <div style="padding-top: 15ch;"></div>
      <div class="container">
        <div class="row">
          <div class="col" style="height: fit-content;" >
            <div style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;text-align: center;"><b>服務報名表單</b></div>
            <hr>
            <form style="font-size: large;padding-left: 8ch;" name="s_reg_form" action="Correct_SRF.jsp" method="POST">
			<input type="hidden" name="s_id" value="<%=s_id%>">
			<input type="hidden" name="s_m_id" value="<%=s_m_id%>">
			<input type="hidden" name="c_id" value="<%=c_id%>">
			<input type="hidden" name="service_sdate" value="<%=service_sdate%>">
			<input type="hidden" name="service_edate" value="<%=service_edate%>">
                <div class="form-group row">
                 <label for="Name" class="col-5 col-form-label"> <b>姓名</b></label>
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" name="chinese_name" id="Name" value="<%=rs5.getString(3)%>">
                  </div>
                </div>
                <div class="form-group row">
                    <label for="person-id" class="col-5 col-form-label"><b>身份證字號</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="ID" id="person-id" value="<%=tmp.getString(10)%>">
                    </div>
                </div>
<%
		}
%>
                <div class="form-group row">
                    <label for="service" class="col-5 col-form-label"><b>服務單位</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="unit_name" id="service" value="<%=unit_name%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-name" class="col-5 col-form-label"><b>服務名稱</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service_name" id="service-name" value="<%=service_name%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-category" class="col-5 col-form-label"><b>服務類別</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service_class" id="service-category" value="<%=service_class%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-content" class="col-5 col-form-label"><b>服務內容</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service_content" id="service-content" value="<%=service_content%>">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-5"><b>服務時間</b></div>
                    <div class="col">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="date" name="timecheck" value="<%=d_ate[0]%> <%=timeone[0]%>~<%=timetwo[0]%>">
                        <label class="form-check-label">
                          <%=d_ate[0]%>
                        </label>
						<input type="hidden" name="service_date" value="<%=d_ate[0]%>">
                        <label class="form-check-label">
                          <%=timeone[0]%>
                        </label>
						<input type="hidden" name="timeone" value="<%=timeone[0]%>">
                        <label>~</label>
                        <label class="form-check-label">
                          <%=timetwo[0]%>
                        </label>
						<input type="hidden" name="timetwo" value="<%=timetwo[0]%>">
                      </div>
                    </div>
                </div>
<%
		for(int a=1;a<count;a++){
%>
				<div class="form-group row">
                    <div class="col-5"></div>
                    <div class="col">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="date"  name="timecheck" value="<%=d_ate[a]%> <%=timeone[a]%>~<%=timetwo[a]%>">
                        <label class="form-check-label">
                          <%=d_ate[a]%>
                        </label>
						<input type="hidden" name="service_date" value="<%=d_ate[a]%>">
                        <label class="form-check-label">
                          <%=timeone[a]%>
                        </label>
						<input type="hidden" name="timeone" value="<%=timeone[a]%>">
                        <label>~</label>
                        <label class="form-check-label">
                          <%=timetwo[a]%>
                        </label>
						<input type="hidden" name="timetwo" value="<%=timetwo[a]%>">
                      </div>
                    </div>
                </div>
<%
		}
			}
			else {
				response.sendRedirect("volunteerserversignin.jsp");
			}
%>
              
              <div style="font-size: large;color: red;">&#10045 報名結果依該服務單位確定後為主</div>
              <div class="col" style="padding-left: 60%;padding-top: 5ch;">
                 <!--href尚未填寫-->
                    <button class="btn btn-warning" type="button" onclick="history.back()" style="color: white;">取消</button>
                    <button class="btn btn-success" id="next" type="submit" style="color: white;" onclick="return show()">下一步</button>
                </div>
				</form>
            </div>
          <div class="col" style="height: fit-content;">
            <img src="../image/registration-form.png" class="img-fluid rounded" alt="Responsive image">            
          </div>
        </div>
      </div>
      <!--footer-->
      <img src="../image/newfooter.png"class="img-fluid">
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