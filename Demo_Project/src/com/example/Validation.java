package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.setProfilePage;

public class Validation extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 String us = request.getParameter("username");
		 String ps = request.getParameter("password");
		 PrintWriter out = response.getWriter();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.200.10:1521:orcl",
					"coel09 as sysdba", "angang08");
			
			//login validation
			PreparedStatement pst = connection
					.prepareStatement("Select email, last_4_ssn from "
							+ "coel09.new_employee_view where email=? and last_4_ssn=?");
			//PreparedStatement pst = connection
				//	.prepareStatement("Select email from "
				//			+ "coel09.new_employee_view where email=?");
			pst.setString(1, us);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				request.getRequestDispatcher("link.html").include(request, response); 
				HttpSession session =request.getSession(false);
				session.setAttribute("user", us );// sets username so that we can retrieve it some other place
				setProfilePage.getConn(us, out);
				session.setAttribute("id", setProfilePage.id);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				out.println("<font color=red>Either user name or password is wrong.</font><br/>");
				rd.include(request, response);
			}
		
		} catch (Exception e) {
			out.println(e);
		}
	}
	
}
