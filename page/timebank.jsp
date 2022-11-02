<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://static.pureexample.com/js/flot/excanvas.min.js"></script>
    <script src="http://static.pureexample.com/js/flot/jquery.flot.min.js"></script>
    <script src="http://static.pureexample.com/js/flot/jquery.flot.pie.min.js"></script>
    <!--頁碼-->
    <script src="../js/timebank.js"></script>
    <script src="../js/timebanktable2.js"></script>
    <style>
      @import url("../css/home.css");
      /*@import url("../css/pagenumber.css");*/
      /*@import url("../css/timebank.css");*/
    </style>
    <title>時間銀行</title>
    <style>
      a:hover {
        text-decoration:underline;
        color:black;
      }
      a:link, a:visited{
        color:black;
      }
      .item{
        background-color: #fff;
        border-radius: 5px;
        margin-top: 20px;
        margin-left: -10px;
        padding-bottom: 20px;
        padding-top: 20px;
      }
      .item2{
        background-color: #fff;
        border-radius: 5px;
        margin-top: 20px;
        margin-left: 10px;
      }
    #flotcontainer {
        /*width: 600px;*/
        height: 400px;
        text-align: left;
    }
    .trianglel{
        width: 0;
        height: 0;
        border: 15px solid transparent;
        border-right: 25px solid #28bccf;
    }
    .triangler{
        width: 0;
        height: 0;
        border: 15px solid transparent;
        border-left: 25px solid #28bccf;
    }
    </style>
