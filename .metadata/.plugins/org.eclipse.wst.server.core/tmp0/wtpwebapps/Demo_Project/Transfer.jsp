<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.example.Transfer_Employees_Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Employee</title>
</head>
<body>
<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
%>

	<%
	try {
		Transfer_Employees_Connection st = new Transfer_Employees_Connection();
		PreparedStatement statement = st.st();
		statement.setInt(1, Integer.parseInt(request.getParameter("id"))); 				
		int rowsInserted = statement.executeUpdate();
				
		if (rowsInserted > 0)
			out.println("A new user was inserted successfully!");
				
	} catch (Exception e) {
		
			out.println(e);
	}
		%>
</body>

</body>
</html>