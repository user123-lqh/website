<%@page contentType="text/html" pageEncoding="utf-8"%>
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 
<html>
    <head>
        <title>修改商品資料</title>
    </head>
    <body>      
	   <%  		
	    request.setCharacterEncoding("utf-8");
       
//Step 1: 載入資料庫驅動程式 	        
            Class.forName("com.mysql.jdbc.Driver");	  
            
//Step 2: 建立連線 	            
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");   				
		       
//Step 3: 選擇資料庫	                    	
                    con.createStatement().execute("use lasthw");
//Step 4: 執行 SQL 指令                       
                    String sql1 = "UPDATE product SET price = '"+request.getParameter("updateprice")+"' WHERE name='"+request.getParameter("updatename")+"' ";
                    int no1=con.createStatement().executeUpdate(sql1);
					String sql2 = "UPDATE product SET amount = '"+request.getParameter("updateamount")+"' WHERE name='"+request.getParameter("updatename")+"' ";
                    int no2=con.createStatement().executeUpdate(sql2);
                    
					if (no1 > 0&& no2>0)
//Step 5: 顯示結果 
                    out.print("<script>");
					out.print("alert('修改成功')");
					out.print(request.getParameter("updatename"));
					out.print("</script>");
					response.setHeader("refresh","3;url=administrator.jsp");
//Step 6: 關閉連線 	
                    con.close();
					
                    
                              
            
       %>
    </body>
</html>
