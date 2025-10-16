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

	public boolean addCity(String name, int sid) throws SQLException {
        String sql = "INSERT INTO CITY (CID, CNAME, SID) VALUES (CITY_SEQ.NEXTVAL, ?, ?)";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, sid);
            ps.executeUpdate();
        }
		return false;
    }

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

    public void deleteCity(int cid) throws SQLException {
        String sql = "DELETE FROM CITY WHERE CID=?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, cid);
            ps.executeUpdate();
        }
    }
    
    public List<City> getCitiesByState(int sid) {
        List<City> list = new ArrayList<>();
        String sql = "SELECT * FROM city WHERE sid = ? ORDER BY cname";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                City c = new City();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                c.setSid(rs.getInt("sid"));
                list.add(c);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    public List<City> getCitiesByStateId(int sid) throws SQLException {
        List<City> list = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM city WHERE sid = ?");
        ps.setInt(1, sid);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            City c = new City();
            c.setCid(rs.getInt("cid"));
            c.setCname(rs.getString("cname"));
            c.setSid(rs.getInt("sid"));
            list.add(c);
        }
        return list;
    }
    public City getCityById(int cid) throws SQLException {
        City city = null;
        String sql = "SELECT * FROM CITY WHERE CID = ?";
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


}
