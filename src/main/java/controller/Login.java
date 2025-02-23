package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Database");
		String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");
        System.out.println("parameter got");
        System.out.println(uemail);
        System.out.println(upwd);
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if(uemail==null || uemail.equals(""))
        {
        	request.setAttribute("status", "InvalidEmail");
        	dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        }
        if(upwd==null || upwd.equals(""))
        {
        	request.setAttribute("status", "InvalidPassword");
        	dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        }
		
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school", "root", "Bhagyajyoti768");
            PreparedStatement ps = con.prepareStatement("select * from user where  email= ? and pass=?");
            System.out.println("Prepared Statement");
            ps.setString(1, uemail);
            ps.setString(2, upwd);
            System.out.println("After Prepared Statement");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
            	System.out.println("Inside resultset");
                session.setAttribute("name", rs.getString("uname"));
                dispatcher = request.getRequestDispatcher("StdDynamicLogin.jsp");
            }
            else
            {
            	request.setAttribute("status", "Failed");
                dispatcher = request.getRequestDispatcher("StdDynamicLogin.jsp");
            }
            dispatcher.forward(request, response);

            
		} catch (Exception  e) {
			e.printStackTrace();

		}
		
	}

}
