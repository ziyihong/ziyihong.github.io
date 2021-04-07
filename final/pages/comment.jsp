<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
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
			@import url("../assets/css/comment.css");
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
					<a href="../pages/member.html"><img src = "../assets/images/member.png" alt = "member" class="memberpic"></a>
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
			<div class = "outside_area">
				<form method="get" action="addcomment.jsp">
					<div class = "top_area">
						<% 
						String uname = (String)session.getAttribute("Got_Mail");
						//jsp連接前端範例
						String itemiddd = request.getParameter("itemid");
						String needid = request.getParameter("needid");
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
								 int run_times=0;
								//Choose Table goods
							  	String sql="select * from `item`";
							  	ResultSet tmp =con.createStatement().executeQuery(sql);	 
							
							 while(tmp.next())
							 {
								String name =tmp.getString(2);
								String itemid=tmp.getString(3);
							 	String price=tmp.getString(8);
								 String image =tmp.getString(7);
								if(itemid.equals(itemiddd)){
									out.print("<img src='../assets/images/"+image+"'>");
							   		out.print("<div class ='info'><div class ='product_name'>"+name+"</div>");
							   		out.print("<div class ='price'>$"+price);
								}
							   run_times++;
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
						     <fieldset class="rating">
									<input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
									<input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
									<input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
									<input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
									<input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
								</fieldset>
							</div>
						</div>
					</div>
					<div class = "bottom_area">
						<textarea type = "textarea" name ="content" class = "comment" placeholder = "寫些對這個產品的評價吧" wrap="hard" row = "15" wrap = "off"></textarea>
						<button type = "submit" class = "btn"><span>留言</span></button>
					</div>
					<input type="hidden" name="itemid" value="<%=itemiddd%>">
					<input type="hidden" name="needid" value="<%=needid%>">
					</form>
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