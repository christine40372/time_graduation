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
    <style type="text/css">
        input {
          border-radius: 0;
        }
        </style>
        <!--宣告一個變數並賦值為60，也就是倒數計時的秒數。-->
        <script>
         var countdown = 20;
        function settime(obj) {
          if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.value="獲取驗證碼";
            countdown = 20;
            return;
          }
          else {
            obj.setAttribute("disabled", true);
            obj.value="重新傳送(" + countdown + ")";
            countdown--;
          }
          setTimeout(function() {
            settime(obj)
          },1000)
        }
        window.onload = function () {
          var obt = document.getElementById("btn");
          obt.onclick = function () {
            settime(this);
          }
        }
        </script>
    <title>忘記密碼</title>
    <style>
        a{
    text-decoration: none;
    
  }
  a:hover{
    text-decoration: underline;
    color: black;
  }

      </style>
</head>
<body>
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
							sql="USE `project`";
							con.createStatement().execute(sql);
							sql="select * from `member`";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
							rs.last();
							int totalNo=rs.getRow();
							
							String countp="select * from `counter`"; 
							ResultSet r=con.createStatement().executeQuery(countp);
							
							sql="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
							rs=con.createStatement().executeQuery(sql);
							rs.next();
							
							if (session.getAttribute("acc")==null){
								response.sendRedirect("../html/index.jsp");
							}
							else {
								
								
	%>
  <div style="background-color:  #f4f8f9;margin-top: 70px;">                 
</body>
<main class="container" style="padding-top:60px;">
    <div class="mx-auto">
    <div class="row display-5 fw-normal">&nbsp;</div>
    <div class="row card row shadow text-center">
    <h1 class="card-title m-auto fw-lighter">忘記密碼</h1>
    <h6 class="card-subtitle m-auto fw-lighter">請點選獲取驗證碼並至電子郵件信箱獲取驗證碼</h6>
    <br>
    <form class="card-body row g-1 mx-auto" action="forgetpassword2_check.jsp" method="post">
    <div class="row">
        <div class="row justify-content-md-center">
            <div class="col-8">
            <span style="text-decoration:none;">您的電子郵件：</span>
            <span style="text-decoration:none;"><%=rs.getString(5)%></span>
        </div>
		
    <div class="col-4">
        <input type="button" class="w-50 btn btn-primary btn-sm " style="background:#ff8c00 ;color:white" form-control id="btn"  value="獲取驗證碼"/>
    </div>
    <div class="row"><div class="col-8">
        <span style="text-decoration:none;">―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――</span>
    </div>
</div>
    
        
        <input type="account" class="form-control" id="account" name="code" placeholder="請輸入驗證碼">
        <input class="w-100 btn btn-lg " style="background:#42b72a ;color:white ;margin-top:10px" type="submit" value="下一步">

</form>

</div>
</div>
</main>
<img style="width: 100%;height: auto;" src="../image/newfooter.png" class="img-fluid">
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
							}
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
 <!--不確定是甚麼--->
<script src="../js/bootstrap.bundle.min.js"></script>

</body>

</html>