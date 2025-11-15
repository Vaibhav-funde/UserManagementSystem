package com.Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.Dbo.UserDbo;
import com.Model.Users;

@WebServlet("/ViewUserServlet")
public class ViewUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdStr = request.getParameter("userId");
        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect("DashboardServlet");
            return;
        }

        int userId = Integer.parseInt(userIdStr);
        UserDbo dbo = new UserDbo();
        Users user = dbo.getUserById(userId);

        if (user == null) {
            request.setAttribute("error", "User not found!");
            request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
            return;
        }

        request.setAttribute("user", user);
        RequestDispatcher rd = request.getRequestDispatcher("UserProfile.jsp");
        rd.forward(request, response);
    }
}
