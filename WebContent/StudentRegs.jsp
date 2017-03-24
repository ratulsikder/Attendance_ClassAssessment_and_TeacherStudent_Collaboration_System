<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Student Regs</title>
</head>
<body>
<%! String name,email,user_name,password;%>


	<% 	 name=request.getParameter("name");
		 //age=Integer.parseInt(request.getParameter("age"));
		email=request.getParameter("email");
		 user_name=request.getParameter("user_name");
		 password=request.getParameter("password");

		try
		{
			//Class.forName("oracle.jdbc.driver.OracleDriver");
           // Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","STUDENT","123");
			ServletContext sc=getServletContext();
			
			Connection con=(Connection)sc.getAttribute("MyConn");
			PrintWriter pw=response.getWriter();
			 // PrintWriter pw=response.getWriter();
		
			 
            PreparedStatement ps=con.prepareStatement("insert into  STUDENT values(?,?,?,?)");
            //System.out.println(name+email+user_name+password);
            ps.setString(1,name);
           // ps.setInt(2,age);
            ps.setString(2,email);
            ps.setString(3,user_name);
            ps.setString(4,password);
            
            ps.execute();
            pw.println("Insert....");
            
            
            
		
		
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		%>
</body>
</html>