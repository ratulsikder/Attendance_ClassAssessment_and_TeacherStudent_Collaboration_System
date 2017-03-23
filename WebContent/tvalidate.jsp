<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String uname,pass;%>
<%
 uname= request.getParameter("uname");
 pass= request.getParameter("pass");

 try {

     ServletContext sc=getServletContext();
     
    Connection con=(Connection)sc.getAttribute("MyConn");
 
	PreparedStatement ps =con.prepareStatement("Select * from TEACHER where uname=? and pass=? ");
	
	

    ps.setString(1,uname);
    ps.setString(2,pass);
    ps.execute();
     
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
	 %>
	 <Font color=green size=5 > <%=uname %> .... log in Successful....</Font><br>

	
	  <a href="index.jsp"> log out</a> 
		 
	 <% 
   }
   else
   {	
	   %>
		 <Font color=red size=5 > Failed....</Font>
		
		 <%   

   }
    
    


}
catch(Exception ex)
{
	System.out.println(ex);
}


%>
</body>
</html>