<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">
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
							sql="select * from `service`";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
							rs.last();
							int totalNo=rs.getRow();
							
							String countp="select * from `counter`"; 
							ResultSet r=con.createStatement().executeQuery(countp);
							
							sql="select * from `service`;";
							rs=con.createStatement().executeQuery(sql);
							rs.next();
							
							request.setCharacterEncoding("UTF-8");
							String service_sdate = request.getParameter("service_sdate");
							String service_edate=request.getParameter("service_edate");
							String service_date=request.getParameter("service_date");
							String service_time1=request.getParameter("service_time1");
							String service_time2=request.getParameter("service_time2");
							String people_number = request.getParameter("people_number");
							String service_content=request.getParameter("service_content");
							String address=request.getParameter ("address") ;
							String volunteers_condition=request.getParameter("volunteers_condition");
							String memberID=request.getParameter("memberID");
							String new_name=request.getParameter("unit_name");
							String service_name=request.getParameter("service_name");
							String serviceclass=request.getParameter("serviceclass");
							String cer=request.getParameter("cer");
							
							String cer_ch="";
							if(cer.equals("1")){
								cer_ch = "課外活動指導組";
							}
							else if(cer.equals("2")){
								cer_ch = "中原大學行政單位";
							}
							else if(cer.equals("3")){
								cer_ch = "校外非營利組織";
							}	
								
	%>
    <div style="padding-top: 15ch;"></div>
    <div class="container" style="padding-bottom: 3%;">
      <div class="row">
        <div class="col" style="height: fit-content;" >
          <div style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;text-align: center;"><b>請確認服務需求</b></div>
          <hr>
          <form  action="S_Demand3_add.jsp" method="get" style="font-size: large;">
		  <input type="hidden" name="memberID" value="<%=memberID%>">
            <div class="form-group row">
                <label for="Name" class="col-md-auto col-form-label" > <b>服務單位</b></label>
                 <div class="col-8" style="padding-right: 5ch;">
                    <input type="text" name="unit_name" class="form-control" readonly id="unit" value="<%=new_name%>">
                 </div>
               </div>
               <div class="form-group row">
                   <label for="person-id" class="col-md-auto col-form-label"><b>服務名稱</b></label>
                   <div class="col-8" style="padding-right: 5ch;">
                    <input type="text" name="service_name" class="form-control" readonly id="servicename" value="<%=service_name%>">
                   </div>
               </div>
 
               <div class="form-group row">
                   <label for="service-name" class="col-md-auto col-form-label"><b>服務類別</b></label>
                   <input type="text" name="serviceclass" class="form-control" readonly id="serviceclass" value="<%=serviceclass%>">
               </div>
              <div class="form-group row">
               <label for="Name" class="col-5 col-form-label"> <b>服務開始日期</b></label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <label for="Name" class="col-5 col-form-label"> <b>服務結束日期</b></label>

               <div class="row">
                <div class="col-6">
                    <input type="date" name="service_sdate" class="form-control" readonly id="stardate" value="<%=service_sdate%>">
               </div>
                 <div class="col-6">
                    <input type="date" name="service_edate" class="form-control" readonly id="enddate" value="<%=service_edate%>">
                 </div>
                </div>
              </div>

              <div class="form-group row">
                  <label for="Name" class="col col-form-label"> <b>服務日期</b></label>
                  <label for="Name" class="col col-form-label" style="margin-left: -2ch;"> <b>服務時間</b></label>
                  <div class="col-md-auto" style="margin-left: -4ch;"></div>
                  <div class="col" style="margin-left: -3ch;"></div>
                  <label for="Name" class="col col-form-label"> <b>需求人數</b></label>

                <div class="row">
                  <div class="col">
                    <input type="date" name="service_date" class="form-control" readonly  id="servedate" style="font-size: small;" value="<%=service_date%>">
                  </div>
                  <div class="col">
                      <input type="time" name="service_time1" class="form-control"readonly id="startime"  style="font-size: small;margin-left: -2ch;" value="<%=service_time1%>">
                  </div>
                  <div class="col-md-auto" style="margin-left: -4ch;">
                      ~
                  </div>
                  <div class="col">
                   <input type="time" name="service_time2" class="form-control" readonly   id="endtime" style="font-size: small;margin-left: -3ch;" value="<%=service_time2%>">
                  </div>
                  <div class="col-md-auto">
                    <input type="text" name="people_number" class="form-control" readonly id="numbere"  style="font-size: small;width: 100px;margin-left: -5.5ch;" value="<%=people_number%>">
                   </div>
                </div>
               </div>


            <div class="form-group row">
              <label for="Name" class="col-3 col-form-label"> <b>服務內容</b></label>
              <div class="row">
               <div class="col" >
                 <input type="text" name="service_content" class="form-control"  readonly id="content" value="<%=service_content%>"></input>
              </div>
              </div>
             </div>

             <div class="form-group row">
              <label for="Name" class="col-3 col-form-label"> <b>活動地址</b></label>
              <div class="row">
               <div class="col">
                 <input type="text" name="address" class="form-control" readonly id="address" value="<%=address%>">
              </div>
              </div>
             </div>

             <div class="form-group row">
              <label for="Name" class="col-4 col-form-label"> <b>志工條件說明</b></label>
              <div class="row">
               <div class="col">
                 <input type="text" name="volunteers_condition" class="form-control" readonly id="condition" value="<%=volunteers_condition%>">

               </input>
              </div>
              </div>
             </div>

			<div class="form-group row">
              <label for="Name" class="col-3 col-form-label"> <b>服務認證單位</b></label>
              <div class="row">
               <div class="col">
			   <input type="hidden" name="cer" class="form-control" readonly id="cer" value="<%=cer%>">
                 <input type="text" name="cer_ch" class="form-control" readonly id="cer_ch" value="<%=cer_ch%>">
              </div>
              </div>
             </div>
             
           
           
           
            <script>
                function myalert() { 
                    alert("需求表單已送出！");
                    }
            </script>
              <div class="col-15" style="padding-left: 70%;padding-top: 5ch;">
                    <a href="../page/S_Demand2.jsp"><button class="btn btn-warning" type="button" style="color: white;">上一步</button></a>
                    <a href="../page/serversupplyself.jsp"><button class="btn btn-success" type="submit" style="color: white;" onclick="myalert()" >送出</button></a>
                </div>
				 </form>
            </div>
          <div class="col" style="height: fit-content;">
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
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
</body>

</html>