<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
    <!--頁碼-->
    <script src="../js/jquery-3.6.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
    <script src="../js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
<script src="../js/Recent_Reg.js"></script>

    <style>
      @import url("../css/home.css");
      /*@import url("../css/pagenumber.css");*/
    </style>
    <title>認證通過服務紀錄</title>
    <style>
      a:hover {
        text-decoration:underline;
        color:black;
      }
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
					
					 String countp="select * from `counter`"; 
					 ResultSet r=con.createStatement().executeQuery(countp);
					 
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="志工服務者"){
					 
%>      
  <script>$('#sort-table').bootstrapTable();</script>
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
    </header>

    <!--這裡開始寫-->
    <script>
      $(document).on('click', 'th', function() {
        var table = $(this).parents('table').eq(0);
        var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()));
        this.asc = !this.asc;
        if (!this.asc) {
          rows = rows.reverse();
        }
        table.children('tbody').empty().html(rows);
      });
      function comparer(index) {
        return function(a, b) {
          var valA = getCellValue(a, index),
            valB = getCellValue(b, index);
          return $.isNumeric(valA) && $.isNumeric(valB) ?
            valA - valB : valA.localeCompare(valB);
        };
      }
      function getCellValue(row, index) {
        return $(row).children('td').eq(index).text();
      }
    </script>
    <div style="padding-top: 15ch;"></div>
    <div class="container" style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;padding-bottom: 2ch;"><b>認證通過服務紀錄</b></div>
    <div class="container"style="background-color: white;height: auto;border-radius:10px;width: auto;">       
      <table class="table table-hover tablesorter" style="height: 100px;text-align: center;" id="myTable" >
                  <thead>
                  <tr>
                      <th scope="col"  class="align-middle" style="width:17%;">服務單位</th>
                      <th scope="col"  class="align-middle" style="width: 14%;">服務類別</th>
                      <th scope="col"  class="align-middle" style="width: 10%;">服務名稱</th>
                      <th scope="col"  class="align-middle" style="width: 10%;">服務日期</br>(開始)</th>
					  <th scope="col"  class="align-middle" style="width: 10%;">服務日期</br>(結束)</th>
                      <th scope="col"  class="align-middle" style="width: 9%;">服務時數</th>
                      <th scope="col"  class="align-middle" style="width: 9%;">服務時間</br>(開始)</th>
                      <th scope="col"  class="align-middle" style="width: 2%;"></th>
                      <th scope="col"  class="align-middle" style="width: 9%;">服務時間</br>(結束)</th>
                      <th scope="col"  class="align-middle" style="width: 10%;">認證狀態</th>
                      <th scope="col"  class="align-middle" style="width: 10%;">證書檢視</th>
                  </tr>
                  </thead>
				  <tbody>
<%
//Step 5: 顯示結果      
						String only="SELECT `unit_name`,`service_class`,`service_sdate`,`service_edate`,`service_ID`, `service_name`, `service_content`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`certification_status`,sum(hours) FROM `application` WHERE `service_name` IN (SELECT DISTINCT`service_name` FROM `application`) && `certification_status` ='認證成功' GROUP BY `service_name`";											
						ResultSet onlyone =  con.createStatement().executeQuery(only);
						while(onlyone.next()){
%>								
									 <tr>
										<td><%=onlyone.getString(1)%></td>								
										<td><%=onlyone.getString(2)%></td>
										<td><%=onlyone.getString(6)%></td>
										<td><%=onlyone.getString(3)%></td>
										<td><%=onlyone.getString(4)%></td>
										<td><%=onlyone.getString(11)%></td>
										<td><%=onlyone.getString(8)%></td>				  
										<td>~</td>				  
										<td><%=onlyone.getString(9)%></td>
										<td style="color: #1ead11;"><%=onlyone.getString(10)%></td>
									
										<td><a style="color: #454481;"><a href="../image/CERTIFICATE.png" download>下載</a></a></td>
									</tr> 
	<%						
						}											
%>								
							  </tbody>
						  </table>                
      </div>
      <div class="container">
          <div class="row">
              <div class="col-8" style="padding-top: 10px;">
                  <ul class="pagination" style="margin-left: 55%;align-items: center;" id="pageModule" style="display: flex;align-items: center;justify-content: center;"></ul>
              </div>
                  <div class="col-4" >
                    <div id="numberPageModule" style="display: flex;align-items: center;justify-content: center;padding-top: 10px;margin-left: 45%;align-items: center;">
                      <label for="numberPage">跳至第</label>
                      <input id="numberPage" type="number" value="1" min="1" max="100">頁
                  </div>
                  </div>
          </div>           
      </div>

    <!--寫到這裡-->
    
    <img src="../image/newfooter.png" style="position: relative; margin-bottom: 0px; margin-top: 30px; width: 100%;">
    <footer style="background-color: #b6c3a7; bottom: 0; width: 100%;">
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
				response.sendRedirect("volunteerserversignin.jsp");
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
	  
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
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