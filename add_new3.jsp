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
  
  <%!
	String newline(String str)
	{
		int index=0;
		while((index=str.indexOf("\n"))!=-1)
			str=str.substring(0,index)+"<br>"+str.substring(index+1);
		return(str);
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
		
           String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
//           String new_name=request.getParameter("name");
           String new_mail=request.getParameter("mail");
           String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
	new_content=newline(new_content);
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT guestbook3 (`GBName`, `Mail`, `Content`, `Putdate`) ";
           sql+="VALUE ('" + new_name + "', ";
           sql+="'"+new_mail+"\', ";
           sql+="'"+new_content+"', ";   
           sql+="'"+new_date+"')";      

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("cart3.jsp");
       }
   

%>