</head>
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
					String sql3="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
						ResultSet rs3=con.createStatement().executeQuery(sql3);
						rs3.next();
						if (session.getAttribute("acc")!=null && session.getAttribute("status")=="志工服務者"){
%>
<body style="background-color: #f4f8f9">
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
    <div class="container-fluid">
        <!--固定側邊清單-->
            <div class="row flex-nowrap" style="background-color: #f4f8f9;">
                <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color: #f4f8f9;padding-top: 4%;border-right:5px white solid;">
                    <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2  min-vh-100" id="sidebar" >
                        <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu" style="position: fixed;">
                            <li class="nav-item">
                                <a href="../page/V_Demand.jsp" class="nav-link align-middle px-0" style="color: black;">
                                    <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">✍🏻 填寫服務需求表單 </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../page/Ser_Reg_Checklist.jsp" class="nav-link align-middle px-0" style="color: black;"> 
                                    <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">📝 審核志工報名 </span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../page/S_time-apply.jsp" class="nav-link align-middle px-0" style="color: black;"> 
                                    <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">⏰ 審核時數受理 </span>
                                </a>
                            </li>
                            <hr>
                            <li class="nav-item">
                                <a href="../page/volunteerself.jsp" class="nav-link align-middle px-0" style="color: black;">
                                    <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">↩️ 個人資料頁面</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="container" style="padding-top: 6%;" id="content">  
                    <div class="row">
        <!--即將到來的服務&個人資料文&個人相片-->
                        <div class="col" style="font-size: 3ch;padding-bottom: 1%;">
                            <b>💎時間銀行</b>
                        </div> 
                    </div>
                    <div class="row">
                            <div class="col-sm-4" style="background-color: white;border-top-left-radius: 3ch;border-bottom-left-radius: 3ch;">
                                <div id="legendPlaceholder"></div>
                                <div id="flotcontainer"></div>
                            </div> 
<%
String getservice = "SELECT `service_name`,`service_date`,`hours`,sum(`hours`) over (order by `service_date` ASC) as '結餘' FROM `application` WHERE `member_ID` ='"+rs3.getString(1)+"' AND `certification_status`='認證成功' ORDER BY `service_date` DESC;";
ResultSet get_service =  con.createStatement().executeQuery(getservice);
%>							
                            <div class="col" style="background-color: white;padding-left: 5ch;border-top-right-radius: 3ch;border-bottom-right-radius: 3ch;">
                                <p style="margin-top: 2ch;font-size: 20px;"><b>💰️時間存摺</b></p>
                                <table class="table" id="myTable" style="text-align: center;">
                                    <thead class="table-light">
                                        <tr>
                                            <th>日期</th>
                                            <th>服務名稱</th>
                                            <th>支出</th>
                                            <th>收入</th>
                                            <th>結餘</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<%
float float_minushours = 0;
float float_plushours = 0;
while(get_service.next()){
	float hours = Float.parseFloat(get_service.getString(3));
	String minushours;
	String plushours;
	if(hours<0){
		minushours = get_service.getString(3).substring(1);
		float_minushours += Float.parseFloat(minushours);
		plushours = "";
	}
	else{
		minushours = "";
		plushours = get_service.getString(3);
		float_plushours += Float.parseFloat(plushours);
	}
%>
                                        <tr>
                                            <td><%=get_service.getString(2)%></td>
                                            <td><%=get_service.getString(1)%></td>
                                            <td><%=minushours%></td>
                                            <td><%=plushours%></td>
                                            <td><%=get_service.getString(4)%></td>
                                        </tr>
<%
}
%> 
                                    </tbody>
                                  </table>
                                    <div class="row">
                                        <div class="col" style="padding-top: 10px;">
                                            <ul class="pagination" style="margin-left: 33%;align-items: center;" id="pageModule" style="display: flex;align-items: center;justify-content: center;"></ul>
                                        </div>
                                    </div>                    
                            </div>
                    </div> 
                    <div class="row" style="margin-top: 3ch;">
                        <div class="col" style="font-size: 3ch;padding-bottom: 1%;">
                            <b>🏵各類別收入比一比</b>
                        </div> 
                        <div class="col-8" style="font-size: 3ch;padding-bottom: 1%;">
                            <b>💞目前提供的服務</b>
                        </div>
                    </div> 
<script>
      function listBtn(n) {
        var listBtn = document.getElementById(n).value;
        var textlistn1 = document.getElementById('show-goverment');
        var textlistn2 = document.getElementById('show-sdgs');
        var month = document.getElementById("start");
        if(listBtn==1 && textlistn1.style.display === 'none'){
          textlistn1.style.display = 'block';
        }
        else{
            textlistn1.style.display = 'none';
        }
        if(listBtn==2 && textlistn2.style.display === 'none'){
            textlistn2.style.display = 'block';
        }
        else  {
          
          textlistn2.style.display= 'none';
        } 
      }
   </script>
             
                    <div class="row">
                        <div class="col" style="background-color: white;border-radius: 3ch;margin-right: 3ch;" >
                          <div class="row">
                            <div class="col-md-auto" style="width: max-content;margin-left: 3ch;margin-top: 2ch;" >
                                <label>請選擇分類</label>
                                <select class="form-select" size="3" aria-label="size 3 select example">
                                    <option value="1" id="1" onclick="listBtn(1)">政府單位</option>
                                    <option value="2" id="2" onclick="listBtn(2)">SDGS</option>
                                </select>
                            </div>
                           <!-- <div class="col" style="width: max-content;margin-top: 2ch;" >
                                <div class="row">
                                    <div class="col">
                                        <label for="start">請選擇月份</label>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <input type="month" id="start" name="start"
                                            min="2021-03" value="2022-06">
                                        </div>
                                    </div>
                                </div>
                            </div>-->
                          </div>
<!--goverment-->
                        <div class="row"  id="show-goverment" style="margin-top: 3ch;display: none;">
                            <div class="col">
<%
String allhours = "SELECT sum(`hours`) FROM `application` WHERE `certification_status`='認證成功';";
ResultSet all_hours = con.createStatement().executeQuery(allhours);
float total=0;
while(all_hours.next()){
		total = Float.parseFloat(all_hours.getString(1));
}
String socialclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%社會類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet social_class = con.createStatement().executeQuery(socialclass);
String s_ocial ="";
float social = 0;
while(social_class.next()){
	s_ocial = social_class.getString(1);
	if(s_ocial==null){
		social = 0;
	}
	else{
		social = Float.parseFloat(social_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>社會類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-success" role="progressbar" style="width:<%=(social/total)*100%>% ;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=social%>小時"><%=social%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String environmentclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%環境類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet environment_class = con.createStatement().executeQuery(environmentclass);
String e_nvironment ="";
float environment = 0;
while(environment_class.next()){
	e_nvironment = environment_class.getString(1);
	if(e_nvironment==null){
		environment = 0;
	}
	else{
		environment = Float.parseFloat(environment_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>環境類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(environment/total)*100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=environment%>小時"><%=environment%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String educationclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%教育類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet education_class = con.createStatement().executeQuery(educationclass);
String e_ducation ="";
float education = 0;
while(education_class.next()){
	e_ducation = education_class.getString(1);
	if(e_ducation==null){
		education = 0;
	}
	else{
		education = Float.parseFloat(education_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>教育類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-warning" role="progressbar" style="width: <%=(education/total)*100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=education%>小時"><%=education%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String cultureclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%文化類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet culture_class = con.createStatement().executeQuery(cultureclass);
String c_ulture ="";
float culture = 0;
while(culture_class.next()){
	c_ulture = culture_class.getString(1);
	if(c_ulture==null){
		culture = 0;
	}
	else{
		culture= Float.parseFloat(culture_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>文化類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-danger" role="progressbar" style="width: <%=(culture/total)*100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=culture%>小時"><%=culture%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String administrationclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%行政類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet administration_class = con.createStatement().executeQuery(administrationclass);
String a_dministration ="";
float administration = 0;
while(administration_class.next()){
	a_dministration = administration_class.getString(1);
	if(a_dministration==null){
		administration = 0;
	}
	else{
		administration= Float.parseFloat(administration_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>行政類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-success" role="progressbar" style="width: <%=(administration/total)*100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=administration%>小時"><%=administration%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String trafficclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%交通類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet traffic_class = con.createStatement().executeQuery(trafficclass);
String t_raffic ="";
float traffic = 0;
while(traffic_class.next()){
	t_raffic = traffic_class.getString(1);
	if(t_raffic==null){
		traffic = 0;
	}
	else{
		traffic= Float.parseFloat(traffic_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>交通類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(traffic/total)*100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=traffic%>小時"><%=traffic%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String ambulanceclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%救護類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet ambulance_class = con.createStatement().executeQuery(ambulanceclass);
String a_mbulance ="";
float ambulance = 0;
while(ambulance_class.next()){
	a_mbulance = ambulance_class.getString(1);
	if(a_mbulance==null){
		ambulance = 0;
	}
	else{
		ambulance= Float.parseFloat(ambulance_class.getString(1));
	}
%>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>救護類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-warning" role="progressbar" style="width: <%=(ambulance/total)*100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=ambulance%>小時"><%=ambulance%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String informationclass = "SELECT sum(`hours`) FROM `application` WHERE `service_class` LIKE '%資訊類%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
ResultSet information_class = con.createStatement().executeQuery(informationclass);
String i_nformation ="";
float information = 0;
while(information_class.next()){
	i_nformation = information_class.getString(1);
	if(i_nformation==null){
		information = 0;
	}
	else{
		information= Float.parseFloat(information_class.getString(1));
	}
%>								
                                <div class="row">
                                    <div class="col-md-auto">
                                        <label>資訊類</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-danger" role="progressbar" style="width: <%=(information/total)*100%>%;color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=information%>小時"><%=information%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
String timebankclass = "SELECT sum(`hours`) FROM application WHERE unit_name LIKE '%時間銀行%' AND `member_ID`='"+rs3.getString(1)+"' AND `certification_status`='認證成功';";
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
%>
                                <div class="row">
                                    <div class="col-md-auto" style="margin-right: -3%;">
                                        <label>時間銀行</label>
                                    </div>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-success" role="progressbar" style="width: <%=(timebank/total)*100%>%;color:black;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" title="<%=timebank%>小時"><%=timebank%>小時</div>
                                        </div>
                                    </div>
                                </div>
<%
}
%>
                            </div>
                        </div>
                        <div class="row"  id="show-sdgs" style="margin-top: 3ch;display: none;">
                            <div class="col">
                                    <div class="col-md-auto">
                                        <label>SDGS1 終結貧窮</label>
                                    </div>
<%
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
%>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-success" role="progressbar" style="width: <%=(sdgs1/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs1%>小時"><%=sdgs1%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS2 消除飢餓</label>
                                    </div>
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
%>
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs2/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs2%>小時"><%=sdgs2%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS3 健康與福祉</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs3/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs3%>小時"><%=sdgs3%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS4 優質教育</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs4/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs4%>小時"><%=sdgs4%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS5 性別平權</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs5/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs5%>小時"><%=sdgs5%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS6 淨水及衛生</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs6/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs6%>小時"><%=sdgs6%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS7 可負擔的潔淨能源</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs7/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs7%>小時"><%=sdgs7%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS8 合適的工作及經濟成長</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs8/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs8%>小時"><%=sdgs8%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS9 工業化、創新及基礎建設</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs9/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs9%>小時"><%=sdgs9%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS10 減少不平等</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs10/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs10%>小時"><%=sdgs10%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS11 永續城鄉</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs11/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs11%>小時"><%=sdgs11%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS12 責任消費及生產</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs12/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs12%>小時"><%=sdgs12%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS13 氣候行動</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs13/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs13%>小時"><%=sdgs13%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS14 保育海洋生態</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs14/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs14%>小時"><%=sdgs14%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS15 保育陸域生態</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs15/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs15%>小時"><%=sdgs15%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS16 和平、正義及健全制度</label>
                                    </div>
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
%>									
                                    <div class="col">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs16/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs16%>小時"><%=sdgs16%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                                    <div class="col-md-auto" >
                                        <label style="margin-top: 1%;">SDGS17 多元夥伴關係</label>
                                    </div>
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
%>									
                                    <div class="col" style="margin-bottom: 3ch;">
                                        <div class="progress" style="margin-top: 1%;">
                                            <div id="progress1" class="progress-bar bg-info" role="progressbar" style="width: <%=(sdgs17/total)*100%>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"title="<%=sdgs17%>小時"><%=sdgs17%>小時</div>
                                        </div>
                                    </div>
<%
}
%>
                            </div>
                        </div>
                        </div>

                        <!--<div class="col-8" style="background-color: white;border-radius: 3ch;" >
                                <div class="table-responsive">
                                       <table class="table table-hover" style="table-layout: fixed;text-align: center;" id="myTable2">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10ch;">服務單位</th>
                                                    <th style="width: 20ch;">服務類別</th>
                                                    <th style="width: 20ch;">服務名稱</th>
                                                    <th style="width: 20ch;">服務內容</th>
                                                    <th style="width: 13ch;">服務日期</th>
                                                    <th style="width: 10ch;">服務時間<br>(開始)</th>
                                                    <th style="width: 1ch;"></th>
                                                    <th style="width: 10ch;">服務時間<br>(結束)</th>
                                                    <th style="width: 30ch;">服務地點</th>
                                                    <th style="width: 10ch;">人數需求</th>
                                                    <th style="width: 30ch;">志工條件</th>
                                                    <th style="width: 20ch;">連絡電話</th>
                                                    <th style="width: 10ch;">刪除服務</th>
                                                </tr>
                                              </thead>
                                              <tbody>											
                                              </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col" style="padding-top: 10px;">
                                            <ul class="pagination" style="margin-left: 33%;align-items: center;" id="pageModule2" style="display: flex;align-items: center;justify-content: center;"></ul>
                                        </div>
                                    </div> 
                                </div>--> 
<%//喵喵喵喵喵喵喵喵喵喵
						
			

	
			
						
						String m_id = rs3.getString(1);
						
						String sql2="select * from `service` WHERE `member_ID` = '"+ m_id +"';";
						ResultSet rs2=con.createStatement().executeQuery(sql2);
						rs2.next();
%>
                        <div class="col-8" style="background-color: white;border-radius: 3ch;" >
                                <div class="table-responsive">
                                       <table class="table table-hover" style="table-layout: fixed;text-align: center;" id="myTable2">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10ch;">服務單位</th>
                                                    <th style="width: 20ch;">服務類別</th>
                                                    <th style="width: 20ch;">服務名稱</th>
                                                    <th style="width: 20ch;">服務內容</th>
                                                    <th style="width: 13ch;">服務日期</th>
                                                    <th style="width: 10ch;">服務時間<br>(開始)</th>
                                                    <th style="width: 1ch;"></th>
                                                    <th style="width: 10ch;">服務時間<br>(結束)</th>
                                                    <th style="width: 30ch;">服務地點</th>
                                                    <th style="width: 10ch;">人數需求</th>
                                                    <th style="width: 30ch;">志工條件</th>
                                                    <!--<th style="width: 20ch;">連絡電話</th>-->
                                                    <th style="width: 10ch;">刪除服務</th>
                                                </tr>
                                              </thead>
                                              <tbody>
<%
						rs2=con.createStatement().executeQuery(sql2);
						while(rs2.next()){
%>											  
                                                <tr>
                                                    <td><%=rs2.getString(2)%></td>
                                                    <td><%=rs2.getString(6)%></td>
                                                    <td><%=rs2.getString(5)%></td>
                                                    <td><%=rs2.getString(4)%></td>
                                                    <td><%=rs2.getString(10)%></td>
                                                    <td><%=rs2.getString(11)%></td>
                                                    <td> ~ </td>
                                                    <td><%=rs2.getString(12)%></td>
                                                    <td><%=rs2.getString(15)%></td>
                                                    <td><%=rs2.getString(13)%></td>
                                                    <!--<td></td>-->
                                                    <td><%=rs2.getString(16)%></td>
                                                    <form action="timebank_del.jsp" method="post">
														<input type="hidden" id="getvalue" name="getvalue2" value="<%=rs2.getString(1)%>">
														<td>
															<div class="PublicTableBtnIcon Color4Btn Js_delete" style="background-color:red; ">
																<i class="iconfont icon-shanchu"></i>
																<input type="submit" style="background-color:red; color:white; border:0px" value="刪除">
															</div>
														</td>
													</form>
												</tr>												
<%
}

%>
</tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col" style="padding-top: 10px;">
                                            <ul class="pagination" style="margin-left: 33%;align-items: center;" id="pageModule2" style="display: flex;align-items: center;justify-content: center;"></ul>
                                        </div>
                                    </div> 
                                </div>
								
                            </div>
                        </div>
                    </div> 
        </div>             
<input type="hidden" id="total" value="<%=total%>">
<input type="hidden" id="float_minushours" value="<%=float_minushours%>">
<input type="hidden" id="float_plushours" value="<%=float_plushours%>">  
    <script>
                                    $(function () { 
										var float_minushours = document.getElementById("float_minushours").getAttribute("value");
										var float_plushours = document.getElementById("float_plushours").getAttribute("value");
										var total = document.getElementById("total").getAttribute("value");
                                        var data = [
                                            {label: "收入", data: float_plushours/total},
                                            {label: "支出", data: float_minushours/total}
                                        ];
                                     
                                        var options = {
                                                series: {
                                                    pie: {
                                                        show: true,
                                                        innerRadius: 0.5,
                                                        label: {
                                                            show: true
                                                        }
                                                    }
                                                }
                                            };
                                        $.plot($("#flotcontainer"), data, options);  
                                    });
                                    
    </script>
 <%
	}
			else {
				response.sendRedirect("volunteerserversignin.jsp");
			}
 %>
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
            <b style="font-size: 3ch;">瀏覽人次:6666人</b>
          </div>      
        </div>               
      </div>     
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
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