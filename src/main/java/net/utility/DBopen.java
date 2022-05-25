package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBopen {
	// 오라클DB 연결 메소드
	public Connection getConnection() {
		Connection con=null;
		try {
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="system";
			String password="1234";
			String driver="oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			//out.println("오라클DB 서버 연결 성공");
			
		}catch (Exception e) {
			System.out.println("오라클DB 연결 실패 : " + e);
		}
		
		return con;
	}
}
