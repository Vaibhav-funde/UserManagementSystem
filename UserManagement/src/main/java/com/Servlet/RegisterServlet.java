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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to register page
        response.sendRedirect("Register.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String stateId = request.getParameter("state");
        String cityId = request.getParameter("city");

        // If city not selected yet, reload register.jsp to show cities
        if (cityId == null || cityId.isEmpty()) {
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DbConnection.getConnection()) {

            String sql = "INSERT INTO users (NAME, EMAIL, MOBILE, PASSWORD, SID, CID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, password);
            ps.setInt(5, Integer.parseInt(stateId));
            ps.setInt(6, Integer.parseInt(cityId));

            int result = ps.executeUpdate();

            if (result > 0) {
                // Registration successful, redirect to login page
                response.sendRedirect("Index.html");
            } else {
                response.getWriter().println("Registration failed! Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
