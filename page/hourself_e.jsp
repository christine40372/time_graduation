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
  <!--頁碼-->
  <script src="../js/jquery-3.6.0.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
  <script src="../js/Recent_Reg.js"></script>

    <!--<script src="js/jquery-1.9.1.min.js"></script>-->
    <link href="../css/iconfont.css" rel="stylesheet" />
    <link href="../css/index.css" rel="stylesheet" />
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="../js/f.js"></script>
    <title>時數認證者個人資料頁面</title>
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
  font-family: 微軟正黑體;
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
font-family:微軟正黑體;
font-size:18px;
color:darkslategray;
position: absolute;
top:70px;
left:40px;
}

</style>
</head>
<body >
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
								response.sendRedirect("hoursignin.jsp");
							}
							else {
								String m_id = rs.getString(1);
								sql="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"' AND `member_class` = '時數認證者';";
	%>
<div class="container-fluid">
<!--固定側邊清單-->
    <div class="row flex-nowrap" style="background-color: #f4f8f9;">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color: #f4f8f9;padding-top: 4%;border-right:5px white solid;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2  min-vh-100" id="sidebar" >
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu" style="position: fixed;">
                    <li class="nav-item">
                        <a href="../page/T_time-apply.jsp" target="_blank" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">📝 審核時數認證 </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/changeself_h_e.jsp" class="nav-link align-middle px-0" style="color: black;"> 
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">✏️ 修改個人資料 </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/changepassword_h.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">🔏修改密碼</span>
                        </a>
                    </li>
                    <hr>
                    <li class="nav-item">
                        <a href="signout.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">↩️ 登出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container" style="padding-top: 6%;padding-left: 8ch;" id="content">  
            <div class="row">
<!--即將到來的服務&個人資料文&個人相片-->
                <div class="col-sm-3" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>🏵徽章</b>
                </div> 
                <div class="col-sm-8" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>💁‍♂️💁個人資料</b>
                </div>
                <div class="row">
                    <div class="col-sm-3" style="background-color: white;margin-right: 3ch;border-radius: 3ch;">
                        <!--徽章-->
                        <div style="margin-left: 1ch;margin-top: 8ch;">
                            <div style="margin-left: 4ch;margin-top: 5ch;">
                                    <img src="../image/e.png" style="width:4cm;">   
                        </div>  
                        </div>
                    </div>
					
                    <div class="col" style="background-color: white;border-top-left-radius: 3ch;border-bottom-left-radius: 3ch;padding-left: 5ch;padding-top: 4ch;">
						<div class="mb-3 row" style="margin-top: 2ch;">
                            <label for="chinese-name" class="col-6 col-md-4 col-form-label">單位名稱</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="chinese-name" value="<%=rs.getString(2)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="english-name" class="col-6 col-md-4 col-form-label">承辦人姓名</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="english-name" value="<%=rs.getString(3)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="person-id" class="col-6 col-md-4 col-form-label">承辦人電話</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="person-id" value="<%=rs.getString(4)%>">
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="email" class="col-6 col-md-4 col-form-label">承辦人電子郵件</label>
                            <div class="col-md-auto">
                              <input type="text" readonly class="form-control-plaintext" id="email" value="<%=rs.getString(5)%>">
                            </div>
                          </div>
                    </div>
					
                    <div class="col-md-auto" style="background-color: white;line-height: 341px;border-top-right-radius: 3ch;border-bottom-right-radius: 3ch;">
                        <!--<img src="../image/po.jpg" style="width: 5cm;border-radius: 3ch;margin-right: 5ch;">-->
                    </div>   
                </div>                  
            </div> 
            <br>
            <div class="col-sm-4" style="font-size: 3ch;padding-bottom: 1%;">
                <b>✔核准紀錄</b>
            </div>
			<%
							String sql2="select * from `application` WHERE `certification_ID` = '"+ m_id +"'AND `audit_status` = '審核成功' AND `certification_status` = '認證成功';";
							ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2);
							
							//sql2="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"' UNION select * from `application` WHERE `certification_status` = '認證成功';";	
							
			%>
                <div class="container" style="background-color: white;height: auto;border-radius:10px;">
                  <table class="table table-hover" style="margin-bottom: 0;text-align: center;"id="myTable">
                      <thead>
                        <tr>
                          <th scope="col">學生姓名</th>
                          <th scope="col">身分證字號</th>
                          <th scope="col">申請單位</th>
                          <th scope="col">服務類別</th>
                          <th scope="col">服務日期</th>
                          <th scope="col">服務時數</th> 
                        </tr>
                      </thead>
					<%	
						while(rs2.next()){
					%>
                        <tr>
                          <th scope="row"><%=rs2.getString(5)%></th>
                          <td><%=rs2.getString(6)%></td>
                          <td><%=rs2.getString(7)%></td>
                          <td><%=rs2.getString(9)%></td>
                          <td><%=rs2.getString(10)%></td>
                          <td><%=rs2.getString(15)%></td>    
                        </tr>
					<%
						}
					%>
					  <tbody>
					
                        <!--<tr>
                          <th scope="row">蔡皓羽</th>
                          <td>E227362512</td>
                          <td>靖娟基金會</td>
                          <td>教育服務</td>
                          <td>111.06.04</td>
                          <td>5</td>    
                        </tr>
                        <tr>
                          <th scope="row">李函諭</th>
                          <td>N229632587</td>
                          <td>溪湖糖廠自治協會</td>
                          <td>文化推廣</td>
                          <td>111.06.01</td>
                          <td>3</td>
                        </tr>
                        <tr>
                          <th scope="row">吳郁儒</th>
                          <td>A226325412</td>
                          <td>社團法人台灣無毒世界協會</td>
                          <td>社會福利</td>
                          <td>111.05.18</td>
                          <td>2</td>
                        </tr>
                        <tr>
                          <th scope="row">周俊華</th>
                          <td>A125695871</td>
                          <td>陽光基金會中區服務中心</td>
                          <td>社會福利</td>
                          <td>111.06.19</td>
                          <td>2</td>
                        </tr>
                        <tr>
                          <th scope="row">關怡伶</th>
                          <td>P226363961</td>
                          <td>台灣之心愛護動物協會</td>
                          <td>SDGS-保護陸域生態</td>
                          <td>111.06.26</td>
                          <td>5</td>
                        </tr>-->
                      </tbody>
                    </table>
                </div>
                <div class="container" style="margin-top: 3ch;">
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
              </div>
          </div>
        </div>
    </div>
</div>              
<footer style="background-color: #b6c3a7;width: 100%;z-index: 2;">
    <img style="width: 100%; height: auto; margin-bottom: -3%;" src="../image/newfooter.png" class="img-fluid"> 
    <div class="container">
        <div class="row">
          <div class="col-8" style="padding-bottom: 3ch;">
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
  <%
						}
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
 <!--不確定是甚麼--->
<script src="../js/bootstrap.bundle.min.js"></script>

  
  </body>
  
  </html>