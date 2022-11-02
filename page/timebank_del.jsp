<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
        <link href="css/reset.css" rel="stylesheet" />
        <link href="css/iconfont.css" rel="stylesheet" />
        <link href="css/index.css" rel="stylesheet" />
        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/f.js"></script>
        <title>管理員會員管理</title>
    </head>
    <body>
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
							sql="use `project`";
							con.createStatement().execute(sql);
							sql="SELECT * FROM `service`";
							String getvalue2=request.getParameter("getvalue2");
						//Step 4: 執行 SQL 指令
							sql="DELETE FROM service WHERE `service_ID`='"+getvalue2+"';";
							con.createStatement().execute(sql);
							con.close();
							response.sendRedirect("timebank_del_end.jsp") ;
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

    </body>
</html>