package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.dbcon.ConnectDB;

/**
 * Servlet implementation class PoliceRespond
 */
public class PoliceRespond extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoliceRespond() {
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
		{
			String pemail = (request.getParameter("pemail"));
			//String address = request.getParameter("address");
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("select * from alerts where aid=?");
		
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				System.out.println("Account Number Already Present in the system...");
				response.sendRedirect("error.html");
			}
			else
			{
				Connection con1 = ConnectDB.getConnect();
				int aid=0;
				String adesc = request.getParameter("adesc");
				String address = request.getParameter("address");
				String astatus = request.getParameter("astatus");
			
	            PreparedStatement pst1 = con1.prepareStatement("insert into alerts  values (?, ?)");
	            pst1.setString(1, adesc);
	            pst1.setString(2, address);
	            pst1.setInt(3, aid);
	            pst1.setString(4, astatus);
	           
	            int i = pst1.executeUpdate();
	            if (i > 0)
	            {
	                
	                response.sendRedirect("RespondSuccessful.html");
	            } 
	            else 
	            {
	                System.err.println("Record not inserted");
	                response.sendRedirect("error.html");
	            }
			}
		}
	         catch (Exception e)
	         {
	            e.printStackTrace();
	        }
			
	}
}
