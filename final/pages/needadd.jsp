<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<% 
		String pay = request.getParameter("pay");
		String realname=request.getParameter("real_name"); 
		String phone = request.getParameter("phone");
		String area=request.getParameter("region"); 
		String cc_num = request.getParameter("card_number");
		String vality = request.getParameter("card_date");
		String threenum = request.getParameter("card_lastnumber");
		String address=request.getParameter("address"); 
		
		String uname = (String)session.getAttribute("Got_Mail");
		Vector<String> itemid = new Vector<String>();
		Vector<Integer> num = new Vector<Integer>();
		Vector<Integer> price = new Vector<Integer>();
		Vector<String> itemname = new Vector<String>();
		//取出購物車內容
		int i = 0;
    	sql = "select * From shopcar Where uername = '" + uname + "'";
		ResultSet rs = con.createStatement().executeQuery(sql);
		while(rs.next()) 
		{
			itemname.addElement(rs.getString(6));
			itemid.addElement(rs.getString(1));
			num.addElement(rs.getInt(3));
			price.addElement(rs.getInt(8));	
			i++;
		}
		java.util.Date now=new java.util.Date();
		String day = now.toString();
		sql = "Select * from needcomment";
		rs = con.createStatement().executeQuery(sql);		
		int no = 1; //先給初值
		if( rs.last() ) //如果能執行last 代表有資料
			no += rs.getInt(5); //有資料再取出來+1
	
			for(int j = 0; j < itemid.size(); j++)
			{				
				sql = "insert into needcomment(`itemname`,`itemid`,`username`, `time`, `num`,`price`,`needid`) values(?,?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, itemname.elementAt(j));
				pst.setString(2, itemid.elementAt(j));
				pst.setString(3, uname);
				pst.setString(4, day);
				pst.setInt(5, num.elementAt(j));
				pst.setInt(6, price.elementAt(j));
                pst.setInt(7,no);
				pst.execute();
				no++;
			}
			
			/*session.setAttribute("pay",pay);
			session.setAttribute("real_name",realname);
			session.setAttribute("phone",phone);
			session.setAttribute("region",area);
			session.setAttribute("card_number",cc_num);
			session.setAttribute("card_date",vality);
			session.setAttribute("card_lastnumber",threenum);
			session.setAttribute("address",address);*/
			

	        response.setHeader("refresh","0;URL=shopalldelete.jsp");	
%>