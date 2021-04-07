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
		<%
		if( session.getAttribute("admin") == null)
		{	
			out.print("<script>alert('非管理者不得入')</script>");
			response.setHeader("refresh","0;URL=../index.jsp") ;
			return;
		}%>

		<!--content-->
		<div class = "main-content" id="main">
			<div class = "title">
				商品管理
			</div>
			<div style = "text-align: right; margin-right: 50px;">
				<button class = "bt" onclick="location.href='managerLogout.jsp'">登出</button>
				<button class = "bt" onclick="location.href='increaseItem.jsp'">新增商品</button>
				<button class = "bt" onclick="location.href='manager2.html'">瀏覽訂單</button>
			</div>
			<table>
				<tr class="tr1">
					<td class="p1">型號</td>
					<td class="p2">名稱</td>
					<td class="p3">照片</td>
					<td class="p4">庫存</td>
					<td class="p5">價格</td>
					<td class = "p4">廠牌</td>
					<td class="p6">介紹圖</td>
					<td class="p6">功能</td>
				</tr>
				<%
			sql = "Select * From item";
			ResultSet rs = con.createStatement().executeQuery(sql);
			while(rs.next())
			{
				%>
				<tr class="tr2">
					<form action="incItem.jsp" method="get">
						<td class="p1"><!--商品型號--><%=rs.getString(3)%></td>
						<td class="p2"><!--商品名稱--><%=rs.getString(2)%></td>
						<td class="p3"><!--商品圖片--><%=rs.getString(7)%></td>
						<td class="p4"><!--商品庫存--><%=rs.getString(11)%></td>
						<td class="p5">$<!--商品價格--><%=rs.getString(8)%></td>
						<td class = "p4"><!--商品廠牌--><%=rs.getString(9)%></td>
						<td class="p6"><!--商品介紹--><% //=rs.getString(12)%></td>     <!--todo 改位置-->				
						<td class="p6">
							<input type = "hidden" name = "number" value = <%=rs.getString(1)%> >
							<button class="bt1" name = "modify"  value = "ok">修改</button>
						    <button class="bt2" name = "del" value = "ok">刪除</button>
						</td>
					</form>
				</tr>			<%
			}%>		
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