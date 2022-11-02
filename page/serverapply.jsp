<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%> 
<%@ page import = "java.sql.*, java.util.*"%> 
<head>
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
    <!--頁碼-->
  <script src="../js/jquery-3.6.0.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-3.6.0.js"><\/script>')</script>
  <script src="../js/Recent_Reg.js"></script>
    <style>
      @import url("../css/home.css");
      /*@import url("../css/pagenumber.css");*/
    </style>
    <title>服務時數申請紀錄</title>

    <style>
      a:hover {
        text-decoration:underline;
        color:black;
      }
      /*table{
        font-size: 18px;
        font-family: cursive;
        text-align: center;
        border-collapse: collapse;
   	    word-wrap: break-word;
   	    table-layout: fixed;
      }
      td, th{
          padding: 10px;
      }*/
      .select_style{
          width:100px; 
          height:30px; 
          overflow:hidden; 
          background:url(mytest/demo/bg.jpg) no-repeat 215px; 
          border:1px solid #ccc; 
          -moz-border-radius:5px; /* Gecko browsers */ 
          -webkit-border-radius:5px; /* Webkit browsers */ 
          border-radius:5px;
          font-family: cursive;
          margin-right: 10px;
        } 
        .select_style select{ 
          padding:5px;
          background:transparent; 
          width:268px; 
          font-size:16px; 
          border:none; 
          height:30px; 
          -webkit-appearance:none; /*for Webkit browsers*/
          font-family: cursive; 
        } 
        #choosetype2{display: none;}
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
					request.setCharacterEncoding("UTF-8");
					
					 String countp="select * from `counter`"; 
					 ResultSet r=con.createStatement().executeQuery(countp);
			String sql5="select * from `member` where `m_account` = '" + session.getAttribute("acc")+"';";
			ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql5);
			rs5=con.createStatement().executeQuery(sql5);
			rs5.next();
							
			if (session.getAttribute("acc")!=null && session.getAttribute("status")=="志工服務者"){
%>      
  <!--<script>$('#sort-table').bootstrapTable();</script>-->
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

    <!--這裡開始寫-->
    <script>
      $(document).on('click', 'th', function() {
        var table = $(this).parents('table').eq(0);
        var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()));
        this.asc = !this.asc;
        if (!this.asc) {
          rows = rows.reverse();
        }
        table.children('tbody').empty().html(rows);
      });
      function comparer(index) {
        return function(a, b) {
          var valA = getCellValue(a, index),
            valB = getCellValue(b, index);
          return $.isNumeric(valA) && $.isNumeric(valB) ?
            valA - valB : valA.localeCompare(valB);
        };
      }
      function getCellValue(row, index) {
        return $(row).children('td').eq(index).text();
      }
    </script>
    <div style="background-color: #f4f8f9; margin-top: 100px;">
      <div class="container" style="font-size: 3ch;font-family: 'Times New Roman', Times, serif;padding-bottom: 2ch;"><b>服務時數申請紀錄</b></div>
      <!--<center><h1><font style="font-family:cursive; font-weight: bolder;">服務時數申請紀錄總表</font></h1></center></br>-->
        <div class="container" >
            <div class="row">
                <div class="col"> 
                    <font style="font-family: cursive;">搜尋欄位：</font> 
                    <select class="select_style" id="choosetype">
                      <option selected value="c">全部</option> 
                      <option value="a">審核狀態</option> 
                      <option value="b">認證狀態</option> 
                    </select> 
                    <font style="font-family: cursive;">狀態：</font> 
                    <select class="select_style" id="choosetype2"> 
                      <option selected value="a">認證成功</option> 
                      <option value="b">認證失敗</option> 
                      <option value="c">認證中</option> 
                    </select> 
                </div>
            </div>
          </div>
            <script>
                var obj = document.getElementById("choosetype"); 
	              var obj2 = document.getElementById("choosetype2"); 
	              obj.onchange=function(){
	                var index = obj.selectedIndex; 
	                var value = obj.options[index].value; 
                  if(value=="b"){
                      obj2.style.display="inline-block";
	                    obj2.removeAttribute("disabled");
                      obj2.options[0]=new Option("認證成功","a");
                      obj2.options[1]=new Option("認證失敗","b");
                      obj2.options[2]=new Option("認證中","c");
                  }else if(value=="a"){
                      obj2.style.display="inline-block";
	                    obj2.removeAttribute("disabled");
                      obj2.options[0]=new Option("審核成功","a");
                      obj2.options[1]=new Option("審核失敗","b");
                      obj2.options[2]=new Option("審核中","c");
	                }else{
                    obj2.setAttribute("disabled",true)
                  }
                }
            </script>
        <div  style="background-color: white;height: auto;border-radius:10px;width: auto;margin-left: 2%;margin-right: 2%;">
          <div class="row" style="margin-top:20px ;"> 
            <div class="col">
			<form action="time_form_serverapply.jsp" method="post">
              <table class="table table-hover tablesorter"id="myTable" style="text-align: center;">
                <thead>
                <tr>
                  <th scope="col"  class="align-middle" style="width:8% ;">服務單位</th>
                  <th scope="col"  class="align-middle" style="width: 10%;">服務類別</th>
                  <th scope="col"  class="align-middle" style="width: 15%;">服務內容</th>
				  <th scope="col"  class="align-middle" style="width: 9%;">服務日期</th>
                  <th scope="col"  class="align-middle" style="width: 7%;">服務時間</br>(開始)</th>
                  <th scope="col"  class="align-middle" style="width: 1%;"></th>
                  <th scope="col"  class="align-middle" style="width: 7%;">服務時間</br>(結束)</th>
				  <th scope="col"  class="align-middle" style="width: 7%;">服務時數</th>
                  <th scope="col"  class="align-middle" style="width: 8%;cursor: pointer;">審核狀態</th>
                  <th scope="col"  class="align-middle" style="width: 8%;cursor: pointer;">認證狀態</th>
                  <th scope="col"  class="align-middle" style="width: 12%;">拒絕原因</th>
                  <th scope="col"  class="align-middle" style="width: 8%;"></th>
                </tr>
                </thead>
                <tbody>
