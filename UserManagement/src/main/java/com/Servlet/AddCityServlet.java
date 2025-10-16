package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dbo.Citydbo;
import com.Dbo.StateDbo;

/**
 * Servlet implementation class AddCityServlet
 */
@WebServlet("/AddCityServlet")
public class AddCityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cname = request.getParameter("cname");
        int sid = Integer.parseInt(request.getParameter("sid"));

        Citydbo cdb = new Citydbo();

        try {
            boolean added = cdb.addCity(cname, sid);
            if (added)
                response.sendRedirect("CityList.jsp?sid=" + sid);
            else
                response.sendRedirect("AddCity.jsp?error=1");
        } catch (SQLException e) {
            throw new ServletException("Error adding city", e);
        }
    }
}
