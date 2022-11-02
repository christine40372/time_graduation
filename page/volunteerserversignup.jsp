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
    <title>志工服務者註冊</title>
    <style>
      a{
  text-decoration: none;
  }
    a:hover{
  text-decoration: underline;
  color: black;
}
    </style>
    <script>
      function myalert() { 
          alert("資料已送出！");
          }
  </script>
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
  <div style="background-color: #FFE8E8;margin-top: 70px;">
                  
  </div>
    
    <main class="container" style="padding-top:60px;">
      <div class="row g-3">
        <div class="col-md-6 card shadow text-center mx-auto">
          <form class="card-body row g-3" action="volunteerserversignup_check.jsp" method="post">
            <h1 class="card-title m-auto fw-lighter">志工服務者註冊</h1>
            <h6 class="card-subtitle m-auto fw-lighter">註冊</h6>
            <form class="card-body row g-3 mx-auto">
                    <div class="form-floating col-md-12">
                        <input type="name" class="form-control" id="name" name="name_CH" placeholder="name">
                        <label for="name">中文姓名</label></div>
                    <div class="form-floating col-md-12">
                        <input type="name" class="form-control" id="name" name="name_EN" placeholder="name">
                        <label for="name">英文姓名</label></div>
                    <div class="form-floating col-md-12">
                        <input type="name" class="form-control" id="name" name="id" placeholder="name">
                        <label for="name">身分證字號</label></div>
                    <div class="form-floating col-md-12">
                        <input type="name" class="form-control" id="name" name="std_id" placeholder="name">
                        <label for="name">學號</label></div>
                    <div class="form-floating col-md-12">
                        <input type="name" class="form-control" id="name" name="tel" placeholder="name">
                        <label for="name">連絡電話</label></div>      
                    <div class="form-floating col-md-12">
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                        <label for="email">電子郵件</label></div>   
                    <div class="form-floating col-md-6">
                        <input type="account" class="form-control" id="account" name="acc" placeholder="Password">
                        <label for="account">帳號</label></div>    
                    <div class="form-floating col-md-6">
                        <input type="password" class="form-control" id="password" name="pwd" placeholder="Password">
                        <label for="password">密碼</label></div>
                    <div class="form-floating row g-3 mx-auto">
                        <span>是否有志工手冊</span>
                        <select aria-label="是否有志工手冊" class="form-select" name="book">
                                <option value="Y">是</option>
                                <option value="N">否</option>
                            </select>
                    </div>        
                    <input class="w-100 btn btn-lg " style="background:#42b72a ;color:white" type="submit" onclick="myalert()" value="送出">
                    <div class="text-muted">or</div>
                    <a class="btn btn-outline-primary" href="../page/volunteerserversignin.jsp">已經有帳號了?按此登入</a>
                </form>
              </form>
            </div>
            <div class="col-md-6 display-5 fw-normal d-flex">
                <img style="width: 100%;height: auto;" src="../image/volunteerserversign.png" ></div>
                <!--<span class="m-auto" >這邊要放照片</span></div>-->
      </div>
    </main>

    <img style="width: 100%;height: auto;" src="../image/X (4).png" class="img-fluid">
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