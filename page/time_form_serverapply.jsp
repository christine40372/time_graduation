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
    <title>服務時數認證申請表單</title>
    <style>
        a:hover {
          text-decoration:underline;
          color:black;
        }
		input::placeholder {
			font-size: 15px;
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
      <div style="padding-top: 15ch;"></div>
      <div class="container">
        <div class="row">
          <div class="col" style="height: fit-content;" >
            <div style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;text-align: center;"><b>服務時數認證申請表單</b></div>
            <hr>
<%
//Step 5: 顯示結果      
						int i=1;
						String getvalue = request.getParameter("getvalue");
						String sql="SELECT `chinese_name`,`ID`,`unit_name`,`service_name`,`service_class`,`service_content`,`service_date`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2' FROM `application` WHERE `service_name` IN ( SELECT `service_name` FROM (SELECT ROW_NUMBER()  OVER (ORDER BY `application_ID`) AS apply_num, `unit_name`,`service_name`,`service_class`,`service_content`,`service_date`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`, `audit_status`,`certification_status`,`Rejection` FROM `application`) AS nothing WHERE `apply_num`='"+getvalue+"')AND `service_date` IN (SELECT `service_date` FROM(SELECT ROW_NUMBER()  OVER (ORDER BY `application_ID`) AS apply_num, `unit_name`,`service_name`,`service_class`,`service_content`,`service_date`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`, `audit_status`,`certification_status`,`Rejection` FROM `application`) AS nothing2 WHERE `apply_num`='"+getvalue+"');";
						ResultSet tmp =  con.createStatement().executeQuery(sql);
						while(tmp.next()){
%>
            <form style="font-size: large;padding-left:3ch;" name="s_reg_form" action="time_form2.jsp" method="post">
                <div class="form-group row">
                 <label for="Name" class="col-5 col-form-label"> <b>姓名</b></label>
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" style="outline: none;" name="Name" value="<%=tmp.getString(1)%>">
                  </div>
                </div>
                <div class="form-group row">
                    <label for="person-id" class="col-5 col-form-label"><b>身份證字號</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" style="outline: none;" name="person-id" value="<%=tmp.getString(2)%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service" class="col-5 col-form-label"><b>服務單位</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" style="outline: none;" name="service" value="<%=tmp.getString(3)%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-name" class="col-5 col-form-label"><b>服務名稱</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" style="outline: none;" name="service-name" value="<%=tmp.getString(4)%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-category" class="col-5 col-form-label"><b>服務類別</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" style="outline: none;" name="service-category" value="<%=tmp.getString(5)%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-content" class="col-5 col-form-label"><b>服務內容</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" style="outline: none;" name="service-content" value="<%=tmp.getString(6)%>">
                    </div>
                </div>
                <div class="row">
                  <div class="col" style="font-weight: bolder;padding-right:0%;">服務日期</div>
                  <div class="col" style="font-weight: bolder;padding-right:0%;margin-left:-5%;">服務時間</div>
                  <div class="col" style="font-weight: bolder;padding-right:0%;padding-left:0%;margin-left:-5%;">申請時數</div>
                  <div class="col" style="font-weight: bolder;padding-left:0%;margin-left:-5%;">說明</div>
                </div>
                <div class="row">
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" style="width:100px;outline: none;" name="date" value="<%=tmp.getString(7)%>">
                  </div>
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" style="margin-left:-15%;outline: none;" name="time-1" value="<%=tmp.getString(8)%>">
                  </div>
				  <div class="col" style="margin-left:-5%;">
                    <input type="text" readonly class="form-control-plaintext" style="margin-left:-40%;outline: none;"  value="~">
                  </div>
				  <div class="col" style="margin-left:-15%;">
                    <input type="text" readonly class="form-control-plaintext" style="margin-left:-40%;outline: none;" name="time-2" value="<%=tmp.getString(9)%>">
                  </div>
                  <div class="col" style="margin-left:-5%;">
                    <input type="number" required class="form-control-plaintext" style="margin-left:-10%;outline: none;"  name="time-number" placeholder="請輸入" value="">
                  </div>
                  <div class="col">
                    <input type="text"  class="form-control-plaintext" style="width:150px;outline: none;" name="description" placeholder="請說明" value="">
                  </div>
                </div>
   <%    				i+=1;	
					}
%>	
				<input type="hidden" name="i" value="<%=i-1%>">
   
				<div class="col" style="padding-left: 70%;padding-top: 5ch;">
                    <button class="btn btn-warning" id="next" type="submit" style="color: white;" >下一步</button></form>
                    <!--href尚未填寫-->
                    <button class="btn btn-success" type="button" onclick="javascript:history.back()" style="color: white;">取消</button>
                </div>
              

              

              
              
            </div>
            <div class="col">
          <div class="col" style="height: fit-content;">
            <img src="../image/time_form.png" class="img-fluid rounded" alt="Responsive image">            
          </div></div>
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