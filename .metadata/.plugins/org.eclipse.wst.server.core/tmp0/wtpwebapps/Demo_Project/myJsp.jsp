
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="link.html" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JSP PAGE</title>
<link rel="stylesheet" href="css/myJsp.css" type="text/css"/>
</head>
<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
%>

<body>
<h1> Database Web Application</h1>
<br/>
<jsp:useBean id="date" class="java.util.Date" />
	The date is <fmt:formatDate value="${date}" type="both" /> 
</body>
<br/>
<br/>
<button type="button" onclick="location.href='/Demo_Project/Database.jsp';">Old Employees Table</button>
<br/>
<br/>
<button type="button" onclick="location.href='/Demo_Project/New_Employees_Table.jsp';">New Employees Table</button>
<br/>
<br/>
<button type="button" onclick="location.href='/Demo_Project/test.jsp';">Employees Table With Tomcat Conn</button>
<br/>
<br/>
<button type="button" onclick="location.href='/Demo_Project/Pagination.jsp';">Pagination Example</button>
<br/>
<button type="button" onclick="location.href='/Demo_Project/Transfer.jsp';">Transfer Employee</button>
</html>