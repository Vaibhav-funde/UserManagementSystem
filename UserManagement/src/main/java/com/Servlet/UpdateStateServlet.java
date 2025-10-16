package com.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Db.DbConnection;

@WebServlet("/UpdateStateServlet")
public class UpdateStateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        int sid = Integer.parseInt(req.getParameter("sid"));
        String sname = req.getParameter("sname");

        String sql = "UPDATE STATE SET SNAME=? WHERE SID=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, sname);
            ps.setInt(2, sid);
            ps.executeUpdate();

            resp.sendRedirect("StateList.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("State update failed", e);
        }
    }
}
