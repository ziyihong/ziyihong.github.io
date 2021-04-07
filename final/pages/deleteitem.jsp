<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>刪除購物車內容</title>
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
           String shopid=new String(request.getParameter("shopid").getBytes("ISO-8859-1"),"UTF-8"); 
         String number= request.getParameter("shopid");
	       sql = "Delete From shopcar Where shopid = '" + shopid + "'";
          con.createStatement().execute(sql);
	response.setHeader("refresh","0;URL=shopcar.jsp") ;
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           
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
