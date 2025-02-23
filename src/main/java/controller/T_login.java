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
 * Servlet implementation class T_login
 */
@WebServlet("/T_login")
public class T_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public T_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Database");
		String tid = request.getParameter("username");
        String upwd = request.getParameter("password");
        System.out.println("parameter got");
        System.out.println(tid);
        System.out.println(upwd);
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if(tid==null || tid.equals(""))
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
            PreparedStatement ps = con.prepareStatement("select * from teacher where  tid= ? and pass=?");
            System.out.println("Prepared Statement");
            ps.setString(1, tid);
            ps.setString(2, upwd);
            System.out.println("After Prepared Statement");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
            	System.out.println("Inside resultset");
                session.setAttribute("name", rs.getString("name"));
                dispatcher = request.getRequestDispatcher("validadmin.jsp");
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
		doGet(request, response);
	}

}

                                                                                                                       