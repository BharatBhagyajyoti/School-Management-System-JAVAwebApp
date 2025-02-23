package dao;
import java.sql.Connection;



import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.*;

public class StdAttendanceFetch {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; // Replace with your driver class name
    final String DB_URL = "jdbc:mysql://localhost:3306/project"; // Replace with your database URL
    final String USER = "root"; // Replace with your database username
    final String PASSWORD = "Biswa@9090"; // Replace with your database password
    
    public List<Student> getStudents(String className) throws SQLException, ClassNotFoundException {
        List<Student> students = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        System.out.println(className);
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/students", "root", "Bhagyajyoti768");
            String qry = "SELECT * FROM "+className;
            st = conn.prepareStatement(qry);
//            st.setString(1, className);
            rs = st.executeQuery();
            while (rs.next()) {
            	Student student = new Student(rs.getString("studid"), rs.getString("sname"));
            	students.add(student);
            	int id=rs.getInt("studid");
            	System.out.println("ID="+id);
            	String name=rs.getString("sname");
            	System.out.println("Name="+name);
            }
            System.out.println("Query executed successfully.");
        }catch (Exception e) {
            // Log error message if an exception occurs
            System.out.println("Error executing query: " + e.getMessage());
            e.printStackTrace();
        }
            finally {
                // Close resources in finally block
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (conn != null) conn.close();
            }
        
        
		return students;
        }
	

}

