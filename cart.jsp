<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>購物車</title>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<style >
		 @import url("asset1/cart_new.css") ;
		
	</style>
	<script type="text/javascript">
		var price = 0.00;
		var price1 = 0.00;
		var price2 = 0.00;

		function jian() {
		    var i = parseInt(document.getElementById("shang").valueOf().value) - 1;
		    if (i <= 0) {
		        i = 0;
		    }
		    document.getElementById("shang").valueOf().value = i;
		    price1 = 338 * i;
		    document.getElementById("yiqian").value=suan(price1);
		    zong();
		}
		function jia() {
		    var i = parseInt(document.getElementById("shang").valueOf().value) + 1;
		    document.getElementById("shang").valueOf().value = i;
		    price1 =338 * i;
		    document.getElementById("yiqian").value=suan(price1);
		    zong();
		}
		function jian1() {
		    var i = parseInt(document.getElementById("shang1").valueOf().value) - 1;
		    if (i <= 0) {
		        i = 0;
		    }
		    document.getElementById("shang1").valueOf().value = i;
		    price2 = 298 * i;
		    document.getElementById("erqian").value=suan(price2);
		    zong();
		}
		function jia1() {
		    var i = parseInt(document.getElementById("shang1").valueOf().value) + 1;
		    document.getElementById("shang1").valueOf().value = i;
		    price2 = 298 * i;
		    document.getElementById("erqian").value=suan(price2);
		    zong();
		}

		function suan(number) {
		    price = price1 + price2;
		    if (isNaN(number)) {
		        return false;
		    }
		    number = Math.round(number * 100) / 100;
		    var s = number.toString();
		    var rs = s.indexOf(".");
		    if (rs < 0) {
		        rs = s.length;
		        s += ".";
		    }
		    while (s.length <= rs + 2) {
		        s += "0";
		    }
		    return s;
		}
		function zong() {
		    price = price1 + price2;
		    if (isNaN(price)) {
		        return false;
		    }
		    price = Math.round(price * 100) / 100;
		    var s = price.toString();
		    var rs = s.indexOf(".");
		    if (rs < 0) {
		        rs = s.length;
		        s += ".";
		    }
		    while (s.length <= rs + 2) {
		        s += "0";
		    }
		    document.getElementById("totalPrice").innerHTML=s;
		}
		function click()
		{
			alert("感謝您的購買！！");
		}
	</script>
</head>
<body style="background-color:	#FFD78C;">

<%!  	
  public int getRowCount(String sql,Connection con)
  {   
		try{
		  ResultSet tmp = con.createStatement().executeQuery(sql);
		  tmp.last();
		  int row=tmp.getRow();
		  return row;
		}catch(SQLException err){
			System.out.println("class error"+err.toString());
			return 0;
		}
		
  }
    
%>


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
  		<div class="ch3"><a href="index.jsp#a"><p class="txthome">熱銷商品</p></a></div>
  		<div class="ch4"><a href="member.jsp"><p class="txthome1">幸運抽獎</p></a></div>
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
     
	
	
	
	
	
	
	
	
	
       
		
	<p style="position: absolute;top: 100px;font-size: 50px;font-weight: bold;left: 270px;">購物車</p>
	<hr class="style-two" style="width: 98%;position: absolute;top: 210px;left: 30px;">
	
	
	
	
