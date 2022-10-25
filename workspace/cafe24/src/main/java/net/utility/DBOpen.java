package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	
	
	// 마리아 DB 연결
	public Connection getConnection() {
		
			/* 카페24 MySQL DB연결 정보 */
			String url      = "jdbc:mysql://localhost/nonchrono";
			String user     = "nonchrono";
			String password = "cjsdn5984!!";
			String driver   = "org.gjt.mm.mysql.Driver"; 
			
			Connection con = null;
			
		try {	
				
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		 
		} catch (Exception e) {
		  System.out.println("Maria DB 연결 실패: "+e);
		} // getConnection() end
		   
		return con; 
	} // getConnection() end
	
	
} // class end
