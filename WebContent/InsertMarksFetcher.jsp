<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%
	HttpSession hs = request.getSession();
	String email = (String) hs.getAttribute("temail");
	String name = (String) hs.getAttribute("tname");

	if (email == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<font color=red size=5>You are not logged in.</font>");
		response.setHeader("Refresh", "3;url=index.jsp");
		throw new javax.servlet.jsp.SkipPageException();

	}
	;
%>

<%!String year, department, course, type;%>
<%
	department = request.getParameter("department");
	year = request.getParameter("year");
	course = request.getParameter("course");
	type = request.getParameter("type");

	String table_name = department + year + course;
	//System.out.println("SELECT student_id FROM "+table_name+" WHERE "+type+"=null");

	ServletContext sc = getServletContext();
	Connection con = (Connection) sc.getAttribute("MyConn");
	PrintWriter pw = response.getWriter();

	//Checking table existence
	try {

		PreparedStatement ps = con.prepareStatement("SELECT student_id FROM \""+table_name+"\" WHERE "+type+" IS NULL");
		ps.execute();

	} catch (SQLException ex) {
		System.out.println(ex);
		pw.println("<font color=red size=5>Course: " + course + ", Departmant: " + department + ", Year: "
				+ year
				+ " is not found.</font><br><font color=green size=5> Please start the course first.</font>");
		response.setHeader("Refresh", "7;url=TeacherPanel.jsp");
		throw new javax.servlet.jsp.SkipPageException();
	}
	%>