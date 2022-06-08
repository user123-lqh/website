<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>管理商品</title>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
   @import url("asset1/administrator.css") ;
    </style>
    
</head>
<body>
<div class="top">
<%
		if (session.getAttribute("member") != null) 
		{
			sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("member") + "'";
			ResultSet rs2 = con.createStatement().executeQuery(sql);
												
			if (rs2.next()) 
		    {
												
				String member = rs2.getString(1);
													
		%>
				<li style="position:absolute;left:1787px;top:60px;"><p>歡迎<%=member%></p></li>
				<li style="position:absolute;left:1800px;top:80px;font-size:25px;"><a href="sign_out.jsp" style="text-decoration:none;color=black;"><p>登出</p></li>
				
				
		<%

		    }
												
			if (session.getAttribute("administrator") != null) 
			{
				sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("administrator") + "'";
				ResultSet rs3 = con.createStatement().executeQuery(sql);
													
				if (rs3.next()) 
				{
		%>
					
					<div class="ch5"><a class="active" href="administrator.jsp"><p class="txthome">管理後台</p></a></div>
					
		<%
				}
				
			}
			
		}
		else
		{
		%>
			<button type="button" class="xyz" id="myBtn">登入</button>

			<!-- The Modal -->
			<div id="myModal" class="modal">
			 
			  <!-- Modal content -->
			  <div class="modal-content">

			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>一般會員登入</h2>
			    </div>
				
				<form  action="sign_in.jsp" method="post">
			    <div class="modal-body">
			      
			      <p>帳號:<input type="text" name="id"></p>
			      <p>密碼:<input onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" type="text" name="pwd"></p>
			        <p>還不是會員?點此<a href="registered.jsp">註冊</a><p>
			    </div>
			    <div class="modal-footer">
			      <button class="abc" >登入</button>
				</form>  
			      
			  </div>
			  </div>

			</div>

			<script>
			// Get the modal
			var modal = document.getElementById("myModal");

			// Get the button that opens the modal
			var btn = document.getElementById("myBtn");

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];

			// When the user clicks the button, open the modal 
			btn.onclick = function() {
			  modal.style.display = "block";
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
			  modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "none";
			  }
			}
			</script>
			<%
		}
											
			%>

			
  <img src="img1/logo.jpg" class="imglogo">	
		<div style="position: absolute; left:750px; top:15px;"><a  href="index.jsp" style="text-decoration: none;color: black;"><p class="txthome">主頁</p></a></div>
  		<div style="position: absolute; left:1100px; top:15px;"><a href="index.jsp#a" style="text-decoration: none;color: black;"><p class="txthome">熱銷商品</p></a></div>
  		<div style="position: absolute; left:150px; top:0px;"><a href="member.jsp" style="text-decoration: none;color: black;"><p class="txthome1">幸運抽獎</p></a></div>
 		 
 		 <div id="menu">
		  <ul>
		    <li > <a href="index1.jsp">商品一覽</a>
		      <ul>
		        <li><a href="index1.jsp">一般造型</a></li>
		        <li><a href="index2.jsp">動物造型</a></li>
		      </ul>
		    </li>
		  </ul>
		</div>
	
	<div>
      <i style='font-size:48px;position: absolute;left: 1700px;top: 20px;' class='fas'>&#xf217;</i>
      <i style='font-size:48px;position: absolute;left: 1800px;top: 20px;' class='fas'>&#xf406;</i>
      <p style="position:absolute;top: 60px;left: 1700px;font-size: 24px;text-decoration: none;"><a href="cart.jsp" style="color: black;">購物車</a></p>
	  
     </div>
  </p>
</p>
</div>
</div>

    <h1 style="position:absolute;top: 140px;left: 780px;color: #FF2626;font-size: 50px;font-weight: bold;">加入/刪除商品</h1>
    <hr style="position: absolute;top: 230px;width: 40%;left: 600px;color:#FF2626 ">
    <div style="height: 1180px;width: 1400px;position:absolute;top: 270px;left: 300px;">

	

 <%

