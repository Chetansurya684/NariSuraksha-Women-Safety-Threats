<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin Dashboard - Nari Suraksha</title>
  <style>
    body {
      background: linear-gradient(to right, #3a6186, #89253e);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    header {
      width: 100%;
      padding: 20px;
      background: rgba(0, 0, 0, 0.3);
      color: #fff;
      text-align: center;
      font-size: 28px;
      font-weight: bold;
      letter-spacing: 1px;
    }

    .dashboard {
      display: flex;
      gap: 30px;
      margin-top: 150px;
    }

    .card {
      background: rgba(255, 255, 255, 0.1);
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 10px;
      padding: 40px;
      width: 150px;
      text-align: center;
      color: #fff;
      backdrop-filter: blur(8px);
      transition: transform 0.3s, box-shadow 0.3s;
      cursor: pointer;
      text-decoration: none;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
      border: 2px solid rgba(255, 255, 255, 0.5);
    }

    .card h3 {
      margin-bottom: 15px;
    }

    .card p {
      font-size: 14px;
      color: #f1f1f1;
    }
  </style>
</head>
<body>

  <header>Admin Dashboard - Nari Suraksha</header>

  <div class="dashboard">
    <a href="Addpolice.html" class="card">
      <h3>Add Police Officer</h3>
      <p>Register new police officers in the system</p>
    </a>

    <a href="ViewAlerts.jsp" class="card">
      <h3>View Alerts</h3>
      <p>See all safety alerts sent by users</p>
    </a>

    <a href="DeletePolice.html" class="card">
      <h3>Manage Police Officers</h3>
      <p> remove registered officers</p>
    </a>
     <a href="ViewUsers.jsp" class="card">
      <h3>View All Users</h3>
      <p>View All registered Users</p>
    </a>
    
     <a href="ViewPolice.jsp" class="card">
      <h3>View All Police Officers</h3>
      <p>View All registered officers</p>
    </a>
    
  
  </div>
  <br>
  <br>
  <a href="index.jsp" class="card">
  <h3> Go To Login </h3>

</body>
</html>
