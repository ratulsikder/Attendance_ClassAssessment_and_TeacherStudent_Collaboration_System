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
<%! String email,pass;%>
<%
 email= request.getParameter("email");
 pass= request.getParameter("pass");

 try {

     ServletContext sc=getServletContext();
     
    Connection con=(Connection)sc.getAttribute("MyConn");
 
	PreparedStatement ps =con.prepareStatement("Select * from TEACHER where email=? and pass=? ");
	
	

    ps.setString(1,email);
    ps.setString(2,pass);
    ps.execute();
    HttpSession hs=request.getSession();
     
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
	   
	   hs.setAttribute("email", email);
	   hs.setAttribute("name", rs.getString("name"));
	   response.setStatus(response.SC_MOVED_TEMPORARILY);
	   response.setHeader("Location", "TeacherPanel.jsp");
	
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