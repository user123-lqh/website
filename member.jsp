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
@import url("asset1/m1.css") ;
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
					
					<div style="position: absolute; left:1500px; top:15px;"><a class="active" href="administrator.jsp"><p class="txthome">管理後台</p></a></div>
					
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
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var iimg = ['t1.jpg','t2.jpg','t4.jpg','l1.jpg','l3.jpg','l4.jpg'];
			var a=0;//第幾個陣列
			$(function() {
				document.getElementById("Pname").src="img1/"+iimg[a];
				showFname();
			});
			function showFname(){
				var imgsrc =  document.getElementById("Pname").src;
				var imgsrc2=imgsrc.substring(imgsrc.indexOf("img")+0);
				document.getElementById("Fname").value=imgsrc2;
			}
			function next_img(){
				if(a<iimg.length-1)
				{
					a=a+1;
				}
				else{
					a=0;
				}
				document.getElementById("Pname").src="img1/"+iimg[a];
				showFname();
			}

			function Previous_img(){
				if(a>0){
					a=a-1;
				}
				else{
					a=iimg.length-1;
				}
				document.getElementById("Pname").src="img1/"+iimg[a];
				showFname();
			}
			var timer; //輪播的開關
			function auto(){

				document.getElementById('P').disabled=true;
				document.getElementById('N').disabled=true;
				document.getElementById('A').disabled=true;
				document.getElementById('S').disabled=false;

				timer=setInterval(function(){ 
					next_img();
					showFname();
				},30)
			}

			function stop(){
				clearInterval(timer);
				document.getElementById('P').disabled=false;
				document.getElementById('N').disabled=false;
				document.getElementById('A').disabled=true;
				document.getElementById('S').disabled=true;
				document.getElementById('T').disabled=false;
				alert("恭喜你獲得了獎品,請點擊加入購物車并填寫收貨信息。");
				
			}
	</script>


 <div style="background-color:#D60000;width: 80%;height: 1840px;position: absolute;left: 200px;top:80px;">
	<img src="img1/choujiang.jpg" style="position:relative;left: 260px; " >
	<div >
		<h1 style="text-align: center;font-size: 60px;color:white;">規則介紹</h1>
		<h1 style="text-align: center;font-size: 30px;color:white;">1.每次抽獎需要花費新台幣220元，獎品將於一個工作日內發放。</h1>
		<h1 style="text-align: center;font-size: 30px;color:white;">2.抽獎者點擊“開始抽獎”自動搖獎，當按下停止時，顯示的獎品為搖獎人獲得的獎品。</h1>
		<div>
			<div  id="photoimg">
		<img src="" alt="photo" id="Pname" style="position: absolute;color: top:50px;left: 340px;">
	</div>
	<div class="F">
		<button type="button" onclick="Previous_img()" id="P" style="position:absolute;top: 480px;left: 560px;width: 100px;height: 40px;visibility: hidden;">Previous</button>
		<button type="button" onclick="next_img()" id="N" style="position:absolute;top: 480px;left: 680px;width: 100px;height: 40px;visibility: hidden;">Next</button>
		<button type="button" onclick="auto()" id="A" style="position:absolute;top: 1680px;left: 250px;width: 250px;height: 80px;font-size: 30px;">開始抽獎</button>
		<input type="hidden" name="id" value="7">
		<input type="hidden" name="amount" value="1">
		<button type="submit" onclick="stop()" id="S" disabled="true" style="position:absolute;top: 1680px;left: 650px;width: 250px;height: 80px;font-size: 30px;">停止</button><br>
		
	</div>
		</div>
	</div>

</div>
<%
	
		request.setCharacterEncoding("UTF-8");
		sql="SELECT * From product where id =7";
		ResultSet rs=con.createStatement().executeQuery(sql);
		String price="",pic="";
		if(rs.next())
		{		
			price=rs.getString("price");
		}
		String p_name=rs.getString("name");
		int pid=rs.getInt("id");
		
		
		%>
<form name="shoppingcar" action="shoppingcar1.jsp" method="POST">
					
					<input type="hidden" name="name" value="<%=rs.getString("name")%>"/>
					<input type="hidden" name="price" value="<%=rs.getString("price")%>"/>
					<input type="hidden" name="img" value="<%=rs.getString("path")+rs.getString("img")%>"/>	
					<input type="hidden" name="id" value="1"/>
					<%
									
						Integer amount=0;
						rs=con.createStatement().executeQuery(sql);
						while(rs.next())
						{
							amount=Integer.parseInt(rs.getString("amount"));
						}
						if(amount>0)
						{
					%>
							
							
					<%
										
										
						}
						else
						{
							out.print("庫存不足");
						}
					%>
					
					<input type="hidden" name="num" value="1"/>
					
					
					<button type="submit" id="T" disabled="true" style="position: absolute;top:1759px;left: 1220px;width: 250px;height: 80px;font-size: 30px;background-color: white;color: black;font-size: 21px;">加入購物車</button>
				</form>

</body>
</html>