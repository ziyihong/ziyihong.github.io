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
				<img src = "../assets/images/logo.png" alt = "logo" class="logo">
				<img src = "../assets/images/pic2.png" alt = "member" class="sloganpic">
				<div class = "member">
					<img src = "../assets/images/member.png" alt = "member" class="memberpic">
					<img src = "../assets/images/shopcar.png" alt = "member" class="carpic">
				</div>
			</div>
			
		</header>
		<!--content-->
		<div class = "main-content" id="main">
			<div class = "title">
				瀏覽訂單
			</div>
			<div style = "text-align: right; margin:0 50px 20px;">
				<button class = "bt" onclick="location.href='../index.jsp'">登出</button>
				<button class = "bt" onclick="location.href='manager.html'">商品管理</button>
			</div>
			<table class = "table">
				<tr class="th">
					<td>姓名</td>
					<td>使用者名稱</td>
					<td>地址</td>
					<td>手機號碼</td>
					<td>卡號</td>
					<td>後三碼</td>
					<td>商品</td>
					<td>數量</td>
					<td>總價</td>
					<td>日期</td>
					<td>訂單編號</td>
				</tr>
				
				<%
					sql = "Select * From `record`";
					ResultSet rs = con.createStatement().executeQuery(sql);
							
					while(rs.next())
				{%>			
				<tr>
					<td ><%=rs.getString(8)%></td>
					<td ><%=rs.getString(1)%></td>
					<td ><%=rs.getString(9)%></td>
					<td ><%=rs.getString(10)%></td>
					<td ><%=rs.getString(11)%></td>
					<td><%=rs.getString(12)%></td>
					<td ><%=rs.getString(2)%></td>
					<td ><%=rs.getString(7)%></td>
					<td ><%=rs.getString(6)%></td>
					<td ><%=rs.getString(5)%></td>
					
					
				</tr>
			<%}%>
			</table>
		</div>
		<!--content end-->
		<footer>
			<div class = "footer_top" style = "width:100%; text-align: right;">
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