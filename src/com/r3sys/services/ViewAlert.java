package com.r3sys.services;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.dbcon.ConnectDB;

import javafx.scene.control.Alert;

/**
 * Servlet implementation class ViewAlert
 */
public class ViewAlert extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public ViewAlert() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM alerts ORDER BY adate DESC");
            ResultSet rs = ps.executeQuery();
            
            List<Alert> alertsList = new ArrayList<>();
            
            while(rs.next()) {
                Alert alert = new Alert();
                alert.setAid(rs.getInt("aid"));
                alert.setAuserld(rs.getString("auserld"));
                alert.setAloc(rs.getString("aloc"));
                alert.setAlertype(rs.getString("alertype"));
                alert.setAdesc(rs.getString("adesc"));
                alert.setAdate(rs.getString("adate"));
                alert.setAstatus(rs.getString("astatus"));
                alertsList.add(alert);
            }
            
            request.setAttribute("alertsList", alertsList);
            request.getRequestDispatcher("ViewAlerts.jsp").forward(request, response);
            
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}