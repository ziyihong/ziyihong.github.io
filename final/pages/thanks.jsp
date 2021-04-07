<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
			@import url("../assets/css/thanks.css");
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
	<%
		if( session.getAttribute("Got_Mail") == null)
		{	
			out.print("<script>alert('請先登入')</script>");
			response.setHeader("refresh","0;URL=login.html") ;
			return;
		}
		%>
		<header>
			<div class = "solid_header">
				<a href="../index.jsp"><img src = "../assets/images/logo.png" alt = "logo" class="logo"></a>
				<img src = "../assets/images/slogan.png" alt = "member" class="sloganpic">
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
						<form action="search_app.jsp">
							<input type="text" name="search" placeholder="Search...">
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
			<div class="thk">
				<span class="wordthk">購買成功</span><br>
				<button class="bt bt2"  onclick="location.href='product.jsp'"><span>繼續購物</span></button>
				<button class="bt"  onclick="location.href='../index.jsp'"><span>回到主頁</span></button>


			</div>
			
		</div>
		<!--content end-->
	<footer>
			<div class = "footer_top">
				<ul>
					<li><a class="bigt" style="text-decoration: none;">商品總覽</a>
					<hr class = "hr">
					<ul class = "footer_list">
						<li><a href = "search_app.jsp?search=asus">AUSU</a></li>
						<li><a href = "search_app.jsp?search=msi">MSI</a></li>
						<li><a href = "search_app.jsp?search=gigabyte">GIGABYTE</a></li>
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
				<li><a href = "aboutus.html">聯絡我們</a></li>
				
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
		var num_plus = document.getElementById("num-plus");
var num_min = document.getElementById("num-min");
var input_num = document.getElementById("input-num");
num_plus.onclick = function() {
input_num.value = parseInt(input_num.value) + 1;
}
num_min.onclick = function() {
if(input_num.value <= 1) {
input_num.value = 1;
} else {
input_num.value = parseInt(input_num.value) - 1;
}
}
</script>
</body>
</html>