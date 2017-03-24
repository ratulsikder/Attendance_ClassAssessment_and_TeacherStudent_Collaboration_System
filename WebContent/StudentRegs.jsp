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
<%! String id,name,email,dept,sesion,conu,gname,gconu,user_name,password;%>


	<% 	
	    id=request.getParameter("id");
		name=request.getParameter("name");
		 //age=Integer.parseInt(request.getParameter("age"));
		email=request.getParameter("email");
		dept=request.getParameter("dept");
		sesion=request.getParameter("sesion");
		conu=request.getParameter("conu");
		gname=request.getParameter("gname");
		gconu=request.getParameter("gconu");
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
		
			 
            PreparedStatement ps=con.prepareStatement("insert into  STUDENT values(?,?,?,?,?,?,?,?,?,?)");
            //System.out.println(name+email+user_name+password);
            ps.setString(1,id);
            ps.setString(2,name);
           // ps.setInt(2,age);
            ps.setString(3,email);
            ps.setString(4,dept);
            ps.setString(5,sesion);
            ps.setString(6,conu);
            ps.setString(7,gname);
            ps.setString(8,gconu);
            ps.setString(9,user_name);
            ps.setString(10,password);
            
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