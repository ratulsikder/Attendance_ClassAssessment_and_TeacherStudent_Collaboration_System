<%@page import="java.io.PrintWriter"%>
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
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
<%! String uname,pass;%>
<%
response.setContentType("text/html");
PrintWriter pw=response.getWriter();
 uname= request.getParameter("uname");
 pass= request.getParameter("pass");
 HttpSession hs=request.getSession();
	hs.setAttribute("user", uname);

 try {

     ServletContext sc=getServletContext();
    Connection con=(Connection)sc.getAttribute("MyConn");
     
	PreparedStatement ps =con.prepareStatement("Select * from STUDENT where uname=? and pass=? ");
	
	

    ps.setString(1,uname);
    ps.setString(2,pass);
    ps.execute();
    
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
	 %>
	<%
	
	 pw.println("<font color=green size=5>Registration Successed...</font>");
	  RequestDispatcher rd=request.getRequestDispatcher("/ServletDemo");
	  
	   rd.include(request, response);
	
	
	%>
    
		 
	 <% 
   }
   else
   {	
	   %>
		<%  pw.println("<font color=red size=5>login failed...</font>");
	        	   RequestDispatcher rd=request.getRequestDispatcher("/Studentlog"); 
	        	   rd.include(request, response);
	        	   %>
		
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