<table style="position: absolute;top: 230px;font-size: 30px;font-weight: bold;left: 330px" border="1" width="1180"bgcolor="#dddddd">
		
		<tr bgcolor="#dddddd">			
		<td align="center" width="380">商品名稱</td> 			
		<td align="center" width="200">商品單價</td>			
		<td align="center" width="200">購買數量</td>			
		<td align="center" width="200">金額</td>			
		<td align="center" width="200">編輯</td>		
		</tr>



		<%
    	sql="SELECT * From stock where ID='"+session.getAttribute("member")+"'";
    	int a=getRowCount(sql,con);
    	ResultSet rs1=con.createStatement().executeQuery(sql);
    	double sum=0;
		if(a!=0){
    	while(rs1.next()){
    		String bbb=rs1.getString("total");
    		
			sum+= Double.valueOf(bbb.toString());
			
			int SID=rs1.getInt("SID");
		
		%>
		
		<%			
		String name,price,num,count;						
									
		name = rs1.getString("name");				
		price = rs1.getString("price");				
		num = rs1.getString("amount");				
		count = rs1.getString("total");	
		
		out.println("<tr>");				
		out.println("<td>"+ name +"</td>");				
		out.println("<td>"+ price +"</td>");				
		out.println("<td>"+ num +"</td>");				
		out.println("<td>"+ count +"</td>");%>
		<td>
		<form action='deletec.jsp' method='post'>                
                <input type="submit" id="btn" name="del" value="刪除">       
                <input type="hidden" name="SID" value="<%=SID%>"/>
                </form>
		</td>
<%		
		out.println("</tr>");			
				
		%>	

    	<%}%>
    			
		<%
		}
		else{
		%>
		
		<div class="center" style="position: absolute;top: 400px;font-size: 30px;font-weight: bold;left: 270px;">
		
			<p class="text">您的購物車沒有任何商品!</p>
			</div>
		 
			<div class="btn" style="position: absolute;top: 480px;font-size: 30px;font-weight: bold;left: 270px;">
				<a href="index.jsp">挑選商品</a>
			</div>
		
		<%}%>
	
	<div style="background-color: #E8E8E8;height: 100px;width: 83%;position: absolute;top: 760px;left: 180px;" >
		<h1 style="position:relative;top: 16px;left: 680px;">總價：
		<%
		
		if(sum>=500&&sum<1000){
				sum=sum*0.9;
			}else if(sum>=1000){
				sum=sum*0.8;
			}
		out.print(sum);
		
		%>
		</h1>
		
		<button  style="background-color: red;color: white;position: absolute;top: 15px;left: 1300px;width: 110px;height: 70px;font-size: 30px;"><a href="#mao" style="color: white;text-decoration: none;">結算</a></button>
	</div>
	
	</table>
	
	<div style="background-color: #E8E8E8;height: 120px;width: 83%;position: absolute;top: 940px;left: 180px;color:red;text-align:center;" >
	<h1>好消息！好消息！會員優惠活動開始啦！！<br>即日起消費滿500元，即可獲得9折優惠！滿1000元，更有8折優惠！！</h1>
	</div>
	
	
	
	

	
	
	
	
	
	




	
	<table  style="position: absolute;top: 1140px;font-size: 50px;font-weight: bold;left: 270px;" id="mao">
		
	<div>
		<p  style="position: absolute;top: 1140px;font-size: 50px;font-weight: bold;left: 270px;">結算</p>
	<hr class="style-two" style="width: 98%;position: absolute;top: 1250px;left:0px;">
	
	</div>
	
	<script type="text/javascript">
        function check_nonnull()
        {
            if(document.getElementById('name').value=="")
            {
                alert("姓名不能為空白，請完整輸入");
                return false;
            }
            if(document.getElementById('tel').value=="")
            {
                alert("手機不能為空白，請完整輸入");
                return false;
            }
            if(document.getElementById('addr').value=="")
            {
                alert("聯絡地址不能為空白，請完整輸入");
                return false;
            }
            return true;
        }
    </script>
	
	
	
	
	
	
	<form action="addorder.jsp" method="POST" class="order" onsubmit="return check_nonnull();">
	<div>
		<h1 style="position: absolute;top: 1260px;left: 270px;">
			收貨人資訊
		</h1>
		<h2 style="position: absolute;top: 1320px;left: 270px;">名字</h2>
		<div style="color: red; position: absolute;top: 1335px;left: 325px;">*</div>
		<input type="text"  id="name" name="name" style="position: absolute;top: 1380px;left: 280px;width: 500px;height: 50px;">
		
		<h2 style="position: absolute;top: 1500px;left: 270px;">聯絡電話</h2>
		<div style="color: red; position: absolute;top: 1515px;left: 375px;">*</div>
		<input type="number" id="tel" name="tel" style="position: absolute;top: 1550px;left: 280px;width: 240px;height: 50px;">
		
		<h2 style="position: absolute;top: 1500px;left: 535px;">地址</h2>
		<div style="color: red; position: absolute;top: 1505px;left: 645px;">*</div>
		<input type="text" id="addr" name="address" style="position: absolute;top: 1550px;left: 540px;width: 240px;height: 50px;">

	</div>
	
	
	
	
	<div class="vl" style="position: absolute;left: 1030px;top: 1280px;height: 375px;"></div>
	<h2 style="position: absolute;top: 1320px;left: 1130px;">付款方式</h2>
	<div style="color: red; position: absolute;top: 1335px;left: 1245px;">*</div>
	<select size="1" name="payment" style="position: absolute;top: 1385px;left: 1145px;width: 240px;height: 50px;font-size: 25px;">
		<option>貨到付款</option>
		<option>超商繳費</option>
		<option>郵局轉賬</option>
		<option>信用卡</option>
	</select>
	

	
	<button type="submit" style="position: absolute;top: 1690px;left: 975px;width: 120px;height:70px;background-color: red;font-size: 25px;color: white;" onclick="click()">確認購買</button>
	</form>
	</table>
	
</body>
</html>