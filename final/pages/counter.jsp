<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%

sql = "Select * From `counter`";
ResultSet rs = con.createStatement().executeQuery(sql);
rs.next();
int count = rs.getInt(1);
	
if(session.isNew())
{
	count++;
	sql = "Update `counter` Set `number` = '" + count + "'";
	con.createStatement().execute(sql);
}
%>