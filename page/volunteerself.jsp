<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>@import url("../css/home.css");</style>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
     <script>
      function listBtn(n) {
        var listBtn = document.getElementById(n).value;
        var textlistn = document.getElementById('show-sdgs'); 
        if(listBtn==10 && textlistn.style.display === 'none'){
          textlistn.style.display = 'block';
        }else  {
          textlistn.style.display = 'none';
        } 
      }
      function listBtn2(n) {
        var listBtn = document.getElementById(n).value;
        var textlistn = document.getElementById('show-sdgs2'); 
        if(listBtn==10 && textlistn.style.display === 'none'){
          textlistn.style.display = 'block';
        }else  {
          textlistn.style.display = 'none';
        } 
      }
   </script>


    <!--<script src="js/jquery-1.9.1.min.js"></script>-->
    <link href="../css/iconfont.css" rel="stylesheet" />
    <link href="../css/index.css" rel="stylesheet" />
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="../js/f.js"></script>
    <title>?????????????????????????????????</title>
    <style>
a{
    text-decoration: none;
    
  }
a:hover{
    text-decoration: underline;
    color: black;
  }
  .t2{
  color:rgb(0, 0, 0) ;
  background-color:	white ;
  font-size: 25px;
  font-family: ???????????????;
  font-weight: bold;
  border-style: outset;
  border-color: #9ec296;
  margin-right:15cm;
  margin-left:1cm;
  border-radius: 30px;
  text-align: center;
} 
.s{
  text-align: left;
  color: black;
  font-size: 15px;
  margin-right: 1cm;
  }
.skills {
    text-align: right;
    color: #5b5858;
  }
div.s{
left:6cm;
}
span.t2{
font-family:???????????????;
font-size:18px;
color:darkslategray;
position: absolute;
top:70px;
left:40px;
}
.timeline {
width: 100%;
height:20px;
background-color:#fff8e0;
text-align: right;
border-radius:10px;
}
.a {
width: 70%;
height:20px;
background-color: #FFC79A;
animation-name: skill100;
animation-duration: 10s;
animation-iteration-count: infinite;
border-radius:10px;
padding-right: 5px;
}
.b {
width: 70%;
height:20px;
background-color:#FFD7B7;
animation-name: skill90-1;
animation-duration: 10s;
animation-iteration-count: infinite;
border-radius:10px;
padding-right: 5px;
}
.c{
width:60%;
height:20px;
background-color: #FEE5D7;
animation-name: skill90-2;
animation-duration: 10s;
animation-iteration-count: infinite;
border-radius:10px;
padding-right: 5px;
}
.d {
width: 70%;
height:20px;
background-color: 	#FFD7B7;
animation-name: skill75;
animation-duration: 10s;
animation-iteration-count: infinite;
border-radius:10px;
padding-right: 5px;
}
.e{
width: 75%;
height:20px;
background-color: 	#FEE5D7;
animation-name: skill70;
animation-duration: 10s;
animation-iteration-count: infinite;
border-radius:10px;
padding-right: 5px;
}
.f{
width: 75%;
height:20px;
background-color: 	#FEE5D7;
animation-name: skill70;
animation-duration: 10s;
animation-iteration-count: infinite;
border-radius:10px;
padding-right: 5px;
}

.skk{	
  width:200px;
  height: 70px;
  background-color: rgba(0,0,0, 0.1);
  color:rgb(148, 57, 57);
  padding: 7px 15px 7px 15px;
  border-color: rgb(223, 19, 19);
  border-spacing: border-box;
  border-style: dotted;
  letter-spacing: 2px;
  border-radius: 30px;
  top:20px;
  left:20px;
  }
* {
  box-sizing: border-box;
}
.timeline2 {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
}
.timeline2:after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: rgb(148, 57, 57) ;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}
@keyframes skill100{
10% {width: 0%}
40% {width: 100%}
100% {width:100%}
}
@keyframes skill90-1 {
25% {width: 0%}
60% {width: 90%}
100% {width: 90%}
}
@keyframes skill90-2 {
25% {width: 0%}
60% {width: 90%}
100% {width: 90%}
}
@keyframes skill75 {
20% {width: 0%}
55% {width: 75%}
100% {width: 75%}
}
@keyframes skill70 {
30% {width: 0%}
90% {width: 70%}
100% {width: 70%}
}
</style>
</head>
<body >
    <!--?????????-->
