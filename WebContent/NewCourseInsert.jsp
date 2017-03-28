<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
	ServletContext sc = getServletContext();
	Connection con = (Connection) sc.getAttribute("MyConn");
	PrintWriter pw = response.getWriter();
	
	String department_name = request.getParameter("department_name");
	String course_code = request.getParameter("course_code");
	String course_name = request.getParameter("course_name");
	String course_year = request.getParameter("course_year");
	String table_name = department_name+course_year+course_code;
	
	HttpSession hs = request.getSession();
	String email = (String)hs.getAttribute("email");
	
	try {

		PreparedStatement ps=con.prepareStatement("insert into  COURSE values(?,?,?,?,?,?)");
		
        ps.setString(1,course_code); 
        ps.setString(2,course_name);
        ps.setString(3,course_year);
        ps.setString(4,department_name);
        
        ps.setString(5,email);
        ps.setString(6,table_name);
        
        ps.execute();
      
        ps2.execute();
        
        pw.println("<font color=green size=5>Operation Successfull.</font>");
        response.setHeader("Refresh", "3;url=TeacherPanel.jsp");

	} catch (Exception ex) {
		System.out.println(ex);
		pw.println("<font color=red size=5>Operation failed. Course already registered.</font>");
		response.setHeader("Refresh", "4;url=TeacherPanel.jsp");
	}
%>