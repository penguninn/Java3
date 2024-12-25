package com.daipc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

public class DBConnect {
    static String DRIVER = "com.mysql.cj.jdbc.Driver";  
    static String URL = "jdbc:mysql://localhost:3306/AssJava3"; 
    static String USER = "root";
    static String PASSWORD = "1234";
    
    static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    public static int executeUpdate(String sql, Object... values) throws SQLException {
    	Connection conn = getConnection();
    	PreparedStatement stmt = conn.prepareStatement(sql);
    	for (int i = 0; i < values.length; i++) {
			stmt.setObject(i + 1, values[i]);
		}
    	return stmt.executeUpdate();
    }
    
    public static ResultSet executeQuery(String sql, Object... values) throws SQLException {
    	Connection conn = getConnection();
    	PreparedStatement stmt = conn.prepareStatement(sql);
    	for (int i = 0; i < values.length; i++) {
			stmt.setObject(i + 1, values[i]);
		}
    	return stmt.executeQuery();
    }

    public static void main(String[] args) {
        DBConnect db = new DBConnect();
        try {
			System.out.println(db.getConnection());
		} catch (Exception e) {
			
		}
        
    }
}
