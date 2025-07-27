<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>User Registration - Women Safety Threats</title>
  <style>
    body {
      background: linear-gradient(to right, #3a6186, #89253e);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .registration-form {
      background: #ffffff;
      padding: 40px 60px;
      border-radius: 12px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      width: 100%;
      max-width: 400px;
    }

    .registration-form h2 {
      text-align: center;
      margin-bottom: 24px;
      color: #333;
    }

    .registration-form input {
      width: 100%;
      padding: 12px 15px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      transition: border 0.3s;
    }

    .registration-form input:focus {
      border: 1px solid #89253e;
      outline: none;
    }

    .registration-form button {
      width: 100%;
      padding: 12px;
      background: #89253e;
      color: #fff;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .registration-form button:hover {
      background: #a6344d;
    }

    .registration-form p {
      text-align: center;
      margin-top: 16px;
      font-size: 14px;
      color: #666;
    }

    .registration-form p a {
      color: #89253e;
      text-decoration: none;
      font-weight: bold;
    }

    .registration-form p a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <form class="registration-form" action="UserRegister" method="POST">
    <h2>User Registration</h2>
    <input type="text" name="uname" placeholder="Full Name" required />
    <input type="text" name="uaddress" placeholder="Add the full Address" required />
    <input type="text" name="uemail" placeholder="Email Address" required />
    <input type="text" name="upassword" placeholder="Password" required />
    <input type="text" name="ucontact" placeholder="Phone Number" required />
    <button type="submit">Register</button>
    <p>Already have an account? <a href="index.jsp">Login</a></p>
  </form>

</body>
</html>
