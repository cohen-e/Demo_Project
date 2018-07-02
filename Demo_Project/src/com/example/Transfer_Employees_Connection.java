package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Transfer_Employees_Connection {

	private PreparedStatement st;

	protected void connection () throws SQLException, ClassNotFoundException {
		String sql = "select * from coel09.new_employees" +
				" where manager_id = ?";
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.200.10:1521:orcl", "coel09 as sysdba", "angang08");
			st = conn.prepareStatement(sql);			
	}
	
	public PreparedStatement st() throws ClassNotFoundException, SQLException{
		connection();
		return this.st;		
	}
}