//Step 3: 選擇資料庫   
           sql="use lasthw";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="select * from product"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           out.println("共"+total_content+"筆商品<p>");
           
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
		   if (page_num==0) //無留言時將頁數指標訂為1
		       page_num=1;
           out.println("請選擇頁數");
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
           for(int i=1;i<=page_num;i++) //使用get傳輸方式,建立1,2,...頁超連結
              {
			   out.print("<a href='administrator.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
           }
           out.println("<p>");

           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "1";  //無留言時將頁數指標訂為1        
           Integer current_page=Integer.valueOf(page_string);//將page_string轉成整數
           //Integer current_page=Integer.valueOf(request.getParameter("page"));
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM product ORDER BY id ASC LIMIT "+start_record+",5";//LIMIT是限制傳回筆數
           rs=con.createStatement().executeQuery(sql);
		   //  逐筆顯示, 直到沒有資料(最多還是5筆)
		  %> 
			
			<table style="border:3px solid ; background-color: white; padding:5px ; text-align-Last:center ; " rules="all" ; cellpadding="5"  >
		   <tr>
			<td>商品編號</td>
			<td>價格</td>
			<td>數量</td>
			<td>圖片</td>
			<td>商品名稱</td>
			<td>商品內容</td>
			<td>圖檔路徑</td>
			<td>刪除</td>
			<td>修改</td>
			
		   </tr>
		   <%
		   while(rs.next())
           {
			out.print("<tr>");
				for(int i=1 ; i<=9 ; i++)
				{
					if(i==1) 
						out.print("<td width='88px' height='150px'>"+rs.getString(i)+"</td>"); 
					if(i==2) 
						out.print("<td width='88px' height='150px'>"+rs.getString(i)+"</td>"); 
					if(i==3) 
						out.print("<td width='88px' height='150px'>"+rs.getString(i)+"</td>"); 
					if(i==4) 
						out.print("<td width='120px' height='150px'><img src='"+rs.getString("path")+rs.getString("img")+"' width='200px' height='200px'> </td>"); 
					if(i==5) 
					{
						out.print("<td width='120px' height='50px'>"+rs.getString(i)+"</td>"); 
					}
					if(i==6) 
						out.print("<td width='180px' height='50px'>"+rs.getString(i)+"</td>"); 
					if(i==7) 
						out.print("<td width='180px' height='50px'>"+rs.getString(i)+"</td>"); 
					if(i==8){ 
						out.print("<td width='150px'><form action='delete.jsp' method='post'>"); 
						out.print("<input type='submit' value='刪除'></input></form></td>"); 
					}
					
					if(i==9){ 
						out.print("<td width='150px'><a href='#update'><input type='submit'  value='修改' ></input></a></td>");
					}
				}
			out.print("</tr>");
           }
		   %>
		   </table>
		   
		   
		    <h1 style="position:absolute;top: 1200px;left: 580px;color: #FF2626;font-size: 50px;font-weight: bold;" id="update" >修改商品</h1>
			<hr style="position: absolute;top: 1290px;width: 40%;left: 400px; color:#FF2626 ">
			
			<table style="position:absolute;top: 1310px;left: 520px;font-size: 30px;font-weight: bold;">
			
			<form action="update.jsp" method="post" >
			<tr>
			<p><td>商品名稱 :</td><td><input type="text" name="updatename"></input></td></p>
			</tr>
			<tr>
			<p><td>修改金額 :</td><td><input type="text" name="updateprice"></input></td></p>
			</tr>
			<tr>
			<p><td>修改數量 :</td><td><input type="text" name="updateamount"></input></td></p>
			</tr>
			<tr>
			<td style="position:absolute;left: 100px;"><input type="submit" value="確認修改" style="font-size: 20px"></input></td>
			</form>
			</tr>
			
			</table>
			
			
			
			<div class="user" >
				<h1 style="position:absolute;top: 1500px;left: 560px;color: #FF2626;font-size: 50px;font-weight: bold;" id="update" >會員購買紀錄</h1>
				<hr style="position: absolute;top: 1590px;width: 40%;left: 400px; color:#FF2626 ">
				
				<p class="solid1" style="position:absolute;top: 1680px;left: 310px;font-size: 30px;font-weight: bold;height:500px;">
				<%
				sql="use lasthw";
				con.createStatement().execute(sql);
				
				sql = "SELECT * FROM shopcart ";
				ResultSet rs5 = con.createStatement().executeQuery(sql);
				
				String name,id,num;
					while(rs5.next()){
						 id=rs5.getString("id");
						 name=rs5.getString("name");
						 num=rs5.getString("quality");
						
						out.println("購買者賬號："+id+"&nbsp;"+"&nbsp;"+"購買產品："+name+"&nbsp;"+"&nbsp;"+num+"個"+"<br>");
					}
         con.close();     
				%>
    
</body>
</html>
