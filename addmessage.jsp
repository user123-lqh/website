<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>	
<html>
<head>
<title>add</title>
</head>
<body>
<%!  //使用JSP宣告模式所定義的變數, 還有一項特色, 即只會執行一次
     String newline(String str)         //處理換行字元的自訂方法
     {
      int index=0;
      while((index=str.indexOf("\n"))!=-1) //尋找是否存在換行字元\n, 若有, 則使用<br>代替
	  //str.indexOf()字元從0計算 abcd, 找c, 則傳回2
	  //substring(0,2)傳回0-1的字, 即ab
       str=str.substring(0,index)+"<br>"+str.substring(index+1);
      return(str);
     }
%>
<%
 
           sql="use lasthw";
           con.createStatement().execute(sql);	   
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
           String new_mid=request.getParameter("mid");
		   String new_pid=request.getParameter("pid");
		   String new_acc=request.getParameter("account");
           String new_p_name=new String(request.getParameter("p_name").getBytes("ISO-8859-1"));
           String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"));
		   new_content=newline(new_content);
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

		   
           sql="insert message (mid, pid, content, time, macc, p_name) ";
           sql+="value ('" + new_mid + "', ";
		   sql+="'"+new_pid+"', ";
           sql+="'"+new_content+"', ";
           sql+="'"+new_date+"', ";
		   sql+="'"+new_acc+"', ";
           sql+="'"+new_p_name+"')";       
//out.println(sql);
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
		  
	    out.print("<script>");
		out.print("alert('留言成功')");
		out.print("</script>");
		response.setHeader("refresh","0;URL=cart"+new_pid+".jsp") ;
		  
%>
</body>
</html>