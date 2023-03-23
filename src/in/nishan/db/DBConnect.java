package in.nishan.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection conn;
	
	public static Connection getConn()
	{
		
		String url="jdbc:mysql:///ebook-app";
		String user="root";
		String password="qwerty1A";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
}
