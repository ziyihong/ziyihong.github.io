<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%
			request.setCharacterEncoding("UTF-8");
			
			String modify = request.getParameter("modify");
			String del = request.getParameter("del");
			String kind;
			String itemid = "";
			
			
			if( request.getParameter("name") != "" && request.getParameter("img") != "" && request.getParameter("store") != "" && request.getParameter("kind") != ""&& request.getParameter("itemid ") != "")
			{
				if( modify != null )
					response.setHeader("refresh","0;URL=increaseItem.jsp?number=" + request.getParameter("number")) ;
				else if ( del != null )
				{			
					sql = "Select * From `item` Where number = ?";
					PreparedStatement pst = con.prepareStatement(sql);	
					pst.setInt(1, Integer.parseInt( request.getParameter("number") ) );
					ResultSet rs = pst.executeQuery();
					rs.next();
					itemid = rs.getString(3);
					kind = rs.getString(9);
					
					sql = "Delete From item Where number = ?";					
					pst = con.prepareStatement(sql);	
					pst.setInt(1, Integer.parseInt( request.getParameter("number") ) );
					pst.execute();
					
					sql = "Delete From `" + kind + "` Where `itemid` = ?";
					pst = con.prepareStatement(sql);	
					pst.setString(1, itemid );
					pst.execute();
					
					out.print("<script>alert('刪除完成')</script>");
					response.setHeader("refresh","0;URL=manager.jsp") ;
				}
				else
				{
					kind = request.getParameter("kind");
					PreparedStatement pstmt = null;
					int number = 1;
					boolean isModify = false;
					if( request.getParameter("number") == null )
					{		
						
						sql = "select * from `item` Order By `number` ASC" ;
						pstmt=con.prepareStatement(sql);
						ResultSet paperrs = pstmt.executeQuery();						
					
						if( paperrs.last() )
							number = paperrs.getInt(1) + 1;							
						sql = "insert into `item`( `name`, `image`, `store`, `price`, `kind`, `itemid`,`number`) values(?, ?, ?, ?, ?, ?, ?)"; //用?取代字串相加						
					}
					else
					{
						sql = "Select * From `item` Where `number` = " + Integer.parseInt( request.getParameter("number") );
						ResultSet rs = con.createStatement().executeQuery(sql);
						rs.next();
						itemid = rs.getString(3);	
						
						isModify = true;
						number = Integer.parseInt( request.getParameter("number") );
						sql = "Update `item` set `name` = ?, `image` = ?, `store` = ?, `price` = ?, `kind` = ?, `itemid` = ? Where `number` = ?";
					}
					pstmt=con.prepareStatement(sql);//創造預備敘述
					//再一一放入各參數
					pstmt.setString(1, request.getParameter("name")); 
					pstmt.setString(2, request.getParameter("img"));
					pstmt.setString(3, request.getParameter("store"));
					pstmt.setString(4, request.getParameter("price"));
					pstmt.setString(5, request.getParameter("kind"));					
					pstmt.setString(6, request.getParameter("itemid") );
					pstmt.setInt(7, number);
					
					
					pstmt.execute();//輸入完執行
					
					
					if( request.getParameter("number") == null )
					{		
						sql = "Select `number` From `"+ kind + "` Order by `number` ASC";
						pstmt=con.prepareStatement(sql);
						ResultSet paperrs = pstmt.executeQuery();						
					
						if( paperrs.last() )
							number = paperrs.getInt(1) + 1;	
						sql = "insert into `"+ kind + "` ( `name`, `image`, `price`, `kind`, `itemid`,`number`) values(?, ?, ?, ?, ?, ?)"; //用?取代字串相加
						pstmt=con.prepareStatement(sql);//創造預備敘述
						//再一一放入各參數
						pstmt.setString(1, request.getParameter("name")); 
						pstmt.setString(2, request.getParameter("img"));
						pstmt.setString(3, request.getParameter("price"));
						pstmt.setString(4, request.getParameter("kind"));					
						pstmt.setString(5, request.getParameter("itemid") );
						pstmt.setInt(6, number );
						pstmt.execute();//輸入完執行
					}
					else
					{			
						
						sql = "Update `" + kind + "` set `name` = ?, `image` = ?, `price` = ?, `kind` = ?, `itemid` = ? Where `itemid` = ?";
						pstmt=con.prepareStatement(sql);//創造預備敘述
						//再一一放入各參數
						pstmt.setString(1, request.getParameter("name")); 
						pstmt.setString(2, request.getParameter("img"));
						pstmt.setString(3, request.getParameter("price"));
						pstmt.setString(4, request.getParameter("kind"));					
						pstmt.setString(5, request.getParameter("itemid") );
						pstmt.setString(6, itemid );
						pstmt.execute();//輸入完執行
					}
					
				
					
					if( isModify )
						out.println("<script>alert('修改成功')</script>");
					else
						out.println("<script>alert('新增成功')</script>");
					//response.setHeader("refresh","0;URL=manager.jsp") ;
				
				}
			}
			
		
		else
			response.sendRedirect("increaseItem.jsp?inputError=true") ;

%>