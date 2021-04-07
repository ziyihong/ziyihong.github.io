<%@ page pageEncoding="UTF-8"%>
<%
    session.removeAttribute("Got_Mail");
    out.print("<script> alert('已登出')</script>");
%>
<meta http-equiv="refresh" content="0;url=../index.jsp">