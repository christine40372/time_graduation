<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous"> 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <style>@import url("../css/home.css");</style>
    <title>服務需求表單</title>
    <style>     
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
				  
				  String countp="select * from `counter`"; 
				  ResultSet r=con.createStatement().executeQuery(countp);
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="服務提供者"){
%>  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>

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

    <div style="padding-top: 15ch;"></div>
    <div class="container" style="padding-bottom: 3%;">
      <div class="row">
        <div class="col" style="height: fit-content;" >
          <div style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;text-align: center;"><b>服務需求表單</b></div>
          <hr>
          <form name="form1" method="post" action="S_Demand2.jsp" style="font-size: large;margin-top: 3ch;">
		  <input type="hidden" name="memberID" value="<%=rs5.getString(1)%>">
              <div class="form-group row">
               <label for="Name" class="col-4 col-form-label" style="text-align: center;"> <b>服務單位</b></label>
                <div class="col-8" style="padding-right: 5ch;">
                  <input type="text" name="unit_name" class="form-control" id="unit" value="<%=rs5.getString(2)%>" >
                </div>
              </div>
              <div class="form-group row">
                  <label for="person-id" class="col-4 col-form-label" style="text-align: center;"><b>服務名稱</b></label>
                  <div class="col-8" style="padding-right: 5ch;">
                    <input type="text" name="service_name"  class="form-control" id="servicename" >
                  </div>
              </div>

              <div class="form-group row">
                  <label for="service-name" name="service_class" class="col-4 col-form-label" style="text-align: center;"><b>服務類別</b></label>
              </div>
              <div class="form-group row">
                <div class="col">
                      <div class="accordion accordion-flush" id="accordionFlushExample" style="margin-left:4ch;margin-right: 4ch;">
                            <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                  SDGs
                                </button>
                              </h2>
                              <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                  <input value="終結貧窮" type="checkbox" name="sdgs">終結貧窮
                                  <input value="消除飢餓" type="checkbox"name="sdgs">消除飢餓
                                  <input value="健康福祉" type="checkbox"name="sdgs">健康與福祉
                                  <input value="優質教育" type="checkbox"name="sdgs">優質教育
                                  </br>
                                  <input value="性別平權" type="checkbox"name="sdgs">性別平權
                                  <input value="淨水衛生" type="checkbox"name="sdgs">淨水及衛生
                                  <input value="可負擔的潔淨能源" type="checkbox"name="sdgs">可負擔的潔淨能源
                                  <br>
                                  <input value="合適的工作及經濟成長" type="checkbox"name="sdgs">合適的工作及經濟成長             
                                  <input value="工業化、創新及基礎建設" type="checkbox"name="sdgs">工業化、創新及基礎建設
                                  <br>
                                  <input value="減少不平等" type="checkbox"name="sdgs">減少不平等
                                  <input value="永續城鄉" type="checkbox"name="sdgs">永續城鄉
                                  <input value="責任消費生產" type="checkbox"name="sdgs">責任消費生產
                                  <input value="氣候行動" type="checkbox"name="sdgs">氣候行動
                                  <br>
                                  <input value="和平、正義及健全制度" type="checkbox"name="sdgs">和平、正義及健全制度
                                  <input value="保育海洋生態" type="checkbox"name="sdgs">保育海洋生態
                                  <br>
                                  <input value="保育陸域生態" type="checkbox"name="sdgs">保育陸域生態
                                  <input value="多元夥伴關係" type="checkbox"name="sdgs">多元夥伴關係
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                  政府單位類別
                                </button>
                              </h2>
                              <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                 <input value="社會類" type="checkbox"name="sdgs">社會類
                                 <input  value="環境類" type="checkbox"name="sdgs">環境類
                                 <input  value="教育類" type="checkbox"name="sdgs">教育類
                                 <input value="文化類" type="checkbox"name="sdgs">文化類
                                 <input value="行政類" type="checkbox"name="sdgs">行政類
                                 <br>
                                 <input value="交通類" type="checkbox"name="sdgs">交通類
                                  <input value="救護類" type="checkbox"name="sdgs">救護類
                                  <input value="資訊類" type="checkbox"name="sdgs">資訊類
                                </div>
                              </div>
                            </div>
                          </div>
                            <br>
              </div>
            </div>
            <div class="col" style="padding-left: 70%;padding-top: 5ch;">
                  <a href="../page/serversupplyself.jsp"><button class="btn btn-warning" type="button" style="color: white;" >取消</button></a>
                  <button class="btn btn-success" type="submit" style="color: white;">下一步</button> 
              </div>
			   </form>
          </div>
        <div class="col" style="height: fit-content;">
          <img src="../image/S_form.png" class="img-fluid rounded" alt="Responsive image">            
        </div>
      </div>
    </div>

     <!--綠色上半部圖片-->
     <img style="width:100%; height:auto;" src="../image/newfooter.png" class="img-fluid" >

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
		  <%
            }
			else {
				response.sendRedirect("serversupplysignin.jsp");
			}
			 while(r.next()) 
            {
				String c_S= r.getString(1); 
				int c=Integer.parseInt(c_S); 

				if (session.isNew()) { 
					c++; 
				countp="update `counter` set `count`=" + c; 
				%>
				
				
				<b style="font-size: 3ch;">
				<%
				out.print("瀏覽人次："+c+"人"+"<br/>");
				%>
				</b>
	
				<%
			}
			else  
			{
				%>
				
				<b style="font-size: 3ch;">
				<%
				out.print("瀏覽人次："+c+"人"+"<br/>");

			} 

			}
			con.createStatement().execute(countp); 
			%> 
				
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