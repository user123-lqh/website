<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>register</title>  
	<style>
		 @import url("asset/registered_2.css") ;	
		</style>
</head>

<body>

	 <%
                String name = new String(request.getParameter("name").getBytes("ISO-8859-1"));
				String id = request.getParameter("id");
                String pwd = request.getParameter("pwd");
				String tel = request.getParameter("tel");
                String mail = request.getParameter("mail");

   
					sql = "SELECT * FROM `member` WHERE name = '" + name + "'";
                    ResultSet rs = con.createStatement().executeQuery(sql);


                    if (rs.next()) 
					{
    %>
						<div class='word1'>
						此名字已經有人使用過!!2秒後自動跳轉<meta http-equiv="refresh" content="2; url=registered.jsp">
						</br><h2> <a href="registered.jsp" style="text-decoration:none;">點我回到註冊</a></h2>
    <%
                    }
                    else 
					{
                        sql = "SELECT * FROM `member` WHERE id = '" + id + "'";
                        ResultSet rs2 = con.createStatement().executeQuery(sql);


                        if (rs2.next()) 
						{
    %>
							<div class='word1'>
							此帳號已經有人使用過!!2秒後自動跳轉<meta http-equiv="refresh" content="2; url=registered.jsp">
							</br><h2> <a href="registered.jsp" style="text-decoration:none;">點我回到註冊</a></h2>
    <%
                        }
						else
						{
							sql = "SELECT * FROM `member` WHERE mail = '" + mail + "'";
							ResultSet rs3 = con.createStatement().executeQuery(sql);
							if (rs3.next()) 
							{
    %>
								<div class='word1'>
								此電子郵件已經有人使用過!!2秒後自動跳轉<meta http-equiv="refresh" content="2; url=registered.jsp">
								</br><h2> <a href="registered.jsp" style="text-decoration:none;">點我回到註冊</a></h2>
    <%
							}
						 

                       

							else 
							{
								sql = "INSERT `member`(name,id, pwd, mail,tel) VALUES('" + name + "','" + id + "', '" + pwd + "', '" + mail + "', '"+ tel + "')";
								con.createStatement().execute(sql);
								session.setAttribute("member", id);
    %>
								<div class='word1'>
								註冊成功2秒後自動跳轉<meta http-equiv="refresh" content="2; url=index.jsp">
								</br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
    <%
							}
						}
					}
			
				
				
		
	
							
	%>
</body>
    <%

                con.close();
         

            
    %>
    
</html>
