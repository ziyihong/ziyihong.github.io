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
			@import url("../assets/css/product.css");
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
							<li><a href="../pages/aboutus.jsp">關於我們</a></li>
							<li><a href="../index.jsp">回首頁</a></li>
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
							<img src="../assets/images/s3.png" alt="Los Angeles" style="width:100%;">
						</div>
						<div class="item" >
							<img src="../assets/images/s4.png" alt="Los Angeles" style="width:100%;">
						</div>
						
						<div class="item">
							<img src="../assets/images/s5.png" alt="New york" style="width:100%;">
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
			<div class="toptitle">
				所有商品
			</div>
			<hr class="titlehr">
			<table>
			 <%
      	
            String search_word =request.getParameter("search");

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

              if(search_word==null||search_word.equals(""))
              {
                out.print("<h3 align='center'style='color:white;'>無輸入關鍵字查詢</h3>");
                //out.print("<SCRIPT language=javascript>function go(){window.history.go(-1);}setTimeout('go()',3000);</SCRIPT>");
              }
              else
              {
                //Choose Table item
                String sql = "SELECT `number`, `name`, `itemid`, `memory`, `function` ,`power` ,`image`,`price`,`kind` FROM `item` WHERE name LIKE '%"+ search_word +"%'" ;
                ResultSet tmp =  con.createStatement().executeQuery(sql);
              
                //Show
				out.print("<div class= 'container2' id = 'msi'><div>");
				int run_times=0;
                while(tmp.next())
                {
                  //Get Value
				String itemid =tmp.getString(3);
                String name =tmp.getString(2);
                String memory=tmp.getString(4);
                String functions =tmp.getString(5);
                String power=tmp.getString(6);
				String image= tmp.getString(7);
				String price= tmp.getString(8);
				String kind=tmp.getString(9);
				
                //Show
				
				out.print("<div class='item2'>");
				out.print("<div class='iteminside'>");
				out.print("<a href='item.jsp?itemid="+itemid+"'>"+"<img src ='../assets/images/"+image+"'></a>");
                out.print("<a href='item.jsp?itemid="+itemid+"'>"+name+memory+"</a>");
                out.print("<p class='sellprice'>"+price+"</p>");
				out.print("</div>");
				run_times++;
				}
				
                out.print("</div></div>");
                //if no search solution
                if(run_times==0)
                {
                  out.print("<p align='center'>關鍵字查詢無資料<p>");
                }
				if(run_times==3)
				{
					out.print("</td>");
					out.print("<td>");
				}

                 out.print("</td>");

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
          
        
			
			</table>
			<div class= "container2">
				<div>
					<img src = "../assets/images/logo.png" style="width: 300px; height: 300px;" class="logoo2">
				</div>
				<div class="item3">
					New&nbsp;Product<br>
					Coming&nbsp;Soon...
					
				</div>
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