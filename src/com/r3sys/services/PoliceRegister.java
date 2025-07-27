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

public class PoliceRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PoliceRegister() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            // Get parameters from request
            String pname = request.getParameter("pname");
            String pstation = request.getParameter("pstation");
            String pcontact = request.getParameter("pcontact");
            String pemail = request.getParameter("pemail");
            String ppassword = request.getParameter("ppassword");
            
            // Validate required fields
            if (pname == null || pname.trim().isEmpty() ||
                pcontact == null || pcontact.trim().isEmpty() ||
                pemail == null || pemail.trim().isEmpty() ||
                ppassword == null || ppassword.trim().isEmpty()) {
                
                response.sendRedirect("error.html?reason=missing_fields");
                return;
            }
            
           
            con = ConnectDB.getConnect();
            
           
            String sql = "INSERT INTO police (pname, pstation, pcontact, pemail, ppassword) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            
            // Set parameters
            ps.setString(1, pname);
            ps.setString(2, pstation != null ? pstation : ""); // Handle null address
            ps.setString(3, pcontact);
            ps.setString(4, pemail);
            ps.setString(5, ppassword);
            
      
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("Success.html");
            } else {
                response.sendRedirect("error.html?reason=insert_failed");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html?reason=db_error");
        } finally {
           
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}