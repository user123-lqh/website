<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%
if(session.getAttribute("member")!=null)
 {
	 try{
		request.setCharacterEncoding("UTF-8");
		
		ResultSet rs;
		sql="insert into shopcart(ID,name,quality,price,total,payment,tel,address)";
		sql+="select ID,name,amount,price,price*amount total ";
		sql+=", '"+request.getParameter("payment")+"',";
		sql+="'"+request.getParameter("tel")+"',";
		sql+="'"+request.getParameter("address")+"' ";
		sql+="from stock where ID='"+(String)session.getAttribute("member")+"'";
		//out.print(sql);
		con.createStatement().executeUpdate(sql);
		
		 sql = "Delete FROM stock WHERE ID='" +(String)session.getAttribute("member")+"'";
		 con.createStatement().execute(sql);
		 
		 //減少庫存
		sql="update product a, ";
		sql+="(select name,sum(quality) q ";
		sql+="from shopcart ";
		sql+="group by name) b ";
		sql+="set a.amount=99-b.q ";
		sql+="where a.name=b.name ";
		con.createStatement().executeUpdate(sql);
		 
		
		out.print("<script>");
		out.print("alert('訂單已送出')");
		out.print("</script>");
		response.setHeader("refresh","0;URL=index.jsp") ;}
		
		catch(Exception e)
		{
			out.print("<script>");
				out.print("alert('錯誤')");
				out.print("</script>");
				out.print(e.toString());
				//response.setHeader("refresh","0;URL=index.jsp") ;
		}
	 
 }
		

	%>
	
	
