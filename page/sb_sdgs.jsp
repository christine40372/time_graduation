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
    <title>SDGs集章冊</title>
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
            <a href="../page/guide.jspl"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">新手指南</b></a>  
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
          <div><img src="../image/sb_sdgs/0.png" width="475" height="482" /></div>
          <span style="left:18px;"><img src="../image/sb_sdgs/zh.png" height="482" /></span>
        </section>
        <%-- 身 --%>
        <section class="page" style="background:url(../image/sb_sdgs/back.png)">
          <div class="badge-parent">	  
            <img src="../image/sb_sdgs/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
			<!--1.終結貧窮 -->
<%
						String sql3="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
						ResultSet rs3=con.createStatement().executeQuery(sql3);
						rs3.next();
String sdgs1class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%終結貧窮%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs1_class = con.createStatement().executeQuery(sdgs1class);
String s_dgs1 ="";
float sdgs1 = 0;
while(sdgs1_class.next()){
	s_dgs1 = sdgs1_class.getString(1);
	if(s_dgs1==null){
		sdgs1 = 0;
	}
	else{
		sdgs1= Float.parseFloat(sdgs1_class.getString(1));
	}
}
String sdgs1_picture ="";
if(sdgs1==0){
	sdgs1_picture = "unlock";
}
if(sdgs1>=1){
	sdgs1_picture = "sdgs1-1";
}
if(sdgs1>=50){
	sdgs1_picture = "sdgs1-2";
}
if(sdgs1>=120){
	sdgs1_picture = "sdgs1-3";
}
if(sdgs1>=230){
	sdgs1_picture = "sdgs1-4";
}
if(sdgs1>=400){
	sdgs1_picture = "sdgs1-5";
}
if(sdgs1>=666){
	sdgs1_picture = "sdgs1-6";
}
%>	
            <img src="../image/sb_sdgs/<%=sdgs1_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--2.消除飢餓-->
<%
String sdgs2class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%消除飢餓%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs2_class = con.createStatement().executeQuery(sdgs2class);
String s_dgs2 ="";
float sdgs2 = 0;
while(sdgs2_class.next()){
	s_dgs2 = sdgs2_class.getString(1);
	if(s_dgs2==null){
		sdgs2 = 0;
	}
	else{
		sdgs2= Float.parseFloat(sdgs2_class.getString(1));
	}
}
String sdgs2_picture ="";
if(sdgs2==0){
	sdgs2_picture = "unlock";
}
if(sdgs2>=1){
	sdgs2_picture = "sdgs2-1";
}
if(sdgs2>=50){
	sdgs2_picture = "sdgs2-2";
}
if(sdgs2>=120){
	sdgs2_picture = "sdgs2-3";
}
if(sdgs2>=230){
	sdgs2_picture = "sdgs2-4";
}
if(sdgs2>=400){
	sdgs2_picture = "sdgs2-5";
}
if(sdgs2>=666){
	sdgs2_picture = "sdgs2-6";
}
%>	
			<img src="../image/sb_sdgs/<%=sdgs2_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--3.健康與福祉-->
