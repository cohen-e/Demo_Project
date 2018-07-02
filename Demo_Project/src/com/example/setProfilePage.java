package com.example;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class setProfilePage {
	
	public static String id;

	public static void start(String us, PrintWriter out) {
		getConn(us,out);// method to use for jsp
	}

	protected static void getConn(String us, PrintWriter out) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.200.10:1521:orcl",
					"coel09 as sysdba", "angang08");
			//shows user information
			PreparedStatement st = connection
					.prepareStatement("Select * from coel09.new_employees where email=?");
			st.setString(1, us);
			
			//lists all users that login user manages
			PreparedStatement sst = connection
					.prepareStatement("Select * from coel09.new_employees where mgr= "
							+ "(select empno from coel09.new_employees where email=?) order by empno");
			sst.setString(1, us);
			ResultSet rss = st.executeQuery();
			ResultSet rsss = sst.executeQuery();
			setPage(out);
			setPersonalInfoTable(out, rss);
			setManagedTable(out, rsss);	
			mainMenu(out);
		}
		catch (Exception e) {
			
		}
	}
	
	private static void mainMenu(PrintWriter out) {
		out.print("</body>");
		out.print("<button type=\"button\" onclick=\"location.href="
				+ " '/Demo_Project/myJsp.jsp';\">Main Menu</button>");
		out.print("</html>");
		
	}

	private static void setManagedTable(PrintWriter out, ResultSet rsss) throws SQLException {
		String s = "Managed Employees";
		setHeader(s, out);
		boolean button = false;
			while(rsss.next()) 
			{
				button = true;
				out.print("<tr>");
				for(int i=1; i<=8; i++)
				{
					out.print("<td>");
					out.println(rsss.getString(i));
					out.print("</td>");
				}
				out.print("</tr>");
			}
		setFooter(out);
		if(button)
			out.println("<button type=\"button\" onclick=\"location.href="
					+ " '/Demo_Project/New_Employees_Form.jsp';\">New Employee Form</button>");
	}

	private static void setFooter(PrintWriter out) {
		out.println("</tbody>");
		out.print("</table>");
		out.print("<br/><br/>");
	}

	private static void setHeader(String s, PrintWriter out) {
		out.println(s);
		out.print("<table>");
		out.print("<thead>");
		out.print("<tr><TD>Employee ID</TD>");
		out.print("<TD>SSN</TD>");
		out.print("<TD>Job ID</TD>");
		out.print("<TD>Manager ID</TD>");
		out.print("<TD>Hire Date</TD>");
		out.print("<TD>Email</TD>");
		out.print("<TD>First Name</TD>");
		out.print("<TD>Last Name</TD></tr>");
		out.println("</thead>");
		out.println("<tbody>");
		
	}

	private static void setPersonalInfoTable(PrintWriter out, ResultSet rss) throws SQLException {
		String s ="My Information";
		setHeader(s, out);	
		
		while(rss.next())
		{
			id = rss.getString(1);
			out.print("<tr>");
			for(int i=1; i<=8; i++)
			{
				out.print("<td>");
				out.print(rss.getString(i));
				out.print("</td>");
			}
			out.print("</tr>");
		}
		setFooter(out);
	}

	private static void setPage(PrintWriter out) {
		out.println("<html>");
		out.println("<head>");
		out.println("WELCOME\n");
		out.println("<link rel=\"stylesheet\" href=\"css/validation.css\" type=\"text/css\"/>");
		out.println("</head>");
		out.println("<br/><br/><body>");
	}
}
