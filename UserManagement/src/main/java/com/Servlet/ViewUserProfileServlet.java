package com.Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Dbo.UserDbo;
import com.Model.Users;
import com.Model.User_Profile;

@WebServlet("/ViewUserProfileServlet")
public class ViewUserProfileServlet extends HttpServlet {
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
        User_Profile profile = dbo.getUserProfileByUserId(userId);

        if (user != null) {
            request.setAttribute("user", user);
            request.setAttribute("profile", profile);
            RequestDispatcher rd = request.getRequestDispatcher("UserProfile.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("DashboardServlet");
        }
    }
}
