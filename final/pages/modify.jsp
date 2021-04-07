<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
	


<%
	
		if(request.getParameter("name") != "" && request.getParameter("mail") != "" && request.getParameter("phone") != ""&& request.getParameter("home") != ""&& request.getParameter("sex") != "")
		{				
			PreparedStatement pstmt = null;
			sql = "select `memberid` from `member` where `mail` = '" + (String)session.getAttribute("Got_Mail") + "'";  //再拿來找編號
			pstmt=con.prepareStatement(sql);
			ResultSet paperrs = pstmt.executeQuery(sql);
			paperrs.next();
			int nowNumber = paperrs.getInt(1);
			String number = String.valueOf(nowNumber); 	
			
			
			sql = "Update `member` Set name = ?, mail = ?, phone = ? ,home = ?,sex = ? Where `memberid` = ?"; //用?取代字串相加
			pstmt=con.prepareStatement(sql);//創造預備敘述			
			pstmt.setString(1, request.getParameter("name")); //再一一放入各參數
			pstmt.setString(2, request.getParameter("mail"));
			pstmt.setString(4, request.getParameter("home"));
			pstmt.setString(3, request.getParameter("phone"));
			pstmt.setString(5, request.getParameter("sex"));
			pstmt.setString(6, number);
			pstmt.executeUpdate();//輸入完執行
			session.setAttribute("Got_Mail", request.getParameter("mail") );
			
		    out.println("<script>alert('修改成功')</script>");
			response.setHeader("refresh","0;URL=../index.jsp") ;	
		}
		else
			response.sendRedirect("modify.jsp?inputError=true") ;

%>