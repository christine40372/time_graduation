<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8：00-12：00">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <style>@import url("../css/home.css");</style>
    <title>服務查詢</title>
    <style>
      a:hover {
        text-decoration:underline;
        color:black;
      }
      
      /*表格內容*/
      table{
   	    border-collapse: separate;
        border-spacing: 0;
      	width: 770px; 	
   	    /*background-color: #fcd8c8;*/
        /*自動斷行*/
      	word-wrap: break-word;
      	table-layout: fixed;
      }

      /*表格框線*/
      .fancytable{
        border:1px solid #cccccc; padding:5px;
         -webkit-border-radius: 5px;
         -moz-border-radius: 5px;
         border-radius: 5px;
       
      }

       /*表格框線*/
      .fancytable td{
        border:1px solid #cccccc; color:#555555;text-align:center;line-height:28px;
      }
       
      /*表格標題背景色*/
      .headerrow{ 
        /*background-color:#ffffff;*/
        background-image: url(../image/searchbg1.png);
      }

      /*表格奇數列背景色*/
      .datarowodd{
        background-color:#ffffff;
      }

      /*表格偶數列背景色*/
      .dataroweven{
         background-color:#efefef;
      }

     /* .td1{ 
        background-color:#C4E1FF;
        border-radius: 45px;
      }*/


      
    </style>


</head>

<script src="../js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
<script src="../js/Recent_Reg.js"></script>

