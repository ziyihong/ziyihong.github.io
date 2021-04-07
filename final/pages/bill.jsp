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
			@import url("../assets/css/bill.css");
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
	<%
		if( session.getAttribute("Got_Mail") == null)
		{	
			out.print("<script>alert('請先登入')</script>");
			response.setHeader("refresh","0;URL=login.html") ;
			return;
		}
		%>
		<%String total = request.getParameter("total");
		   int i = Integer.parseInt(total);
					if(i==0)
					{	
						out.print("<script>alert('購物車為空')</script>");
						response.setHeader("refresh","0;URL=product.jsp") ;
						return;
					}
		%>
		

	<body>
		<header>
			<div class = "solid_header">
				<a href="../index.jsp"><img src = "../assets/images/logo.png" alt = "logo" class="logo"></a>
				<img src = "../assets/images/slogan.png" alt = "member" class="sloganpic">
				<div class = "member">
					<a href="member.jsp"><img src = "../assets/images/member.png" alt = "member" class="memberpic"></a>
					<a href="shopcar.jsp"><img src = "../assets/images/shopcar.png" alt = "member" class="carpic"></a>
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
							<li><a href="../pages/product.html">商品總覽</a></li>
							<li><a href="../pages/shopcar.html">購物車</a></li>
							<li><a href="../pages/aboutus.html">關於我們</a></li>
							<li><a href="../index.html">回首頁</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!--content-->
		<div class = "main-content" id="main">
			<div class="totaltitle">
			
				
				<span>本次消費總計:$</span>
				<span><%=total%></span>
			   </div>
			   <div class="totalarea">
				<table style="width: 100%;">
					<tr class = "table_title">
						<td  class="td1">商品名稱</td>
						<td  class="td1">數量</td>
						<td  class="td1">單價</td>
						<td  class="td1">總計</td>
					</tr>
					<% 
					String uname = (String)session.getAttribute("Got_Mail");
					//jsp連接前端範例
					String itemiddd = request.getParameter("itemid");
					
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
							   
							String sqll="select * from `shopcar`";
							ResultSet rp =con.createStatement().executeQuery(sqll);	 
							String name="";
							String itemid="";
							String price="";
							String username="";
							String image="";
							String itemidd="";
							String num="";
							String shopid="";
							String pay="";
							int sum=0;
								while(rp.next())
								 {
									itemid=rp.getString(1);
									num=rp.getString(3);
									shopid=rp.getString(4);
									username=rp.getString(5);
									name=rp.getString(6);
									image=rp.getString(7);
									price=rp.getString(8);
									if(username.equals(uname)){
										%>
										
										<tr>
											<td width="50%"><%=name%></td>
											<td>&nbsp;&nbsp;<%=num%>&nbsp;&nbsp;</td>
											<td>&nbsp;&nbsp;<%=price%>&nbsp;&nbsp;</td>
											<td>
												<%	
												int numm = Integer.parseInt(num);
												int pricee = Integer.parseInt(price);
												sum=numm*pricee;
												out.print("  ");
												out.print(sum);
												out.print("  ");
												}
												%>
											</td>
										</tr>
										<%
							  }
								%>
							</table>
						</div>
						<form method="get" action="additembuy.jsp">
							<div class="pay">
								<span><input type = "radio" value = "payment" name = "pay" onclick= "inputinfo()"  CHECKED>貨到付款</span>
								<span><input type = "radio" value = "onlinepay" name = "pay" id = "online" onclick= "inputinfo()" selected>線上付款</span>
							</div>
							<div class = "info">
								<div class = "info_title">
									收件資訊
								</div>
								<div class = "info_container">
									<div class = "user_info">
										<div class = "info_inside">
											<span>姓名</span>
											<input type = "text" name = "real_name">
										</div>
										<div class= "info_inside">
											<span>手機號碼</span>
											<input type = "text" name = "phone">
										</div>
									</div>
									<div class = "address_input">
										<span>收件地址</span>
										<select name="region">
											<option value="台北市">台北市</option>
											<option value="新北市">新北市</option>
											<option value="桃園市">桃園市</option>
											<option value="台中市">台中市</option>
											<option value="台中市">台中市</option>
											<option value="高雄市">高雄市</option>
											<option value="基隆市">基隆市</option>
											<option value="新竹市">新竹市</option>
											<option value="新竹縣">新竹縣</option>
											<option value="嘉義市">嘉義市</option>
											<option value="嘉義縣">嘉義縣	</option>
											<option value="苗栗縣">苗栗縣</option>
											<option value="彰化縣">彰化縣</option>
											<option value="南投縣">南投縣</option>
											<option value="雲林縣">雲林縣</option>
											<option value="屏東縣">屏東縣</option>
											<option value="宜蘭縣">宜蘭縣	</option>
											<option value="花蓮縣">花蓮縣</option>
											<option value="臺東縣">臺東縣</option>
											<option value="澎湖縣">澎湖縣</option>
											<option value="金門縣">金門縣</option>
											<option value="連江縣">連江縣</option>
										</select>
										<input type = "text" name = "address">
									</div>
								</div>
							</div>
							<div class = "card" id = "online_pay">
								<div class = "info_title">
									信用卡
								</div>
								<div class = "info_container">
									<div class = "card_number">
										<div class = "card_inside">
											<span>信用卡號</span>
											<input type = "text" name = "card_number">
										</div>
									</div>
									<div class = "card_number">
										<div class = "card_inside">
											<span>有效期限</span>
											<input type = "text" name = "card_date">
										</div>
										<div class = "card_inside">
											<span>卡片背後末三碼</span>
											<input type = "text" name = "card_lastnumber">
										</div>
									</div>
								</div>
							</div>
							<div class = "btn_area">
								<button type = "reset" class = "btn" ><span>重設</span></button>
								<button type = "submit" class = "btn"><span>結帳</span></button>
							</div>
						</form>
					</div>
								<%
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
		<!--content end-->
		<footer>
			<div class = "footer_top">
				<ul>
					<li><a class="bigt" style="text-decoration: none;">商品總覽</a>
					<hr class = "hr">
					<ul class = "footer_list">
						<li><a href = "../pages/product.search_app.jsp?search=asus">AUSU</a></li>
						<li><a href = "../pages/product.search_app.jsp?search=msi">MSI</a></li>
						<li><a href = "../pages/product.search_app.jsp?search=gigabyte">GIGABYTE</a></li>
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
		function inputinfo(){
			var radio = document.getElementById("online");
			var obj = document.getElementById("online_pay");
			if( radio.checked )
			{
				obj.style.visibility = "visible";
			}
			else
			{
				obj.style.visibility = "hidden";
			}
		}
</script>
</body>
</html>