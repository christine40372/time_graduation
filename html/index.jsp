<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <!--swiper-->
    <!---->
    <style>@import url("../css/home.css");</style>
    <style>@import url("../css/passport.css");</style>
    <style>@import url("../css/homereal.css");</style>
    <style>@import url("../css/swiper.css");</style>
    
    <title>志工時區X時間銀行</title>
</head>
<style> 
</style>
<body>
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
  <!--功能列-->
  <header style="background-color: white; width: 100%; height: 70px; position: fixed; top: 0px; z-index: 5;">
      <div class="container">
          <div class="row"> 
            <div class="col">    
              <a href="index.jsp"><img style="width:150%;height: 8ch;" src="../image/logo.png" ></a>
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
    <!--廣告輪播牆-->
<div style="background-image:url(../image/bg1.jpg);">
  <div class="container" style="padding-top: 10%;">
    <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
      <div class="swiper-wrapper" id="div_town">
        <div class="swiper-slide">
          <img src="../image/adv.png" style="width: 100%;">
        </div>
        <div class="swiper-slide">
          <img src="../image/adv1.png" style="width: 100%;">
        </div>
        <div class="swiper-slide">
          <img src="../image/adv2.png" style="width: 100%;">
        </div>
      </div>
      <div class="swiper-button-next" style="width: 40px"><img src="../image/arrow24.png"></div>
      <div class="swiper-button-prev" style="width: 40px"><img src="../image/arrow24.png"></div>
    </div>
  </div>
</div>
  <img style="width: 100%;height: auto;z-index: 0;" src="../image/home2.png" class="img-fluid" > 
  <div style="background-color: #cee8e6;">      
  <div class="container" style="z-index: 4;width: 100%;padding-left: 5ch;padding-right: 5ch;padding-top: 3ch;">
  <div class="row">
<%
	String getservice = "SELECT DISTINCT `service_sdate`,`unit_name`,`service_name` FROM `service` ORDER BY `service_sdate` DESC LIMIT 5;";
	ResultSet get_service =  con.createStatement().executeQuery(getservice);
%>
  <!--近期服務-->
  <div class="col">
      <h3 style="text-align: center;"><b>────&#10047 近期服務 &#10047────</b></h3>
      <div class="newlist">
          <ul>	  
<%
			while(get_service.next()){
%>
              <li style="list-style: none;cursor:pointer;" onclick="javascript:window.location.href='../page/search.jsp'">
                      <i class="marknew">NEW</i>
                      <div class="msgnew">
                          <span> <%=get_service.getString(1)%> </span>
                          <p><%=get_service.getString(2)%></p>
                          <p><%=get_service.getString(3)%></p>
                      </div>  
              </li>
<%				
			}
%>
          </ul>
      </div>
  </div>
  </div>
  <hr>
  <!--網站消息-->
<%
	String getsystem = "SELECT `system_date`,`system_content` FROM `system_note` ORDER BY `system_date` DESC LIMIT 5";
	ResultSet get_system =  con.createStatement().executeQuery(getsystem);
%>
  <div class="row" style="padding-top: 3ch;">
    <div class="col">
      <h3 style="text-align: center;"><b>────&#10047 網站消息 &#10047────</b></h3>
      <div class="newlist" style="margin-left: 0%;">
          <ul>
 <%
			while(get_system.next()){
				
%>
              <li style="list-style: none;cursor:pointer;">
                      <i class="marknew">NEW</i>
                      <div class="msgnew">
                          <span> <%=get_system.getString(1)%> </span>
                          <p><%=get_system.getString(2)%></p>
                      </div>  
              </li>
<%
			}
%>
          </ul>
      </div>
    </div>
  </div>
  <hr>
  <div class="row" style="padding-top: 3ch;"> 
<%
	String gettraining = "SELECT `training_date`,`training_type`,`training_name`,`training_more` FROM `training_data` ORDER BY `training_date` DESC;";
	ResultSet get_training =  con.createStatement().executeQuery(gettraining);
	String pageParameter = request.getParameter("page");
      if(pageParameter == null){
        pageParameter = "1";
      }
      int currentPage = Integer.parseInt(pageParameter);
      int rowCount = 1;
      int pageLimit = 5;