<%
//Step 5: 顯示結果      
						String only="SELECT ROW_NUMBER()  OVER (ORDER BY `application_ID`) AS apply_num, `unit_name`,`service_class`,`service_content`,`service_date`,TIME_FORMAT(`service_time1`,'%H:%i')AS 'service_time1',TIME_FORMAT(`service_time2`,'%H:%i') AS 'service_time2',`hours`, `audit_status`,`certification_status`,`Rejection` FROM `application`";											
						ResultSet onlyone =  con.createStatement().executeQuery(only);
						int a=1;
						String audit_status = "";
						String certification_status = "";
						String Rejection = "";
						while(onlyone.next()){
							audit_status = onlyone.getString(9);
							certification_status = onlyone.getString(10);
							Rejection = onlyone.getString(11);
							if(certification_status == null){
								certification_status="認證中";
							}
							if(audit_status == null){
								audit_status="審核中";
							}
							if(audit_status.equals("審核成功")){
								
							}
							if(audit_status.equals("審核失敗")){
								certification_status="";
							}
							if(audit_status.equals("審核中")){
								certification_status="";
							}
							if(Rejection==null){
								Rejection="";
							}
							
%>	
                <tr>
                  <td><%=onlyone.getString(2)%></td>
                  <td><%=onlyone.getString(3)%></td>
                  <td><%=onlyone.getString(4)%></td>
                  <td><%=onlyone.getString(5)%></td>
                  <td><%=onlyone.getString(6)%></td>
				  <td>~</td>
                  <td><%=onlyone.getString(7)%></td>
                  <td><%=onlyone.getString(8)%></td>                  
                  <td id="audit_status<%=a%>" style="color: #1ead11;"><%=audit_status%></td>
                  <td id="certification_status<%=a%>" style="color: #cc1a1a;"><%=certification_status%></td>
                  <td><%=Rejection%></td>
                  <td id="application<%=a%>" value="<%=a%>"></td>
                  <input type="hidden" name="getvalue" id="getvalue" value="">
				</tr>
<%				a+=1;
						}											
%>	
                  </tbody>
              </table>
			  </form>
            </div>
          </div>
    </div>
      <script>
        function showalert(){
            alert("已申請！");
        }
      </script>
         <div class="container">
          <div class="row">
              <div class="col-8" style="padding-top: 10px;">
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
    <!--寫到這裡-->
    
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
		  <%
            }
			else {
				response.sendRedirect("volunteerserversignin.jsp");
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
				var myaudit_status=[];
				var mycertification_status=[];
				for(var i=1;i<=num;i++){
					myaudit_status[i] = document.getElementById("audit_status"+i).innerHTML;
					mycertification_status[i] = document.getElementById("certification_status"+i).innerHTML;
					if(myaudit_status[i]=="審核失敗"){
						application=`<button type="submit" onclick="getV(`+i+`)" class="btn btn-secondary">申請</button>`;
					}
					else if(mycertification_status[i]=="認證失敗"){
						application=`<button type="submit" onclick="getV(`+i+`)" class="btn btn-secondary">申請</button>`;
					}
					else{
						application=``;
					}
					$("#application"+i).html(application);
				 }  
	</script>
    
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