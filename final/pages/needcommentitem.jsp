
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>


<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>待評分</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style>
			@import url("../assets/css/fixed.css");
			@import url("../assets/css/record.css");
			@import url("../assets/css/shopcar.css");
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
			<div class = "title">待評分項目
				<hr class = "line">
			</div>
			<div class="shopcartitle">
				<span class="stit2_2">資訊</span>
				<span class="stit3_2">單價</span>
				<span class="stit4_2">數量</span>
				<span class="stit5_2">總計</span>
				<span class="stit6">消費時間</span>
			</div>
			<div class="outside">
				
					<%
					 String uname = (String)session.getAttribute("Got_Mail");
					 //connect mydata.sql
					 try
					 {
					   Class.forName("com.mysql.jdbc.Driver");   
					   try
					   {
						 String url="jdbc:mysql://localhost/?serverTimezone=UTC";

						 Connection con=DriverManager.getConnection(url,"root","1234");   
						 if(con.isClosed())
						   out.println("連線建立失敗");
						 else
						 {
						   //Choose & Use myData
						   con.createStatement().execute("USE `member`");
			 
						   //total counter
						   
			 
						   //Choose Table goods
						   String sql = "SELECT* FROM `needcomment`" ;
						   ResultSet tmp =  con.createStatement().executeQuery(sql);
							int run_times=0;
							 
						  while(tmp.next())
						  {
							 String username =tmp.getString(1);
							 String itemname =tmp.getString(2);
							 String itemid=tmp.getString(3);
							 String time=tmp.getString(4);
							 String needid =tmp.getString(5);
							 String money=tmp.getString(6);
							 String num= tmp.getString(7);
							 int sum=Integer.parseInt(money)*Integer.parseInt(num);

							 //Show
							if(username.equals(uname)){
								out.print("<div class='shopcaritem2'><div class='iteminfro5'><a href='comment.jsp?itemid="+itemid+"&needid="+needid+"'>前往評論</a></div>");
							out.print("<div class='iteminfro'>"+itemname+"</div>");
							out.print("<div class='iteminfro5'>"+money+"</div>");
						    out.print("<div class='iteminfro5'>"+num+"</div>");
							out.print("<div class='iteminfro5'>"+sum+"</div>");
							out.print("<div class='iteminfro6'>"+time+"</div></div>");
							
							run_times++;
							}
							
						 } 

						   //close connect
						   con.close();
						 
						 }
					   }
					   catch (SQLException sExec) 
					   {
						 out.println("SQL錯誤"+sExec.toString());
					   }
					 }
					 
					 catch (ClassNotFoundException err) 
					 {
					   out.println("class錯誤"+err.toString());
					 }
					
					   
					 %>
				
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
</script>
</body>
</html>