package com.Servlet;

import com.Dbo.StateDbo;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddStateServlet")
public class AddStateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sname = request.getParameter("sname");
        StateDbo sdb = new StateDbo();

        try {
            sdb.addState(sname);
            response.sendRedirect("StateList.jsp"); // Redirect to list after adding
        } catch (SQLException e) {
            throw new ServletException("Error adding state", e);
        }
    }
}
