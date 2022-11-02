<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="shortcut icon" href="../image/favicon.png" type="image/x-icon" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>@import url("../css/home.css");</style>
    <title>報名紀錄總表</title>
    <style>
        a:hover {
          text-decoration:underline;
          color:black;
        }
      </style>
</head>
<script>
    function sortTable(n) {
      var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
      table = document.getElementById("myTable");
      switching = true;
      // 设置升序排列
      dir = "asc";
      /* 设置一个循环语句 */
      while (switching) {
        // 设置循环结束标记
        switching = false;
        rows = table.rows;
        /* 循环列表，从第二行开始 */
        for (i = 1; i < (rows.length - 1); i++) {
          // 设置元素是否调换位置
          shouldSwitch = false;
          /* 获取要比较的元素,
          one from current row and one from the next: */
          x = rows[i].getElementsByTagName("TD")[n];
          y = rows[i + 1].getElementsByTagName("TD")[n];
          /* 判断是否将下一个元素与当前元素进行切换 (asc 或 desc):  */
          if (dir == "asc") {
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
              // 设置调换元素标记，并结束当前循环
              shouldSwitch = true;
              break;
            }
          } else if (dir == "desc") {
            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
              // 设置调换元素标记，并结束当前循环
              shouldSwitch = true;
              break;
            }
          }
        }
        if (shouldSwitch) {
          /* 如果元素调换位置设置为 true，则进行对调操作 */
          rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
          switching = true;
          // 每次对调完成时，将 switchcount 增加 1
          switchcount ++;
        } else {
          /* 如果完成所有元素的排序且 direction 设置为 "asc",这时就将 direction 设置为 "desc" 并再次执行循环 */
          if (switchcount == 0 && dir == "asc") {
            dir = "desc";
            switching = true;
          }
        }
      }
    }
    </script>

     
<!--頁碼-->
<script src="../js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
<script src="../js/Recent_Reg.js"></script>
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
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="志工服務者"){
			
				int a=1;
//Step 5: 顯示結果      
				String rejection="";
				String status="";
				String n_ull="null";
				String getV="";
				String sql="SELECT  ROW_NUMBER()  OVER (ORDER BY`unit_name`) AS apply_num,`unit_name`,`service_name`,`service_class`,`service_sdate`,`service_edate`,`service_date`,`Rejection`,`sing_up_status`,`certification_ID`,`s_member_ID` FROM `sing_up`";
				ResultSet tmp =  con.createStatement().executeQuery(sql);
%>
      <div style="padding-top: 15ch;"></div>
      <div class="container" style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;padding-bottom: 2ch;"><b>報名紀錄總表</b></div>
      <div class="container"style="background-color: white;height: auto;border-radius:10px;width: auto;"> 
	<form action="time_form.jsp" method="post">      
        <table class="table table-hover tablesorter" style="height: 100px;text-align: center;" id="myTable">
                    <thead>
                      <tr>
                        <th scope="col"  class="align-middle" style="width:17% ;">服務單位</th>
						<th scope="col"  class="align-middle" style="width:13% ;">服務名稱</th>
                        <th scope="col"  class="align-middle" style="width: 14%;">服務類別</th>
                        <th scope="col"  class="align-middle" style="width: 10%;cursor: pointer;" onclick="sortTable(3)">服務日期 &#8645</th>
                        <th scope="col"  class="align-middle" style="width: 10%;cursor: pointer;" onclick="sortTable(5)">報名狀態 &#8645</th>
                        <th scope="col"  class="align-middle" style="width: 15%;">拒絕原因</th>
                        <th scope="col"  class="align-middle" style="width: 11%;">服務時數申請</th>
                      </tr>
                    </thead>
                <tbody>
<%
					while(tmp.next()){
						rejection=tmp.getString(8);						
						if(rejection==null){
							rejection="";
						}
						status=tmp.getString(9);
						if(status == null){
							status="報名審核中";
						}
%>				
                    <tr>	
						<input type="hidden" name="c_id<%=a%>" value="<%=tmp.getString(10)%>">
                        <td><input type="hidden" name="unit_name<%=a%>" value="<%=tmp.getString(2)%>"><%=tmp.getString(2)%></td>
						<td><input type="hidden" name="service_name<%=a%>" value="<%=tmp.getString(3)%>"><%=tmp.getString(3)%></td>
                        <td><input type="hidden" name="service_class<%=a%>" value="<%=tmp.getString(4)%>"><%=tmp.getString(4)%></td>
                        <td><input type="hidden" name="service_date<%=a%>" value="<%=tmp.getString(5)%>"><%=tmp.getString(7)%></td>
                        <td id="status<%=a%>"><%=status%></td>
                        <td><input type="hidden" name="rejection<%=a%>" value="<%=rejection%>"><%=rejection%></td>
                        <td id="application<%=a%>" name="apply<%=a%>" value="<%=a%>"></td> <!-- id：application 第224行，確定為報名成功後，拿申請button(之後需加確認今日的日期>服務結束日期)-->
						<input type="hidden" name="getvalue" id="getvalue" value=""><!--為了將按鈕的號碼傳值給time_form.jsp-->
                    </tr> 
<%						a+=1;			
					}
%>					
                </tbody>
          </table>
		</form>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <ul class="pagination" style="margin-left: 55%;align-items: center;" id="pageModule" style="display: flex;align-items: center;justify-content: center;"></ul>
                    <div id="numberPageModule" style="display: flex;align-items: center;justify-content: center;padding-top: 10px;margin-left: 45%;align-items: center;">
                        <label for="numberPage">跳至第</label>
                        <input id="numberPage" type="number" value="1" min="1" max="100">頁
                    </div>
                </div>
                    <div class="col-4" >
                        <a href="../page/Registration_record.jsp"><button type="button" class="btn btn-link" style="margin-left: 65%;font-size: large;color: black;">報名總表 &#10148</button></a>
                    </div>
            </div>           
        </div>
        
      
      <!--footer-->
      <img src="../image/newfooter.png"class="img-fluid" style="margin-bottom: -3%;">
      <footer style="background-color: #b6c3a7;padding-bottom: 1.5%;">
        <div class="container">
          <div class="row">
            <div class="col-8">
              <b style="font-size: 2ch;">聯絡資訊</b>
              <br>
              E-mail : VTimezone@gmail.com<br>
              Tel : 0800-000-888<br>
              Copyright © 2022 CYIM. All Rights Reserved<br>
              歡迎您來到-志工時區X時間銀行
            </div>
            <div class="col-4">
              <b style="font-size: 2ch;">瀏覽人次:6666人</b>
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
<script>
  function getV(n){
    var counttable="";//設拿到按鈕號碼的變數
	var get_value="";
    counttable=document.getElementById("application"+n).getAttribute("value");
	get_value=document.getElementById("getvalue");
	get_value.value=counttable; //將按鈕號碼設為hidden的value
	console.log(get_value.value); //可以在f12中的主控台看到取的按鈕號碼有沒有對
  }
  var num = $("#myTable tbody tr").length; //取得table中有幾行
  var application="";
  var mystatus=[];
  for(var i=1;i<=num;i++){
    mystatus[i] = document.getElementById("status"+i).innerHTML;
    if(mystatus[i]=="報名成功"){
    application=`<button type="submit" onclick="getV(`+i+`)" class="btn btn-secondary">申請</button>`;//會把i值傳到function getV 的n (第幾行之意)
    }
    else{
    application=``;
    }
    $("#application"+i).html(application);
  }  
</script>
<%
			}
			else {
				response.sendRedirect("volunteerserversignin.jsp");
			}

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