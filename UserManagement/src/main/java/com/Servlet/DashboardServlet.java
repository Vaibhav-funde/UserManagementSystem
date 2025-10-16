package com.Servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Dbo.UserDbo;
import com.Model.Users;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDbo dbo = new UserDbo();
        int totalUsers = dbo.getTotalUsers();
        List<Users> userList = dbo.getAllUsers();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("userList", userList);

        RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
        rd.forward(request, response);
    }
}
