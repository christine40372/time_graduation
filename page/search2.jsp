<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8：00-12：00">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <style>@import url("../css/home.css");</style>
    <title>服務詳細資訊</title>
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
        background-color:#E8FFF5;
      }

      /*表格奇數列背景色*/
      .datarowodd{
        background-color:#ffffff;
      }

      /*表格偶數列背景色*/
      .dataroweven{
         background-color:#efefef;
      }

      .td1{ 
        background-color:#C4E1FF;
        border-radius: 45px;
      }
  
      .btn2{
         float:right;
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
%>

  <!--需求是否送出
  <script> 
    function myFunc() { 
        var r = confirm("確認是否報名？"); 
    
        if (r == true) { 
          alert("已報名")
        } 
        else { 
          
        }   
  
      } 
    </script> -->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
 
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
   <% request.setCharacterEncoding("UTF-8");%>
 <%						
						String getvalue = request.getParameter("getvalue");
						String s_id = request.getParameter("s_id");
						String s_m_id = request.getParameter("s_m_id");
						String c_id = request.getParameter("c_id");
						String service_sdate = request.getParameter("service_sdate");
						String service_edate = request.getParameter("service_edate");
						String all_service_class = request.getParameter("cls");
						String service_class[]= request.getParameterValues("class");
						String service_date1 = request.getParameter("date1");
						String service_date2 = request.getParameter("date2");
						String service_time1 = request.getParameter("time1");
						String service_time2 = request.getParameter("time2");
						String address[] = request.getParameterValues("address");
						String condition="";
						String condition2="";
						int countclass = 0;
						int countaddress = 0;
						
						if(service_class!=null && service_date1!=null && service_date2!=null && service_time1!=null && service_time2!=null && address!=null){
							countclass = service_class.length;//總共選了幾項
							countaddress = address.length;
							condition="SELECT * FROM (SELECT ROW_NUMBER()  OVER (ORDER BY`unit_name`) AS apply_num,`unit_name`,`service_name`,`service_class`,`service_sdate`,`service_edate`,`service_time1`,`service_time2`,`address`,`volunteers_condition`,`service_content` FROM ( SELECT DISTINCT `unit_name`,`service_name`,`service_class`,`service_sdate`,`service_edate`,`service_time1`,`service_time2`,`address`,`volunteers_condition`,`service_content` FROM `service`)`service` WHERE `service_sdate`>='"+service_date1+"' AND (`service_edate`<='"+service_date2+"' OR `service_sdate`>='"+service_date2+"')AND `service_time1` >='"+service_time1+"'AND `service_time2` <='"+service_time2+"'";
						    condition2="SELECT DISTINCT `service_name`,`service_date`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`people_number` FROM `service` WHERE `service_name` IN ( SELECT `service_name` FROM (SELECT ROW_NUMBER()  OVER (ORDER BY`unit_name`) AS apply_num,`unit_name`,`service_name`,`service_class`,`service_sdate`,`service_edate`,`service_time1`,`service_time2`,`address`,`volunteers_condition` FROM ( SELECT DISTINCT `unit_name`,`service_name`,`service_class`,`service_sdate`,`service_edate`,`service_time1`,`service_time2`,`address`,`volunteers_condition` FROM `service`)`service` WHERE `service_sdate`>='"+service_date1+"' AND (`service_edate`<='"+service_date2+"' OR `service_sdate`>='"+service_date2+"')AND `service_time1` >='"+service_time1+"'AND `service_time2` <='"+service_time2+"'";
							
							if(countclass==1){
								condition+="AND `service_class` like '%"+service_class[0]+"%'";
								condition2+="AND `service_class` like '%"+service_class[0]+"%'";
							}
							else{
								condition+="AND (`service_class` like '%"+service_class[0]+"%'";
								condition2+="AND (`service_class` like '%"+service_class[0]+"%'";
								for(int y = 1; y < countclass ; y++){
									if(y==countclass-1){
										condition+="OR `service_class` like '%"+service_class[y]+"%')";
										condition2+="OR `service_class` like '%"+service_class[y]+"%')";
									}
									else{
										condition+="OR `service_class` like '%"+service_class[y]+"%'";
										condition2+="OR `service_class` like '%"+service_class[y]+"%'";	
									}
								}
							}
							if(countaddress==1){
								condition+="AND `address` like '%"+address[0]+"%'";
								condition2+="AND `address` like '%"+address[0]+"%'";
							}
							else{
								condition+="AND (`address` like '%"+address[0]+"%'";
								condition2+="AND (`address` like '%"+address[0]+"%'";
								for(int i =1; i< countaddress; i++){
									if(i==countaddress-1){
										condition+="OR `address` like '%"+address[i]+"%')";
										condition2+="OR `address` like '%"+address[i]+"%')";
									}
									else{
										condition+="OR `address` like '%"+address[i]+"%'";
										condition2+="OR `address` like '%"+address[i]+"%'";
									}
								}
							}
						condition+=") AS nothing WHERE `apply_num`='"+getvalue+"'";
						condition2+=") AS nothing WHERE `apply_num`="+getvalue+")";
						ResultSet tmp =  con.createStatement().executeQuery(condition);
						ResultSet tmp2 =  con.createStatement().executeQuery(condition2);
						while(tmp.next()){         								    
	%>
	<div style="background-color: #f4f8f9;margin-top: 70px;" align="center">
	<form action="s_reg_form.jsp" method="POST">
	<input type="hidden" name="s_id" value="<%=s_id%>">
	<input type="hidden" name="s_m_id" value="<%=s_m_id%>">
	<input type="hidden" name="c_id" value="<%=c_id%>">
	<input type="hidden" name="all_service_class" value="<%=all_service_class%>">
	<input type="hidden" name="service_sdate" value="<%=service_sdate%>">
	<input type="hidden" name="service_edate" value="<%=service_edate%>">
      <div class="container" style="padding-top: 5ch;text-align: left;font-size: 18px;" >
        <h4  align="center" valign="center" style="text-decoration: underline;"><b>服務詳細資訊</b></h4>
        <br>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務單位：</b>
            </div>
            <div class="col-md-auto">
              <p><%=tmp.getString(2)%></p>
			  <input type="hidden" name="unit_name" value="<%=tmp.getString(2)%>">
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務名稱：</b>
            </div>
            <div class="col-md-auto">
              <p><%=tmp.getString(3)%></p>
			  <input type="hidden" name="service_name" value="<%=tmp.getString(3)%>">			  
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務地點：</b>
            </div>
            <div class="col-md-auto">
              <p><%=tmp.getString(9)%></p>
			  <input type="hidden" name="address" value="<%=tmp.getString(9)%>">			  
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-4">
              <b>服務日期與時段</b>
            </div>
			<div class="col-md-auto">
              <b>需求人數</b>
            </div>
		  </div>
		  <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
<%
			while(tmp2.next()){
%>
              <p style="display: inline;"><%=tmp2.getString(2)%></p>&emsp;<label style="display:inline;"><%=tmp2.getString(3)%>~<%=tmp2.getString(4)%>&emsp;&emsp;&emsp;&emsp;<%=tmp2.getString(5)%>人</label></br>
			  <input type="hidden" name="service_date" value="<%=tmp2.getString(2)%>">
			  <input type="hidden" name="timeone" value="<%=tmp2.getString(3)%>">
			  <input type="hidden" name="timetwo" value="<%=tmp2.getString(4)%>">
			  <input type="hidden" name="people" value="<%=tmp2.getString(5)%>">
<%
			}
%>
            </div>
          </div>
		  </br>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務內容：</b>
            </div>
            <div class="col-md-auto">
              <p><%=tmp.getString(11)%></p>
			  <input type="hidden" name="service_content" value="<%=tmp.getString(11)%>">
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>報名條件：</b>
            </div>
            <div class="col-md-auto">
              <p><%=tmp.getString(10)%></p>
			  <input type="hidden" name="volunteers_condition" value="<%=tmp.getString(10)%>">
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>目前報名人數：</b>
            </div>
            <div class="col-md-auto">
              <p style="display: inline;"><!--待填--></p>&emsp;<label style="display:inline;"><!--待填--></label>&emsp;<span><!--待填-->人</span><br>
            </div>
          </div>
<%
			}
		}
%>
          <div class="row"  style="padding-left: 45%;padding-top: 5ch;">
            <view  class="btn2">
              <input class="btn btn-success" type="submit" value="報名" id="rightButton" >
              <input class="btn btn-secondary" type="button" value="取消" id="rightButton" onclick="history.back()">
              <br>
             </view> 
          </div>

        </div>
		</form>
      </div>
    </div>
  </div>
</div>
     <img style="width:100%; height:auto;padding-top: 3ch;" src="../image/newfooter.png" class="img-fluid" >

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



<!--
<div style="background-color: #f4f8f9;margin-top: 70px;" align="center">
      <div class="container" style="padding-top: 5ch;text-align: left;font-size: 18px;" >
        <h4  align="center" valign="center" style="text-decoration: underline;"><b>服務詳細資訊</b></h4>
        <br>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務單位：</b>
            </div>
            <div class="col-md-auto">
              <p>新北市新莊區衛生所</p>
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務名稱：</b>
            </div>
            <div class="col-md-auto">
              <p>資料及文書處理志工</p>
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務地點：</b>
            </div>
            <div class="col-md-auto">
              <p>新北市新莊區中華路一段2號</p>
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務日期與時段：</b>
            </div>
            <div class="col-md-auto">
              <p style="display: inline;">2022-04-06</p>&emsp;<label style="display:inline;">1400-1600</label><br>
              <p style="display: inline;">2022-04-06</p>&emsp;<label style="display:inline;">1400-1600</label>
            </div>
          </div>
          <div class="row" style="padding-top: 1ch;padding-left: 35%;">
            <div class="col-md-auto">
              <b>需求人數：</b>
            </div>
            <div class="col-md-auto" >
              <p>每時段各需10人</p>
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>服務內容：</b>
            </div>
            <div class="col-md-auto">
              <p>資料鍵入及文書處理</p>
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>報名條件：</b>
            </div>
            <div class="col-md-auto">
              <p>熟悉電腦操作即可</p>
            </div>
          </div>
          <div class="row" style="padding-left: 35%;">
            <div class="col-md-auto">
              <b>目前報名人數：</b>
            </div>
            <div class="col-md-auto">
              <p style="display: inline;">2022-04-06</p>&emsp;<label style="display:inline;">1400-1600</label>&emsp;<span>8人</span><br>
              <p style="display: inline;">2022-04-06</p>&emsp;<label style="display:inline;">1400-1600</label>&emsp;<span>9人</span>
            </div>
          </div>
          <div class="row"  style="padding-left: 45%;padding-top: 5ch;">
            <view  class="btn2">
              <a href="../page/s_reg_form.html"><input class="btn btn-success" type="button" value="報名" id="rightButton" ></a>
              <input class="btn btn-secondary" type="button" value="取消" id="rightButton" onclick="location.href='search.html'">
              <br>
             </view> 
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
-->