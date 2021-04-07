<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<html>
<head>
<title>add</title>
</head>
<body>
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
         String numm=new String(request.getParameter("num").getBytes("ISO-8859-1"),"UTF-8"); 
         String shopidd=new String(request.getParameter("shopid").getBytes("ISO-8859-1"),"UTF-8"); 
         String fun =new String(request.getParameter("fun").getBytes("ISO-8859-1"),"UTF-8"); 
         sql="use `member`";
         con.createStatement().execute(sql); 
         sql = "Select `shopid` From `shopcar` Order By `shopid` ";
         int nummm = Integer.parseInt(numm);
         if(fun.equals("-"))
         {
            nummm--;
         }
         else
         nummm++;
         ResultSet rs = con.createStatement().executeQuery(sql);
         Statement updatestmt=con.createStatement();
         sql = "UPDATE shopcar SET num = '"+nummm+"' WHERE shopid = '"+shopidd+"' ";
         con.createStatement().execute(sql);
         out.print("<meta http-equiv='refresh' content='0;url=shopcar.jsp'>");
           con.createStatement().execute(sql);
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
