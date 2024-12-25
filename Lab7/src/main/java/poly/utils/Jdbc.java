package poly.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost;database=PTPM_FINALLY_SOF203;encrypt=true;trustServerCertificate=true;";
	static String username = "sa";
	static String password = "123";
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(dburl, username, password);
	}

	public static int executeUpdate(String sql) throws SQLException {
		Connection connection = getConnection();
		Statement statement = connection.createStatement();
		return statement.executeUpdate(sql);
	}

	public static ResultSet executeQuery(String sql) throws SQLException {
		Connection connection = getConnection();
		Statement statement = connection.createStatement();
		return statement.executeQuery(sql);
	}

	public static int executeUpdate(String sql, Object... values) throws SQLException {
		Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		for (int i = 0; i < values.length; i++) {
			statement.setObject(i + 1, values[i]);
		}
		return statement.executeUpdate();
	}

	public static ResultSet executeQuery(String sql, Object... values) throws SQLException {
		Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		for (int i = 0; i < values.length; i++) {
			statement.setObject(i + 1, values[i]);
		}
		return statement.executeQuery();
	}

	public static void main(String[] args) {
		try {
			System.out.println(getConnection());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
