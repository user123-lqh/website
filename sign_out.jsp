<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	
<head>
    
</head>

<body>
   
    <%
                session.removeAttribute("member");
                session.removeAttribute("administrator");
    %>
				<%


				session.removeAttribute("member");
				response.sendRedirect("index.jsp") ;
				%>
	
</body>
    <%

                con.close();
            
    %>
</html>
