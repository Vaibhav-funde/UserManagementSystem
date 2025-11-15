package com.Dbo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Db.DbConnection;
import com.Model.State;



public class StateDbo {

	 public void addState(String name) throws SQLException {
	        String sql = "INSERT INTO STATE (SID, SNAME) VALUES (STATE_SEQ.NEXTVAL, ?)";
	        try (Connection con = DbConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, name);
	            ps.executeUpdate();
	        }
	    }

	    public void updateState(int sid, String name) throws SQLException {
	        String sql = "UPDATE STATE SET SNAME=? WHERE SID=?";
	        try (Connection con = DbConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, name);
	            ps.setInt(2, sid);
	            ps.executeUpdate();
	        }
	    }

	    public void deleteState(int sid) throws SQLException {
	        String sql = "DELETE FROM STATE WHERE SID=?";
	        try (Connection con = DbConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setInt(1, sid);
	            ps.executeUpdate();
	        }
	    }
	    
    // Fetch all states from the database
    public List<State> getAllStates() {
        List<State> list = new ArrayList<>();
        String sql = "SELECT * FROM state ORDER BY sname";

        try (
        	Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                State s = new State();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public State getStateById(int sid) {
        State state = null;
        String sql = "SELECT SID, SNAME FROM STATE WHERE SID=?";
        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                state = new State();
                state.setSid(rs.getInt("SID"));
                state.setSname(rs.getString("SNAME"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return state;
    }
    public boolean isStateExists(String sname) throws SQLException {
        String sql = "SELECT COUNT(*) FROM STATE WHERE SNAME = ?"; // Correct table name
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, sname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // state exists if count > 0
            }
        }
        return false;
    }

}
