<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">
<head>
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <style>@import url("../css/home.css");</style>
    <title>註冊失敗</title>
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
<body style="background-color: #f4f8f9;">

  <!--頁碼-->
<script src="../js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
<script src="../js/Recent_Reg.js"></script>

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
<div style="margin-top: 70px;">
      <%
		try {
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
						sql="select * from member";
						PreparedStatement pstmt = con.prepareStatement(sql);
						
						request.setCharacterEncoding("UTF-8");
						String com=request.getParameter("com");
						String name=request.getParameter("name");
						String tel=request.getParameter("tel");
						String email=request.getParameter("email");
						String acc=request.getParameter("acc");
						String pwd=request.getParameter("pwd");
						String cls="服務提供者";
						String sts="N";
		   
						sql = "SELECT * FROM `member` WHERE `m_account`='" +acc+ "'"  ; 
						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs=ps.executeQuery();
						if(rs.next()){   
	%>
						<center>
							<h3>帳號已存在，請更改帳號</h3>
							<a href="serversupplysignup.jsp" style="font-size: 20px">重新註冊</a>
						</center>
	<%
						}
						else{
							if(com.equals("")||name.equals("")||tel.equals("")||email.equals("")||acc.equals("")||pwd.equals("")){
	%>
						<center>
							<h3>請完整填寫欄位</h3>
							<a href="serversupplysignup.jsp" style="font-size: 20px">重新註冊</a>
						</center>
	<%							
							}
							else{
								sql = "INSERT INTO `member`(unit_name,chinese_name,phone,email,m_account,m_password,member_class,account_status,registration_date) " + "values(?,?,?,?,?,?,?,?,NOW())";
								PreparedStatement tmt = con.prepareStatement(sql);
								tmt.setString(1, com);
								tmt.setString(2, name);
								tmt.setString(3, tel);
								tmt.setString(4, email);
								tmt.setString(5, acc);
								tmt.setString(6, pwd);
								tmt.setString(7, cls);
								tmt.setString(8, sts);
								tmt.executeUpdate();
								con.close();
								response.sendRedirect("newmember_hs.jsp") ;
							}
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
	</div>
<footer style="background-color: #b6c3a7; position:fixed; bottom: 0px; width:100%;">
	 <img style="width:100%; height:auto;" src="../image/newfooter.png" class="img-fluid; position:fixed; bottom: 0px;" >
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
            <b style="font-size: 3ch;">瀏覽人次:6666人</b>
          </div>      
        </div>               
      </div>     
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
	
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>

</html>