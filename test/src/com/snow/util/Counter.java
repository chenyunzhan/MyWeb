package com.snow.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Counter {
	public void count(String ip, String host, Integer port, String user) {
		Connection conn = DBUtil.getConn();
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:ss");
		String time = df.format(date);
		String sql = "insert into visitor values(null, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ip);
			ps.setString(2, user);
			ps.setInt(3, port);
			ps.setString(4, host);
			ps.setString(5, time);
			int sum = ps.executeUpdate();
			if(sum < 1){
				System.out.println("===================count failure==========================");
			}
		} catch (SQLException e) {
			System.out.println("===================count exception==========================");
			e.printStackTrace();
		}  finally {
			DBUtil.close(conn);
		}
	}
}
