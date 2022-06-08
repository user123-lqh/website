<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@page import = "java.sql.*"%>
<html>
    <head><title>成績查詢結果</title></head>
    <body>
 <% try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
           {
//Step 3: 選擇資料庫
           String sql="USE `lasthw`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令的ResultSet 
           String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
           sql = "SELECT * FROM `product` WHERE `name` ='" + name + "'";
           ResultSet rs=con.createStatement().executeQuery(sql);
//Step 5：進行資料的處理
           if (rs.next()){ //要從檔頭移到第一筆, 指標才正確
   int num= Integer.valueOf(rs.getString("id"));
			  for(int i=1;i<=6;i++){
				  
				  if(num==i)%>
					  <meta http-equiv="refresh" content="0.1;url='cart'+num+'.jsp'">
              <%}
       }
       }
//Step 6: 關閉連線
       con.close();
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
    out.println("class錯誤");
}
        %>   
    </body>
</html>
