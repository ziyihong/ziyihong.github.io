<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>additembuy</title>
</head>
<body>

<%!
String newline(String str)
{
   int index=0;
   while((index=str.indexOf("\n"))!=-1)
   str=str.substring(0,index)+"<br>"+str.substring(index+1);
   return(str);
}
%>
<%
String uname = (String)session.getAttribute("Got_Mail");
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {

//Step 3: 選擇資料庫   
           sql="use `member`";
		 
           con.createStatement().execute(sql);
           String itemid = request.getParameter("itemid");
           String name = request.getParameter("name");
           String price = request.getParameter("price");
           String num22 = request.getParameter("num");
           String image = request.getParameter("image");
           //new_content=newline(new_content);
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
           int now_num = 1;
           sql ="Select `shopid` From `shopcar` Order By `shopid`";
           ResultSet rs = con.createStatement().executeQuery(sql);
           if( rs.last() )
           {
              now_num =  rs.getInt(1) + 1;
           }
           int pay=0;
           int num2 = Integer.parseInt(num22);
           int price1 = Integer.parseInt(price);
           pay=num2*price1;
           sql="INSERT `shopcar` (`itemid`,`uername`,`time`,`num`,name,image,`price`,`shopid`) ";
           sql+="VALUE ('" + itemid + "', "; 
           sql+="'" + uname + "', ";
           sql+= "'" + new_date + "', ";
           sql+= "'" + num22 + "', ";
           sql+= "'" + name + "', ";
           sql+= "'" + image + "', ";
           sql+= "'" + price + "', ";
           sql+="'" + now_num + "' )";
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          out.print("<meta http-equiv='refresh' content='0;url=shopcar.jsp'>");
      %>
      <form action="shopcar.jsp">
            <input type='hidden' name='itemid' value='"+itemid+"'>
            <input type='hidden' name='price' value='"+price+"'>
            <input type='hidden' name='name' value='"+name+"'>
            <input type='hidden' name='image' value='"+image+"'>
         </form>
      <%
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
