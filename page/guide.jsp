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
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/card.css">
    <link rel="stylesheet" href="../css/about.css">
    <link rel="stylesheet" href="../css/contact.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <link rel="icon" href="../img/logo.png" type="image/x-icon" />
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>新手指南</title>
    <script>
        window.onload = function(){
            var i1 = document.getElementById("1");
            i1.style.opacity = 1;
            var i2 = document.getElementById("2");
            i2.style.opacity = 1;
            var a1 = document.getElementById("a1");
            a1.style.opacity = 1;
            var s1 = document.getElementById("s1");
            s1.style.opacity = 1;
            var v1 = document.getElementById("v1");
            v1.style.opacity = 1;
        }
    </script>
    <style>
        a{
          text-decoration: none;
        }
        a:hover{
          text-decoration: underline;
          color: black;
        }
        .i1{
            opacity: 0;
            transition: opacity 2s;
        }
        .i2{
            opacity: 0;
            transition: opacity 2s 1.5s;
        }
        .a1{
            opacity: 0;
            transition: opacity 2s 2.5s;
        }
        .s1{
            opacity: 0;
            transition: opacity 2s 2.5s;
        }
        .v1{
            opacity: 0;
            transition: opacity 2s 2.5s;
        }
    </style>
</head>
<header style="background-color: white; width: 100%; height: 70px; position: fixed; top: 0px; z-index: 600;">
    <div class="container">
        <div class="row"> 
          <div class="col">    
            <a href="../html/index.jsp"><img style="width:auto;height: 70px ;" src="../image/logo.png" ></a>
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
  <div style="margin-top: 70px;"><br></div>
<body style="background-color: #F1EDC3;">
    <center><img src="../image/2.png" width="35%"></center>
    <img src="../image/1-1.png" id="1" class="i1" height="120px" style="float: right;"><br>
    <img src="../image/1-2.png" id="2" class="i2" height="167px" style="margin-top: 120px;"><br><br>
    
    <div class="container">
      <div class="row">
        <div class="col">
          <a href="#3"><img src="../image/a1.png" onmouseover="this.src='../image/a2.png';" onmouseout="this.src='../image/a1.png';" id="a1" class="a1" height="100px" style="margin-left: 100px;"></a>
        </div>
        <div class="col">
          <a href="#4"><img src="../image/s1.png" onmouseover="this.src='../image/s2.png';" onmouseout="this.src='../image/s1.png';" id="s1" class="s1" height="100px" style="margin-left: 30px;"></a>
        </div>
        <div class="col">
          <a href="#6"><img src="../image/v1.png" onmouseover="this.src='../image/v2.png';" onmouseout="this.src='../image/v1.png';" id="v1" class="v1" height="100px" style="margin-left: 30px;"></a>
        </div>
      </div>
    </div>
    <br>

    <img src="../image/3.png" id="3" width="100%">
    <img src="../image/4.png" id="4" width="100%">
    <img src="../image/5.png" id="5" width="100%">
    <img src="../image/6.png" id="6" width="100%">
    <img src="../image/7.png" id="7" width="100%">
    <img src="../image/8.png" id="8" width="100%">
    <img src="../image/9.png" id="9" width="100%">
    <img src="../image/10.png" id="10" width="100%">
    <img src="../image/11.png" id="11" width="100%">
    <img src="../image/12.png" id="12" width="100%">
    <img src="../image/13.png" id="13" width="100%">

    <img style="width: 100%;height: auto;" src="../image/yellowfooter.png" class="img-fluid">

<footer style="background-color: #b6c3a7;">
    <div class="container">
      <div class="row">
        <div class="col-8">
          <b style="font-size: 3ch;">聯絡資訊</b>
          <br>
          E-mail : VTimezone@gmail.com<br>
          Tel : 0800-000-888<br>
          Copyright © 2022 CYIM. All Rights Reserved<br>
          歡迎您來到-志工時區X時間銀行
        </div>
        <div class="col-4">
		 <%
try {
//Step 1: 載入資料庫驅動程式 
  Class.forName("com.mysql.jdbc.Driver");
  try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
		String countString;
		int Count;
        if(con.isClosed())
           out.println("連線建立失敗");
        else
        {
//Step 3: 選擇資料庫	        
           String sql="USE `Project`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令
           String countp="select * from `counter`"; 
		  ResultSet r=con.createStatement().executeQuery(countp);
		   
//Step 5: 顯示結果  

				while(r.next()) 
            {
				String c_S= r.getString(1); 
				int c=Integer.parseInt(c_S); 

				if (session.isNew()) { 
					c++; 
				countp="update `counter` set `count`=" + c; 
				%>
				
				
				<b style="font-size: 3ch;">
				<%
				out.print("瀏覽人次："+c+"人"+"<br/>");
				%>
				</b>
	
				<%
			}
			else  
			{
				%>
				
				<b style="font-size: 3ch;">
				<%
				out.print("瀏覽人次："+c+"人"+"<br/>");

			} 

			}
			con.createStatement().execute(countp); 
			%> 
				

          </div>      
        </div>               
      </div> 
	 
<%
//Step 6: 關閉連線
        con.close();
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
    <!--回到頂端-->
    <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
  <script src="../js/home.js"></script>                     
  </footer>

<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>