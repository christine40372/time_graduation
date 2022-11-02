<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>@import url("../css/home.css");</style>
    <title>審核活動報名清單</title>
    <style>
        a:hover {
          text-decoration:underline;
          color:black;
        }
      </style>
</head>
<!--頁碼-->
<script src="../js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
<script src="../js/Recent_Reg.js"></script>

<body style="background-color: #f4f8f9;">
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
							String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
							ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
							rs5=con.createStatement().executeQuery(sql5);
							rs5.next();
											
							if (session.getAttribute("acc")!=null && session.getAttribute("status")=="服務提供者"){
							sql="SELECT ROW_NUMBER() OVER (ORDER BY `service_name`) AS apply_num,`service_name`,`unit_name`,`service_class`,`service_content`,`service_sdate`,`service_edate`,`sing_up_status`FROM (SELECT  DISTINCT `service_name`,`unit_name`,`service_class`,`service_content`,`service_sdate`,`service_edate`,`sing_up_status`FROM `sing_up` WHERE `s_member_ID`='"+ rs5.getString(1) +"' AND `sing_up_status` is NULL)AS nothing;";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
							rs.last();
							int totalNo=rs.getRow();	
	%>
      <div style="padding-top: 15ch;"></div>
      <div class="container" style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;padding-bottom: 2ch;"><b>審核活動報名清單</b></div>
      <div class="container" style="background-color: white;height: auto;border-radius:10px;width: auto;">
		<form action="Vol_Reg_List.jsp" method="POST">
			<input type="hidden" id="getvalue" name="getvalue" value="">
        <table class="table table-hover"  id="myTable">
            <thead>
              <tr>
                <th style="width: 15ch;" scope="col">服務名稱</th>
                <th  style="width: 10ch;"scope="col">單位名稱</th>
                <th  style="width: 10ch;"scope="col">服務類別</th>
                <th  style="width: 10ch;"scope="col">服務內容</th>
                <th  style="width: 10ch;"scope="col">服務開始日期</th>
                <th  style="width: 10ch;"scope="col">服務結束日期</th>
                <th style="width: 1ch;" scope="col"></th>
              </tr>
            </thead>
            <tbody>
	<%
			  sql="SELECT ROW_NUMBER() OVER (ORDER BY `service_name`) AS apply_num,`service_name`,`unit_name`,`service_class`,`service_content`,`service_sdate`,`service_edate`,`sing_up_status`FROM (SELECT  DISTINCT `service_name`,`unit_name`,`service_class`,`service_content`,`service_sdate`,`service_edate`,`sing_up_status`FROM `sing_up` WHERE `s_member_ID`='"+ rs5.getString(1) +"' AND `sing_up_status` is NULL)AS nothing;";
			  rs=con.createStatement().executeQuery(sql);
			  for(int i=0; i<totalNo; i++){
				  rs.next();
	%>
				  <tr>
					<th scope="row"><%=rs.getString(2)%></th>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><button type="submit" class="btn btn-outline-success" onclick="getV(<%=i+1%>)">進入</button></td>
				  </tr>
	<%
			  }
	%>
            </tbody>
          </table>
		  </form>
      </div>
      <div class="container">
        <div class="row">
            <div class="col-8">
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
<script>
		function getV(n){
		var counttable="";//設拿到按鈕號碼的變數
		var getvalue="";
		counttable=n;
		getvalue=document.getElementById("getvalue");
		getvalue.value=counttable;
		console.log(getvalue.value); //可以在f12中的主控台看到取的按鈕號碼有沒有對
	}
</script>	
	<%				}
							else {
								response.sendRedirect("serversupplysignin.jsp");
							}	
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
      <!--footer-->
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
                <b style="font-size: 3ch;">瀏覽人次:6666人</b>
              </div>      
            </div>               
          </div>     
          <!--回到頂端-->
          <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
        <script src="../js/home.js"></script>                     
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
      <script src="../js/home.js"></script>                     
      </footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>    
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
</body>
</html>


<!--
<tbody>
              <tr>
                <th scope="row">資料及文書處理志工</th>
                <td>新北市新莊區衛生所</td>
                <td>醫療衛生/資訊服務/健康與福祉</td>
                <td>資料鍵入及文書處理</td>
                <td>2022.05.26</td>
                <td>2022.05.26</td>
                <td><a href="../page/Vol_Reg_List.html" target="_blank"><button type="button" class="btn btn-outline-success">進入</button></a></td>
              </tr>
              <tr>
                <th scope="row">溪湖糖廠春遊趣</th>
                <td>新北市新莊區衛生所</td>
                <td>文化推廣</td>
                <td>幫助交通疏散，協助工作人員雜事等</td>
                <td>2022.06.01</td>
                <td>2022.06.03</td>
                <td><a href="../page/Vol_Reg_List.html" target="_blank"><button type="button" class="btn btn-outline-success">進入</button></a></td>
              </tr>
              <tr>
                <th scope="row">糖廠運作介紹</th>
                <td>新北市新莊區衛生所</td>
                <td>文化推廣</td>
                <td>幫助交通疏散，協助工作人員雜事等</td>
                <td>2022.06.05</td>
                <td>2022.06.05</td>
                <td><a href="../page/Vol_Reg_List.html" target="_blank"><button type="button" class="btn btn-outline-success">進入</button></a></td>
              </tr>
            </tbody>
-->