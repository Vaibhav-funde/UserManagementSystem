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

@WebServlet("/DeleteStateServlet")
public class DeleteStateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sidParam = request.getParameter("sid");

        if (sidParam == null || sidParam.isEmpty()) {
            response.sendRedirect("StateList.jsp");
            return;
        }

        int sid = Integer.parseInt(sidParam);

        String sql = "DELETE FROM STATE WHERE SID=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sid);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to list after deletion
        response.sendRedirect("StateList.jsp");
    }
}
