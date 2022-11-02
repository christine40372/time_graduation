<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 

<html lang="en">
<head>
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <style>@import url("../css/home.css");</style>
    <title>拒絕審核</title>
    <style>
      a:hover {
        text-decoration:underline;
        color:black;
      }
      
     
      .btn2{
         float:right;
      }

      .td1{ 
        background-color:#C4E1FF;
        border-radius: 45px;
      }
       
    </style>
</head>
<body>

   <!--原因是否送出-->
   <script> 
    function myFunc() { 
        var r = confirm("拒絕原因是否確認送出？"); 
    
        if (r == true) { 
          alert("已送出");
          location.href='T_time-apply.jsp';
        } 
        else { 
          
        }   
  
      } 
    </script> 

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
	String getvalue = request.getParameter("getvalue");
%>

    <div style="background-color: #f4f8f9; margin-top: 70px;">
        <div class="container" style="padding-top: 5ch;" >
            <h4  align="center" valign="center"><b>拒絕認證</b></h4>
            <br>
        <form action="T_Refuse_add.jsp" method="POST">               
            <table align="center"  cellpadding="50">
              <td class="td1">
                 <br>
                 <p align="center"><b>請輸入拒絕原因</b></p>
					<input type="hidden" name="getvalue" value="<%=getvalue%>">
                 <br>
                    <textarea name="refuse_reason"
                      rows="8"
                      cols="50"
                      required>
                   </textarea>
                  <br>    
                  
                  <view  class="btn2">
                    <input type="submit" value="送出" id="leftButton" onclick="myFunc()"> &nbsp;&nbsp;
                    </view>
                 
                    <view class="btn2">
                    <input type="button" value="上一步" id="rightButton" onclick="location.href='T_time-apply.jsp'">
                    &nbsp;&nbsp;
                    </view>

                    
                </td>
            </table>
	</form>
        </div> 
        <br>
        <br>
    </div>  
    
    <img style="width: 100%; height: auto;" src="../image/newfooter.png" class="img-fluid" >

    <footer class="footer" style="background-color: #b6c3a7;" position: fixed; : 0px; z-index: 2; >
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
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="時數認證者"){
			
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
			}
			else {
				response.sendRedirect("hoursignin.jsp");
			}
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
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
 
   
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>