<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%
	String modify = request.getParameter("modify");
	String del = request.getParameter("del");
	String insert = request.getParameter("insert");
	String number= request.getParameter("number");
	
	if(insert != null)
	{
		String oper = "insert";
		sql = "Select number From item Where number = '" + number + "'";
		ResultSet rs = con.createStatement().executeQuery(sql);
		
		boolean update = false;
		if(rs.next())
		{
			sql = "Update item Set name = ?, quantity = ?, price = ?, introdution = ? Where number ='" + number + "'";
			update = true;
		}
		else
			sql = "insert into item( itemid, name, image, stock,  number) values( ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, request.getParameter("itemid"));
		pst.setString(2, request.getParameter("name"));
		pst.setString(3, request.getParameter("image"));
		pst.setString(4, request.getParameter("stock"));
		pst.setString(5, request.getParameter("price"));
		pst.setString(6, request.getParameter("kind"));

		
		
		if(update==true)
			pst.executeUpdate();
		else
		{	
			pst.setString(5, request.getParameter("number"));
			pst.execute();
		}
		
		out.print("<script>alert('新增完成')</script>");
		response.setHeader("refresh","0;URL=manager.jsp") ;
	}
	else if(del != null)
	{
		sql = "Delete From item Where number = ?";
		PreparedStatement pst = con.prepareStatement(sql);	
		pst.setString(1, number);
		pst.execute();
		out.print("<script>alert('刪除完成')</script>");
		response.setHeader("refresh","0;URL=manager.jsp") ;
	}
	else if(modify != null)
		response.setHeader("refresh","0;URL=manager.jsp?number=" + number) ;
%>