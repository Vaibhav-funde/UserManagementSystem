package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "vaibhav", "Vaibhav#202");
        } catch(Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

}
