<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>
	<title>會員登入狀況</title>
		<style>
		@import url("asset/sign_in.css") ;	
		</style>
</head>


<body>
    <%
                String id = request.getParameter("id");
                String pwd = request.getParameter("pwd");
				if ((id != null && !id.equals("")) && (pwd != null && !pwd.equals(""))) 
				{
				    sql = "SELECT * FROM `member` WHERE name = 'admin' AND id = '" + id + "' AND pwd = '" + pwd + "'";
                    ResultSet rs  = con.createStatement().executeQuery(sql);
					if (rs.next()) 
					{
                        session.setAttribute("member", id);
                        session.setAttribute("administrator", id);
    %>
						<div class='word1'>
						管理員登入2秒後自動跳轉<meta http-equiv="refresh" content="2; url=index.jsp">
						</br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
						
    <%
					
                    }
						
						else
						{
							
											
						sql = "SELECT * FROM `member` WHERE id=? AND pwd=?";
						PreparedStatement psmt = null;
						psmt=con.prepareStatement(sql);
						psmt.setString(1,id);
						psmt.setString(2,pwd);
						ResultSet rs2 = psmt.executeQuery();
						
                        if (rs2.next()) 
						{
                            session.setAttribute("member", id);
    %>
							<div class='word1'>
							登入成功2秒後自動跳轉<meta http-equiv="refresh" content="2; url=index.jsp">
							</br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>

    <%

                        }
                    
                        else 
						{
                            sql = "SELECT * FROM `member` WHERE id = '" + id + "' AND pwd != '" + pwd + "'";
                            ResultSet rs3 = con.createStatement().executeQuery(sql);

                            if (rs3.next()) 
							{
    %>							
								<div class='word1'>
								密碼錯誤2秒後自動跳轉<meta http-equiv="refresh" content="2; url=registered.jsp">
								</br><h2> <a href="registered.jsp" style="text-decoration:none;">點我回到註冊</a></h2>
    <%
                            }
                            else 
							{
    %>
								<div class='word1'>
								找不到您的帳戶!!2秒後自動跳轉<meta http-equiv="refresh" content="2; url=registered.jsp">
								</br><h2> <a href="registered.jsp" style="text-decoration:none;">點我回到註冊</a></h2>
    <%
                            }
                        }
						}
				}
                else 
				{
    %>				
					<div class='word1'>
					請填妥您的資料再送出!!<meta http-equiv="refresh" content="2; url=registered.jsp">
					</br><h2> <a href="registered.jsp" style="text-decoration:none;">點我回到註冊</a></h2>
    <%
                }
    %>
</body>
    <%

                con.close();
    %>
</html>
