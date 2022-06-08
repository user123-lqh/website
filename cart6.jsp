<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
<head>
	
	<title>貓爪小夜燈</title>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<style type="text/css" media="screen">

	 @import url("asset1/c_new.css") ;
	
	</style>
</head>

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
<body  style="background-image: url(img1/background_new.jpg);height: 2140px;">
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
					
					<div style="position:absolute;left:1500px;top:0px"><a class="active" href="administrator.jsp"><p class="txthome">管理後台</p></a></div>
					
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
		
		
		
		<div class="ch2"><a  href="index.jsp" style="text-decoration: none;color: black;" ><p class="txthome" >主頁</p></a></div>
		<img src="img1/logo.jpg" class="imglogo">
  		<div class="ch3"><a href="index.jsp#a" style="text-decoration: none;color: black;"><p class="txthome">熱銷商品</p></a></div>
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
      <i style='font-size:40px;position: absolute;left: 1690px;top: 30px;' class='fas'>&#xf217;</i>
      <i style='font-size:40px;position: absolute;left: 1800px;top: 30px;' class='fas'>&#xf406;</i>
      <p style="position:absolute;top: 60px;left: 1680px;font-size: 24px;text-decoration: none;"><a href="cart.jsp" style="color: black;">購物車</a></p>
      

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
	<div>
		<img src="img1/t4.jpg" style="position: absolute;top: 160px;left: 600px;width: 380px;height: 380px;">
		<p style="padding:5px 200px 5px 5px;background-color: #F5F5F5;position: absolute;top: 140px;left: 1010px;font-size: 40px;color: red;">貓爪小夜燈</p>
		<p style="position: absolute;top: 230px;left: 1010px;font-size: 25px;">質感極為柔軟，<br>就像在摸貓咪的爪子一樣。<br>內部放置磁鐵，不易掉落。<br>輕拍手掌就會亮燈，使用便利。</p>
		<p style="font-size: 35px;position:absolute;top: 360px;left: 1010px;">售價：</p>
		
		
		
		<%
	
		request.setCharacterEncoding("UTF-8");
		sql="SELECT * From product where id =6";
		ResultSet rs=con.createStatement().executeQuery(sql);
		String price="",pic="";
		if(rs.next())
		{		
			price=rs.getString("price");
		}
		String p_name=rs.getString("name");
		int pid=rs.getInt("id");
		
		
		%>
		<div style="color: red;position: absolute;top: 395px;left: 1110px;font-size: 35px;"><%=rs.getString("price")%></div>
				<form name="shoppingcar" action="shoppingcar.jsp" method="POST">
					
					<input type="hidden" name="name" value="<%=rs.getString("name")%>"/>
					<input type="hidden" name="price" value="<%=rs.getString("price")%>"/>
					<input type="hidden" name="img" value="<%=rs.getString("path")+rs.getString("img")%>"/>	
					<input type="hidden" name="id" value="6"/>
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
							<p style="font-size: 25px;position:absolute;top: 425px;left: 1015px;">剩餘數量：<%=amount%></p>
							
					<%
										
										
						}
						else
						{
							out.print("庫存不足");
						}
					%>
					
					
					<select name="num" style="font-size: 25px;position:absolute;top: 500px;left: 1015px;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					</h4>
					
					<button type="submit"  style="position: absolute;top: 481px;left: 1130px;width: 150px;height: 60px;background-color: red;color: white;font-size: 21px;">加入購物車</button>
				</form>
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div>
		<form name="form1" method="post" action="add_new6.jsp" >
		<input type="text" placeholder="請寫些評論"  style="position: absolute;top: 580px;left: 600px;height: 240px;width: 900px;font-size:35px; " name="content">
		<h2 style="position: absolute;top: 830px;left: 600px;">姓名:</h2>
		<input type="text" name="name"  style="position: absolute;top: 845px;left: 660px;width: 300px;height: 30px;">
		<h2 style="position: absolute;top: 830px;left: 1005px;">電子郵箱:</h2>
		<input type="text" name="mail" style="position: absolute;top: 845px;left:1125px;width: 300px;height: 30px;">
		<input type="submit" name="Submit" value="送出" style="position:absolute;top: 900px;width: 120px;height: 50px;font-size: 25px;left:1000px;">
		</form>
		
		
		
	</div>
	<hr style="position: absolute;top: 970px;width: 55%;left: 520px;">
	<p style="position: absolute;top: 1005px;left: 600px;font-size: 25px;">評論內容:</p>
	
	<div style="position: absolute;top: 1070px;left: 600px;height: 1040px;width: 900px;font-size:35px;background-color:white;">
		<% sql="SELECT * FROM `guestbook6`"; //算出共幾筆留言
           ResultSet rs2=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs2.last();
           int total_content=rs2.getRow();
           
           
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           
		   
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
                   
           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
		   
		   
			
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `guestbook6` ORDER BY `GBNO` DESC LIMIT ";
           sql+=start_record+",5";

// current_page... SELECT * FROM `guestbook` ORDER BY `GBNO` DESC LIMIT
//      current_page=1: SELECT * FROM `guestbook` ORDER BY `GBNO` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `guestbook` ORDER BY `GBNO` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `guestbook` ORDER BY `GBNO` DESC LIMIT 10, 5
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {
                 
                 out.println("訪客姓名:"+rs.getString(2)+"<br>");
                 out.println("E-mail:"+rs.getString(3)+"<br>");
                 out.println("留言內容:<br>"+rs.getString(4)+"<br>");
                 out.println("留言時間:"+rs.getString(5)+"<br><hr>");
          }
		 
		  
//Step 6: 關閉連線
          con.close();
		%>
	</div>
	.
	
	
	<div class="txt10" style="position: absolute;top:2120px;height: 130px;width: 99.2%;background-color:#33CCFF;">
	<%
      int counter;
		application.setAttribute("counter", "1000");
		String cnt=(String)application.getAttribute("counter");
		counter = Integer.parseInt(cnt); 
		counter++;
		cnt = String.valueOf(counter);    
		application.setAttribute("counter", cnt);
		%>

      
		<h1 style="text-align: center;">
	 您是第<%=counter%>為貴客！
	  </h1>
    </div>
</body>
</html>