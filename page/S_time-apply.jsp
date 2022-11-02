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
    <style>@import url("../css/home.css");</style>
    <title>服務提供者時數審核</title>
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
    <style>
      a:hover {
        text-decoration:underline;
        color:black;
      }
      
      /*表格內容*/
      table{
   	    border-collapse: separate;
        border-spacing: 0;
      	width: 770px; 	
   	    
        /*自動斷行*/
      	word-wrap: break-word;
      	table-layout: fixed;
      }

      /*表格框線*/
      .fancytable{
        border:1px solid #cccccc; padding:5px;
         -webkit-border-radius: 5px;
         -moz-border-radius: 5px;
         border-radius: 5px;
       
      }

       /*表格框線*/
      .fancytable td{
        border:1px solid #cccccc; color:#555555;text-align:center;line-height:28px;
      }
       
      /*表格標題背景色*/
      .headerrow{ 
        background-color:#D2E9FF;
      }

      /*表格奇數列背景色*/
      .datarowodd{
        background-color:#ffffff;
      }

      /*表格偶數列背景色*/
      .dataroweven{
         background-color:#efefef;
      }

      /*按鈕並列*/
      .btn1{
         float:left;
      }

      .btn2{
         float:right;
      }

    
    </style>
</head>

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

  <!--認證與否的彈跳視窗-->
  <script> 
    function myFunc(n) { 
        var r = confirm("確定要受理志工時數嗎？"); 
    
        if (r == true) { 
          alert("受理成功");
		  getV(n);
        } 
        else { 
          
        }   
      }
	function getV(n){
		var counttable="";//設拿到按鈕號碼的變數
		var getvalue="";
		counttable=n;
		getvalue=document.getElementById("getvalue");
		getvalue.value=counttable;
		console.log(getvalue.value); //可以在f12中的主控台看到取的按鈕號碼有沒有對
		document.form1.action="S_time-apply_add.jsp";
		document.form1.submit();
	}
	function refuse(n){
		var counttable="";//設拿到按鈕號碼的變數
		var getvalue="";
		counttable=n;
		getvalue=document.getElementById("getvalue");
		getvalue.value=counttable;
		console.log(getvalue.value); //可以在f12中的主控台看到取的按鈕號碼有沒有對
		document.form1.action="S_Refuse.jsp";
		document.form1.submit();
	}
  </script> 

  <!--頁碼-->
<script src="../js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
<script src="../js/Recent_Reg.js"></script>

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
				String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
				ResultSet rs5 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
				rs5=con.createStatement().executeQuery(sql5);
				rs5.next();
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="服務提供者"){
				
				String updatemust="SET SQL_SAFE_UPDATES=0";
				String sql="SELECT ROW_NUMBER()  OVER (ORDER BY `service_name`,`service_date`) AS apply_num,`chinese_name`,`ID`,`service_name`,`service_class`,`service_date`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`,DATE_FORMAT(`apply_date`,'%Y-%m-%d') AS 'apply_date',`Rejection` FROM project.application WHERE `s_member_ID`= "+ rs5.getString(1) +" && `audit_status` is null";
				ResultSet update_must =  con.createStatement().executeQuery(updatemust);
				ResultSet tmp =  con.createStatement().executeQuery(sql);
				String n_ull="null";
				String rejection="";
				int a=1;
%>
     <div style="background-color: #f4f8f9;;margin-top: 70px;">
      <div style="padding-top: 5ch;padding-left: 3ch;padding-right: 3ch;" >
        <h4  align="center" valign="center"><b>志工申請列表</b></h4>
        <br>
	<form name="form1" action="" method="post">
		<input type="hidden" id="getvalue" name="getvalue" value="">
        <table class="table table-hover" id="myTable" style="text-align: center;">
          <thead>
            <tr>
              <th style="width: 9ch;">志工姓名</th>
              <th style="width: 9ch;">身分證字號</th>
              <th style="width: 11ch;">服務名稱</th>
              <th style="width: 12ch;">服務類別</th>
              <th style="width: 9ch;cursor: pointer;" onclick="sortTable(4)">服務日期 &#8645</th>
              <th style="width: 8ch;">服務時間<br>(開始)</th>
              <th style="width: 1ch;"></th>
              <th style="width: 8ch;">服務時間<br>(結束)</th>
              <th style="width: 8ch;">服務時數</th>
              <th style="width: 9ch;">申請日期</th>
              <th style="width: 10ch;">說明</th>
              <th style="width: 10ch;">受理與否</th>
            </tr>
          </thead>
          <tbody>
<%
			while(tmp.next()){
				rejection=tmp.getString(11);						
				if(rejection==null){
					rejection="";
				}
%>
            <tr>
              <td><%=tmp.getString(2)%></td>
              <td><%=tmp.getString(3)%></td>
              <td><%=tmp.getString(4)%></td>
              <td><%=tmp.getString(5)%></td>
              <td><%=tmp.getString(6)%></td>
              <td><%=tmp.getString(7)%></td>
              <td>~</td>
              <td><%=tmp.getString(8)%></td>
              <td><%=tmp.getString(9)%></td>
              <td><%=tmp.getString(10)%></td>
              <td><%=rejection%></td>
			  <input type="hidden" id="getvalue<%=a%>">
              <td>
                <view  class="btn1">
                  <input class="btn btn-outline-success" type="button" value="同意"  id="agree<%=a%>"  onclick="myFunc(<%=a%>);" style="width:50px;text-align: center;padding-left: 0%;padding-right: 0%;">
                </view>
	
                <view class="btn2">
                  <input class="btn btn-outline-danger" type="button" value="拒絕" id="disagree<%=a%>" onclick="refuse(<%=a%>)" style="width:50px;text-align: center;padding-left: 0%;padding-right: 0%;">
                </view>
              </td>
            </tr>
<%
			a+=1;
			}
%>
          </tbody>
        </table>
    </form>      
        
      </div> 
      <br>
      
      <div class="container">
        <div class="row">
            <div class="col-8">
                <ul class="pagination" style="margin-left: 55%;align-items: center;" id="pageModule" style="display: flex;align-items: center;justify-content: center;"></ul>
            </div>
            <div class="col-4">
                <div id="numberPageModule" style="display: flex;align-items: center;justify-content: center;padding-top: 10px;margin-left: 45%;align-items: center;">
                    <label for="numberPage">跳至第</label>
                    <input id="numberPage" type="number" value="1" min="1" max="100">頁
                </div>
            </div>
              
        </div>           
    </div>
    

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
            <b style="font-size: 3ch;">瀏覽人次:6666人</b>
          </div>      
        </div>               
      </div>     
      <button type="button" class="btn  btn-floating btn-lg" id="btn-back-to-top"><img style="width: 5ch;" src="../image/up-arrow.png"></button>                               
    <script src="../js/home.js"></script>                     
    </footer>
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<%
//Step 5: 顯示結果 				
		   //if(con.isClosed())
		//con.isClosed()會回傳True或是false來表示是否連線成功
              //out.println("連線建立失敗");
           //else
              //out.println("連線成功");
		  }
			else {
				response.sendRedirect("serversupplysignin.jsp");
			}
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