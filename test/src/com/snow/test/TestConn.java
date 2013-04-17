package com.snow.test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
 
public class TestConn {
	public static void main(String[] args) throws Exception {
		String str = "";
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:10100/d8240767edeab4bf5a252e3658b3afa0f" +
		  "?useUnicode=true&characterEncoding=gb2312&autoReconnect=true&failOverReadOnly=false";
		Connection con= DriverManager.getConnection(url,"uPpt5YDfhDEoM","pYrbgh5peDFYv");
		System.out.println(con);
		Statement smt=con.createStatement();
		String sql = "select * from snow";
		ResultSet rs = smt.executeQuery(sql);
		while(rs.next())
		{
		 str = rs.getString(1);

		System.out.print(str);
			//aaaaaaaa
		}
	}
}
