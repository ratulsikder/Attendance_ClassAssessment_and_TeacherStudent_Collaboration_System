<%-- Begin Project Login Authenticator --%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%
	HttpSession hs = request.getSession();
	String email = (String) hs.getAttribute("email");
	String name = (String) hs.getAttribute("name");

	if (email == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<font color=red size=5>You are not logged in.</font>");
		response.setHeader("Refresh", "3;url=index.jsp");
		throw new javax.servlet.jsp.SkipPageException();

	}
	;
%>
<%-- End Project Login Authenticator --%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Panel</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="TeacherPanelStyle.css" type="text/css" />

</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Teacher </a>
		</div>
		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">


			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user"></i> <%=name%> <b
					class="caret"></b></a>
				<ul class="dropdown-menu">

					<li class="divider"></li>
					<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
							Log Out</a></li>
				</ul></li>
		</ul>
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="TeacherPanel.jsp"><i
						class="fa fa-fw fa-dashboard"></i> Dashboard</a></li>
				<li class="active"><a href="TakeAttendance.jsp"><i
						class="fa fa-fw fa-bar-chart-o"></i>Take Attendance</a></li>
				<li><a href="tables.html"><i class="fa fa-fw fa-table"></i>
						Tables</a></li>
				<li><a href="forms.html"><i class="fa fa-fw fa-edit"></i>
						Forms</a></li>
				<li><a href="bootstrap-elements.html"><i
						class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a></li>
				<li><a href="bootstrap-grid.html"><i
						class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a></li>
				<li><a href="javascript:;" data-toggle="collapse"
					data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i>
						Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="demo" class="collapse">
						<li><a href="#">Dropdown Item</a></li>
						<li><a href="#">Dropdown Item</a></li>
					</ul></li>
				<li><a href="blank-page.html"><i class="fa fa-fw fa-file"></i>
						Blank Page</a></li>
				<li><a href="index-rtl.html"><i
						class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">


			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Course request details: <small></small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				<%
					ServletContext sc = getServletContext();
					Connection con = (Connection) sc.getAttribute("MyConn");
					PrintWriter pw = response.getWriter();
					
					Date date = new Date();
				    String DATE_FORMAT = "yyyy-MM-dd";
				    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
				%>
				<div class="row">
					<div class="container" style="max-width: 30%">
						<form id="contact" action="AttendanceFetcher.jsp" method="post">
							<h3>Select the course</h3>

							<fieldset>
								Department: <select name="department" required autofocus
									style="float: right">
									<%
										try {
											//System.out.println("SELECT DISTINCT ON (department) department from course WHERE teacher_id = '"+email+"'");
											PreparedStatement ps = con.prepareStatement(
													"SELECT DISTINCT (department) department from course WHERE teacher_id = '" + email + "'");
											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
									%>
									<option value="<%=rs.getString("department")%>"><%=rs.getString("department")%></option>

									<%
										}

										} catch (Exception ex) {
											System.out.println(ex);
										}
									%>
								</select>
							</fieldset>
							<fieldset>
								Year: <select name="year" required style="float: right">
									<%
										try {
											//System.out.println("SELECT DISTINCT ON (department) department from course WHERE teacher_id = '"+email+"'");
											PreparedStatement ps = con.prepareStatement(
													"SELECT DISTINCT (course_year) course_year from course WHERE teacher_id = '" + email + "'");
											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
									%>
									<option value="<%=rs.getString("course_year")%>"><%=rs.getString("course_year")%></option>

									<%
										}

										} catch (Exception ex) {
											System.out.println(ex);
										}
									%>

								</select>
							</fieldset>
							<fieldset>
								Course: <select name="course" required style="float: right">
									<%
										try {
											//System.out.println("SELECT DISTINCT ON (department) department from course WHERE teacher_id = '"+email+"'");
											PreparedStatement ps = con.prepareStatement(
													"SELECT DISTINCT (course_code) course_code from course WHERE teacher_id = '" + email + "'");
											ResultSet rs = ps.executeQuery();

											while (rs.next()) {
									%>
									<option value="<%=rs.getString("course_code")%>"><%=rs.getString("course_code")%></option>

									<%
										}

										} catch (Exception ex) {
											System.out.println(ex);
										}
									%>
								</select>
							</fieldset>
							<fieldset>
								Date:<input style="float: right" type="date" value=<%=(String)sdf.format(date) %> tabindex="3" name="date" required>
							</fieldset>
							

							<fieldset>
								<button name="submit" type="submit" id="contact-submit"
									data-submit="...Sending">Submit</button>
							</fieldset>

						</form>
					</div>
				</div>


				<!-- /.row -->


				<!-- /.row -->


				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>





</body>