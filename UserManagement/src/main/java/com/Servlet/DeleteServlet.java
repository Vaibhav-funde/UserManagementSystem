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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdStr = request.getParameter("userId");

        if (userIdStr != null && !userIdStr.isEmpty()) {
            try (Connection con = DbConnection.getConnection()) {

                int userId = Integer.parseInt(userIdStr);
                String sql = "DELETE FROM USERS WHERE USER_ID = ?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, userId);
                    int rows = ps.executeUpdate();

                    if (rows > 0) {
                        System.out.println("User deleted successfully: ID = " + userId);
                    } else {
                        System.out.println("No user found with ID = " + userId);
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Redirect back to Dashboard after deletion
        response.sendRedirect("DashboardServlet");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
