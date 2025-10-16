package com.Dbo;

import java.sql.*;
import java.util.*;
import com.Db.DbConnection;
import com.Model.Users;

public class UserDbo {

    // Count total users
	public int getTotalUsers() {
	    int count = 0;
	    try (Connection con = DbConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM USERS");
	         ResultSet rs = ps.executeQuery()) {
	        if (rs.next()) count = rs.getInt(1);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}

    // Fetch all users with their state and city names
	public List<Users> getAllUsers() {
	    List<Users> list = new ArrayList<>();
	    String sql ="SELECT u.USER_ID, u.NAME, u.EMAIL, u.MOBILE, " +
                "s.SNAME AS STATE_NAME, c.CNAME AS CITY_NAME " +
                "FROM USERS u " +
                "LEFT JOIN STATE s ON u.SID = s.SID " +
                "LEFT JOIN CITY c ON u.CID = c.CID " +
                "ORDER BY u.USER_ID ASC";

	    try (Connection con = DbConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Users u = new Users();
	            u.setUserId(rs.getInt("USER_ID"));
	            u.setName(rs.getString("NAME"));
	            u.setEmail(rs.getString("EMAIL"));
	            u.setMobile(rs.getString("MOBILE"));
	            u.setStateName(rs.getString("STATE_NAME"));  // alias matches SQL
	            u.setCityName(rs.getString("CITY_NAME"));    // alias matches SQL
	            list.add(u);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
