package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.dbcon.ConnectDB;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public UserRegister() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            String uname = request.getParameter("uname");
            String uaddress = request.getParameter("uaddress");
            String ucontact = request.getParameter("ucontact");
            String uemail = request.getParameter("uemail");
            String upassword = request.getParameter("upassword");
            
            // Validate input parameters
            if (uname == null || uname.isEmpty() || 
                uemail == null || uemail.isEmpty() || 
                upassword == null || upassword.isEmpty()) {
                response.sendRedirect("error.html");
                return;
            }
            
            con = ConnectDB.getConnect();
            
            // Modified query to auto-increment the ID (assuming uid is auto-increment in DB)
            String query = "INSERT INTO user (uname, uaddress, ucontact, uemail, upassword) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            
            ps.setString(1, uname);
            ps.setString(2, uaddress);
            ps.setString(3, ucontact);
            ps.setString(4, uemail);
            ps.setString(5, upassword); // In production, you should hash the password
            
            int i = ps.executeUpdate();
            
            if (i > 0) {
                response.sendRedirect("Success.html");
            } else {
                response.sendRedirect("error.html");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        } finally {
            // Close resources in finally block
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}