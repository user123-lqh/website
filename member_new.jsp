<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>	
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	 <script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<style>
@import url("asset/member_new.css") ;
	</style>
</head>
<body >
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
		<div style="position:absolute;left:750px;top:20px;"><a class="active" href="index.jsp"><p class="txthome">主頁</p></a></div>
		<img src="img1/logo.jpg" class="imglogo">
  		<div style="position:absolute;left:1100px;top:20px;"><a href="index.jsp#a"><p class="txthome">熱銷商品</p></a></div>
  		<div style="position:absolute;left:150px;top:0px" ><a href="member.jsp"><p class="txthome1">幸運抽獎</p></a></div>
		<div style="position:absolute;left:-650px;top:0px" ><a href="member_new.jsp"><p class="txthome1">關於我們</p></a></div>
		
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
      <i style='font-size:54px;position: absolute;left: 1690px;top: 30px;' class='fas'>&#xf217;</i>
      <i style='font-size:42px;position: absolute;left: 1800px;top: 30px;' class='fas'>&#xf406;</i>
      <p style="position:absolute;top: 60px;left: 1690px;font-size: 24px;text-decoration: none;"><a href="cart.jsp" style="color: black;">購物車</a></p>
      

			<!-- The Modal -->
			<div id="myModal" class="modal">
			 
			  <!-- Modal content -->
			  <div class="modal-content">

			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>登入</h2>
			    </div>
			    <div class="modal-body">
			      
			      <p>帳號:<input type="text" name="欄位名稱"></p>
			      <p>密碼:<input type="text" name="欄位名稱"></p>
			        <p>還不是會員?點此<a href="registered.jsp">註冊</a><p>
			    </div>
			    <div class="modal-footer">
			      <button class="abc" >登入</button>
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

		
     </div>
	</div>

 <div style="background-color: #FF8800;width: 75%;height: 1240px;position: absolute;left: 200px;top:80px;">



 <div class="img_div" style=" top: 420px;left: 140px;">
    <img src="img1/3.jpg" style="border-style: solid;border-width: 5px;border-color: red;">
        <a href="#">
            <div class="mask">
               <p style="text-align: center;font-size: 40px;color: red;font-weight: bold;font-weight: bold;">資管二甲</p>
               <p style="position: absolute;left: 15px;font-size: 25px;color: red;top: 100px;font-weight: bold;">姓名：盧啟輝</p>
               <p style="position: absolute;left: 15px;font-size: 25px;top: 150px;color: red;font-weight: bold;">分工：後端設計和編寫</p>
               <p style="position: absolute;left: 15px;font-size: 25px;top: 230px;color: red;font-weight: bold;">心得：這是一次特殊的期末專案，第一次獨自完成一份後端設計，雖然很辛苦但是收穫頗多。解決問題的過程也是成長的過程。</p>
                </div>
        </a>
 </div>

 

 
 <div style="position: absolute;top: 0px;left: 540px;font-size: 65px;font-weight: bold;color:#00DB00 ;text-shadow: 3px 2px #EBEB00;">
  <p>夜空中最亮的星</p>
 </div>
 <img src="picture/light1.jpg" style="position:absolute;top: 50px;left:900px;">
 </div>
 

 
 <button style="position:absolute;top: 1400px;left: 850px;width: 200px;height: 60px;font-size: 25px;background-color: yellow;"><a href="index.jsp">返回首頁</a></button>
</body>
</html>