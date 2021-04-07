<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>delete</title>
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
           String needid=new String(request.getParameter("needid").getBytes("ISO-8859-1"),"UTF-8"); 
	       sql = "Delete From needcomment Where needid = '" + needid + "'";
          con.createStatement().execute(sql);
         response.setHeader("refresh","0;URL=needcommentitem.jsp");
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