<header style="background-color: white; width: 100%; height: 70px; position: fixed; top: 0px; z-index: 2;">
    <div class="container">
        <div class="row"> 
          <div class="col">    
            <a href="../html/index.jsp"><img style="width:150%;height: auto;" src="../image/logo.png" ></a>
          </div>
          <div class="col">    
           
            </div>
            <div class="col-md-auto">
              <a href="../page/guide.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">????????????</b></a>  
            </div>
            <div class="col-md-auto">
              <a href="../page/search.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">????????????</b></a> 
            </div>
            <div class="col-md-auto">
              <a href="../page/hoursignin.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">???????????????</b></a>
            </div>
            <div class="col-md-auto">
              <a href="../page/serversupplysignin.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">???????????????</b></a>
            </div>
            <div class="col-md-auto">
              <a href="../page/volunteerserversignin.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">???????????????</b></a>
            </div>
            <div class="col-md-auto">
              <a href="../page/aboutus.jsp"><b style="font-size: 3ch;text-align:center;line-height: 60px;color: black;">????????????</b></a>
            </div>
          </div>
      </div>
      
  </header>
  <%
				try {
					//Step 1: ??????????????????????????? 
					Class.forName("com.mysql.jdbc.Driver");
					try {
					//Step 2: ???????????? 	
						String url="jdbc:mysql://localhost/?serverTimezone=UTC";
						String sql="";
						Connection con=DriverManager.getConnection(url,"root","1234");
						if(con.isClosed())
							out.println("??????????????????");
						else {
						//Step 3: ???????????????   
							sql="USE `project`";
							con.createStatement().execute(sql);
							sql="select * from `member`";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
							rs.last();
							int totalNo=rs.getRow();
							
							
							String countp="select * from `counter`"; 
							ResultSet r=con.createStatement().executeQuery(countp);
							
							sql="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
							rs=con.createStatement().executeQuery(sql);
							rs.next();

							if (session.getAttribute("acc")==null){
								response.sendRedirect("volunteerserversignin.jsp");
							}
							else {
								String m_id = rs.getString(1);
								String handbook = rs.getString(13);
								if(handbook.equals("Y")){
									handbook = "???";
								}
								else if(handbook.equals("N")){
									handbook = "???";
								}
								else{
									handbook = "??? ???????????????";
								}
								
								sql="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"' AND `member_class` = '???????????????';";
	%>
<div class="container-fluid">
<!--??????????????????-->
    <div class="row flex-nowrap" style="background-color: #f4f8f9;">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color: #f4f8f9;padding-top: 4%;border-right:5px white solid;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2  min-vh-100" id="sidebar" >
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu" style="position: fixed;">
                    <li class="nav-item">
                        <a href="../page/sb_sdgs.jsp" target="_blank" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">??????? ???????????? </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/Registration_record.jsp" target="_blank" class="nav-link align-middle px-0" style="color: black;"> 
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">??????? ???????????? </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/allservicerecord.jsp" target="_blank" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">???????????????????????????? </span>
                        </a>
                    </li>
                    <li class="nav-item">
                      <a href="../page/serverapply.jsp" target="_blank" class="nav-link align-middle px-0" style="color: black;">
                          <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">??????????????????????????? </span>
                      </a>
                  </li>
                    <li class="nav-item">
                        <a href="../page/changeself_v.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">?????? ??????????????????</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/changepassword_v.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">????????????????</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/timebank.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">??????? ????????????</span>
                        </a>
                    </li>
                    <hr>
                    <li class="nav-item">
                        <a href="signout.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">?????? ??????</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
		<%
							String sql2="select * from `sing_up` WHERE `member_ID` = '"+ m_id +"'AND `sing_up_status` = '????????????';";
							ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2);
							rs2.next();
							rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2);
							rs2.last();
							int totalNo2=rs2.getRow();
							sql2="select * from `sing_up` WHERE `member_ID` = '"+ m_id +"'AND `sing_up_status` = '????????????';";
							rs2=con.createStatement().executeQuery(sql2);
							rs2.next();
		%>
        <div class="container" style="padding-top: 6%;padding-left: 8ch;" id="content">  
            <div class="row">
<!--?????????????????????&???????????????&????????????-->
                <div class="col-sm-4" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>?????????????????????????</b>
                </div> 
                <div class="col-sm-8" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>?????????????????????????????</b>
                </div>
                <div class="row">
                    <div class="col-sm-4" style="background-color: white;margin-right: 3ch;border-radius: 3ch;">
				<%
					for(int i=0; i<totalNo2; i++){
				%>
                        <div style="margin-left: 4ch;margin-top: 2ch;">
                            <nobr><input type="date" readonly id="upcoming-services-date" value="<%=rs2.getString(8)%>" style="border: none; outline: none;background-color: transparent;text-align: left;"></nobr>
                            <nobr><input type="text" readonly id="upcoming-services-s-name" value="<%=rs2.getString(4)%>" style="border: none; outline: none;background-color: transparent;text-align: left;width: 150px;"></nobr>
                        </div>
				<%
						rs2.next();
					}
				%>
                    </div>
                    <div class="col" style="background-color: white;border-top-left-radius: 3ch;border-bottom-left-radius: 3ch;padding-left: 5ch;">
                        <div class="mb-3 row" style="margin-top: 2ch;">
                            <label for="chinese-name" class="col-6 col-md-4 col-form-label">????????????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="chinese-name" value="<%=rs.getString(3)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="english-name" class="col-6 col-md-4 col-form-label">????????????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="english-name" value="<%=rs.getString(9)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="person-id" class="col-6 col-md-4 col-form-label">???????????????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="person-id" value="<%=rs.getString(10)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="student-id" class="col-6 col-md-4 col-form-label">??????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="student-id" value="<%=rs.getString(11)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="phone" class="col-6 col-md-4 col-form-label">????????????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="phone" value="<%=rs.getString(4)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="email" class="col-6 col-md-4 col-form-label">????????????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="email" value="<%=rs.getString(5)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="email" class="col-6 col-md-4 col-form-label">????????????</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="book" value="<%=handbook%>">
                            </div>
                          </div>
                    </div>
                    <div class="col-md-auto" style="background-color: white;line-height: 341px;border-top-right-radius: 3ch;border-bottom-right-radius: 3ch;">
                        <!--<img src="../image/ppp0.jpeg" style="width: 5cm;border-radius: 3ch;margin-right: 5ch;">-->
                    </div>   
                </div>                  
            </div> 
            <div class="row" style="margin-top: 3ch;">
                <div class="col" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>?????????????????????????</b>
                </div> 
                <div class="col" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>?????????????????????????</b>
                </div>
            </div>           
            <div class="row">
<!--????????????-->
                <div class="col" style="background-color: white;border-radius: 3ch;margin-right: 3ch;" >
                  <div class="row">
                    <div class="col-md-auto" style="width: max-content;margin-left: 3ch;margin-top: 2ch;" >
                        <label>???????????????</label>
                        <select class="form-select" size="3" aria-label="size 3 select example">
                            <option value="1" id="1" onclick="listBtn(1)">?????????</option>
                            <option value="2" id="2" onclick="listBtn(2)">?????????</option>
                            <option value="3" id="3" onclick="listBtn(3)">?????????</option>
                            <option value="4" id="4" onclick="listBtn(4)">?????????</option>
                            <option value="5" id="5" onclick="listBtn(5)">?????????</option>
                            <option value="6" id="6" onclick="listBtn(6)">?????????</option>
                            <option value="7" id="7" onclick="listBtn(7)">?????????</option>
                            <option value="8" id="8" onclick="listBtn(8)">?????????</option>
                            <option value="9" id="9" onclick="listBtn(9)">?????????</option>
                            <option value="10"id="10" onclick="listBtn(10)">SDGS</option>
                        </select>
                    </div>
                    <div class="col-md-auto btn-group" id="show-sdgs" style="display: none;width: max-content;margin-top: 2ch;">
                        <label>?????????SDGS??????</label>
                        <select class="form-select" size="3" aria-label="size 3 select example">
                          <option value="1">????????????</option>
                          <option value="2">????????????</option>
                          <option value="3">???????????????</option>
                          <option value="4">????????????</option>
                          <option value="5">????????????</option>
                          <option value="6">???????????????</option>
                          <option value="7">????????????????????????</option>
                          <option value="8">??????????????????????????????</option>
                          <option value="9">?????????????????????????????????</option>
                          <option value="10">???????????????</option>
                          <option value="11">????????????</option>
                          <option value="12">?????????????????????</option>
                          <option value="13">????????????</option>
                          <option value="14">??????????????????</option>
                          <option value="15">??????????????????</option>
                          <option value="16">??????????????????????????????</option>
                          <option value="17">??????????????????</option>
                        </select>
                    </div>
                  </div>
                  <div class="row" style="margin-top: 2ch;">
                    <div class="s">
                      <p class="sk">????????????</p>
                      <div class="timeline">
                          <div class="skills a">????????????</div>
                      </div>
                      <p class="sk">????????????</p>
                      <div class="timeline">
                          <div class="skills b">????????</div>
                      </div>
                      <p class="sk">????????????</p>
                      <div class="timeline">
                          <div class="skills c">????????</div>
                      </div>
                      <p class="sk">????????????</p>
                      <div class="timeline">
                          <div class="skills d">????</div>
                      </div>
                      <p class="sk">????????????</p>
                      <div class="timeline">
                          <div class="skills e">????</div>
                      </div>
                      <p class="sk">????????????</p>
                      <div class="timeline">
                          <div class="skills f">????</div>
                      </div>
                      <br> 
                  </div>
                  </div>
                </div>
                <div class="col" style="background-color: white;border-radius: 3ch;margin-right: 4ch;" >
                  <div class="row">
                      <div class="col-md-auto" style="width: max-content;margin-left: 3ch;margin-top: 2ch;">
                        <label>???????????????</label>
                        <select class="form-select" size="3" aria-label="size 3 select example">
                            <option value="1" id="1" onclick="listBtn2(1)">?????????</option>
                            <option value="2" id="2" onclick="listBtn2(2)">?????????</option>
                            <option value="3" id="3" onclick="listBtn2(3)">?????????</option>
                            <option value="4" id="4" onclick="listBtn2(4)">?????????</option>
                            <option value="5" id="5" onclick="listBtn2(5)">?????????</option>
                            <option value="6" id="6" onclick="listBtn2(6)">?????????</option>
                            <option value="7" id="7" onclick="listBtn2(7)">?????????</option>
                            <option value="8" id="8" onclick="listBtn2(8)">?????????</option>
                            <option value="9" id="9" onclick="listBtn2(9)">?????????</option>
                            <option value="10"id="10" onclick="listBtn2(10)">SDGS</option>
                        </select>
                      </div>
                      <div class="col-md-auto btn-group" id="show-sdgs2" style="display: none;margin-top: 2ch;">
                        <label>?????????SDGS??????</label>
                        <select class="form-select" size="3" aria-label="size 3 select example">
                            <option value="1">????????????</option>
                            <option value="2">????????????</option>
                            <option value="3">???????????????</option>
                            <option value="4">????????????</option>
                            <option value="5">????????????</option>
                            <option value="6">???????????????</option>
                            <option value="7">????????????????????????</option>
                            <option value="8">??????????????????????????????</option>
                            <option value="9">?????????????????????????????????</option>
                            <option value="10">???????????????</option>
                            <option value="11">????????????</option>
                            <option value="12">?????????????????????</option>
                            <option value="13">????????????</option>
                            <option value="14">??????????????????</option>
                            <option value="15">??????????????????</option>
                            <option value="16">??????????????????????????????</option>
                            <option value="17">??????????????????</option>
                        </select>
                      </div>
                    </div>
                    <div class="row" style="margin-top: 5ch;background-color: #fcfdc1;border-radius: 1ch;margin-left: 3ch;margin-right: 3ch;height: 6ch;font-size: large;">
                      <div class="col-md-3">
                        <input type="text" readonly class="form-control-plaintext" id="rank" value="25th" style="text-align: center;color: gray;font-size: medium;line-height: 5ch;">
                      </div>
                      <div class="col col-sm-4" >
                        <input type="text" readonly class="form-control-plaintext" id="user+1" value="????????????" style="text-align: left;line-height: 5ch;">
                      </div>
                      <div class="col" >
                        <label style="line-height: 5ch;"><input type="text" readonly class="form-control-plaintext" id="user+1-hour" value="56" style="display:inline;width: 100px;text-align: center;color: #2622aa;line-height: 5ch;">??????</label>
                      </div>
                    </div>
                    <div class="row" style="margin-top: 2ch;background-color: #fcfdc1;border-radius: 1ch;margin-left: 3ch;margin-right: 3ch;height: 6ch;font-size: large;">
                      <div class="col-md-3">
                        <input type="text" readonly class="form-control-plaintext" id="rank" value="26th" style="text-align: center;color: gray;font-size: medium;line-height: 5ch;">
                      </div>
                      <div class="col col-sm-4" >
                        <input type="text" readonly class="form-control-plaintext" id="user" value="?????????" style="text-align: left;line-height: 5ch;">
                      </div>
                      <div class="col" >
                        <label style="line-height: 5ch;"><input type="text" readonly class="form-control-plaintext" id="user-hour" value="52" style="display:inline;width: 100px;text-align: center;color: #2622aa;line-height: 5ch;">??????</label>
                      </div>
                    </div>
                    <div class="row" style="margin-top: 2ch;background-color: #fcfdc1;border-radius: 1ch;margin-left: 3ch;margin-right: 3ch;height: 6ch;font-size: large;">
                      <div class="col-md-3">
                        <input type="text" readonly class="form-control-plaintext" id="rank" value="27th" style="text-align: center;color: gray;font-size: medium;line-height: 5ch;">
                      </div>
                      <div class="col col-sm-4" >
                        <input type="text" readonly class="form-control-plaintext" id="user-1" value="????????????" style="text-align: left;line-height: 5ch;">
                      </div>
                      <div class="col" >
                        <label style="line-height: 5ch;"><input type="text" readonly class="form-control-plaintext" id="user-1-hour" value="48" style="display:inline;width: 100px;text-align: center;color: #2622aa;line-height: 5ch;">??????</label>
                      </div>
                    </div>
                    <div class="row" style="margin-top: 4ch;margin-left: 3ch;margin-right: 3ch;text-align: center;">
                      <p>&#10043 ???SDGS????????????????????????????????????25?????????4????????????</p>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>
<%
						}
						con.close();
					}
			}
			catch (SQLException sExec) {
				out.println("SQL??????"+sExec.toString());
		  
			}
		}
		catch (ClassNotFoundException err) {
			out.println("class??????"+err.toString());
		}
	%>              
<footer style="background-color: #b6c3a7;width: 100%;z-index: 2;">
    <img style="width: 100%; height: auto; margin-bottom: -3%;" src="../image/newfooter.png" class="img-fluid"> 
    <div class="container">
        <div class="row">
          <div class="col-8" style="padding-bottom: 3ch;">
            <b style="font-size: 3ch;">????????????</b>
            <br>
            E-mail : VTimezone@gmail.com<br>
            Tel : 0800-000-888<br>
            Copyright ?? 2022 CYIM. All Rights Reserved<br>
            ???????????????-????????????X????????????
          </div>
          <div class="col-4">
            <b style="font-size: 3ch;">????????????:6666???</b>
          </div>      
        </div>               
      </div>     
      <!--????????????-->
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                              
  </footer>
  
 <!--??????????????????--->
<script src="../js/bootstrap.bundle.min.js"></script>

  
  </body>
  
  </html>