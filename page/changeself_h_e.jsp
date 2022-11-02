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
    <title>修改個人資料</title>
    <style>
a{
    text-decoration: none;
    
  }
a:hover{
    text-decoration: underline;
    color: black;
  }
.overlay1 {
  position: absolute;
  top: 3.5cm;
  left: 51%;
  border-radius: 10%;
  height: 15cm;
  width:15cm;
  opacity: 0;
  transition: 0.4s ease;
  background-color: #b6c3a7;
}
.overlay1:hover {
  opacity: 0.5;
}
.click {
  padding-top: 220px;
  font-size: 30px;
  color: white;
  font-weight: 500;
  text-align: center;
}
input {
        display: none;
        width: 5cm;
      }

      .icon {
        width: 3vw;
      }
      figure {
        display: block;
        margin: 0;
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
							
							String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
							ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
							rs5=con.createStatement().executeQuery(sql5);
							rs5.next();
											
							if (session.getAttribute("acc")!=null && session.getAttribute("status")=="時數認證者"){
	%>

<div style="background-color: #fe0909;margin-top: 70px;">
</div>  
<main class="container" style="padding-top:60px;">
    <div class="row g-3">
      <div class="col-md-6 card shadow text-center mx-auto">
          <form class="card-body row g-3" action="changeself_h_e_check.jsp" method="post">
            <h1 class="card-title m-auto fw-lighter">修改個人資料</h1>
            <h6 class="card-subtitle m-auto fw-lighter" style="color: red;">請確認米字號(*)欄位都已填寫</h6>
                    <input type="text" readonly class="form-control-plaintext" style="text-align: center;font-size:20px" name="com" value="<%=rs.getString(2)%>">
                <div class="form-floating col-md-12">
                    <input type="name" class="form-control" id="name" name="name" placeholder="name">
                    <label for="name">*承辦人姓名</label></div>
               <div class="form-floating col-md-12">
                    <input type="name" class="form-control" id="name" name="tel" placeholder="name">
                    <label for="name">*承辦人電話</label></div>
                <div class="form-floating col-md-12">
                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                    <label for="email">*承辦人電子郵件</label></div>
                    <input class="w-100 btn btn-lg " style="background:#42b72a ;color:white" type="submit" value="儲存">
                <div class="text-muted">or</div>
                <a class="btn btn-outline-primary" href="../page/hourself_e.jsp">取消</a>
          </form>
						
					
        </div>
        <div class="col shadow" style="background-color:#f5f5f4;"><img src="../image/book.png" height="100%"></div>
        <div class="col-md-5 card shadow text-center mx-auto">
          <form class="card-body">
            <h1 class="card-title m-auto fw-lighter">更換照片</h1>
          <img style="width:auto;height: 50%;" src="../image/po.jpg" class="img-fluid">
          <!--<img style="width: auto;height: auto;"src="../image/po.png" class="rounded float-start">-->
          <HR style="border:3 dashed #ff0033" width="100%" SIZE=5>
          <div style="height: 3cm;">
              <input id="customFileInput" type="file" accept="image/*">
              <label for="customFileInput" class="button-primary">
                <p style="font-size: 15px;"><img class="icon" src="../image/file.svg" alt="上傳檔案">
                點此選擇檔案</p>
                <hr width=425 size=5>
              </label>
              <p style="font-size: 5px;height: 0.01cm;">檔名：<span id="file_name"></span></p>
              <p style="font-size: 5px;height: 0.01cm;">類型：<span id="file_type"></span></p>
              <p style="font-size: 5px;height: 0.01cm;">大小：<span id="file_size"></span></p>
              <p style="font-size: 5px;height: 0.01cm;">最後更新時間：<span id="file_time"></span></p>
              <p style="font-size: 5px;height: 0.01cm;">縮圖：</p>
              <figure>
                <img id="file_thumbnail" height="60cm">
              </figure>
            </div>
            
          </div>
        </form>
          <script>
          
            var inputFile = document.getElementById('customFileInput');
      
            inputFile.addEventListener('change', function(e) {
      
              var fileData = e.target.files[0]; // 檔案資訊
              var fileName = fileData.name; // 檔案名稱
              var fileType = fileData.type; // 檔案類型
              var fileSize = Math.floor(fileData.size * 0.001); // 檔案大小轉成kb
              var fileTime = fileData.lastModifiedDate;
      
              console.log(fileData); // 用開發人員工具可看到資料
      
              document.getElementById('file_name').innerText = fileName;
              document.getElementById('file_type').innerText = fileType;
              document.getElementById('file_size').innerText = fileSize + 'kb';
              document.getElementById('file_time').innerText = fileTime;
              document.getElementById('file_thumbnail').src = URL.createObjectURL(fileData);
      
            }, false);
      
          </script>
        </form>
    </div>
        
      
    </div> 
</main>




<img style="width: 100%; height: auto;" src="../image/X (4).png" class="img-fluid">
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
							}
							else {
								response.sendRedirect("hoursignin.jsp");
							}
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
 <!--不確定是甚麼--->
<script src="../js/bootstrap.bundle.min.js"></script>

  
  </body>
  
  </html>