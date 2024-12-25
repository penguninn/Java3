package bai2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost;database=HRM;encrypt=true;trustServerCertificate=true;";
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

	public static void main(String[] args) {
		try {
			String sql = "select * from Departments";
			ResultSet resultSet = Jdbc.executeQuery(sql);
			while (resultSet.next()) {
				String id = resultSet.getString(1);
				String name = resultSet.getString(2);
				String desc = resultSet.getString(3);

				System.out.println(id + " " + name + " " + desc);
			}
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			String sql = "UPDATE Departments SET name = '?', Description = '?' where id = 'D11'";
			int rows = Jdbc.executeUpdate(sql);
			System.out.println(rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
