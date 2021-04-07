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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			@import url("../assets/css/fixed.css");
			@import url("../assets/css/item.css");
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
        <div class="sellarea">
	 	
        <%
       int total_item1=0;
	   String itemidd = request.getParameter("itemid");
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
              String sql = "SELECT*FROM `item`" ;
              ResultSet tmp =  con.createStatement().executeQuery(sql);
			int run_times=0;
				
             while(tmp.next())
             {
                String num =tmp.getString(1);
				String name =tmp.getString(2);
				String itemid =tmp.getString(3);
                String memory =tmp.getString(4);
                String functions =tmp.getString(5);
                String power=tmp.getString(6);
				String image = tmp.getString(7);
				String price = tmp.getString(8);
                String kind=tmp.getString(9);
                String hz=tmp.getString(10);
				String store=tmp.getString(11);
				String adimage=tmp.getString(12);
                //Show
				
                if(itemid.equals(itemidd))
                {
                    out.print("<div class='sellpic'><img src='../assets/images/"+image+"'></div>");
                    out.print("<div class='sellword'>");
                    out.print("<span class='bbb'>"+name+"</span>");
                    out.print("<div class='price'>售價&nbsp;:&nbsp;$"+price+"&nbsp;NTD</div>");
                    out.print("<span class='aaa'>基礎頻率&nbsp;:&nbsp;最高"+hz+"</span><br>");
                    out.print("<span class='aaa'>記憶體&nbsp;:&nbsp;"+memory+"</span><br>");
                    out.print("<span class='aaa'>電源需求&nbsp;:&nbsp;"+power+"</span><br>");
                    out.print("<span class='aaa'>"+functions+"</span><br>");
                    out.print("<span class='aaa'>庫存&nbsp;:&nbsp;"+store+"</span><br>");
					out.print("<form action='additemshop.jsp'>");
					out.print("<input type='hidden' name='itemid' value='"+itemid+"'>");
					out.print("<input type='hidden' name='price' value='"+price+"'>");
					out.print("<input type='hidden' name='name' value='"+name+"'>");
					out.print("<input type='hidden' name='image' value='"+image+"'>");
					run_times++;
					%>
					<div class="ccc">
			<span class="aaa">數量&nbsp;:&nbsp;</span>
			
				<select name="num" id="num">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				
				<button class="bt"><span>加入購物車</span></a></button>
			   </form>
			    
			</div>
				</div>
						</div>   	
			<div class="ad">
				<img src="../assets/images/<%=adimage%>">
			</div>
			<div class="rarea">
					
					
					<%
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
          
		
		
			    
				<%
				 //connect mydata.sql
				 String uname = (String)session.getAttribute("Got_Mail");
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
		 
					   //Choose Table goods
					   String sql = "SELECT * FROM `forum`" ;
					   ResultSet tmp =  con.createStatement().executeQuery(sql);
					   
					   //Show
					   int run_times=0;
					   while(tmp.next())
					   {
						String name=tmp.getString(1);
						String content=tmp.getString(2);
						String star=tmp.getString(3);
						String itemid=tmp.getString(4);
						String time=tmp.getString(5);
						String num=tmp.getString(6);
						out.print(itemid);
						if(name.equals(uname)){
							
						if(itemid.equals(itemidd))
						{
						out.print("<div class='fback'><div>");
						out.print("<fieldset class='rating'>");  
						out.print("<span class='uname'>"+name+"</span><br>");
						switch(star)
							{
		
								case "1":
								{
									out.print("<span class='fa fa-star checked'></span>");
									out.print("<span class='fa fa-star unchecked'></span>");
									out.print("<span class='fa fa-star unchecked'></span>");
									out.print("<span class='fa fa-star unchecked'></span>");
									out.print("<span class='fa fa-star unchecked'></span>");
									
								}
								break;
								case "2":
								{
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star unchecked'></span>");
								out.print("<span class='fa fa-star unchecked'></span>");
								out.print("<span class='fa fa-star unchecked'></span>");
								
								}
								break;
								case "3":
								{
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star unchecked'></span>");
								out.print("<span class='fa fa-star unchecked'></span>");
								
								}
								break;
		
								case "4":
								{
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star unchecked'></span>");
								
								}
								break;
								case "5":
								{
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								out.print("<span class='fa fa-star checked'></span>");
								}
								break;


								
							}
						out.print("</fieldset></div>");
						out.print("<hr class='ratinghr'>");
						out.print("<span class='rcontent'>"+content+"</span></div>");
						 
					   }
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