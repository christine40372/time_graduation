<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous"> 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <style>@import url("../css/home.css");</style>
    <title>服務提供者需求表單</title>
    <style>
      
    </style>
</head>

<body style="background-color: #f4f8f9;">
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
				   request.setCharacterEncoding("UTF-8"); 
				   
				   String countp="select * from `counter`"; 
				   ResultSet r=con.createStatement().executeQuery(countp);
				   
		   String memberID=request.getParameter("memberID");
		   String new_name=request.getParameter("unit_name");
           String service_name=request.getParameter("service_name");
		   String sdgs[]=request.getParameterValues("sdgs");
		   String serviceclass="";
		   int count=0;
		   count=sdgs.length;
		for(int i=0;i<count;i++)
		{
			if(i==count-1){
				serviceclass+=sdgs[i];
			}else{
				serviceclass+=sdgs[i]+"/";
			}			
		}
%>  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>

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

    <div style="padding-top: 15ch;"></div>
    <div class="container" style="padding-bottom: 3%;">
      <div class="row">
        <div class="col" style="height: fit-content;" >
          <div style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;text-align: center;"><b>服務需求表單</b></div>
          <hr>
 <form name="form1"  action="S_Demand3.jsp" method="post" style="font-size: large;margin-top: 3ch;">
 <input type="hidden" name="memberID" value="<%=memberID%>">
 <input type="hidden" name="unit_name" value="<%=new_name%>">
 <input type="hidden" name="service_name" value="<%=service_name%>">
   <input type="hidden" name="serviceclass" value="<%=serviceclass%>">
              <div class="form-group row">
               <label for="Name"   class="col-5 col-form-label"> <b>服務開始日期</b></label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <label for="Name" class="col-5 col-form-label"> <b>服務結束日期</b></label>

               <div class="row">
                <div class="col-6">
                  <input type="date" name="service_sdate" class="form-control" placeholder="請輸入服務開始日期" id="stardate">
               </div>
                 <div class="col-6">
                  <input type="date" name="service_edate" class="form-control" placeholder="請輸入服務結束日期" id="enddate">
                 </div>
                </div>
              </div>

              <div class="form-group row">
                  <label for="Name"   class="col col-form-label"> <b>服務日期</b></label>
                  <label for="Name"  class="col col-form-label" style="margin-left: -2ch;"> <b>服務時間</b></label>
                  <div class="col-md-auto" style="margin-left: -4ch;"></div>
                  <div class="col" style="margin-left: -3ch;"></div>
                  <label for="Name"  class="col col-form-label"> <b>需求人數</b></label>

                <div class="row">
                  <div class="col">
                    <input type="date" name="service_date" class="form-control" placeholder="請輸入" id="servedate" style="font-size: small;">
                  </div>
                  <div class="col">
                     <input type="time" name="service_time1" class="form-control" placeholder="請輸入" id="startime" style="font-size: small;margin-left: -2ch;">
                  </div>
                  <div class="col-md-auto" style="margin-left: -4ch;">
                      ~
                  </div>
                  <div class="col">
                   <input type="time"  name="service_time2" class="form-control" placeholder="請輸入" id="endtime" style="font-size: small;margin-left: -3ch;">
                  </div>
                  <div class="col-md-auto">
                    <input type="text" name="people_number" class="form-control" placeholder="請輸入" id="number" style="font-size: small;width: 100px;margin-left: -5.5ch;">
                   </div>
                </div>
               </div>
 
            <input type="button" value="+" style="border-radius:50%;width: 30px;height: 30px;text-align: center;line-height: 14px;" onclick="">

            <div class="form-group row">
              <label for="Name" class="col-3 col-form-label"> <b>服務內容</b></label>
              <div class="row">
               <div class="col" >
                 <textarea name="service_content" class="form-control" placeholder="請輸入" id="content"></textarea>
              </div>
              </div>
             </div>

             <div class="form-group row">
              <label for="Name"  class="col-3 col-form-label"> <b>活動地址</b></label>
              <div class="row">
               <div class="col">
                 <input type="text" name="address" class="form-control" placeholder="請輸入" id="address">
              </div>
              </div>
             </div>

             <div class="form-group row">
              <label for="Name" class="col-4 col-form-label"> <b>志工條件說明</b></label>
              <div class="row">
               <div class="col">
                 <textarea  name="volunteers_condition" class="form-control" placeholder="請輸入" id="condition"></textarea>
              </div>
              </div>
             </div>
			<div class="form-group row">
              <label for="Name"  class="col-3 col-form-label"> <b>服務認證單位</b></label>
              <div class="row">
               <div class="col">
                 <input type="radio" name="cer" id="cer" value="1">課外活動指導組 &nbsp;&nbsp;
				 <input type="radio" name="cer" id="cer" value="2">中原大學行政單位&nbsp;&nbsp;
				 <input type="radio" name="cer" id="cer" value="3">校外非營利組織&nbsp;&nbsp;
              </div>
              </div>
             </div>
             
            
           
            <div class="col-15" style="padding-left: 70%;padding-top: 5ch;">
                  <a href="../page/S_Demand.jsp"><button class="btn btn-warning" type="button" style="color: white;" >上一步</button></a>
                  <button class="btn btn-success" type="submit" style="color: white;">下一步</button>
              </div>
			  </form>
          </div>
        <div class="col" >
          <img src="../image/S_form2.png" class="img-fluid rounded" alt="Responsive image">            
        </div>
      </div>
    </div>

     <!--綠色上半部圖片-->
     <img style="width:100%; height:auto;" src="../image/newfooter.png" class="img-fluid" >

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
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
</body>
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
</html>