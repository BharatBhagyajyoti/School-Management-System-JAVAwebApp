package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String n = request.getParameter("name");
        String e = request.getParameter("email");
        String p = request.getParameter("pass");
//        String r = request.getParameter("re_pass");
        String c = request.getParameter("contact");
    	RequestDispatcher dispatcher = null;
    	Connection con = null;
    	if(n==null || n.equals(""))
        {
        	request.setAttribute("status", "InvalidName");
        	dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
        }
    	if(e==null || e.equals(""))
        {
        	request.setAttribute("status", "InvalidEmail");
        	dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
        }
    	if(p==null || p.equals(""))
        {
        	request.setAttribute("status", "InvalidPassword");
        	dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
        }
    	if(c==null || c.equals(""))
        {
        	request.setAttribute("status", "InvalidPhoneNo");
        	dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
        }
    	
    	
    	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school", "root", "Bhagyajyoti768");
			PreparedStatement ps = con.prepareStatement("insert into user(uname,email,pass,uph) values (?,?,?,?)");
            ps.setString(1, n);
            ps.setString(2, e);
            ps.setString(3, p);
//            ps.setString(4, r);
            ps.setString(4, c);

            int count = ps.executeUpdate();
        	dispatcher  = request.getRequestDispatcher("/registration.jsp");

            if(count>0)
            {
            	request.setAttribute("status","success");
            }
            else
            {
            	request.setAttribute("status","Failed");

            }
            
            dispatcher.forward(request, response);
            
		  } 
	   catch (Exception e1) {
			e1.printStackTrace();
			
		}
		finally {
			try {
				con.close();
			}
			catch (Exception e1) {
				e1.printStackTrace();
		}
	
		
		}
	
	}

}
