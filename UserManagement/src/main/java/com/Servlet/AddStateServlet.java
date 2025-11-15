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

        String sname = request.getParameter("sname").trim(); // remove extra spaces
        StateDbo sdb = new StateDbo();

        try {
            // Check if state already exists
            if (sdb.isStateExists(sname)) {
                // Redirect back with error message (you can also show a popup in JSP)
                request.setAttribute("error", "State already exists!");
                request.getRequestDispatcher("AddState.jsp").forward(request, response);
            } else {
                // Add new state
                sdb.addState(sname);
                response.sendRedirect("StateList.jsp"); // Redirect to list after adding
            }
        } catch (SQLException e) {
            throw new ServletException("Error adding state", e);
        }
    }
}
