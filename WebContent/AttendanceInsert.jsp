<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!String year, department, course, date;%>
<%
	
	
	Enumeration paramNames = request.getParameterNames();
while(paramNames.hasMoreElements()) 
{
    String paramName = (String)paramNames.nextElement();
}
	
	String table_name = department + year + course;

	ServletContext sc = getServletContext();
	Connection con = (Connection) sc.getAttribute("MyConn");
	PrintWriter pw = response.getWriter();

	try {

		PreparedStatement ps = con
				.prepareStatement("alter table " + table_name + " add( \"" + date + "\" NUMBER NULL)");
		ps.execute();

	} catch (Exception ex) {
		System.out.println(ex);
		pw.println("<font color=red size=5>Attendance Already Taken for " + date + ".</font>");
		response.setHeader("Refresh", "3;url=TakeAttendance.jsp");
		throw new javax.servlet.jsp.SkipPageException();
	}
%>