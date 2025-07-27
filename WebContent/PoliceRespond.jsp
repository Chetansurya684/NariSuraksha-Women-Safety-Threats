<%@page import="com.r3sys.dbcon.ConnectDB" %>
<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Alerts</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f2f4f8;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            padding: 20px;
            color: #2c3e50;
        }

        table {
            width: 90%;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 15px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button[type="submit"]:hover {
            opacity: 0.9;
        }

        .approve-btn {
            background-color: #27ae60;
            color: white;
        }

        .reject-btn {
            background-color: #e74c3c;
            color: white;
        }

        .actions form {
            display: inline-block;
        }

    </style>
</head>
<body>
    <h2>All Alerts from Users</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Alert Message</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                con = ConnectDB.getConnect(); // Database connection
                ps = con.prepareStatement("SELECT * FROM alerts"); // Table name
                rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("aid") %></td>
            <td><%= rs.getString("adesc") %></td>
            <td><%= rs.getString("astatus") %></td>
            <td class="actions">
                <form action="ViewResponse" method="post">
                    <input type="hidden" name="aid" value="<%= rs.getInt("aid") %>">
                    <input type="hidden" name="astatus" value="Approved">
                    <button class="approve-btn" type="submit">Approve</button>
                </form>
                <form action="ViewResponse" method="post">
                    <input type="hidden" name="aid" value="<%= rs.getInt("aid") %>">
                    <input type="hidden" name="astatus" value="Rejected">
                    <button class="reject-btn" type="submit">Reject</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                try { if (rs != null) rs.close(); } catch(Exception e) {}
                try { if (ps != null) ps.close(); } catch(Exception e) {}
                try { if (con != null) con.close(); } catch(Exception e) {}
            }
        %>
    </table>
    <a href="PoliceDashboard.html">Go To Dashboard</a>
</body>
</html>
