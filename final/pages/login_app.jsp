<%@ page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 
<%
    //connect mydata.sql
    try
    {
    	Class.forName("com.mysql.jdbc.Driver");   
        try
        {
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");   
            if(con.isClosed())
              	out.println("連線建立失敗");
            else
            {
	            
	            //Get Mail & Password
	            String get_mail=request.getParameter("name");
	            String get_password=request.getParameter("password");
				
				if(get_mail.equals("111") && get_password.equals("111"))
				{
					session.setAttribute("admin", get_password);
					response.setHeader("refresh","0;URL=manager.jsp") ;
					return;
				}
				

	            //Choose & Use myData
	            con.createStatement().execute("USE `member`");
              	//Choose Table admin
              	String sql = "SELECT `mail`, `password` FROM `member` WHERE `mail`='"+get_mail+"'" ;
              	ResultSet tmp =  con.createStatement().executeQuery(sql);
	            
              	//APP
              	Boolean not_have_data=true;	//check tmp have Data or not
              	String sql_password="";
              	while(tmp.next())
              	{
  	            	sql_password=tmp.getString(2);
  	            	if(sql_password.equals(get_password))
	            	  {
  	            		//Write Mail to session
	            		 session.setAttribute("Got_Mail",get_mail);
                   out.print("<script> alert('登入成功')</script>");
	            		 out.print("<meta http-equiv='refresh' content='0;url=../index.jsp'>");
	            	  }
	            	  else
	            	  {
  	            		//Go to ERROR Page 
	            		 session.setAttribute("Golbal_Msg","`password` Error");
	            		 out.print("<meta http-equiv='refresh' content='0;url=wronglogin.jsp'>");

	            	  }
	            	not_have_data=false;
              	}
                if(not_have_data)
                {
                	out.print("<meta http-equiv='refresh' content='0;url=register.jsp'>");
                }

              	//close connect
              	con.close();
            }
        }
        catch (SQLException sExec) 
        {
            out.println("SQL錯誤"+sExec.toString());
        }
    }
    catch (ClassNotFoundException err) 
    {
	    out.println("class錯誤"+err.toString());
    }
%>

