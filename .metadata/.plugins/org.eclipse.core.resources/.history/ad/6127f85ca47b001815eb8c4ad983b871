<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.example.setProfilePage" %>
<%--@ include file="link.html" --%>  
<hr/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
				setProfilePage p = new setProfilePage();
				p.start(name, response.getWriter());
				
			} else {
				response.sendRedirect("Login.jsp");
			}
		}
	%>
	</br>
	</br>
	<form action="/Demo_Project/Logout" method="POST">
		<input type="submit" value="Logout">
	</form>
</body>
</html>