<body>
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
    
     <div style="background-color: #f4f8f9; margin-top: 70px;">
      <div class="container" style="padding-top: 5ch;" >
        <center><img src="../image/search.png" height="30cm" width="auto"></center>
        <br>
        <table  style="width: 100%;"  cellpadding="0" >
            <tbody >
                <td  colspan="2" class="td1"> 
                    <form action="search.jsp" method="GET"> 
                        <fieldset>
                            <div class="container" style="background-image: url(../image/searchbg.png);border-radius: 5ch;" >
                              <div class="row">
                                <div class="col-md-auto">
									<br>
								  <p>&nbsp;&nbsp;<b>服務類別：</b>
									&nbsp;&nbsp;<input type="checkbox" name="class" value="社會類"/>社會類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="環境類"/>環境類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="教育類"/>教育類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="文化類"/>文化類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="行政類"/>行政類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="交通類"/>交通類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="救護類"/>救護類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="資訊類"/>資訊類
									&nbsp;&nbsp;<input type="checkbox" name="class" value="時間銀行"/>時間銀行
								</p> 
								 <p>
									&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="class" value="終結貧窮" />1.終結貧窮
									&nbsp;&nbsp;<input type="checkbox" name="class" value="消除飢餓"/>2.消除飢餓
									&nbsp;&nbsp;<input type="checkbox" name="class" value="健康與福祉"/>3.健康與福祉
									&nbsp;&nbsp;<input type="checkbox" name="class" value="優質教育"/>4.優質教育
									&nbsp;&nbsp;<input type="checkbox" name="class" value="性別平權"/>5.性別平權
									&nbsp;&nbsp;<input type="checkbox" name="class" value="淨水及衛生"/>6.淨水及衛生
									&nbsp;&nbsp;<input type="checkbox" name="class" value="可負擔的潔淨能源"/>7.可負擔的潔淨能源
									<br>
									&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="class" value="合適的工作及經濟成長"/>8.合適的工作及經濟成長
									<input type="checkbox" name="class" value="工業化、創新及基礎建設"/>9.工業化、創新及基礎建設
									&nbsp;&nbsp;<input type="checkbox" name="class" value="減少不平等"/>10.減少不平等
									&nbsp;&nbsp;<input type="checkbox" name="class" value="永續城鄉"/>11.永續城鄉
									&nbsp;&nbsp;<input type="checkbox" name="class" value="責任消費及生產"/>12.責任消費及生產
									&nbsp;&nbsp;<input type="checkbox" name="class" value="氣候行動"/>13.氣候行動
									<br>
									&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="checkbox" name="class" value="保育海洋生態"/>14.保育海洋生態
									&nbsp;&nbsp;<input type="checkbox" name="class" value="保育陸域生態"/>15.保育陸域生態
									&nbsp;&nbsp;<input type="checkbox" name="class" value="和平、正義及健全制度"/>16.和平、正義及健全制度
									&nbsp;&nbsp;<input type="checkbox" name="class" value="多元夥伴關係"/>17.多元夥伴關係
								 </p>                           
								  <p>&nbsp;&nbsp;<b>服務日期：</b>
									<input name="date1" id="date1" type="date"/>
									<label>~</label>
									<input name="date2" id="date2" type="date"/>                           
								  </p>
								  <p>&nbsp;&nbsp;<b>服務時間：</b>
									<input type="time" name="time1"/>
									<label>~</label>
									<input type="time" name="time2"/>
								  </p>
								</div>
							  </div>
                              <div class="row">
								<div class="col-md-auto">
									<p>&nbsp;&nbsp;<b>服務地點：</b></p>
								</div>
								<div class="col-md-auto">
									<div class="accordion accordion-flush" id="accordionFlushExample" style="width: 550px;">
										<div class="accordion-item">
											<h7 class="accordion-header" id="flush-headingTwo">
											<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
												北部
											</button>
											</h7>
											<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<input type="checkbox" name="address" value="基隆市">基隆市
													&nbsp;<input type="checkbox" name="address" value="台北市">台北市
													&nbsp;<input type="checkbox" name="address" value="新北市">新北市
													&nbsp;<input type="checkbox" name="address" value="桃園市">桃園市
													&nbsp;<input type="checkbox" name="address" value="新竹縣">新竹縣
													&nbsp;<input type="checkbox" name="address" value="新竹市">新竹市
													&nbsp;<input type="checkbox" name="address" value="宜蘭縣">宜蘭縣
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<h7 class="accordion-header" id="flush-headingThree">
											  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
												中部
											  </button>
											</h7>
											<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
											  <div class="accordion-body">
												&nbsp; <input type="checkbox" name="address" value="苗栗縣">苗栗縣
												&nbsp; <input type="checkbox" name="address" value="台中市">台中市
												&nbsp; <input type="checkbox" name="address" value="彰化縣">彰化縣
												&nbsp; <input type="checkbox" name="address" value="南投縣">南投縣
												&nbsp; <input type="checkbox" name="address" value="雲林縣">雲林縣
											  </div>
											</div>
										</div>
										<div class="accordion-item">
											<h7 class="accordion-header" id="flush-headingfour">
											  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefour" aria-expanded="false" aria-controls="flush-collapsefour">
												南部
											  </button>
											</h7>
											<div id="flush-collapsefour" class="accordion-collapse collapse" aria-labelledby="flush-headingfour" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													&nbsp; <input type="checkbox" name="address" value="嘉義縣">嘉義縣
													&nbsp; <input type="checkbox" name="address" value="嘉義市">嘉義市
													&nbsp; <input type="checkbox" name="address" value="台南市">台南市
													&nbsp; <input type="checkbox" name="address" value="高雄市">高雄市
													&nbsp; <input type="checkbox" name="address" value="屏東縣">屏東縣
												</div>
											</div>
										</div>
										<div class="accordion-item">
											<h7 class="accordion-header" id="flush-headingfive">
											  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefive" aria-expanded="false" aria-controls="flush-collapsefive">
												東部
											  </button>
											</h7>
											<div id="flush-collapsefive" class="accordion-collapse collapse" aria-labelledby="flush-headingfive" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													&nbsp; <input type="checkbox" name="address" value="花蓮縣">花蓮縣
													&nbsp; <input type="checkbox" name="address" value="台東縣">台東縣
													&nbsp; <input type="checkbox" name="address" value="澎湖縣">澎湖縣
													&nbsp; <input type="checkbox" name="address" value="連江縣">連江縣
													&nbsp; <input type="checkbox" name="address" value="金門縣">金門縣
												</div>
											</div>
										</div>
									</div>
								</div>
                             </div>
								<br>   
							<div class="row"><center>
								<div class="col-md-auto">
									<center><input type="submit" value="查詢" style="background-color: #FFFFFF; color: #0E90FF; border-radius: 5px; border-color: #E8E8ED">
								</div></center>
							</div>
							<br>
						</div>
                </fieldset>
              </form>  
              </td> 
          </tbody>           
        </table>
        <br>
