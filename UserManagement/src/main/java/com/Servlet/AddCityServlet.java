package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Dbo.Citydbo;

@WebServlet("/AddCityServlet")
public class AddCityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cname = request.getParameter("cname").trim();
        int sid = Integer.parseInt(request.getParameter("sid"));

        Citydbo cdb = new Citydbo();

        try {
            boolean added = cdb.addCity(cname, sid);

            if (added) {
                response.sendRedirect("CityList.jsp?sid=" + sid); // City added successfully
            } else {
                // City already exists, redirect back to AddCity.jsp with error
                request.setAttribute("error", "City already exists for this state!");
                request.getRequestDispatcher("AddCity.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException("Error adding city", e);
        }
    }
}
