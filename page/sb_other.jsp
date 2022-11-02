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
    <title>其他特殊榮譽集章冊</title>
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
          <div><img src="../image/sb_other/0.png" width="475" height="482" /></div>
          <span style="left:18px;"><img src="../image/sb_other/zh.png" height="482" /></span>
        </section>
        <%-- 身 --%>
        <section class="page" style="background:url(../image/sb_other/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_other/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
			<!--時間銀行-->
<%
						String sql3="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
						ResultSet rs3=con.createStatement().executeQuery(sql3);
						rs3.next();
String timebankclass = "SELECT sum(`hours`) FROM `application` WHERE `unit_name` LIKE '%時間銀行%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet timebank_class = con.createStatement().executeQuery(timebankclass);
String t_imebank ="";
float timebank = 0;
while(timebank_class.next()){
	t_imebank = timebank_class.getString(1);
	if(t_imebank==null){
		timebank = 0;
	}
	else{
		timebank= Float.parseFloat(timebank_class.getString(1));
	}
}
String timebank_picture ="";
if(timebank==0){
	timebank_picture = "unlock";
}
if(timebank>=1){
	timebank_picture = "timebank";
}
%>
            <img src="../image/sb_other/<%=timebank_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
            <!--總時數-->
<%
String allhours = "SELECT sum(`hours`) FROM `application` WHERE `certification_status`='認證成功';";
ResultSet all_hours = con.createStatement().executeQuery(allhours);
float other1=0;
while(all_hours.next()){
		other1 = Float.parseFloat(all_hours.getString(1));
}
String other1_picture ="";
if(other1==0){
	other1_picture = "unlock";
}
if(other1>=1){
	other1_picture = "other1-1";
}
if(other1>=50){
	other1_picture = "other1-2";
}
if(other1>=120){
	other1_picture = "other1-3";
}
if(other1>=230){
	other1_picture = "other1-4";
}
if(other1>=400){
	other1_picture = "other1-5";
}
if(other1>=666){
	other1_picture = "other1-6";
}

%>
			<img src="../image/sb_other/<%=other1_picture%>.png" width="200" height="200" style="float:left;margin-top:9px;position:relative;top: -445px;left:40px;" />			
          </div>
        </section>
		<section class="page" style="background:url(../image/sb_other/back.png)">
          <div class="badge-parent">
            <img src="../image/sb_other/6.png" width="466" height="463" style="float:left;margin-top:9px;" />
          </div>
        </section>
         <%-- 尾 --%>
		<section class="page">
			<div><img src="../image/sb_other/back.png" width="475" height="482" /></div>
			<span style="right:18px;"><img src="../image/sb_other/zh.png" height="482" /></span> 
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