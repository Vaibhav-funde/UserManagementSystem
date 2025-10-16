package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.Dbo.Citydbo;

@WebServlet("/UpdateCityServlet")
public class UpdateCityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cid = Integer.parseInt(request.getParameter("cid"));
        String cname = request.getParameter("cname");
        int sid = Integer.parseInt(request.getParameter("sid"));

        Citydbo cdb = new Citydbo();
        try {
            cdb.updateCity(cid, cname, sid);
            response.sendRedirect("CityList.jsp?sid=" + sid);
        } catch (SQLException e) {
            throw new ServletException("Error updating city", e);
        }
    }
}
