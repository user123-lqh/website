﻿<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>



<html>
<head>
<title>addboard</title>
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

//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use lasthw";
           con.createStatement().execute(sql);	   
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
           
		   String new_id=request.getParameter("id");
		   String new_pid=request.getParameter("pid");
		   String new_time=request.getParameter("time");
		   
           String new_product=new String(request.getParameter("product").getBytes("ISO-8859-1") ,"UTF-8");
           String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1") ,"UTF-8");
		   new_content=newline(new_content);
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

		   
           sql="insert board (id, pid, content, time, product) ";
           
		   sql+="'"+new_pid+"', ";
           sql+="'"+new_content+"', ";
           sql+="'"+new_time+"', ";
		   sql+="'"+new_id+"', ";
           sql+="'"+new_product+"')";       
//out.println(sql);
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
		  
			out.print("<script>");
			out.print("alert('留言成功')");
			out.print("</script>");
			
		}  
    
   




%>

</body>
</html>
