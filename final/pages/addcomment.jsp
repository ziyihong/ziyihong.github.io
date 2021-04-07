<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
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
		   String uname = (String)session.getAttribute("Got_Mail");
           con.createStatement().execute(sql);
           String needid = request.getParameter("needid");
           String new_content=request.getParameter("content");
           //new_content=newline(new_content);
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
         
           int now_num = 1;
           sql = "Select `forumid` From `forum` Order By `forumid` ";
           ResultSet rs = con.createStatement().executeQuery(sql);
           if( rs.last() )
           {
              now_num =  rs.getInt(1) + 1;
           }

           sql="INSERT forum (`content`,`time`, `name`, `star`,`itemid`,`forumid`) ";
           sql+="VALUE ('" + new_content + "', "; 
           sql+="'"+new_date+"', ";
           sql+="'" + session.getAttribute("Got_Mail") + "', ";
           sql+= "'" + request.getParameter("rating") + "', ";
           sql+= "'" + request.getParameter("itemid") + "', ";
           sql+="'" + now_num + "' )";


//Step 4: 執行 SQL 指令	
        /*   sql="INSERT INTO `forum` values(";
           sql+= "'" + session.getAttribute("Got_Mail") + "',";
           sql+= "'" + new_content + "',";
           sql+= "'" + request.getParameter("rating") + "',";*/

           con.createStatement().execute(sql);
          response.setHeader("refresh","0;URL=needdelete.jsp?needid="+needid+"");
//Step 6: 關閉連線
          
//Step 5: 顯示結果 
          //直接顯示最新的資料
          	
           con.close();
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
