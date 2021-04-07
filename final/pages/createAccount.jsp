<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String psw1 = request.getParameter("password1");
	String psw2 = request.getParameter("password2");
	if(psw1.equals(psw2))
	{
		if(request.getParameter("password1") != "" && request.getParameter("phone") != "" && request.getParameter("name") != "" && request.getParameter("phone") != "")
		{		
			/*String mail = request.getParameter("mail");
			char at = 'd';
			int find = mail.indexOf(at);*/
			PreparedStatement pstmt = null;
			sql = "select * from `member` Where `mail` = '" + request.getParameter("mail") + "'" ;
			pstmt=con.prepareStatement(sql);
			ResultSet paperrs = pstmt.executeQuery();
			int find = -1;
			
			if( !paperrs.next() )
			{
				if( find == -1 )
				{
					//讀出目前的會員編號最大值
					sql = "select `memberid` from `member` order by `memberid` ASC";					
					pstmt=con.prepareStatement(sql);
					paperrs = pstmt.executeQuery();		
					int nowNumber = 1;
					if(paperrs.last())
						nowNumber = paperrs.getInt(1) + 1;//再加一					
					
					sql = "insert into `member`(`name`, `password`, `mail`, `phone`, `memberid`) values(?, ?, ?, ?, ?)"; //用?取代字串相加
					pstmt=con.prepareStatement(sql);//創造預備敘述
					pstmt.setString(1, request.getParameter("name"));//再一一放入各參數
					pstmt.setString(2, request.getParameter("password1")); 
					pstmt.setString(3, request.getParameter("mail"));
					pstmt.setString(4, request.getParameter("phone"));
					pstmt.setInt(5, nowNumber );
					
					
					pstmt.execute();//輸入完執行
					
					out.println("<script>alert('註冊成功')</script>");
					response.setHeader("refresh","0;URL=../index.jsp") ;
				}
				else
				{
					out.println("<script>alert('無效信箱')</script>");
					response.setHeader("refresh","0;URL=register.jsp") ;
				}
			}
			else
			{
				out.println("<script>alert('已註冊的信箱')</script>");
				response.setHeader("refresh","0;URL=register.jsp") ;
			}
		}
		else
			response.sendRedirect("register.jsp?inputError=true") ;
	}
	else
		response.sendRedirect("register.jsp?pswError=true") ;
%>