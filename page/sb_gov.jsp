<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link type="text/css" href="../css/stampbook.css" rel="stylesheet" media="screen" />		
    <style>@import url("../css/home.css");</style>
    <title>政府單位類別集章冊</title>
    <style>
      a{
  text-decoration: none;
  }
    a:hover{
  text-decoration: underline;
  color: black;
}
  .button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;   
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 20px;
  box-shadow: 0 9px #999;
  width: 5cm;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

    </style>
</head>
<body>
<%  	
    try {
// Step 1: 載入資料庫驅動程式 
        	Class.forName("com.mysql.jdbc.Driver");	  
	// 使用JDBC去連結MySQL，所以該行語法的意思，就是要告訴電腦我要使用JDBC
        try {
// Step 2: 建立連線 
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");   
		// 建立connection(連線)的語法，url代表我所要連結的MySQL所在IP，root是帳號，1234是密碼
		// 此連線是指和mySql連線，不是和存在mySql內的特定資料庫連線。	
// Step 3: 選擇資料庫	
                    con.createStatement().execute("USE `project`");
%>
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
            <a href="../page/guide.html"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">新手指南</b></a>  
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
            <a href="../page/aboutus.html"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">關於我們</b></a>
          </div>
        </div>
    </div>
</header>
<div style="background-color: #f4f8f9;margin-top: 70px;">
      <div class="container">
          <br>
        <div class="row"> 
            <div class="col"></div>
            <div class="col"><center><a href="../page/sb_gov.jsp"><button class="button">政府單位類別<br>集章冊</button></a></center></div>
            <div class="col"><center><a href="../page/sb_sdgs.jsp" > <button class="button">SDGs<br>集章冊</button></a></center></div>
            <div class="col"><center><a href="../page/sb_other.jsp"><button class="button">其他特殊榮譽<br>集章冊</button></a></center></div>
            <div class="col">    
        </div>
        </div>         
  </div>
  <div class="container" style="padding-top:50px;">
    <div class="row"> 
      <div class="col">
  <div id="shineflip">
	<div id="shineflip-pages">
		<canvas id="shineflip-canvas"></canvas>
		<canvas id="shineflip-page-mid-canvas"></canvas>
		<%-- 頭 --%>
        <section class="page">
          <div><img src="../image/sb_gov/0.png" width="475" height="482" /></div>
          <span style="left:18px;"><img src="../image/sb_gov/zh.png" height="482" /></span>
        </section>
        <%-- 身 --%>
        <section class="page" style="background:url(../image/sb_gov/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_gov/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
			<!--社會類-->
<%
String gov1class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%社會類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov1_class = con.createStatement().executeQuery(gov1class);
String g_ov1 ="";
float gov1 = 0;
while(gov1_class.next()){
	g_ov1 = gov1_class.getString(1);
	if(g_ov1==null){
		gov1 = 0;
	}
	else{
		gov1= Float.parseFloat(gov1_class.getString(1));
	}
}
String gov1_picture ="";
if(gov1==0){
	gov1_picture = "unlock";
}
if(gov1>=1){
	gov1_picture = "gov1-1";
}
if(gov1>=50){
	gov1_picture = "gov1-2";
}
if(gov1>=120){
	gov1_picture = "gov1-3";
}
if(gov1>=230){
	gov1_picture = "gov1-4";
}
if(gov1>=400){
	gov1_picture = "gov1-5";
}
if(gov1>=666){
	gov1_picture = "gov1-6";
}

%>	
            <img src="../image/sb_gov/<%=gov1_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--環境類-->
<%
String gov2class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%環境類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov2_class = con.createStatement().executeQuery(gov2class);
String g_ov2 ="";
float gov2 = 0;
while(gov2_class.next()){
	g_ov2 = gov2_class.getString(1);
	if(g_ov2==null){
		gov2 = 0;
	}
	else{
		gov2= Float.parseFloat(gov2_class.getString(1));
	}
}
String gov2_picture ="";
if(gov2==0){
	gov2_picture = "unlock";
}
if(gov2>=1){
	gov2_picture = "gov2-1";
}
if(gov2>=50){
	gov2_picture = "gov2-2";
}
if(gov2>=120){
	gov2_picture = "gov2-3";
}
if(gov2>=230){
	gov2_picture = "gov2-4";
}
if(gov2>=400){
	gov2_picture = "gov2-5";
}
if(gov2>=666){
	gov2_picture = "gov2-6";
}

%>
			<img src="../image/sb_gov/<%=gov2_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--教育類-->
<%
String gov3class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%教育類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov3_class = con.createStatement().executeQuery(gov3class);
String g_ov3 ="";
float gov3 = 0;
while(gov3_class.next()){
	g_ov3 = gov3_class.getString(1);
	if(g_ov3==null){
		gov3 = 0;
	}
	else{
		gov3= Float.parseFloat(gov3_class.getString(1));
	}
}
String gov3_picture ="";
if(gov3==0){
	gov3_picture = "unlock";
}
if(gov3>=1){
	gov3_picture = "gov3-1";
}
if(gov3>=50){
	gov3_picture = "gov3-2";
}
if(gov3>=120){
	gov3_picture = "gov3-3";
}
if(gov3>=230){
	gov3_picture = "gov3-4";
}
if(gov3>=400){
	gov3_picture = "gov3-5";
}
if(gov3>=666){
	gov3_picture = "gov3-6";
}

%>
			<img src="../image/sb_gov/<%=gov3_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--文化類-->
<%
String gov4class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%文化類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov4_class = con.createStatement().executeQuery(gov4class);
String g_ov4 ="";
float gov4 = 0;
while(gov4_class.next()){
	g_ov4 = gov4_class.getString(1);
	if(g_ov4==null){
		gov4 = 0;
	}
	else{
		gov4= Float.parseFloat(gov4_class.getString(1));
	}
}
String gov4_picture ="";
if(gov4==0){
	gov4_picture = "unlock";
}
if(gov4>=1){
	gov4_picture = "gov4-1";
}
if(gov4>=50){
	gov4_picture = "gov4-2";
}
if(gov4>=120){
	gov4_picture = "gov4-3";
}
if(gov4>=230){
	gov4_picture = "gov4-4";
}
if(gov4>=400){
	gov4_picture = "gov4-5";
}
if(gov4>=666){
	gov4_picture = "gov4-6";
}

%>
			<img src="../image/sb_gov/<%=gov4_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			           
          </div>
        </section>
        <section class="page" style="background:url(../image/sb_gov/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_gov/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
            <!--行政類-->
<%
String gov5class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%行政類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov5_class = con.createStatement().executeQuery(gov5class);
String g_ov5 ="";
float gov5 = 0;
while(gov5_class.next()){
	g_ov5 = gov5_class.getString(1);
	if(g_ov5==null){
		gov5 = 0;
	}
	else{
		gov5= Float.parseFloat(gov5_class.getString(1));
	}
}
String gov5_picture ="";
if(gov5==0){
	gov5_picture = "unlock";
}
if(gov5>=1){
	gov5_picture = "gov5-1";
}
if(gov5>=50){
	gov5_picture = "gov5-2";
}
if(gov5>=120){
	gov5_picture = "gov5-3";
}
if(gov5>=230){
	gov5_picture = "gov5-4";
}
if(gov5>=400){
	gov5_picture = "gov5-5";
}
if(gov5>=666){
	gov5_picture = "gov5-6";
}

%>
			<img src="../image/sb_gov/<%=gov5_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--交通類-->
<%
String gov6class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%交通類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov6_class = con.createStatement().executeQuery(gov6class);
String g_ov6 ="";
float gov6 = 0;
while(gov6_class.next()){
	g_ov6 = gov6_class.getString(1);
	if(g_ov6==null){
		gov6 = 0;
	}
	else{
		gov6= Float.parseFloat(gov6_class.getString(1));
	}
}
String gov6_picture ="";
if(gov6==0){
	gov6_picture = "unlock";
}
if(gov6>=1){
	gov6_picture = "gov6-1";
}
if(gov6>=50){
	gov6_picture = "gov6-2";
}
if(gov6>=120){
	gov6_picture = "gov6-3";
}
if(gov6>=230){
	gov6_picture = "gov6-4";
}
if(gov6>=400){
	gov6_picture = "gov6-5";
}
if(gov6>=666){
	gov6_picture = "gov6-6";
}

%>
			<img src="../image/sb_gov/<%=gov6_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--救護類-->
<%
String gov7class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%救護類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov7_class = con.createStatement().executeQuery(gov7class);
String g_ov7 ="";
float gov7 = 0;
while(gov7_class.next()){
	g_ov7 = gov7_class.getString(1);
	if(g_ov7==null){
		gov7 = 0;
	}
	else{
		gov7= Float.parseFloat(gov7_class.getString(1));
	}
}
String gov7_picture ="";
if(gov7==0){
	gov7_picture = "unlock";
}
if(gov7>=1){
	gov7_picture = "gov7-1";
}
if(gov7>=50){
	gov7_picture = "gov7-2";
}
if(gov7>=120){
	gov7_picture = "gov7-3";
}
if(gov7>=230){
	gov7_picture = "gov7-4";
}
if(gov7>=400){
	gov7_picture = "gov7-5";
}
if(gov7>=666){
	gov7_picture = "gov7-6";
}

%>
			<img src="../image/sb_gov/<%=gov7_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--資訊類-->
<%
String gov8class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%資訊類%' AND `member_ID`='1' AND `certification_status`='認證成功';";
ResultSet gov8_class = con.createStatement().executeQuery(gov8class);
String g_ov8 ="";
float gov8 = 0;
while(gov8_class.next()){
	g_ov8 = gov8_class.getString(1);
	if(g_ov8==null){
		gov8 = 0;
	}
	else{
		gov8= Float.parseFloat(gov8_class.getString(1));
	}
}
String gov8_picture ="";
if(gov8==0){
	gov8_picture = "unlock";
}
if(gov8>=1){
	gov8_picture = "gov8-1";
}
if(gov8>=50){
	gov8_picture = "gov8-2";
}
if(gov8>=120){
	gov8_picture = "gov8-3";
}
if(gov8>=230){
	gov8_picture = "gov8-4";
}
if(gov8>=400){
	gov8_picture = "gov8-5";
}
if(gov8>=666){
	gov8_picture = "gov8-6";
}

%>
			<img src="../image/sb_gov/<%=gov8_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			           
          </div>
        </section>
         <%-- 尾 --%>
		<section class="page">
			<div><img src="../image/sb_gov/back.png" width="475" height="482" /></div>
			<span style="right:18px;"><img src="../image/sb_gov/zh.png" height="482" /></span> 
		</section>
      </div>
    </div>
    </div>
    
    <script type="text/javascript" src="../js/shineflip_min.js"></script>
    <script type="text/javascript">
    var shineFlip = new ShineFlip({
      // autoFitScreen: true,
      width: 950,
      height: 482,
      page_width: 475,
      page_height: 482
    });
    </script>
    <div class="col">
<!--變換圖檔_開始-->
<script language="JavaScript"> 

  var slidespeed=1000 
  var slideimages=new Array("../image/sb_gov/stamp.png","../image/sb_sdgs/stamp.png","../image/sb_other/stamp.png") 
  var imageholder=new Array() 
  var ie55=window.createPopup 
  for (i=0;i<slideimages.length;i++){ 
  imageholder[i]=new Image() 
  imageholder[i].src=slideimages[i] 
  } 
  function gotoshow(){ 
  window.location=slidelinks[whichlink] 
  } 
  
  </script> 
  <img src="001.gif" name="slide" border=0 style="filter:progid:DXImageTransform.Microsoft.Pixelate(MaxSquare=15,Duration=1); width: 3.5cm;" align="middle"> 
  <script language="JavaScript1.1"> 
  
  var whichlink=0 
  var whichimage=0 
  var pixeldelay=(ie55)? document.images.slide.filters[0].duration*1000 : 0 
  function slideit(){ 
  if (!document.images) return 
  if (ie55) document.images.slide.filters[0].apply() 
  document.images.slide.src=imageholder[whichimage].src 
  if (ie55) document.images.slide.filters[0].play() 
  whichlink=whichimage 
  whichimage=(whichimage<slideimages.length-1)? whichimage+1 : 0 
  setTimeout("slideit()",slidespeed+pixeldelay) 
  } 
  slideit() 
  
  </script>
  <!--變換圖檔_結束-->
</div>
</div>
  </div>
<br><br><br><br><br><br><br>

<div style="text-align:center;clear:both;">
	<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
	<script src="/follow.js" type="text/javascript"></script>
</div>

</div>
    </div>
</div>

  
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
    </footer>

  <script src="../js/bootstrap.bundle.min.js"></script>
<%
// Step 5: 顯示結果 				
		   // if(con.isClosed())
		// con.isClosed()會回傳True或是false來表示是否連線成功
              // out.println("連線建立失敗");
           // else
              // out.println("連線成功");
// Step 6: 關閉連線
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