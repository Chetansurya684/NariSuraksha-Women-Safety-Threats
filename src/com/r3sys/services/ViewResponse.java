package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.dbcon.ConnectDB;

 // Make sure this matches the form's action in JSP
public class ViewResponse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewResponse() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int aid = 0;
        String astatus = request.getParameter("astatus");

        try {
            aid = Integer.parseInt(request.getParameter("aid"));
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
            request.setAttribute("message", "Invalid alert ID");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = ConnectDB.getConnect(); // Ensure this method returns a valid DB connection

            String sql = "UPDATE alerts SET astatus = ? WHERE aid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, astatus);
            ps.setInt(2, aid);

            int result = ps.executeUpdate();

            if (result > 0) {
                // Optional: add success feedback via session or request attributes
                System.out.println("Alert status updated to: " + astatus);
            } 
            else
            {
                System.out.println("Failed to update alert status for aid: " + aid);
            }

            // Redirect to alert-fetching servlet (update list)
            response.sendRedirect("PoliceRespond.jsp"); // Replace with your actual servlet name if different

        }
        catch (Exception e)
        {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
