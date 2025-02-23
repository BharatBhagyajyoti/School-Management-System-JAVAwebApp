package controller;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;

@WebServlet("/RecordAttendanceServlet")
public class RecordAttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Received POST request to RecordAttendanceServlet");

    	
    	String date = request.getParameter("date");
        String classNumber = request.getParameter("class");
        String[] studentIds = request.getParameterValues("student_id[]");
        String[] names = request.getParameterValues("name[]");
        String[] statuses = request.getParameterValues("status[]");
        String[] notes = request.getParameterValues("note[]");
        
     // Debug statements to print received data
        System.out.println("Date: " + date);
        System.out.println("Class: " + classNumber);
        System.out.println("Student IDs: " + Arrays.toString(studentIds));
        System.out.println("Names: " + Arrays.toString(names));
        System.out.println("Statuses: " + Arrays.toString(statuses));
        System.out.println("Notes: " + Arrays.toString(notes));
        
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "Biswa@9090");
            String qry = "INSERT INTO Attendance (date, class, student_id, name, status, note) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(qry);

            for (int i = 0; i < studentIds.length; i++) {
                pstmt.setString(1, date);
                pstmt.setString(2, classNumber);
                pstmt.setInt(3, Integer.parseInt(studentIds[i]));
                pstmt.setString(4, names[i]);
                pstmt.setString(5, statuses[i]);
                pstmt.setString(6, notes[i]);
                pstmt.executeUpdate();
            }
            System.out.println("Attendance success...");

            // Redirect to a success page or display a success message
//            response.sendRedirect("success.jsp");
//            System.out.println("");
            
        } catch (Exception ex) {
            ex.printStackTrace();
            // Redirect to an error page or display an error message
            response.sendRedirect("https://www.google.com/search?q=error+page+codepen&oq=error&gs_lcrp=EgZjaHJvbWUqDggAEEUYJxg7GIAEGIoFMg4IABBFGCcYOxiABBiKBTIRCAEQRRg5GEMYsQMYgAQYigUyBggCEEUYQDIKCAMQABixAxiABDIKCAQQABixAxiABDIKCAUQABixAxiABDIHCAYQABiABDIKCAcQABixAxiABNIBCDEzMzRqMGoxqAIAsAIA&sourceid=chrome&ie=UTF-8");
        } finally {
            // Close resources in finally block
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
