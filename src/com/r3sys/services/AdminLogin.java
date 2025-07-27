package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.r3sys.dbcon.ConnectDB;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try{
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        

		if(email.equals("admin@gmail.com") && password.equals("admin")) {
            response.sendRedirect("AdminDashboard.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}

}
/*
 Connection con = ConnectDB.getConnect();
		PreparedStatement ps1 = (PreparedStatement) con.prepareStatement("select * from admin where email=? and password = ?");
		ps1.setString(1, email);
		ps1.setString(2, password);
		java.sql.ResultSet rs = ps1.executeQuery();
*/
