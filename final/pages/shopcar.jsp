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
							<li><a href="product.jsp">商品總覽</a></li>
							<li><a href="shopcar.jsp">購物車</a></li>
							<li><a href="aboutus.html">關於我們</a></li>
							<li><a href="../index.jsp">回首頁</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!--content-->
		<div class = "main-content" id="main">
			<div class="shopcartitle">
			<span class="stit1">圖片</span>
				<span class="stit2">資訊</span>
				<span class="stit3">單價</span>
				<span class="stit4">數量</span>
				<span class="stit5">總計</span>
			</div>
			<div class="outside">
				
				<% 
						//jsp連接前端範例
						String itemiddd = request.getParameter("itemid");
						String uname=(String)session.getAttribute("Got_Mail");
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
							  //String sql="select * from `item`";
							  //ResultSet tmp =con.createStatement().executeQuery(sql);	 
								String sqll="select * from `shopcar`";
								ResultSet rp =con.createStatement().executeQuery(sqll);	 
								String name="";
								String itemid="";
								String price="";
								String image="";
								String num="";
								String shopid="";
								String username="";
								int sum=0;
								int total=0;
								int item = 1; //用來計算第幾個商品的, 藉此改變input的id
								
									while(rp.next())
							 		{
										itemid=rp.getString(1);
										num=rp.getString(3);
										shopid=rp.getString(4);
										name=rp.getString(6);
										username=rp.getString(5);
										image=rp.getString(7);
										price=rp.getString(8);
										if(username.equals(uname)){
											
								%>
											<div class="shopcaritem">
												<div>
													<img src="../assets/images/<%=image%>">
												</div>
												<div class="iteminfro"><%=name%></div>
												<div class="iteminfro2"><%=price%></div>
												
												<div class="iteminfro3">
												<form action="shopadd.jsp">
													<input type='hidden' name='shopid' value="<%=shopid%>">
													<input type="submit"  class="num-min" name="fun" value="-"></button>
													<input id="input-num<%=item%>"type="text" class="input-num" value="<%=num%>" style="width:60px;height:40px;" name ="num" >
													<input type="submit" class="num-plus"name="fun" value="+"></button>
												</form>
												</div>
												<div class="iteminfro2">
												<%	
													
													int numm = Integer.parseInt(num);
													int pricee = Integer.parseInt(price);
													sum=numm*pricee;
													total=total+sum;
													out.print(sum);
													
												%>	
												<input type='hidden' name='itemid' value="<%=itemid%>">
												<input type='hidden' name='price' value="<%=price%>">
												<input type='hidden' name='name' value="<%=name%>">
												<input type='hidden' name='image' value="<%=image%>">
												<input type="hidden" value="<%=num%>">

												</div>
												
												<div class="iteminfro4">
													<form action = "deleteitem.jsp" method = "get">
														<input type="hidden" name="shopid" value="<%=shopid%>">
														<button type = "submit" title="是否確定要移除" class="bt2">X</button>
													</form>
												</div>
											</div>
											<%
											}
										}	 
								 	
								%>
							</div>
							<form action="bill.jsp">
							<input type="hidden" name="total" value="<%=total%>">
							<input type="submit" class="bt" value="前往結帳">
							</form>
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


</body>
</html>