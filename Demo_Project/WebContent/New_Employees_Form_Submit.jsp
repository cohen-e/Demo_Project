<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.example.New_Employees_Form_Submit_Connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>

<html>
<head>
<title>RESULTS</title>
</head>
<body>
<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
%>

	<%
	try {
		New_Employees_Form_Submit_Connect st = new New_Employees_Form_Submit_Connect();
		PreparedStatement statement = st.st();
		statement.setInt(1, 6);
		statement.setInt(2, Integer.parseInt(request.getParameter("ssn")));
		statement.setString(3, request.getParameter("job_id"));
		statement.setInt(4, Integer.parseInt(request.getParameter("manager"))); //try to set as null
		statement.setDate(5, java.sql.Date.valueOf(request.getParameter("date_a")));
		statement.setString(6, request.getParameter("first_name"));
		statement.setString(7, request.getParameter("last_name"));
				
		int rowsInserted = statement.executeUpdate();
				
		if (rowsInserted > 0)
			out.println("A new user was inserted successfully!");
				
	} catch (Exception e) {
		
			out.println(e);
	}
		%>
</body>
<br/>
<br/>
<button type="button"
	onclick="location.href= '/Demo_Project/New_Employees_Form.jsp';">Back</button>
<button type="button"
	onclick="location.href= '/Demo_Project/New_Employees_Table.jsp';">New Employees Table</button>
<button type="button"
	onclick="location.href= '/Demo_Project/myJsp.jsp';">Main Menu</button>
</html>