<%
String sdgs3class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%健康與福祉%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs3_class = con.createStatement().executeQuery(sdgs3class);
String s_dgs3 ="";
float sdgs3 = 0;
while(sdgs3_class.next()){
	s_dgs3 = sdgs3_class.getString(1);
	if(s_dgs3==null){
		sdgs3 = 0;
	}
	else{
		sdgs3= Float.parseFloat(sdgs3_class.getString(1));
	}
}
String sdgs3_picture ="";
if(sdgs3==0){
	sdgs3_picture = "unlock";
}
if(sdgs3>=1){
	sdgs3_picture = "sdgs3-1";
}
if(sdgs3>=50){
	sdgs3_picture = "sdgs3-2";
}
if(sdgs3>=120){
	sdgs3_picture = "sdgs3-3";
}
if(sdgs3>=230){
	sdgs3_picture = "sdgs3-4";
}
if(sdgs3>=400){
	sdgs3_picture = "sdgs3-5";
}
if(sdgs3>=666){
	sdgs3_picture = "sdgs3-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs3_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--4.優質教育-->
<%
String sdgs4class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%優質教育%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs4_class = con.createStatement().executeQuery(sdgs4class);
String s_dgs4 ="";
float sdgs4 = 0;
while(sdgs4_class.next()){
	s_dgs4 = sdgs4_class.getString(1);
	if(s_dgs4==null){
		sdgs4 = 0;
	}
	else{
		sdgs4= Float.parseFloat(sdgs4_class.getString(1));
	}
}
String sdgs4_picture ="";
if(sdgs4==0){
	sdgs4_picture = "unlock";
}
if(sdgs4>=1){
	sdgs4_picture = "sdgs4-1";
}
if(sdgs4>=50){
	sdgs4_picture = "sdgs4-2";
}
if(sdgs4>=120){
	sdgs4_picture = "sdgs4-3";
}
if(sdgs4>=230){
	sdgs4_picture = "sdgs4-4";
}
if(sdgs4>=400){
	sdgs4_picture = "sdgs4-5";
}
if(sdgs4>=666){
	sdgs4_picture = "sdgs4-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs4_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			           
          </div>
        </section>
        <section class="page" style="background:url(../image/sb_sdgs/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_sdgs/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
            <!--5.性別平權-->
<%
String sdgs5class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%性別平權%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs5_class = con.createStatement().executeQuery(sdgs5class);
String s_dgs5 ="";
float sdgs5 = 0;
while(sdgs5_class.next()){
	s_dgs5 = sdgs5_class.getString(1);
	if(s_dgs5==null){
		sdgs5 = 0;
	}
	else{
		sdgs5= Float.parseFloat(sdgs5_class.getString(1));
	}
}
String sdgs5_picture ="";
if(sdgs5==0){
	sdgs5_picture = "unlock";
}
if(sdgs5>=1){
	sdgs5_picture = "sdgs5-1";
}
if(sdgs5>=50){
	sdgs5_picture = "sdgs5-2";
}
if(sdgs5>=120){
	sdgs5_picture = "sdgs5-3";
}
if(sdgs5>=230){
	sdgs5_picture = "sdgs5-4";
}
if(sdgs5>=400){
	sdgs5_picture = "sdgs5-5";
}
if(sdgs5>=666){
	sdgs5_picture = "sdgs5-6";
}

%>
			<img src="../image/sb_sdgs/<%=sdgs5_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--6.淨水及衛生-->
<%
String sdgs6class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%淨水及衛生%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs6_class = con.createStatement().executeQuery(sdgs6class);
String s_dgs6 ="";
float sdgs6 = 0;
while(sdgs6_class.next()){
	s_dgs6 = sdgs6_class.getString(1);
	if(s_dgs6==null){
		sdgs6 = 0;
	}
	else{
		sdgs6= Float.parseFloat(sdgs6_class.getString(1));
	}
}
String sdgs6_picture ="";
if(sdgs6==0){
	sdgs6_picture = "unlock";
}
if(sdgs6>=1){
	sdgs6_picture = "sdgs6-1";
}
if(sdgs6>=50){
	sdgs6_picture = "sdgs6-2";
}
if(sdgs6>=120){
	sdgs6_picture = "sdgs6-3";
}
if(sdgs6>=230){
	sdgs6_picture = "sdgs6-4";
}
if(sdgs6>=400){
	sdgs6_picture = "sdgs6-5";
}
if(sdgs6>=666){
	sdgs6_picture = "sdgs6-6";
}

%>
			<img src="../image/sb_sdgs/<%=sdgs6_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--7.可負擔的潔淨能源-->
<%
String sdgs7class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%可負擔的潔淨能源%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs7_class = con.createStatement().executeQuery(sdgs7class);
String s_dgs7 ="";
float sdgs7 = 0;
while(sdgs7_class.next()){
	s_dgs7 = sdgs7_class.getString(1);
	if(s_dgs7==null){
		sdgs7 = 0;
	}
	else{
		sdgs7= Float.parseFloat(sdgs7_class.getString(1));
	}
}
String sdgs7_picture ="";
if(sdgs7==0){
	sdgs7_picture = "unlock";
}
if(sdgs7>=1){
	sdgs7_picture = "sdgs7-1";
}
if(sdgs7>=50){
	sdgs7_picture = "sdgs7-2";
}
if(sdgs7>=120){
	sdgs7_picture = "sdgs7-3";
}
if(sdgs7>=230){
	sdgs7_picture = "sdgs7-4";
}
if(sdgs7>=400){
	sdgs7_picture = "sdgs7-5";
}
if(sdgs7>=666){
	sdgs7_picture = "sdgs7-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs7_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--8.合適的工作及經濟成長-->
<%
String sdgs8class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%合適的工作及經濟成長%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs8_class = con.createStatement().executeQuery(sdgs8class);
String s_dgs8 ="";
float sdgs8 = 0;
while(sdgs8_class.next()){
	s_dgs8 = sdgs8_class.getString(1);
	if(s_dgs8==null){
		sdgs8 = 0;
	}
	else{
		sdgs8= Float.parseFloat(sdgs8_class.getString(1));
	}
}
String sdgs8_picture ="";
if(sdgs8==0){
	sdgs8_picture = "unlock";
}
if(sdgs8>=1){
	sdgs8_picture = "sdgs8-1";
}
if(sdgs8>=50){
	sdgs8_picture = "sdgs8-2";
}
if(sdgs8>=120){
	sdgs8_picture = "sdgs8-3";
}
if(sdgs8>=230){
	sdgs8_picture = "sdgs8-4";
}
if(sdgs8>=400){
	sdgs8_picture = "sdgs8-5";
}
if(sdgs8>=666){
	sdgs8_picture = "sdgs8-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs8_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			           
          </div>
        </section>
		<section class="page" style="background:url(../image/sb_sdgs/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_sdgs/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
            <!--9.工業化、創新及基礎建設-->
<%
String sdgs9class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%工業化、創新及基礎建設%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs9_class = con.createStatement().executeQuery(sdgs9class);
String s_dgs9 ="";
float sdgs9 = 0;
while(sdgs9_class.next()){
	s_dgs9 = sdgs9_class.getString(1);
	if(s_dgs9==null){
		sdgs9 = 0;
	}
	else{
		sdgs9= Float.parseFloat(sdgs9_class.getString(1));
	}
}
String sdgs9_picture ="";
if(sdgs9==0){
	sdgs9_picture = "unlock";
}
if(sdgs9>=1){
	sdgs9_picture = "sdgs9-1";
}
if(sdgs9>=50){
	sdgs9_picture = "sdgs9-2";
}
if(sdgs9>=120){
	sdgs9_picture = "sdgs9-3";
}
if(sdgs9>=230){
	sdgs9_picture = "sdgs9-4";
}
if(sdgs9>=400){
	sdgs9_picture = "sdgs9-5";
}
if(sdgs9>=666){
	sdgs9_picture = "sdgs9-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs9_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--10.減少不平等-->
<%
String sdgs10class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%減少不平等%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs10_class = con.createStatement().executeQuery(sdgs10class);
String s_dgs10 ="";
float sdgs10 = 0;
while(sdgs10_class.next()){
	s_dgs10 = sdgs10_class.getString(1);
	if(s_dgs10==null){
		sdgs10 = 0;
	}
	else{
		sdgs10= Float.parseFloat(sdgs10_class.getString(1));
	}
}
String sdgs10_picture ="";
if(sdgs10==0){
	sdgs10_picture = "unlock";
}
if(sdgs10>=1){
	sdgs10_picture = "sdgs10-1";
}
if(sdgs10>=50){
	sdgs10_picture = "sdgs10-2";
}
if(sdgs10>=120){
	sdgs10_picture = "sdgs10-3";
}
if(sdgs10>=230){
	sdgs10_picture = "sdgs10-4";
}
if(sdgs10>=400){
	sdgs10_picture = "sdgs10-5";
}
if(sdgs10>=666){
	sdgs10_picture = "sdgs10-6";
}

%>		
			<img src="../image/sb_sdgs/<%=sdgs10_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--11.永續城鄉-->
<%
String sdgs11class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%永續城鄉%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs11_class = con.createStatement().executeQuery(sdgs11class);
String s_dgs11 ="";
float sdgs11 = 0;
while(sdgs11_class.next()){
	s_dgs11 = sdgs11_class.getString(1);
	if(s_dgs11==null){
		sdgs11 = 0;
	}
	else{
		sdgs11= Float.parseFloat(sdgs11_class.getString(1));
	}
}
String sdgs11_picture ="";
if(sdgs11==0){
	sdgs11_picture = "unlock";
}
if(sdgs11>=1){
	sdgs11_picture = "sdgs11-1";
}
if(sdgs11>=50){
	sdgs11_picture = "sdgs11-2";
}
if(sdgs11>=120){
	sdgs11_picture = "sdgs11-3";
}
if(sdgs11>=230){
	sdgs11_picture = "sdgs11-4";
}
if(sdgs11>=400){
	sdgs11_picture = "sdgs11-5";
}
if(sdgs11>=666){
	sdgs11_picture = "sdgs11-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs11_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--12.責任消費及生產-->
<%
String sdgs12class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%責任消費及生產%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs12_class = con.createStatement().executeQuery(sdgs12class);
String s_dgs12 ="";
float sdgs12 = 0;
while(sdgs12_class.next()){
	s_dgs12 = sdgs12_class.getString(1);
	if(s_dgs12==null){
		sdgs12 = 0;
	}
	else{
		sdgs12= Float.parseFloat(sdgs12_class.getString(1));
	}
}
String sdgs12_picture ="";
if(sdgs12==0){
	sdgs12_picture = "unlock";
}
if(sdgs12>=1){
	sdgs12_picture = "sdgs12-1";
}
if(sdgs12>=50){
	sdgs12_picture = "sdgs12-2";
}
if(sdgs12>=120){
	sdgs12_picture = "sdgs12-3";
}
if(sdgs12>=230){
	sdgs12_picture = "sdgs12-4";
}
if(sdgs12>=400){
	sdgs12_picture = "sdgs12-5";
}
if(sdgs12>=666){
	sdgs12_picture = "sdgs12-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs12_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			           
          </div>
        </section>
		<section class="page" style="background:url(../image/sb_sdgs/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_sdgs/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
            <!--13.氣候行動-->
<%
String sdgs13class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%氣候行動%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs13_class = con.createStatement().executeQuery(sdgs13class);
String s_dgs13 ="";
float sdgs13 = 0;
while(sdgs13_class.next()){
	s_dgs13 = sdgs13_class.getString(1);
	if(s_dgs13==null){
		sdgs13 = 0;
	}
	else{
		sdgs13= Float.parseFloat(sdgs13_class.getString(1));
	}
}
String sdgs13_picture ="";
if(sdgs13==0){
	sdgs13_picture = "unlock";
}
if(sdgs13>=1){
	sdgs13_picture = "sdgs13-1";
}
if(sdgs13>=50){
	sdgs13_picture = "sdgs13-2";
}
if(sdgs13>=120){
	sdgs13_picture = "sdgs13-3";
}
if(sdgs13>=230){
	sdgs13_picture = "sdgs13-4";
}
if(sdgs13>=400){
	sdgs13_picture = "sdgs13-5";
}
if(sdgs13>=666){
	sdgs13_picture = "sdgs13-6";
}

%>
			<img src="../image/sb_sdgs/<%=sdgs13_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--14.保育海洋生態-->
<%
String sdgs14class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%保育海洋生態%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs14_class = con.createStatement().executeQuery(sdgs14class);
String s_dgs14 ="";
float sdgs14= 0;
while(sdgs14_class.next()){
	s_dgs14 = sdgs14_class.getString(1);
	if(s_dgs14==null){
		sdgs14 = 0;
	}
	else{
		sdgs14= Float.parseFloat(sdgs14_class.getString(1));
	}
}
String sdgs14_picture ="";
if(sdgs14==0){
	sdgs14_picture = "unlock";
}
if(sdgs14>=1){
	sdgs14_picture = "sdgs14-1";
}
if(sdgs14>=50){
	sdgs14_picture = "sdgs14-2";
}
if(sdgs14>=120){
	sdgs14_picture = "sdgs14-3";
}
if(sdgs14>=230){
	sdgs14_picture = "sdgs14-4";
}
if(sdgs14>=400){
	sdgs14_picture = "sdgs14-5";
}
if(sdgs14>=666){
	sdgs14_picture = "sdgs14-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs14_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--15.保育陸域生態-->
<%
String sdgs15class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%保育陸域生態%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs15_class = con.createStatement().executeQuery(sdgs15class);
String s_dgs15 ="";
float sdgs15= 0;
while(sdgs15_class.next()){
	s_dgs15 = sdgs15_class.getString(1);
	if(s_dgs15==null){
		sdgs15 = 0;
	}
	else{
		sdgs15= Float.parseFloat(sdgs15_class.getString(1));
	}
}
String sdgs15_picture ="";
if(sdgs15==0){
	sdgs15_picture = "unlock";
}
if(sdgs15>=1){
	sdgs15_picture = "sdgs15-1";
}
if(sdgs15>=50){
	sdgs15_picture = "sdgs15-2";
}
if(sdgs15>=120){
	sdgs15_picture = "sdgs15-3";
}
if(sdgs15>=230){
	sdgs15_picture = "sdgs15-4";
}
if(sdgs15>=400){
	sdgs15_picture = "sdgs15-5";
}
if(sdgs15>=666){
	sdgs15_picture = "sdgs15-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs15_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--16.和平、正義及健全制度-->
<%
String sdgs16class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%和平、正義及健全制度%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs16_class = con.createStatement().executeQuery(sdgs16class);
String s_dgs16 ="";
float sdgs16= 0;
while(sdgs16_class.next()){
	s_dgs16 = sdgs16_class.getString(1);
	if(s_dgs16==null){
		sdgs16 = 0;
	}
	else{
		sdgs16= Float.parseFloat(sdgs16_class.getString(1));
	}
}
String sdgs16_picture ="";
if(sdgs16==0){
	sdgs16_picture = "unlock";
}
if(sdgs16>=1){
	sdgs16_picture = "sdgs16-1";
}
if(sdgs16>=50){
	sdgs16_picture = "sdgs16-2";
}
if(sdgs16>=120){
	sdgs16_picture = "sdgs16-3";
}
if(sdgs16>=230){
	sdgs16_picture = "sdgs16-4";
}
if(sdgs16>=400){
	sdgs16_picture = "sdgs16-5";
}
if(sdgs16>=666){
	sdgs16_picture = "sdgs16-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs16_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			           
          </div>
        </section>
		<section class="page" style="background:url(../image/sb_sdgs/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_sdgs/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
            <!--17.多元夥伴關係-->
<%
String sdgs17class = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%多元夥伴關係%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet sdgs17_class = con.createStatement().executeQuery(sdgs17class);
String s_dgs17 ="";
float sdgs17= 0;
while(sdgs17_class.next()){
	s_dgs17 = sdgs17_class.getString(1);
	if(s_dgs17==null){
		sdgs17 = 0;
	}
	else{
		sdgs17= Float.parseFloat(sdgs17_class.getString(1));
	}
}
String sdgs17_picture ="";
if(sdgs17==0){
	sdgs17_picture = "unlock";
}
if(sdgs17>=1){
	sdgs17_picture = "sdgs17-1";
}
if(sdgs17>=50){
	sdgs17_picture = "sdgs17-2";
}
if(sdgs17>=120){
	sdgs17_picture = "sdgs17-3";
}
if(sdgs17>=230){
	sdgs17_picture = "sdgs17-4";
}
if(sdgs17>=400){
	sdgs17_picture = "sdgs17-5";
}
if(sdgs17>=666){
	sdgs17_picture = "sdgs17-6";
}

%>	
			<img src="../image/sb_sdgs/<%=sdgs17_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
          </div>
        </section>
         <%-- 尾 --%>
		 <section class="page" style="background:url(../image/sb_sdgs/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_sdgs/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
          </div>
        </section>
		<section class="page">
			<div><img src="../image/sb_sdgs/back.png" width="475" height="482" /></div>
			<span style="right:18px;"><img src="../image/sb_sdgs/zh.png" height="482" /></span> 
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
  <!--<img src="../image/sb_sdgs/stamp.png" style="width:3.5cm;">-->
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