<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>		
<html lang="en">
<head>
 
  <title>註冊</title>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
     @import url("asset/registered.css") ;
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
				<li><a href="sign_out.jsp"><button type="button" class="xyz" id="myBtn">歡迎<%=member%>/登出</button></li>
				
				
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
			      <button style="
				  position:relative;
					  top:-125px;
					  left:240px;
					  width:70px;
					  height:70px;
					  background-color:#FF3333;
					  border-radius:20%;
					  text-align: center;
					   color:white;
					  font-size:10px;
					   font-weight:bolder; ">登入</button>
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
  		<div style="position:absolute;left:200px;top:0px" ><a href="member.jsp"><p class="txthome1">關於我們</p></a></div>
     <div id="menu">
      <ul>
        <li> <a href="index1.jsp">商品一覽</a>
          <ul>
            <li><a href="index1.jsp">一般造型</a></li>
            <li><a href="index2.jsp">可愛造型</a></li>
          </ul>
        </li>
      </ul>
    </div>
     <div>
      <i style='font-size:48px;position: absolute;left: 1700px;top: 20px;' class='fas'>&#xf217;</i>
      <i style='font-size:48px;position: absolute;left: 1800px;top: 20px;' class='fas'>&#xf406;</i>
	  <p style="position:absolute;top: 60px;left: 1690px;font-size: 24px;text-decoration: none;"><a href="cart.jsp" style="color: black;">購物車</a></p>
     </div>
  </div>
 
  	 <p class="txtc1">-----註冊-----</p>
 		<div class="content">
 		<form action="registered_2.jsp" method="POST" onsubmit="return check_nonnull();">	
			
			<p class="print">姓名:<input type="text" id="name" name="name"></p>
			
 			<p class="print">帳號:<input type="text" id="account" name="id"></p>
			
 			<p class="print">密碼:<input type="text" id="pwd" name="pwd"></p>
			
 			<p class="print">電話:<input type="text" id="tel" name="tel"></p>
			
 			<p class="printe">e-mail:<input type="text" id="email" name="mail"></p>
			
		<script type="text/javascript">
        function check_nonnull()
        {	
			if(document.getElementById('name').value=="")
            {
                alert("姓名不能為空白，請完整輸入");
                return false;
            }
            if(document.getElementById('account').value=="")
            {
                alert("帳號不能為空白，請完整輸入");
                return false;
            }
            if(document.getElementById('pwd').value=="")
            {
                alert("密碼不能為空白，請完整輸入");
                return false;
            }
            if(document.getElementById('tel').value=="")
            {
                alert("連絡電話不能為空白，請完整輸入");
                return false;
            }
            if(document.getElementById('email').value=="")
            {
                alert("E-mail不能為空白，請完整輸入");
                return false;
            }
            
            
			if(document.getElementById('email').value.indexOf("@")==-1)
            {
                alert("請正確填入e-mail格式");
                return false;
            }
            return true;
        }
		</script>
 		<button type="submit" class="abc" >完成註冊</button>
 		</div>
    <div class="txt10">
      <h1>第二十二組製作</h1>
    </div>
	

</body>
</html>
