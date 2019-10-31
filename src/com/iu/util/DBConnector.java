package com.iu.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		String user = "user12";
		String password = "user12";
		String url = "jdbc:oracle:thin:@211.238.142.24:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
}
