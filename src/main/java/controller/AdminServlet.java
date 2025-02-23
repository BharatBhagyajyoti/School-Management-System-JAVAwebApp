package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.company.dao.AdminDao;
import com.company.dao.AdminDaoImpl;
import com.company.dao.RegisterDao;
import com.company.dao.RegisterDaoImpl;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("admin_id");
		String pwd = request.getParameter("password");
		
		AdminDao admDao = new AdminDaoImpl();
		
		 if (admDao.isValidAdmin(id,pwd)) {
	            HttpSession session = request.getSession();
	            session.setAttribute("admin_id", id);
	           // HttpSession session1 = request.getSession();
	           // session1.setAttribute("password", pwd);
	            response.sendRedirect("validadmin.jsp");
	            
	        } else {
	        	response.setContentType("text/html");
	            PrintWriter out = response.getWriter();

	            out.println("<html><head>");
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('Invalid Admin credentials');");
	            out.println("location='admin.html?error=1';");
	            out.println("</script>");
	            out.println("</head><body></body></html>");
	        }
	}
	}