<%request.setCharacterEncoding("UTF-8");%>
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
						String service_class[] = request.getParameterValues("class");
						String service_date1 = request.getParameter("date1");
						String service_date2 = request.getParameter("date2");
						String service_time1 = request.getParameter("time1");
						String service_time2 = request.getParameter("time2");
						String address[] = request.getParameterValues("address");
						String condition="";
						int countclass = 0;
						int countaddress = 0;
						int x=1;
						
						if(service_class!=null && service_date1!=null && service_date2!=null && service_time1!=null && service_time2!=null && address!=null){
							countclass = service_class.length;//總共選了幾項
							countaddress = address.length;
							condition="SELECT * FROM ( SELECT DISTINCT `member_ID`,`unit_name`,`service_name`,`service_class`,`service_sdate`,`service_edate`,`service_time1`,`service_time2`,`address`,`service_ID`,`certification_ID` FROM `service`)`service` WHERE `service_sdate`>='"+service_date1+"' AND (`service_edate`<='"+service_date2+"' OR `service_sdate`>='"+service_date2+"')AND `service_time1` >='"+service_time1+"'AND `service_time2` <='"+service_time2+"'";
							if(countclass==1){
								condition+="AND `service_class` like '%"+service_class[0]+"%'";
							}
							else{
								condition+="AND (`service_class` like '%"+service_class[0]+"%'";
								for(int y = 1; y < countclass ; y++){
									if(y==countclass-1){
										condition+="OR `service_class` like '%"+service_class[y]+"%')";
									}
									else{
										condition+="OR `service_class` like '%"+service_class[y]+"%'";									
									}
								}
							}
							if(countaddress==1){
								condition+="AND `address` like '%"+address[0]+"%'";
							}
							else{
								condition+="AND (`address` like '%"+address[0]+"%'";
								for(int i =1; i< countaddress; i++){
									if(i==countaddress-1){
										condition+="OR `address` like '%"+address[i]+"%')";
									}
									else{
										condition+="OR `address` like '%"+address[i]+"%'";
									}
								}
							}
							ResultSet rs =  con.createStatement().executeQuery(condition);
	%>
          <table style="width:100%" align="center"  border="2" cellpadding="10" class="fancytable" id="myTable">
            <thead >
            <tr align="center" height="80" class="headerrow" >
			  <th colspan="11">服務單位</th>
              <th colspan="11">服務名稱</th>
              <th colspan="11">服務類別</th>
              <th colspan="11">更多詳細內容</th>
            </tr>
            </thead>
		<form action="search2.jsp" method="GET">
			<input type="hidden" id="getvalue" name="getvalue" value="">
<%				for(int i=0;i<countclass;i++){
%>					<input type="hidden" name="class" value="<%=service_class[i]%>">
<%				}
%>				
<%				for(int i=0;i<countaddress;i++){
%>					<input type="hidden" name="address" value="<%=address[i]%>">
<%				}
%>	
            <tbody>
		<%
						
						while(rs.next()){
		%>
							
							<tr  height="50" class="datarowodd">
								<input type="hidden" name="s_id" value="<%=rs.getString(10)%>">
								<input type="hidden" name="s_m_id" value="<%=rs.getString(1)%>">
								<input type="hidden" name="c_id" value="<%=rs.getString(11)%>">
								<td colspan="11"><input style="border: white; text-align: center;" type="text" value="<%=rs.getString(2)%>" name="unit" readonly="readonly"></td>
								<td colspan="11"><input style="border: white; text-align: center;" type="text" value="<%=rs.getString(3)%>" name="content" readonly="readonly"></td>
								<td colspan="11"><input style="border: white; text-align: center;" type="text" value="<%=rs.getString(4)%>" name="cls" readonly="readonly"></td>
								<td colspan="11">               
								<input class="btn btn-outline-info" type="submit" name="detail" value="查看更多"  onclick="getV(<%=x%>)">            
								</td>
								<input type="hidden" value="<%=x%>">
							</tr>
							<input type="hidden" name="date1" value="<%=service_date1%>">
							<input type="hidden" name="date2" value="<%=service_date2%>">
							<input type="hidden" name="time1" value="<%=service_time1%>">
							<input type="hidden" name="time2" value="<%=service_time2%>">
							<input type="hidden" name="service_sdate" value="<%=rs.getString(5)%>">
							<input type="hidden" name="service_edate" value="<%=rs.getString(6)%>">
		<%
							x++;
						}
						}		
		%>
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
			
            
          </tbody>
		  </form>
          </table>
        
      </div> 
      <br>
     

      <div class="container">
        <div class="row">
            <div class="col-8">
                <ul class="pagination" style="margin-left: 55%;align-items: center;" id="pageModule" style="display: flex;align-items: center;justify-content: center;"></ul>
                <div id="numberPageModule" style="display: flex;align-items: center;justify-content: center;padding-top: 10px;margin-left: 45%;align-items: center;">
                    <label for="numberPage">跳至第</label>
                    <input id="numberPage" type="number" value="1" min="1" max="100">頁
                </div>
            </div>
              
        </div>           
    </div>

     <img style="width:100%; height:auto;" src="../image/newfooter.png" class="img-fluid" >

     <footer style="background-color: #b6c3a7;">
      <div class="container">
        <div class="row">
          <div class="col-8：00-12：00">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
<%
						
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
</body>

</html>