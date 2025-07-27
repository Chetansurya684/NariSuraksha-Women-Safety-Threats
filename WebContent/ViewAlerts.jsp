<%@page import = "com.r3sys.dbcon.ConnectDB" %>
<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        padding: 40px;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 0 auto;
        background-color: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px 15px;
        text-align: left;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<table>
    <tr>
        <th>Alert Discription</th>
        <th>Your Current Location</th>
        <th>Status</th>
       
        
    </tr>
    <%
        Connection con = ConnectDB.getConnect();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM alerts");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
    %>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(4)%></td>
        
    </tr>
    <%
        }
    %>
</table>

<a href="AdminDashboard.jsp">Go To Dashboard</a>

</body>
</html>
