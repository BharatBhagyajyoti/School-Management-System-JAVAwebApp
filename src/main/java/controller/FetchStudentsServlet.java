package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.List;

/**
 * Servlet implementation class FetchStudentsServlet
 */
@WebServlet("/FetchStudentsServlet")
public class FetchStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchStudentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// Set content type of the response
        response.setContentType("text/html");

        // Get the selected class from the request parameter
        String selectedClass = request.getParameter("class");
        
     // Fetch student names based on the selected class
        List<String> studentNames = fetchStudentsByClass(selectedClass);
     // Generate HTML content dynamically
        response.setContentType("text/html");
        

        
            	
        
	}

	private List<String> fetchStudentsByClass(String selectedClass) {
		// TODO Auto-generated method stub
		
		return null;
	}

	private String[] getStudentNames(String selectedClass) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
