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
    java.sql.Date new_date =new java.sql.Date(System.currentTimeMillis());
    String uname = (String)session.getAttribute("Got_Mail");
    if(phone !=null  && realname !=null  || address !=null  || threenum !=null  || vality !=null  || cc_num !=null  || pay !=null  ) //三選一
	{		
		Vector<String> itemid = new Vector<String>();
		Vector<Integer> num = new Vector<Integer>();
		Vector<Integer> price = new Vector<Integer>();
		Vector<String> itemname = new Vector<String>();
    	sql = "select * From shopcar Where uername = '" + uname + "'";
		ResultSet rs = con.createStatement().executeQuery(sql);
		//取出購物車內容
		int i = 0;
		while(rs.next()) 
		{
			itemname.addElement(rs.getString(6));
			itemid.addElement(rs.getString(1));
			num.addElement(rs.getInt(3));
			price.addElement(rs.getInt(8));	
			i++;
		}
		
		if(i == 0)//避免空的購物車也能購買
		{
			out.print("<script>alert('購物車為空')</script>");
			response.setHeader("refresh","0;URL=shopcar.jsp") ;
			return;
		}		
			for(int j = 0; j < itemid.size(); j++)
			{			
				sql = "Select store From item Where itemid = '" + itemid.elementAt(j) + "'" ; //以商品名稱取出對應的庫存數量
				rs = con.createStatement().executeQuery(sql);
				rs.next();
				int storee = rs.getInt(1);
				int newstore = storee - num.elementAt(j);
				
				if(newstore < 0)//數量不足 立刻停止
				{
					out.print("<script>alert('數量不足!!')</script>");
					response.setHeader("refresh","0;URL=shopcar.jsp") ;
					return;
				}					
				
				sql = "Update item Set store = ? Where itemid = ?"; //更新庫存數量
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setInt(1, newstore);
				pst.setString(2, itemid.elementAt(j));
				pst.execute();
			}
		
		
		
		//刪除購物車內容
		//sql = "Delete From shopcar Where uername = '" + uname + "'";
		//con.createStatement().execute(sql);
		
		
		//將資料放入record
		
		java.util.Date now=new java.util.Date();
		String day = now.toString();
		sql = "Select * from record";
		rs = con.createStatement().executeQuery(sql);
		int no = 1; //先給初值
		if( rs.last() ) //如果能執行last 代表有資料
			no += rs.getInt(5); //有資料再取出來+1
			
		//設定訂單編號
		if(pay.equals("onlinepay"))
		{
			for(int j = 0; j < itemid.size(); j++)
			{				
				sql = "insert into record(`itemname`,`itemid`,`username`, `time`, `num`,`realname`,`address`,`phone`,`area`,`cc_num`,`vality`,`threenum`,`money`,`recordid`) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, itemname.elementAt(j));
				pst.setString(2, itemid.elementAt(j));
				pst.setString(3, uname);
				pst.setString(4, day);
				pst.setInt(5, num.elementAt(j));
				pst.setString(6, realname);
                pst.setString(7,address);
                pst.setString(8, phone);
				pst.setString(9, area);
				pst.setString(10,cc_num);
				pst.setString(11,vality);
				pst.setString(12,threenum);
				pst.setInt(13,price.elementAt(j));
                pst.setInt(14,no);
				pst.execute();
				no++;
			}
		}
		else
		{
			if(pay.equals("payment"))
			for(int j = 0; j < itemid.size(); j++)
			{				
				sql = "insert into record(`itemname`,`itemid`,`username`, `time`, `num`,`realname`,`address`,`phone`,`area`,`money`,`recordid`) values(?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, itemname.elementAt(j));
				pst.setString(2, itemid.elementAt(j));
				pst.setString(3, uname);
				pst.setString(4, day);
				pst.setInt(5, num.elementAt(j));
				pst.setString(6, realname);
                pst.setString(7, address);
                pst.setString(8, phone);
				pst.setString(9, area);
				pst.setInt(10, price.elementAt(j));
                pst.setInt(11,no);
				pst.execute();
				no++;
			}
		}
		response.setHeader("refresh","0;URL=needadd.jsp") ;	
		out.println("<script>alert('購買成功!!')</script>");

			
	}
	else	
	{
		out.print("<script>alert('請輸入付款資料!!')</script>");
		response.setHeader("refresh","0;URL=shopcar.jsp") ;		
    }
	
%>