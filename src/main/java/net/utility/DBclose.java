package net.utility;

import java.sql.*;

public class DBclose {
	// 오라클DB 연결 자원 반납
	public static void close(Connection con) {
		try {
			if(con!=null) {con.close();}
		} catch(Exception e) {}
	}
	
	public static void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) {pstmt.close();}
		} catch(Exception e) {}
		try {
			if(con!=null) {con.close();}
		} catch(Exception e) {}
	}
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) {rs.close();}
		}catch(Exception e) {}
		try {
			if(pstmt!=null) {pstmt.close();}
		} catch(Exception e) {}
		try {
			if(con!=null) {con.close();}
		} catch(Exception e) {}
	}

}
