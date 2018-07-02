package com.example;
/* TODO
 * The output does not print correctly in Google Chrome Browser
 * Fix Later 
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class action_page
 */
public class action_page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public action_page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * used for small amount of data
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * Used for large amounts of sensitive data
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//make sure to add which section the printed items need to go, or they will print everything as regular print statements. 
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.print("Served at: " + request.getContextPath() + "<br/>");
		
		out.print("Thank You " + request.getParameter("LastName") + ", Your information has been processed." + "<br/>");

		out.print("<button type= \"button\" onclick= \"location.href= \'/Demo_Project/myJsp.jsp\';\">" + "Main Menu</button>" );
		out.println("</html>");
	}

}
