package org.euniceruiz.dbConnection;

import java.sql.*;

public class DatabaseConnection {
	static Connection connection;

	public static Connection getConnection() {
		try {
			String url = "jdbc:postgresql://localhost:5432/";
			String databaseName ="phonebook";
			String username = "postgres";
			String password = "iheartme";

			Class.forName("org.postgresql.Driver");
			try {
				connection = DriverManager.getConnection(url + databaseName, username, password);
			}
			catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);
		}
		
		return connection;
	}


}
