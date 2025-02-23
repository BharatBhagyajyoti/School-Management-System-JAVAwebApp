<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.StdAttendanceFetch" %>
<%@ page import="dao.Student" %> 
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Attendance System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize-css/1.0.0/css/materialize.min.css">
    <style>
        /* Internal CSS for additional styling */
        body {
            font-family: Roboto, sans-serif; /* Example font change */
        	background-color: rgb(31, 31, 29);
            margin: 0; /* Remove default margin */
            padding: 1%; /* Remove default padding */
            justify-content: center; /* Center horizontally */
            margin-top: 0%;
            margin-left: 4%;
        }

        h1 {
            margin-top: 0; /* Remove default Materialize margin */
        	color: #f2f2f2;
        	
        }
        h2{
        	color:#f2f2f2
        }
        

        .container {
            padding: 2rem;
            border-radius: 28px; /* Add border radius */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.19); /* Subtle shadow */
        	background-color: rgb(65, 63, 63);
        	
        }

        .center-table {
            margin: 0 auto; /* Center align the table */
        	color: #f2f2f2;
        }

        table {
            border: none; /* Remove default table border */
        }

        th {
            background-color: #f2f2f2;
            color:black;
        }
        label[for="date"] { /* Targets the label with "for" attribute set to "name" */
    		color: #f2f2f2;
		}
		label[for="class"] { /* Targets the label with "for" attribute set to "name" */
    		color: #f2f2f2;
		}
    </style>
</head>
<body>

<h1 align="center">Student Attendance Management</h1>




<div class="container"align="center">
    <h2 align="center" >Record Attendance</h2>
    <form action="#" method="post">
        <div class="row">
            <div class="col s6 m6 input-field">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" class="validate" required>
            </div>
            <div class="col s6 m6 input-field">
                <label for="class">Class:</label>
                <select name="class" id="class" class="browser-default">
                    <option  value="">Select Class</option>
                    <option  value="one">1</option>
                    <option  value="two">2</option>
                    <option  value="three">3</option>
                    <option  value="four">4</option>
                    <option  value="five">5</option>
                    <option  value="six">6</option>
                    <option  value="seven">7</option>
                    <option  value="eight">8</option>
                    <option  value="nine">9</option>
                    <option  value="ten">10</option>
                    
                    
                </select>
		     
                
                <!-- Submit button -->
    			<div class="row">
        			<div class="col s12">
            			<button type="submit" class="btn waves-effect waves-light green">Show</button>
        			</div>
    			</div>
            </div>
        </div>
      </form>

	<form action="./RecordAttendanceServlet" id='secondForm' method="POST">
	<input type="hidden" id="hiddenDate" name=date>
        <div class="center-table">
            <table class="striped">
                <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Note (Optional)</th>
                </tr>
                </thead>
                <tbody>
                <%
                                	
                String className= request.getParameter("class");
                if(className != null && !className.isEmpty()){
                	
                
                	StdAttendanceFetch std=new StdAttendanceFetch();
                	List<Student> students = std.getStudents(className);
                	for (Student student : students) {
                %>
                
                <tr>
                	<td><%= student.getId() %><input type="hidden" name="student_id[]" value="<%= student.getId() %>"></td>
                	<td><%= student.getName() %><input type="hidden" name="name[]" value="<%= student.getName() %>"></td>
                	<td>
                    	<select name="status[]" class="browser-default" required>
                        	<option value="">Select Status</option>
                        	<option value="present">Present</option>
                        	<option value="absent">Absent</option>
                        	<option value="late">Late</option>
                    	</select>
                	</td>
                <td><input type="text" name="note[]"></td>
            	</tr>
            	<%
            		}
                }
                
            	%>
                </tbody>
            </table>
        </div>
        
    	<div class="row">
    		<div class="col s12">
        		<button type="submit" class="btn waves-effect waves-light green">Submit Attendance</button>
    		</div>
    	</div>
        </form>
        <%
		// Get date from the first form if it has been submitted
		String date = request.getParameter("date");
		if (date != null && !date.isEmpty()) {
    		// Set the date value in the hidden input field of the second form
    		out.println("<script>document.getElementById('hiddenDate').value = '" + date + "';</script>");
		}
		%>
    
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize-css/1.0.0/js/materialize.min.js"></script>

<script>
    // Retrieve the value of the hidden input field
    var hiddenDateValue = document.getElementById('hiddenDate').value;
    // Print the value to the console for checking
    console.log("Date from the first form: " + hiddenDateValue);
</script>


	
	

</body>
</html>
