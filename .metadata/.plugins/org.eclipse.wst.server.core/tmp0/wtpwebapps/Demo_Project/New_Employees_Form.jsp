<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.example.New_Employees_Connection" %>
<%@page import="java.sql.ResultSet"%>
<html>
<head>

<title>New Employee Form</title>
</head>
<body>
<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
%>

<%
	New_Employees_Connection ts = new New_Employees_Connection();
	ResultSet rs = ts.getRS();
%>
<form method="post" action="/Demo_Project/New_Employees_Form_Submit.jsp">
First name:<br> <input type="text" name="first_name">
<br/>
Last name:<br> <input type="text" name="last_name">
<br/>
SSN:<br> <input type="text" name="ssn">
<br/>
Job ID:<br> <select name="job_id">
		  <option value="AD_PRES">President</option>
		  <option value="AD_VP">Administration Vice President</option>
		  <option value="AD_ASST">Administration Assistant</option>
		  <option value="FI_MGR">Finance Manager</option>
		  <option value="FI_ACCOUNT">Accountant</option>
		  <option value="AC_MGR">Accounting Manager</option>
		  <option value="AC_ACCOUNT">Public Accountant</option>
		  <option value="SA_MAN">Sales Manager</option>
		  <option value="SA_REP">Sales Representative</option>
		  <option value="PU_MAN">Purchasing Manager</option>
		  <option value="PU_CLERK">Purchasing Clerk</option>
		  <option value="ST_MAN">Stock Manager</option>
		  <option value="ST_CLERK">Stock Clerk</option>
		  <option value="SH_CLERK">Shipping Clerk</option>
		  <option value="IT_PROG">Programmer</option>
		  <option value="MK_MAN">Marketing Manager</option>
		  <option value="MK_REP">Marketing Representative</option>
		  <option value="HR_REP">Human Resources Representative</option>
		  <option value="PR_REP">Public Relations Representative</option>
 </select>
<br/>
Manager Email: <br> <select name="manager">
			<option value =<%=(String) session.getAttribute("id")%>> <%=(String) session.getAttribute("user")%></option>
			<option value = null> Not Applicable</option>
</select>
<br/>
Date: yyyy-mm-dd <br> <input type="date" name="date_a">
<br/>
<br/>
<input type="submit" value="Submit">
</form>
<button type="button" onclick="location.href= '/Demo_Project/myJsp.jsp';">Main Menu</button>
<br/>
<br/>
<button type="button" onclick="location.href= '/Demo_Project/FormTest1.jsp';">Practice Action</button>
<br/>

</body>
</html>