<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>	

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>一般小夜燈</title>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
    @import url("asset1/index_new1.css") ;
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

		
		<div class="ch2"><a class="active" href="index.jsp"><p class="txthome">主頁</p></a></div>
		<img src="img1/logo.jpg" class="imglogo">
  		<div style="position:absolute;left:1100px;top:20px;"><a href="index.jsp#a"><p class="txthome">熱銷商品</p></a></div>
  		<div style="position:absolute;left:200px;top:0px" ><a href="member.jsp"><p class="txthome1">幸運抽獎</p></a></div>
 		 <div id="menu">
		  <ul>
		    <li> <a href="index1.jsp">商品一覽</a>
		      <ul>
		        <li><a href="index1.jsp">一般造型</a></li>
		        <li><a href="index2.jsp">動物造型</a></li>
		      </ul>
		    </li>
		  </ul>
		</div>
     <div>
      <i style='font-size:48px;position: absolute;left: 1690px;top: 20px;' class='fas'>&#xf217;</i>
      <i style='font-size:48px;position: absolute;left: 1800px;top: 20px;' class='fas'>&#xf406;</i>
      <p style="position:absolute;top: 60px;left: 1680px;font-size: 24px;text-decoration: none;"><a href="cart.jsp" style="color: black;">購物車</a></p>
     
     </div>
	</div>
  </div>
     
  <div class="a">
  	<p class="txtt1">一般形小夜燈</p>
    </div>
   <div class="line1">
   </div>
  <div class="b">

  	<img src="img1/l1.jpg" class="imgpro1"> 
  	<a href="cart1.jsp"><button >加入購物車</button></a>
  	<p class="money">聖誕小夜燈<p>
  	<p class="money">售價:220</p>
  	<p class="money">存貨有限，</p>
  	<p class="money">要買要快</p>
  </div>
  <div class="c">
  	<img src="img1/t2.jpg" class="imgpro1"> 
  	<a href="cart5.jsp"><button >加入購物車</button></a>
  	<p class="money">月球小夜燈<p>
  	<p class="money">售價：310</p>
  	<p class="money">存貨有限，</p>
  	<p class="money">要買要快</p>
  </div>
  <div class="d">
  	<img src="img1/t4.jpg" class="imgpro1"> 
  	<a href="cart6.jsp"><button >加入購物車</button></a>
  	<p class="money">貓爪小夜燈<p>
  	<p class="money">售價：320</p>
  	<p class="money">存貨有限，</p>
  	<p class="money">要買要快</p>
  </div>
  

  

 

   <div class="txt10">
	<%
      int counter;
		application.setAttribute("counter", "1000");
		String cnt=(String)application.getAttribute("counter");
		counter = Integer.parseInt(cnt); 
		counter++;
		cnt = String.valueOf(counter);    
		application.setAttribute("counter", cnt);
		%>

      
		<h1>
	 您是第<%=counter%>為貴客！
	  </h1>
    </div>

</body>
</html>
