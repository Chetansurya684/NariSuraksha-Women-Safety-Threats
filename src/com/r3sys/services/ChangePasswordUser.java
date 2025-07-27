package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.dbcon.ConnectDB;

import pojo.User;

/**
 * Servlet implementation class ChangePasswordUser
 */
public class ChangePasswordUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordUser() {
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
		try
		{   String uemail=User.getUemail();
			String uPassword=request.getParameter("uPassword");
			String nPassword=request.getParameter("nPassword");
			
			

			System.out.println(uemail);
			
				Connection con=ConnectDB.getConnect();
				
				if(uemail!=null){
					
					
				
					PreparedStatement ps =con.prepareStatement("update user set upassword=? and uemail=?");
					

					ps.setString(1, uPassword);
					ps.setString(2, uemail);
					
					
					int i=ps.executeUpdate();
					
					if(i>0)
					{
						response.sendRedirect("UserPassChangedSuccess.html");
					}
					else
					{
						response.sendRedirect("error.html");
						
					}
				}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}