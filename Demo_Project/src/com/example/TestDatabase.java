package com.example;

import com.example.Employees_Connection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestDatabase extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
	}

	public void testMethod(HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		Employees_Connection conn = new Employees_Connection();
		int total = conn.total();
		ResultSet rs = conn.getRS();
		String[][] table = new String[total + 1][11]; //plus one for the headings
		int nextRow = 0;
		createTable(rs, table, nextRow, response);
	}

	public void createTable(ResultSet rs, String[][] table, int nextRow, HttpServletResponse response)
			throws SQLException, IOException {
		//add the headings
		//format table in future
		table[nextRow][0] = "Employee ID";
		table[nextRow][1] = "First Name";
		table[nextRow][2] = "Last Name";
		table[nextRow][3] = "Email";
		table[nextRow][4] = "Phone Number";
		table[nextRow][5] = "Hire Date";
		table[nextRow][6] = "Job ID";
		table[nextRow][7] = "Salary";
		table[nextRow][8] = "Commission Pct";
		table[nextRow][9] = "Manager ID";
		table[nextRow][10] = "Department ID";
		nextRow = nextRow + 1; 
		
		while(rs.next()){
			table[nextRow][0] = rs.getString(1);
			table[nextRow][1] = rs.getString(2);
			table[nextRow][2] = rs.getString(3);
			table[nextRow][3] = rs.getString(4);
			table[nextRow][4] = rs.getString(5);
			table[nextRow][5] = rs.getString(6);
			table[nextRow][6] = rs.getString(7);
			table[nextRow][7] = rs.getString(8);
			table[nextRow][8] = rs.getString(9);
			table[nextRow][9] = rs.getString(10);
			table[nextRow][10] = rs.getString(11);
			nextRow = nextRow + 1; 
		}
		
		printTable(table, response);
	}

	private void printTable(String[][] table, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<h1>");
		out.print("This page displays the data table using a servlet/java class");
		out.print("</h1>");
		out.print("<body>");
		out.print("<table>");
			for(int i = 0; i< table.length; i++)
				{
				out.print("<tr><td>"+ table[i][0] + "</td>");
				
				out.print("<td>" + table[i][1]+ "</td>");
				
				out.print("<td>" + table[i][2]+ "</td>");
				
				out.print("<td>" + table[i][3]+ "</td>");
				
				out.print("<td>" + table[i][4] + "</td>");
				
				out.print("<td>" + table[i][5] + "</td>");
		
				out.print("<td>" + table[i][6]+ "</td>");
			
				out.print("<td>" + table[i][7]+ "</td>");
				
				out.print("<td>" + table[i][8]+ "</td>");
				
				out.print("<td>" + table[i][9]+ "</td>");
				
				out.print("<td>" + table[i][10]+ "</td></tr>");
				
				}
			out.print("</table>");
			out.print("<button type= \"button\" onclick= \"location.href= '/Demo_Project/myJsp.jsp\';\">" + "Main Menu</button>" );
			out.print("</body>");
			out.print("</html>");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	
	//keep as doGet cause we we retrieving the data straight, not getting it from a form. 
			 {	
		if (request.getSession().getAttribute("user") == null)
			response.sendRedirect("Login.jsp");

			try {
				testMethod(response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
