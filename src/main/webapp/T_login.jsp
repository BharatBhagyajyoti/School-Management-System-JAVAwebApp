<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Login</title>
</head>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Teacher Login Portal</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <style>
    body {
      background-color: #c1bcc5;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      padding: 30px;
      border-radius: 5px;
      box-shadow: 12px  12px 30px rgba(0, 0, 0, 99);
      background-color: #4f4a4a;
      font-color: #c1bcc5 ;
      border-radius: 36px;
      display: flex;
      flex-direction: row;
    }

    .image-container {
      flex: 1;
      text-align: center;
      margin-top: 90px ;
      box-shadow: px  12px 30px rgba(0, 0, 0, 99);
      filter: drop-shadow(10px 10px 10px rgba(0 ,0 ,0 ,0.6));

    }

    .login-form {
      flex: 1;
      padding: 20px;
    }

    h1 {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .show-password {
      cursor: pointer;
    }

    p {
      text-align: center;
      font-size: 12px;
      color: #aaa;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <div class="container card">
    <div class="image-container">
      <img src="Images/img5-removebg-preview.png" alt="School Image" class="responsive-img">
    </div>
    <div class="login-form">
      <h1 class="center-align"> Teacher's Login</h1>
      <form action="T_login" method="post" class="Teacher-login">
        <div class="row">
          <div class="input-field col s12">
            <input id="username" type="text" name="username" class="validate" required>
            <label for="username">Teacher Id:</label>
          </div>
          <div class="input-field col s12">
            <input id="password" type="password" name="password" class="validate" required>
            <label for="password">Password:</label>
            <span class="show-password">Show Password</span>
          </div>
        </div>
        <p class="center-align">
          <label>
            <input type="checkbox" id="remember-me" name="remember-me">
            <span>Remember Me</span>
          </label>
        </p>
        <div class="row">
          <div class="col s12">
            <button type="submit" class="btn waves-effect waves-light green col s12">Login</button>
          </div>
        </div>
        <a href="#" class="center-align">Forgot Password?</a>
      </form>
    </div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script>
    const showPassword = document.querySelector('.show-password');
    const passwordInput = document.getElementById('password');

    showPassword.addEventListener('click', function() {
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        showPassword.textContent = 'Hide Password';
      } else {
        passwordInput.type = 'password';
        showPassword.textContent = 'Show Password';
      }
    });
  </script>
</body>

</html>