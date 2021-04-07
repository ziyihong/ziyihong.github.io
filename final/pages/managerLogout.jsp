<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<% //把account 的值傳過來了
	
	if(session.getAttribute("backdata") != null)
	{
		session.removeAttribute("backdata");		
	}
	response.sendRedirect("index.jsp");
%>