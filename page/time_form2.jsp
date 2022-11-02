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
    <title>請確認申請資料</title>
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
					
					String countp="select * from `counter`"; 
					ResultSet r=con.createStatement().executeQuery(countp);
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
            <div style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;text-align: center;"><b>請確認申請資料</b></div>
            <hr>
<%			
			int a=0;
			int x=1;
			int z=1;
		    int sum=0;
			String name = request.getParameter("Name");
			String person_id = request.getParameter("person-id");
			String unit_name = request.getParameter("service");
			String service_name = request.getParameter("service-name");
			String service_class = request.getParameter("service-category");
			String service_content = request.getParameter("service-content");
			String d_ate = request.getParameter("date");
			String time1 = request.getParameter("time-1");
			String time2 = request.getParameter("time-2");
			String time_number = request.getParameter("time-number");
			String description = request.getParameter("description");
			String c_id = request.getParameter("c_id");
			String s_m_id = request.getParameter("s_m_id");
%>
            <form style="font-size: large;padding-left:3ch;" name="s_reg_form" action="time_form_add.jsp" method="post">
			<input type="hidden" name="c_id" value="<%=c_id%>">
			<input type="hidden" name="s_m_id" value="<%=s_m_id%>">
                <div class="form-group row">
                 <label for="Name" class="col-5 col-form-label"> <b>姓名</b></label>
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" name="Name" value="<%=name%>">
                  </div>
                </div>
                <div class="form-group row">
                    <label for="person-id" class="col-5 col-form-label"><b>身份證字號</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="person-id" value="<%=person_id%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service" class="col-5 col-form-label"><b>服務單位</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service" value="<%=unit_name%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-name" class="col-5 col-form-label"><b>服務名稱</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service-name" value="<%=service_name%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-category" class="col-5 col-form-label"><b>服務類別</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service-category" value="<%=service_class%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="service-content" class="col-5 col-form-label"><b>服務內容</b></label>
                    <div class="col">
                      <input type="text" readonly class="form-control-plaintext" name="service-content" value="<%=service_content%>">
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
                    <input type="text" readonly class="form-control-plaintext" style="width:100px;outline: none;" name="date" value="<%=d_ate%>">
                  </div>
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" style="margin-left:-15%;outline: none;" name="time-1" value="<%=time1%>">
                  </div>
				  <div class="col" style="margin-left:-5%;">
                    <input type="text" readonly class="form-control-plaintext" style="margin-left:-40%;outline: none;"  value="~">
                  </div>
				  <div class="col" style="margin-left:-15%;">
                    <input type="text" readonly class="form-control-plaintext" style="margin-left:-40%;outline: none;" name="time-2" value="<%=time2%>">
                  </div>
                  <div class="col" style="margin-left:-5%;">
                    <input type="number" readonly class="form-control-plaintext" style="margin-left:-10%;outline: none;text-align:center;"  name="time-number" placeholder="請輸入" value="<%=time_number%>">
                  </div>
                  <div class="col">
                    <input type="text" readonly  class="form-control-plaintext" style="width:150px;outline: none;" name="description"  value="<%=description%>">
                  </div>
                </div>
<%
					sum+=Integer.parseInt(time_number);
%>                
                <div class="row">
                  <div class="col"></div>
                  <div class="col"></div>
				  <div class="col"></div>
                  <div class="col" style="font-weight: bolder;">
                    <input type="text" readonly class="form-control-plaintext" style="outline: none;" value="總時數：">
                  </div>
                  <div class="col">
                    <input type="text" readonly class="form-control-plaintext" style="outline: none;" id="total" value="<%=sum%>">
                  </div>
                </div>
			 

              <!--時數申請是否送出-->
                <script> 
                  function myFunc() { 
                      var r = confirm("時數申請表單是否確認送出？"); 
                  
                      if (r == true) { 
                        alert("已送出");
                      } 
                      else { 
                        location.href = time_form2.jsp;
                      }   
                
                    } 
                  </script> 
		
		<div class="col" style="padding-left: 55%;padding-top: 5ch;">
                    <button class="btn btn-warning" id="next" type="submit" style="color: white;" onclick="myFunc()">確定送出</button>
			
                     <a href="../page/time_form.jsp">
                    <button class="btn btn-success" type="button" onclick="history.back()" style="color: white;">上一步</button>
					 </a>
                </div>
            </div>
			</form>
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