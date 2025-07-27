package com.r3sys.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.*;
public class ConnectDB {
	static Connection con = null;
	public static Connection getConnect()  
	{
		try 
  	  {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/safetydb","root", "");
			System.out.println("Connection Established..."+con);
			

		} 
  	  catch (Exception e) 
  	  {
			e.printStackTrace();
			System.err.println("Failed to connect...!!!");
		}
  	  return con;
    }
	

}


