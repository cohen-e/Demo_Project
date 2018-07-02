<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.Employees_Connection"%>

<html height>

<head>
<title>Employees Table</title>
 <link rel="stylesheet" href="css/database1.css" type="text/css"/> 

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="js/jquery-paginate.js"></script>
</head>
	<%
	if (session.getAttribute("user") == null){
		response.sendRedirect("Login.jsp");
	}
	%>
	
<body>
	<%
		String print = request.getParameter("yes_to_print");
		if (print != null && print.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename=Employee_Info.xls");
		}
	%>
	<%
	if (print == null) {
	%>
	<H1>Employee Table and Information</H1>
	<%
	}
	%>
	<%
		Employees_Connection ts = new Employees_Connection();
		ResultSet rs = ts.getRS();
	%>
	
	<table id='myTable' border="1" align="center" width="100%">
		<thead>
			<tr>
				<TH bgcolor="lightblue">Employee ID</TH>
				<TH bgcolor="lightblue">First Name</TH>
				<TH bgcolor="lightblue">Last Name</TH>
				<TH bgcolor="lightblue">Email</TH>
				<TH bgcolor="lightblue">Phone Number</TH>
				<TH bgcolor="lightblue">Hire Date</TH>
				<TH bgcolor="lightblue">Job ID</TH>
				<TH bgcolor="lightblue">Salary</TH>
				<TH bgcolor="lightblue">Commission Pct</TH>
				<TH bgcolor="lightblue">Manager ID</TH>
				<TH bgcolor="lightblue">Department ID</TH>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
					while (rs.next()) {
				%>
				<TD bgcolor="lightgreen"><%=rs.getString(1)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(2)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(3)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(4)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(5)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(6)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(7)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(8)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(9)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(10)%></td>
				<TD bgcolor="lightgreen"><%=rs.getString(11)%></td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>

	<script>
		$('#myTable').paginate({
			limit : 10,
			onSelect : function(obj, page) {
				console.log('Page ' + page + ' selected!');
			}
		});
	</script>
	
	<br />
	<%
	if (print == null) {
	%>
	<button type="button" onclick="location.href= '/Demo_Project/myJsp.jsp';">Main Menu</button>
	<button type="button" onclick="location.href= '/Demo_Project/TestDatabase';">Java	Class Database</button>
	<button type="button" onclick="window.print();">Print Current Page</button>
	<a href="Database.jsp?yes_to_print=YES"><button>Print Table</button></a>
	<br></br>
	<p>This page incorporates print. The Print Table button prints the entire table in Excel 
		without the buttons and header.</p>
	<%
	}
	%>
</body>
</html>