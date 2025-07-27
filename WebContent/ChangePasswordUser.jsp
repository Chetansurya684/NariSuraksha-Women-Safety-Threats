<%@page import = "com.r3sys.dbcon.ConnectDB" %>
<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .message {
            margin: 15px 0;
            padding: 10px;
            border-radius: 4px;
            text-align: center;
        }
        .error {
            background-color: #ffdddd;
            color: #d8000c;
        }
        .success {
            background-color: #ddffdd;
            color: #4F8A10;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #333;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Change Password</h2>
        
        <%-- Display error message if any --%>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            String successMessage = (String) request.getAttribute("successMessage");
            
            if (errorMessage != null) {
        %>
            <div class="message error">
                <%= errorMessage %>
            </div>
        <%
            }
            
            if (successMessage != null) {
        %>
            <div class="message success">
                <%= successMessage %>
            </div>
        <%
            }
        %>
        
        <form action="ChangePasswordUser" method="post">
            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <input type="password" id="currentPassword" name="upassword" required>
            </div>
            
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="npassword" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="npassword" required>
            </div>
            
            <button type="submit" class="btn">Change Password</button>
        </form>
        
        <a href="UserDashboard.html" class="back-link">Back to Dashboard</a>
    </div>
</body>
</html>