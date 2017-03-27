<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
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
<%! String name,email,una,pwd; %>


	<% 	 name=request.getParameter("name");
		 //age=Integer.parseInt(request.getParameter("age"));
		email=request.getParameter("email");
		 una=request.getParameter("uname");
		 pwd=request.getParameter("pass");

		try
		{
		
			ServletContext sc=getServletContext();
		
			Connection con=(Connection)sc.getAttribute("MyConn");
			PrintWriter pw=response.getWriter();
		
            PreparedStatement ps=con.prepareStatement("insert into  TEACHER values(?,?,?,?)");
            ps.setString(1,name);
           
            ps.setString(2,email);
            ps.setString(3,una);
            ps.setString(4,pwd);
            ps.execute();
         
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
         	 %>
         	 <center><br><Font color=green size=5 > <%=name %> .... Registration is Successful....</Font><br></center>
         	<%@include file="tlog.jsp"  %>
         	
         
         		 
         	 <% 
            }
            else
            {	
         	   %>
         		 <Font color=red size=5 >Ragistration is Failed....</Font>
         		
         		 <%@include file="treg.jsp" %>
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