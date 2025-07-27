package com.r3sys.services;
import java.sql.*;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.r3sys.dbcon.ConnectDB;

import pojo.User;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
			String uemail = request.getParameter("uemail");
	        String upassword = request.getParameter("upassword");
        Connection con = ConnectDB.getConnect();
		PreparedStatement ps1 =  (PreparedStatement) con.prepareStatement("select * from user where uemail=? and upassword=?");
		ps1.setString(1, uemail);
		ps1.setString(2, upassword);
		java.sql.ResultSet rs = ps1.executeQuery();
		if(rs.next()){
			User.setUemail(rs.getString(5));
			response.sendRedirect("UserDashboard.html");
		}
		else{
			response.sendRedirect("index.jsp");
		}

       
       
	}
		catch(Exception e)
		{
			
		}
}
}

	
