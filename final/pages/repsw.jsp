<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>

<%
	
		if(request.getParameter("password") != ""&&request.getParameter("password1") != "" &&request.getParameter("password2") != "")
		{		
			String psw1 = request.getParameter("password1");
			String psw2 = request.getParameter("password2");
			sql = "select * from `member` where `mail` = '" + (String)session.getAttribute("Got_Mail") + "'";  //再拿來找編號
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
			ResultSet paperrs = pstmt.executeQuery(sql);
			paperrs.next();
			
			int now_psw = paperrs.getInt(3);
			int input_psw = Integer.valueOf(request.getParameter("password"));
			if( psw1.equals( psw2) )
			{	
				if( input_psw == now_psw )
				{
					int nowNumber = paperrs.getInt(7);
					String number = String.valueOf(nowNumber); 	
					String mail= paperrs.getString(2);
					
					
					sql = "Update `member` Set `password` = ? Where `memberid` = ?"; //用?取代字串相加
					pstmt=con.prepareStatement(sql);//創造預備敘述			
					pstmt.setString(1, request.getParameter("password1")); //再一一放入各參數
					pstmt.setString(2, number);
					
					pstmt.executeUpdate();//輸入完執行
					
								
					out.println("<script>alert('修改成功')</script>");
					response.setHeader("refresh","0;URL=../index.jsp") ;
				}	
				else
					out.println("<script>alert('密碼錯誤')</script>");
			}
			else
				response.setHeader("refresh","0;URL=password.jsp?pswError=true") ;				
		}
		else
			response.sendRedirect("password.jsp?inputError=true") ;

	
	
	
%>