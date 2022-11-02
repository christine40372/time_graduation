<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>@import url("../css/home.css");</style>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
     <script>
      function listBtn(n) {
        var listBtn = document.getElementById(n).value;
        var textlistn = document.getElementById('show-sdgs'); 
        if(listBtn==10 && textlistn.style.display === 'none'){
          textlistn.style.display = 'block';
        }else  {
          textlistn.style.display = 'none';
        } 
      }
      function listBtn2(n) {
        var listBtn = document.getElementById(n).value;
        var textlistn = document.getElementById('show-sdgs2'); 
        if(listBtn==10 && textlistn.style.display === 'none'){
          textlistn.style.display = 'block';
        }else  {
          textlistn.style.display = 'none';
        } 
      }
   </script>
	<!--頁碼-->
	<script src="../js/jquery-3.6.0.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
	<script src="../js/Recent_Reg.js"></script>

    <!--<script src="js/jquery-1.9.1.min.js"></script>-->
    <link href="../css/iconfont.css" rel="stylesheet" />
    <link href="../css/index.css" rel="stylesheet" />
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="../js/f.js"></script>
    <title>刪除服務</title>
    <style>
a{
    text-decoration: none;
    
  }
a:hover{
    text-decoration: underline;
    color: black;
  }
  .t2{
  color:rgb(0, 0, 0) ;
  background-color:	white ;
  font-size: 25px;
  font-family: 微軟正黑體;
  font-weight: bold;
  border-style: outset;
  border-color: #9ec296;
  margin-right:15cm;
  margin-left:1cm;
  border-radius: 30px;
  text-align: center;
} 
.s{
  text-align: left;
  color: black;
  font-size: 15px;
  margin-right: 1cm;
  }
.skills {
    text-align: right;
    color: #5b5858;
  }
div.s{
left:6cm;
}
span.t2{
font-family:微軟正黑體;
font-size:18px;
color:darkslategray;
position: absolute;
top:70px;
left:40px;
}

</style>
</head>
<body >
    <!--功能列-->
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
    <body>
        <div style="margin-top: 70px;">
		<center>
			<h3>資料已成功刪除</h3>
				<a href="timebank.jsp" style="font-size: 20px">回時間銀行頁面</a>
		</center>  
	</div>

<footer style="background-color: #b6c3a7;width: 100%;z-index: 2;position: absolute; bottom: 0;">
    <img style="width: 100%; height: auto; margin-bottom: -3%;" src="../image/newfooter.png" class="img-fluid"> 
    <div class="container">
        <div class="row">
          <div class="col-8" style="padding-bottom: 3ch;">
            <b style="font-size: 3ch;">聯絡資訊</b>
            <br>
            E-mail : VTimezone@gmail.com<br>
            Tel : 0800-000-888<br>
            Copyright © 2022 CYIM. All Rights Reserved<br>
            歡迎您來到-志工時區X時間銀行
          </div>
          <div class="col-4">
            <b style="font-size: 3ch;">瀏覽人次:6666人</b>
          </div>      
        </div>               
      </div>     
      <!--回到頂端-->
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                              
  </footer>
 <!--不確定是甚麼--->
<script src="../js/bootstrap.bundle.min.js"></script>

  
  </body>
  
  </html>