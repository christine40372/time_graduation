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
    <title>服務提供者個人資料頁面</title>
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
								response.sendRedirect("serversupplysignin.jsp");
							}
							else {
								String m_id = rs.getString(1);
								sql="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"' AND `	member_class` = '服務提供者';";
	%>
<div class="container-fluid">
<!--固定側邊清單-->
    <div class="row flex-nowrap" style="background-color: #f4f8f9;">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" style="background-color: #f4f8f9;padding-top: 4%;border-right:5px white solid;">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2  min-vh-100" id="sidebar" >
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu" style="position: fixed;">
                    <li class="nav-item">
                        <a href="../page/Ser_Reg_Checklist.jsp"target="_blank" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">📝 審核志工報名</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/S_time-apply.jsp" target="_blank" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">⏰ 審核時數受理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/S_Demand.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">✍🏻 填寫服務需求表單</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/changeself_s.jsp" class="nav-link align-middle px-0" style="color: black;"> 
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline"> ✏️修改個人資料 </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../page/changepassword_s.jsp" class="nav-link align-middle px-0" style="color: black;">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">🔏 修改密碼</span>
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
                <div class="col-sm-8" style="font-size: 3ch;padding-bottom: 1%;">
                    <b>💁‍♂️💁個人資料</b>
                </div>
                <div class="row">
                   
                    <div class="col" style="background-color: white;border-top-left-radius: 3ch;border-bottom-left-radius: 3ch;padding-left: 5ch;">
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
                        <!--<img src="../image/0.jpeg" style="width: 5cm;border-radius: 3ch;margin-right: 5ch;">-->
                    </div>   
                </div>                  
            </div> 
            <br>
            <div class="col-sm-4" style="font-size: 3ch;padding-bottom: 1%;">
                <b>💞目前已提供的服務</b>
            </div>
            <div class="PublicPointToAgeText">

                <span class="span2">*若已有志工報名該活動，請另行通知該志工，本網站不負任何責任。</span></div>
                <!--查詢
                <div class="InquireBox clearfix">
                    <div class="InquireleftBox">
                        <div class="Text">搜尋：</div>
                        <div class="InputDiv">
                            <input class="phoneInput" placeholder="請輸入您要搜尋的欄位" /></div>
                        </div>
                        <div class="PublicBtnIcon Color1Btn fr">
                            <i class="iconfont icon-icon-chaxun"></i>
                            <span>搜尋</span>
                        </div>
                    </div>
                    修改列表
                    <div class="InquireTableBox">
                        <div class="headbox">
                            <div class="headboxtext">
                                <span class="span1">網站消息管理列表</span>
                            </div>
                            勾選刪除
                            <div class="PublicBtnIcon Color5Btn">
                                <i class="iconfont  icon-shanchu"></i>
                                <span>勾選刪除</span>
                            </div>
                            <div class="PublicBtnIcon Color2Btn fr Js_edit">
                                <i class="iconfont icon-changyongtubiao-mianxing-"></i>
                                <span>新增網站消息</span>
                            </div>
                        </div>-->
                        <!--查詢到的表格-->
						
						<%
							String sql2="select * from `service` WHERE `member_ID` = '"+ m_id +"';";
							ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2);
							rs2.next();

							
			%>
                        <div class="InquireSelectTable">
                            <table class="PublicTableCss">
                                <thead>
                                    <tr>
                                       <!--<td>
                                            <input id="inputcheck" class="inputcheck" type="checkbox" name="inputcheck" />
                                            <label for="inputcheck"></label>
                                            <span>全選</span>
                                        </td>--> 
                                        <td>服務名稱</td>
                                        <td>服務內容</td>
                                        <td>服務日期與時段</td>
                                        <td>需求人數</td>
                                        <td>服務單位</td>
                                        <td>服務地點</td>
                                        <td>服務類別</td>
                                        <td>志工服務條件</td>
                                        <td>目前報名人數</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
					<%				
						rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2);
						while(rs2.next()){
					%>
                                    <tr>
                                        <!--<td>
                                            <input id="aa" class="inputcheck" type="checkbox" name="inputcheck" />
                                            <label for="aa"></label>
                                        </td>-->
                                        <td><%=rs2.getString(5)%></td>
                                        <td><%=rs2.getString(4)%></td>
                                        <td><%=rs2.getString(10)%> <%=rs2.getString(11)%> ~ <%=rs2.getString(12)%></td>
                                        <td><%=rs2.getString(13)%></td>
                                        <td><%=rs2.getString(2)%></td>
                                        <td><%=rs2.getString(15)%></td>
                                        <td><%=rs2.getString(6)%></td>
                                        <td><%=rs2.getString(16)%><br></td>
										<td><%
											if(rs2.getString(14) == null){
												out.print("0");
											}
											else{
												out.print(rs2.getString(14));
											}
										%></td>
										<form action="serversupplyself_del.jsp" method="post">
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
									</br>
                                            <!--頁碼-->
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
						
                        <!--添加訓練公告-->
                        <div class="PublicFloatBox adduser"><div class="f_MiddleBox wid400"><div class="f_Head">
                            <span>新增網站消息</span>
                            <i class="Js_closeBtn iconfont icon-buoumaotubiao20 fr"></i>
                        </div>
                        <div class="f_content">
                            <div class="f_alonediv">
                                <div class="f_alone_name">日期</div>
                                <div class="f_alone_input">
                                    <input class="f_p_input" />
                                </div>
                                <!--提示消息-->
                                <div class="f_pormat">請輸入日期(例:2022.01.01)</div>
                            </div>
                            <div class="f_alonediv">
                                <div class="f_alone_name">訊息欄</div>
                                <div class="f_alone_input">
                                    <input class="f_p_input" />
                                </div>
                                <!--提示消息-->
                                <div class="f_pormat">請輸入欲公告的訊息</div>
                            </div>
                            <div class="f_alonediv1">
                                <div class="f_alone_name"></div>
                                <div class="f_alone_input1">
                                    <!--視窗按鈕-->
                                    <div class="publicf_btn">
                                        <div class="publicf_btn1">確定修改 </div>
                                        <div class="publicf_btn2 fr Js_closeBtn">取消 </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
				out.println("SQL錯誤"+sExec.toString());
		  
			}
		}
		catch (ClassNotFoundException err) {
			out.println("class錯誤"+err.toString());
		}
	%>   
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
 <!--不確定是甚麼--->
<script src="../js/bootstrap.bundle.min.js"></script>

  
  </body>
  
  </html>