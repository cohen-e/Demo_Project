package com.example;

import java.sql.*;

public class Employees_Connection {

private ResultSet rs;
	private int total;
	
	protected void connection () throws SQLException, ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection(
	 			"jdbc:oracle:thin:@192.168.200.10:1521:orcl", "coel09 as sysdba", "angang08"); 
	 	 	Statement statement = connection.createStatement();
	 	 	rs = statement.executeQuery("select * from coel09.employees");
			
	}
	
	public ResultSet getRS () throws ClassNotFoundException, SQLException {
		connection();
		return this.rs;
		
	}
	public int total() throws ClassNotFoundException, SQLException {
		connection();
		while(this.rs.next()) {
			total = total +1;
		}
		return this.total;
		
	}
}
