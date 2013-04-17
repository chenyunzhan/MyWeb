package com.snow.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	public static Connection getConn () {
		try {  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection conn = DriverManager.getConnection("jdbc:mysql://172.30.48.30:3306/d8240767edeab4bf5a252e3658b3afa0f", "uFeMPDQILM4Ur", "pfKbDOH1hlEeh");  
            //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/web", "root", "root");  
            if(null != conn) {  
                return conn;  
            } 
        } catch (SQLException e) {  
            e.printStackTrace();  
        } catch (ClassNotFoundException e) {  
            e.printStackTrace();  
        }  
        return null;
	}
	
}
