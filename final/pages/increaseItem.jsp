<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style>
			@import url("../assets/css/fixed.css");
			@import url("../assets/css/manager.css");
			@import url("../assets/css/searchbox.css");
		</style>
		<script>
		function openNav() {
		document.getElementById("sidebar").style.width = "250px";
		}
		function closeNav() {
		document.getElementById("sidebar").style.width = "0";
		}
		</script>
	</head>
	<body>
		<header>
			<div class = "solid_header">
				<a href="../index.jsp"><img src = "../assets/images/logo.png" alt = "logo" class="logo"></a>
				<img src = "../assets/images/pic2.png" alt = "member" class="sloganpic">
				<div class = "member">
					<a href="../pages/member.jsp"><img src = "../assets/images/member.png" alt = "member" class="memberpic"></a>
					<a href="../pages/shopcar.jsp"><img src = "../assets/images/shopcar.png" alt = "member" class="carpic"></a>
				</div>
			</div>
			<div class = "header" id = "header">
				<img src = "../assets/images/menu.png" alt = "menu" onclick="openNav()" style="cursor: pointer;">
				<div id = "sidebar" class = "sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<img src = "../assets/images/logo1.png" class="listlogo">
					<a href="" class="list1">msi&nbsp;RX5700</a>
					<a href="" class="list1">msi&nbsp;RTX2080&nbsp;super</a>
					<a href="" class="list2">asus&nbsp;GTX1660&nbsp;super</a>
					<a href="" class="list2">asus&nbsp;RTX2080&nbsp;TI</a>
					<a href="" class="list3">GIGA&nbsp;RX5700&nbsp;XT</a>
					<a href="" class="list3">GIGA&nbsp;RTX2060&nbsp;super</a>
				</div>
				<div class="right">
					<div class="webdesigntuts-workshop">
						<form action="" method="">
							<input type="search" placeholder="Search...">
							<button>Search</button>
						</form>
					</div>
					<nav>
						<ul>
							<li><a href="../pages/product.jsp">商品總覽</a></li>
							<li><a href="../pages/shopcar.jsp">購物車</a></li>
							<li><a href="../pages/aboutus.html">關於我們</a></li>
							<li><a href="../index.jsp">回首頁</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!--content-->
		<div class = "main-content" id="main">
			<div class = "input">
				<%
					
					
					if( request.getParameter("number") != null )
					{
						String number = request.getParameter("number");
						sql = "Select * From `item` Where `number` = '" + number + "';";
						ResultSet rs = con.createStatement().executeQuery(sql);	
						rs.next();
						%>
					<form action="incItem.jsp" method="get">
						<input type = "hidden" name = "number" value = <%=number%>>
						<div class = "block">
							<p>型號</p>
							<input type = "text" name = "itemid" value = <%=rs.getString(3)%>>
						</div>
						<div class = "block">
							<p>產品名稱</p>
							<input type = "text" name = "name" value = <%=rs.getString(2)%>>
						</div>
						<div class = "block">
							<p>圖片名</p>
							<input type = "text" name = "img" value = <%=rs.getString(7)%>>
						</div>
						<div class = "block">
							<p>剩餘庫存</p>
							<input type = "text" name = "store" value = <%=rs.getString(11)%>>
						</div>
						<div class = "block">
							<p>價格</p>
							<input type = "text" name = "price" value = <%=rs.getString(8)%>>
						</div>
						<div class = "block bottom">
							<div class ="left">
								<span class = "title">廠牌</span>
								<select name="kind">
								
								<% 
									String brand = rs.getString(9);
									switch( brand )
									{
										case "msi":%>
											<option value="msi" selected>MSI</option>
											<option value="asus">ASUS</option>
											<option value="gigabyte">GIGABYTE</option>
										</select><%
											break;
										case "asus":%>
											<option value="msi" >MSI</option>
											<option value="asus" selected>ASUS</option>
											<option value="gigabyte">GIGABYTE</option>
										</select><%
											break;
										case "gigabyte":%>
											<option value="msi" >MSI</option>
											<option value="asus" >ASUS</option>
											<option value="gigabyte" selected>GIGABYTE</option>
										</select><%
											break;
									}
									
						String obj = request.getParameter("inputError");
						if(obj != null)
						{			
							if(obj.equals("true"))
							{
								out.println("*資料輸入尚未齊全，請重新輸入<br>");
							}
						}
							%>
								
							</div>
							<button type = "submit"  >送出</button>
						</div>						
					</form><%
					}					
					else
					{
				%>
					<form action="incItem.jsp" method="get">
					<div class = "block">
						<p>型號</p>
						<input type = "text" name = "itemid">
					</div>
					<div class = "block">
						<p>產品名稱</p>
						<input type = "text" name = "name">
					</div>
					<div class = "block">
						<p>圖片名</p>
						<input type = "text" name = "img">
					</div>
					<div class = "block">
						<p>剩餘庫存</p>
						<input type = "text" name = "store">
					</div>
					<div class = "block">
						<p>價格</p>
						<input type = "text" name = "price">
					</div>
					<div class = "block bottom">
						<div class ="left">
							<span class = "title">廠牌</span>
							<select name="kind">
								<option value="msi">MSI</option>
								<option value="asus">ASUS</option>
								<option value="gigabyte">GIGABYTE</option>
							</select><%
							String obj = request.getParameter("inputError");
						if(obj != null)
						{			
							if(obj.equals("true"))
							{
								out.println("*資料輸入尚未齊全，請重新輸入<br>");
							}
						}%>
							</div>
							<button type = "submit"  >送出</button>
						</div>
						
					</form><%
					}%>
				</div>
			</div>
		<!--content end-->
		<footer>
			<div class = "footer_top">
				<ul>
					<li><a class="bigt" style="text-decoration: none;">商品總覽</a>
					<hr class = "hr">
					<ul class = "footer_list">
						<li><a href = "../pages/product.html#asus">AUSU</a></li>
						<li><a href = "../pages/product.html#msi">MSI</a></li>
						<li><a href = "../pages/product.html#gigabyte">GIGABYTE</a></li>
					</ul>
				</li>
				<li><a class="bigt" style="text-decoration: none;">會員資訊</a>
				<hr class = "hr">
				<ul class = "footer_list">
					<li><a href = "register.jsp">註冊會員</a></li>
					<li><a href = "modifyacc.jsp">修改會員資料</a></li>
					<li><a href = "record.jsp">購買紀錄</a></li>
					<li><a href = "shopcar.jsp">購物車</a></li>
					<li><a href = "needcommentitem.jsp">待評分項目</a></li>
				</ul>
			</li>
			<li><a class="bigt" style="text-decoration: none;">關於我們</a>
			<hr class = "hr">
			<ul class = "footer_list">
				<li><a href = "../pages/aboutus.html">聯絡我們</a></li>
				
			</ul>
		</li>
		
	</ul>
	<img src = "../assets/images/logo1.png" alt = "logo">
</div>
<hr class="hr2">
<div class = "copyright">
	© 2020 Belief of GPU 保留所有權利
</div>
</footer>
<script>
		window.onscroll = function() {myFunction()};
		var header = document.getElementById("header");
		var sticky = header.offsetTop;
		function myFunction() {
		if (window.pageYOffset > sticky) {
		header.classList.add("sticky");
		} else {
		header.classList.remove("sticky");
		}
		}
	
</script>
</body>
</html>