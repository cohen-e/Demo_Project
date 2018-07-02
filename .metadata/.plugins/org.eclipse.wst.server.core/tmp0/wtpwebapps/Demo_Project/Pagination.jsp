<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="oracle.jdbc.driver.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>jQuery paginate example</title>
<link rel="stylesheet" href="css/pagination.css" type="text/css" />
<h1>Pagination Example</h1>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="js/jquery-paginate.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%>

	<table id='myTable'>
		<thead>
			<tr>
				<td>Index</td>
				<td>Value</td>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>


	<script>
		for (var i = 0; i < 40; ++i)
			$('#myTable > tbody').append(
					'<tr><td>' + i + '</td><td>' + i.toString(16)
							+ '</td></tr>');

		// Paginate it
		$('#myTable').paginate({
			limit : 10,
			onSelect : function(obj, page) {
				console.log('Page ' + page + ' selected!');
			}
		});
	</script>
	<br />
	<button type="button"
		onclick="location.href= '/Demo_Project/myJsp.jsp';">Main Menu</button>
</body>
</html>