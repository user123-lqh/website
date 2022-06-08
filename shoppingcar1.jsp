<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>

<%!  	
  public int getRowCount(String sql,Connection con)
  {   
		try{
		  ResultSet rs = con.createStatement().executeQuery(sql);
		  rs.last();
		  int row=rs.getRow();
		  return row;
		}catch(SQLException err){
			System.out.println("class error"+err.toString());
			return 0;
		}
		
  }
  %>
  
<%

	if(session.getAttribute("member")==null)
	{%>

	<p>您尚未登入，<a href="index.jsp"  >點我登入</a></p>





<%
	}
	else
	{
		sql="select * from stock ";
		int a=getRowCount(sql,con);
		request.setCharacterEncoding("UTF-8");
		String num=request.getParameter("num");
		sql="select * from product where id='"+request.getParameter("id")+"'";
		ResultSet rs=con.createStatement().executeQuery(sql);
		Integer left=0;
		int price=0;

		while(rs.next())
		{
			left=Integer.parseInt(rs.getString("amount"));
			price=Integer.parseInt(rs.getString("price"));
	
	
		}
		int x=Integer.parseInt(num);

		if(left>=x){
	
			out.print(request.getParameter("name"));
			int total=price*x;
			request.setCharacterEncoding("UTF-8");
			sql="insert into stock(id,name,price,img,amount,total,PID) values('"+(String)session.getAttribute("member")+"','幸運抽獎獎品','"+price+"','"+request.getParameter("img")+"','"+num+"','"+total+"','"+request.getParameter("id")+"')";
			con.createStatement().execute(sql);
			response.sendRedirect("cart.jsp");
		}
		else{
			
			out.print("<script>");
			out.print("alert('庫存不足')");
			out.print("</script>");
			
		}

%>


<%

	}
	

%>
