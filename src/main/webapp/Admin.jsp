<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <style>
    /* Internal CSS */
    body {
      background-color: #747171;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    #login-form {
      background-color: #514d4d;
      padding: 100px; /* Increased padding for larger container */
      border-radius: 44px;
      box-shadow: 4px 0px 83px rgba(30, 29, 29, 0.1);
      width: 800px; /* Increased container width to 700px */
      position: relative; /* Add position relative for absolute positioning */
    }

    #login-form h2 {
      text-align: center;
      color: #cbced3;
    }

    .input-container {
      position: relative;
    }

    .input-container label,
    .input-container input[type="text"],
    .input-container input[type="password"],
    #login-form input[type="checkbox"] + span {
      color: #ebe7e7; /* Change color to white */
      margin-left: 11px;
    }

    .input-container input[type="text"],
    .input-container input[type="password"] {
      width: 40%;
      padding: 12px;
      margin: 17px 0;
      border: 1px solid #cccccc;
      border-radius: 33px;
      color: #000000; /* Change color to black */
    }

    #login-form input[type="checkbox"] {
      margin-left: 5px;
    }

    #login-form button[type="submit"] {
      width: 60%;
      padding: 15px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 18px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      position: relative; /* Set position relative */
      top: 20px; /* Adjust top distance */
    }

    #login-form button[type="submit"]:hover {
      background-color: #45a049;
    }

    #login-form .forgot-password {
      font-size: 12px;
      text-align: right;
      color: rgb(48, 223, 66);
      
      
    }

    .forget-password
    {
        position: relative;
        margin-top: 204px;

    }

    #login-form .signup {
      font-size: 14px;
      text-align: center;
      margin-top: 50px;
      margin-right:232px;
    }

    /* Style for the image */
    #login-form img {
      position: absolute;
      top: 50%;
      left: 60%;
      transform: translateY(-50%);
      width: 350px; /* Adjust the width of the image as needed */
      height:350px; ;
    }
  </style>
</head>
<body>
  <div id="login-form">
    <img src="Images/four.png" alt="School Logo"> <!-- Replace "image-url" with the URL of your image -->
    <h2>Admin Login</h2>
    <form>
      <div class="input-container">
        <label for="username">Username:</label>
        <input type="text" id="username" placeholder="Enter Username">
      </div>
      <div class="input-container">
        <label for="password">Password:</label>
        <input type="password" id="password" placeholder="Enter Password">
      </div>
      <label>
        <input type="checkbox" class="filled-in" checked="checked" />
        <span>Remember me</span>
      </label>
      <div>
        <a href="#" class="forgot-password">Forgot Password?</a>
      </div>
      <button type="submit" class="btn">Login</button>
      <div class="signup">
        <p>Don't have an account? <a href="#">Sign Up</a> as an admin.</p>
      </div>
    </form>
  </div>
</body>
</html>