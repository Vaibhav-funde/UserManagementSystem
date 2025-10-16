package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dbo.Citydbo;

/**
 * Servlet implementation class DeleteCityServlet
 */
@WebServlet("/DeleteCityServlet")
public class DeleteCityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cidStr = request.getParameter("cid");
	        String sidStr = request.getParameter("sid"); // to redirect back to the state’s city list

	        if (cidStr != null && !cidStr.isEmpty()) {
	            int cid = Integer.parseInt(cidStr);
	            int sid = (sidStr != null && !sidStr.isEmpty()) ? Integer.parseInt(sidStr) : 0;

	            Citydbo cdb = new Citydbo();
	            try {
	                cdb.deleteCity(cid);
	            } catch (SQLException e) {
	                e.printStackTrace();
	                response.getWriter().println("Error deleting city: " + e.getMessage());
	                return;
	            }

	            // Redirect back to the city list of the same state
	            response.sendRedirect("CityList.jsp?sid=" + sid);
	        } else {
	            response.getWriter().println("City ID is missing.");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
