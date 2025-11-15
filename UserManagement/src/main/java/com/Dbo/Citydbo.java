package com.Dbo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Db.DbConnection;
import com.Model.City;

public class Citydbo {

    // Add city only if it does not exist for the given state
    public boolean addCity(String name, int sid) throws SQLException {
        if (isCityExists(name, sid)) {
            return false; // City already exists for this state
        }

        String sql = "INSERT INTO CITY (CID, CNAME, SID) VALUES (CITY_SEQ.NEXTVAL, ?, ?)";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, sid);
            ps.executeUpdate();
            return true;
        }
    }

    // Update city
    public void updateCity(int cid, String name, int sid) throws SQLException {
        String sql = "UPDATE CITY SET CNAME=?, SID=? WHERE CID=?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, sid);
            ps.setInt(3, cid);
            ps.executeUpdate();
        }
    }

    // Delete city
    public void deleteCity(int cid) throws SQLException {
        String sql = "DELETE FROM CITY WHERE CID=?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, cid);
            ps.executeUpdate();
        }
    }

    // Check if city already exists for a state
    public boolean isCityExists(String name, int sid) throws SQLException {
        String sql = "SELECT COUNT(*) FROM CITY WHERE CNAME=? AND SID=?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, sid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    // Get all cities for a state
    public List<City> getCitiesByState(int sid) throws SQLException {
        List<City> list = new ArrayList<>();
        String sql = "SELECT * FROM CITY WHERE SID=? ORDER BY CNAME";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                City c = new City();
                c.setCid(rs.getInt("CID"));
                c.setCname(rs.getString("CNAME"));
                c.setSid(rs.getInt("SID"));
                list.add(c);
            }
        }
        return list;
    }

    public City getCityById(int cid) throws SQLException {
        City city = null;
        String sql = "SELECT * FROM CITY WHERE CID=?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                city = new City();
                city.setCid(rs.getInt("CID"));
                city.setCname(rs.getString("CNAME"));
                city.setSid(rs.getInt("SID"));
            }
        }
        return city;
    }
    public List<City> getCitiesByStateId(int sid) throws SQLException {
        List<City> list = new ArrayList<>();
        String sql = "SELECT * FROM CITY WHERE SID = ?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                City c = new City();
                c.setCid(rs.getInt("CID"));
                c.setCname(rs.getString("CNAME"));
                c.setSid(rs.getInt("SID"));
                list.add(c);
            }
        }
        return list;
    }

}
