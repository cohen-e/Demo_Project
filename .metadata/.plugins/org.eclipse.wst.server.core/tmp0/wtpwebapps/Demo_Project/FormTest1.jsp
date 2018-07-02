<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Example Form Page</title>
</head>
<body>
<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
%>

 <br/>
<%--form action tells which page will get the information --%>
<form action="/Demo_Project/action_page" method="POST">
	Last Name: <input type="text" name="LastName">
	<br/>
	Start Date: <input type="text" name="DateAdded">
	<br/>
	<input type="submit" value="Submit">
	
</form>
</body>
</html>