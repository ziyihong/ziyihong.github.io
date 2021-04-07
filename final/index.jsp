<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="pages/counter.jsp" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style>
			@import url("assets/css/fixed.css");
			@import url("assets/css/index.css");
			@import url("assets/css/searchbox.css");
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
				<a href="index.jsp"><img src = "assets/images/logo.png" alt = "logo" class="logo"></a>				
				<p style="color:white;" >  您是第<%= count %>位貴客！</p>

				<img src = "assets/images/slogan.png" alt = "member" class="sloganpic">
				<div class = "member">
					<a href="pages/member.jsp"><img src = "assets/images/member.png" alt = "member" class="memberpic"></a>
					<a href="pages/shopcar.jsp"><img src = "assets/images/shopcar.png" alt = "member" class="carpic"></a>
				</div>				
			</div>
			<div class = "header" id = "header">
				<img src = "assets/images/menu.png" alt = "menu" onclick="openNav()" style="cursor: pointer;">
				<div id = "sidebar" class = "sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<img src = "assets/images/logo1.png" class="listlogo">
					<a href="" class="list1">msi&nbsp;RX5700</a>
					<a href="" class="list1">msi&nbsp;RTX2080&nbsp;super</a>
					<a href="" class="list2">asus&nbsp;GTX1660&nbsp;super</a>
					<a href="" class="list2">asus&nbsp;RTX2080&nbsp;TI</a>
					<a href="" class="list3">GIGA&nbsp;RX5700&nbsp;XT</a>
					<a href="" class="list3">GIGA&nbsp;RTX2060&nbsp;super</a>
				</div>
				<div class="right">
					<div class="webdesigntuts-workshop">
						<form action="pages/search_app.jsp">
							<input type="text" name="search" placeholder="Search...">
							<button>Search</button>
						</form>
					</div>
					<nav>
						<ul>
							<li><a href="pages/product.jsp">商品總覽</a></li>
							<li><a href="pages/shopcar.jsp">購物車</a></li>
							<li><a href="pages/aboutus.html">關於我們</a></li>
							<li><a href="index.jsp">回首頁</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!--content-->
		<div class = "main-content" id="main">
			<div class="container">
				
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="assets/images/s2.gif" alt="Los Angeles" style="width:100%;">
						</div>
						<div class="item" >
							<img src="assets/images/s3.png" alt="Los Angeles" style="width:100%;">
						</div>
						
						<div class="item">
							<img src="assets/images/s1.png" alt="New york" style="width:100%;">
						</div>
					</div>
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev" style= "width:140px;">
						<span class="glyphicon glyphicon-chevron-left"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next" style= "width:140px;">
						<span class="glyphicon glyphicon-chevron-right"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="hot">熱門商品</div>
			<div class="bigarea">
				<div class="no1">
					<a href="pages/item.jsp?itemid=p002" class="image"><img src="assets/images/msi2.jpg"></a>
					<a href="pages/item.jsp?itemid=p002"><div class="in">微星 GeForce RTX 2080 GAMING X TRIO</div></a>
					<button class="bt"  onclick="location.href='pages/item.jsp?itemid=p002'"><span>來去看看</span></a></button>
				</div>
				<div class="no1">
					<a href="pages/item.jsp?itemid=p004" class="image"><img src="assets/images/asus2.jpg"></a>
					<a href="pages/item.jsp?itemid=p004"><div class="in">華碩 ROG STRIX RTX2080TI O11G WHITE GAMING</div></a>
					<button class="bt"  onclick="location.href='pages/item.jsp?itemid=p004'"><span>來去看看</span></a></button>
				</div>
				<div class="no1">
					<a href="pages/item.jsp?itemid=p006" class="image"><img src="assets/images/giga2.jpg"></a>
					<a href="pages/item.jsp?itemid=p006"><div class="in">技嘉 GeForce RTX 2060 SUPER WINDFORCE OC 8G</div></a>
					<button class="bt"  onclick="location.href='pages/item.jsp?itemid=p006'"><span>來去看看</span></a></button>
				</div>
			</div>
			<div class="lastdiv" style="background-image: url(assets/images/enter.jpg); background-size: 100%;">
				
				<span class="fade">進入屬於我們的信仰</span><br>
				<button class="fade bt bt2"  onclick="location.href='pages/product.jsp'"><span>所有商品</span></a></button>
				
			</div>
		</div>
		<!--content end-->
			<footer>
			<div class = "footer_top">
				<ul>
					<li><a class="bigt" style="text-decoration: none;">商品總覽</a>
					<hr class = "hr">
					<ul class = "footer_list">
						<li><a href = "pages/search_app.jsp?search=asus">AUSU</a></li>
						<li><a href = "pages/search_app.jsp?search=msi">MSI</a></li>
						<li><a href = "pages/search_app.jsp?search=gigabyte">GIGABYTE</a></li>
					</ul>
				</li>
				<li><a class="bigt" style="text-decoration: none;">會員資訊</a>
				<hr class = "hr">
				<ul class = "footer_list">
					<li><a href = "pages/register.jsp">註冊會員</a></li>
					<li><a href = "pages/modifyacc.jsp">修改會員資料</a></li>
					<li><a href = "pages/record.jsp">購買紀錄</a></li>
					<li><a href = "pages/shopcar.jsp">購物車</a></li>
					<li><a href = "pages/needcommentitem.jsp">待評分項目</a></li>
				</ul>
			</li>
			<li><a class="bigt" style="text-decoration: none;">關於我們</a>
			<hr class = "hr">
			<ul class = "footer_list">
				<li><a href = "pages/aboutus.html">聯絡我們</a></li>
				
			</ul>
		</li>
		
	</ul>
	<img src = "assets/images/logo1.png" alt = "logo">
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
		$(window).on("load",function() {
$(window).scroll(function() {
var windowBottom = $(this).scrollTop() + $(this).innerHeight();
$(".fade").each(function() {
/* Check the location of each desired element */
var objectBottom = $(this).offset().top + $(this).outerHeight();

/* If the element is completely within bounds of the window, fade it in */
if (objectBottom < windowBottom) { //object comes into view (scrolling down)
if ($(this).css("opacity")==0) {$(this).fadeTo(500,1);}
}
});
}).scroll(); //invoke scroll-handler on page-load
});
</script>
</body>
</html>