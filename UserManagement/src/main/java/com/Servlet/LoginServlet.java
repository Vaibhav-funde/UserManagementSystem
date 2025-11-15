package com.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DbConnection.getConnection()) {

            // ✅ Correct query (only 2 parameters)
            String sql = "SELECT USER_ID, NAME FROM USERS WHERE EMAIL=? AND PASSWORD=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String userName = rs.getString("NAME");

                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("USER_ID"));
                session.setAttribute("email", email);

                // ✅ Store username to use in Welcome Username
                session.setAttribute("userName", userName);

                // 🔹 Role logic
                String role;
                if (email.equalsIgnoreCase("admin@gmail.com") && password.equals("Admin@123")) {
                    role = "admin";
                } else {
                    role = "user";
                }

                session.setAttribute("role", role);

                // Redirect to dashboard
                response.sendRedirect("DashboardServlet");

            } else {
                request.setAttribute("errorMessage", "Invalid Email or Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
