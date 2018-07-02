<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.New_Employees_Connection" %>

<html>

<head>
	
<title>Employee Info</title>
<link rel="stylesheet" href="css/New_Employees_Design.css" type="text/css"/>
</head>
<body>
	<%
		String print = request.getParameter("yes_to_print");
		if (print != null && print.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.excel");
			response.setHeader("Content-Disposition", "inline; filename=My_Employee_Info.pdf");
		}
	%>
<H1>Employee Table and Information</H1>

<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
%>

 	<%
 		New_Employees_Connection ts = new New_Employees_Connection();
		ResultSet rs = ts.getRS();
     %>

     <TABLE BORDER="1">
            <TR>
                <TH>Employee ID</TH>
                <TH>Name</TH>
                <TH>Email</TH>
                <TH>SSN</TH>
                <TH>Last 4 SSN</TH>
                <TH>Encrypted SSN</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></td>
                <TD> <%= rs.getString(3) %></td>
                <TD> <%= rs.getString(4) %></td>
                <TD> <%= rs.getString(5) %></td>
                <TD> <%= rs.getString(6) %></td>
            </TR>
            <% } %>
        </TABLE>
        <br/>
        <br/>
<button type="button" onclick="location.href= '/Demo_Project/New_Employees_Form.jsp';">New Employees Form</button>
<button type="button" onclick="location.href= '/Demo_Project/myJsp.jsp';">Main Menu</button>
<a href="New_Employees_Table.jsp?yes_to_print=YES"><button>Print Table</button></a>
<br/>
</body>
</html>