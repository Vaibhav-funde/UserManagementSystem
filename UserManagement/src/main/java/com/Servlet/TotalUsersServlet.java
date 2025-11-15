package com.Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Dbo.UserDbo;

@WebServlet("/TotalUsersServlet")
public class TotalUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDbo dbo = new UserDbo();
        int totalUsers = dbo.getTotalUsers();

        request.setAttribute("totalUsers", totalUsers);

        RequestDispatcher rd = request.getRequestDispatcher("TotalUserCount.jsp");
        rd.forward(request, response);
    }
}