%>
  <!--近期訓練-->
    <div class="col">
      <h3 style="text-align: center;"><b>────&#10047 近期訓練 &#10047────</b></h3>
      <div class="newlist">
          <ul>
<%
			while(get_training.next()){
				if((rowCount/pageLimit) == (currentPage-1) || ((rowCount/pageLimit) == currentPage && rowCount%pageLimit ==0)){	
%>
              <li style="list-style: none;">
                  <a href="<%=get_training.getString(4)%>">
                      <i class="marknew">NEW</i>
                      <div class="msgnew">
                          <span><%=get_training.getString(1)%> </span>
                          <p>【<%=get_training.getString(2)%>】</p>
                          <p><%=get_training.getString(3)%></p>
                      </div>  
                  </a> 
              </li>
<%
				}
				rowCount++;
			}
%>
          </ul>
      </div>
<%
      int totalItem = rowCount-1; //所有物件 
      int totalPage = (totalItem/pageLimit); //
      int whileCounter = 1;
      if (totalItem%pageLimit > 0){
        totalPage++;
      }
%>
      <div class="btnpage">
        <a style="cursor: pointer;" class='page_pr' onclick="pageChange('<%= currentPage  %>',-1,'<%= totalPage  %>')">
          <img src='https://www.townpassport.com.tw/townpassport_img/202103_TW_VillageRoaming/arrow2.svg' alt=''>
        </a>
        <ul class='pagenu'>
          <%       
        while(whileCounter <= totalPage){
          
        %>
		<% if(currentPage == whileCounter){
          out.println("<li class='on' >");
        }
        else{
        out.println("<li>");
        }
        %>
          <a   style="cursor: pointer;"  onclick="pageChange('<%= whileCounter  %>',0,'<%= totalPage  %>')">
            <span><%= whileCounter  %></span>
          </a>
          </li>
		  <%
          whileCounter++;
         }
        %>
        </ul>
        <a style="cursor: pointer;" class='page_nt' onclick="pageChange('<%= currentPage  %>',1,'<%= totalPage  %>')">
          <img src='https://www.townpassport.com.tw/townpassport_img/202103_TW_VillageRoaming/arrow2.svg' alt=''>
        </a>
      </div>
      </div>
    </div>
  </div>
</div> 
  <!--排行榜按鈕-->
<div class="idx_buttons btnpaly viewgo">
  <div class="i_btn btnpaly viewgo">
    <a href="../page/no1.html">
      <p style="padding-right: 1ch;">
        <br>
        排<br>行<br>榜
        <img src="https://www.townpassport.com.tw/townpassport_img/202103_TW_VillageRoaming/arrow5.svg">
      </p>
    </a>
  </div>
</div>
<div class="idx_buttons btnpaly viewgo" style="top: 40%;">
  <div class="i_btn btnpaly viewgo">
    <a href="../page/play.html">
      <p style="padding-right: 1ch;">
        <br>
        趣<br>味<br>小<br>測<br>驗
        <img src="https://www.townpassport.com.tw/townpassport_img/202103_TW_VillageRoaming/arrow5.svg">
      </p>
    </a>
  </div>
</div>
    <img style="width: 100%;" src="../image/homefooter.png" class="img-fluid" >
    <footer style="background-color: #b6c3a7;">
      <div class="container">
        <div class="row" style="padding-bottom: 2ch;">
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
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<!--swiper-->
<script src="../js/swiper.js"></script>
<script>
  var swiper = new Swiper('.swiper-container', {
    slidesPerView: 'auto',
    spaceBetween: 10,
  centeredSlides: true,
  loop: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    autoplay:{
      delay:3000,
    },
    navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  });
  function pageChange(page,type,total){
    const pageNumber = Number(page) + Number(type);
    if( pageNumber>0 && pageNumber<= Number(total)){
      window.location='/time/html/index.jsp?page='+pageNumber
    }
  }
</script>
<!---->
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