package com.hos.pkg;

import java.sql.*;

public class password {
	Connection con=null;
	public String getCon()
	{
		String pwd="";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","UHMP","banasthali");
			Statement stat = con.createStatement();
			ResultSet rs = stat.executeQuery("SELECT password FROM adminPass where userName='diya'");
			 while(rs.next()){
		          pwd=rs.getString(1);
		       } 
			 con.close(); 
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return pwd;
	}
}
