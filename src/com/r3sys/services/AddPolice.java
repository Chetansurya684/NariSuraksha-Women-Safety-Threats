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

public class AddPolice extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Validate input parameters
        String pname = request.getParameter("pname");
        String pemail = request.getParameter("pemail");
        String pcontact = request.getParameter("pcontact");
        String pstation = request.getParameter("pstation");
        
        if (isEmpty(pname) || isEmpty(pemail) || isEmpty(pcontact)) {
            response.sendRedirect("Addpolice.html?error=missing_fields");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = ConnectDB.getConnect();
            String sql = "INSERT INTO police(pname, pemail, pcontact, pstation) VALUES(?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, pname.trim());
            ps.setString(2, pemail.trim());
            ps.setString(3, pcontact.trim());
            ps.setString(4, pstation.trim());
            
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("Addpolice.html?success=true");
            } else {
                response.sendRedirect("Addpolice.html?error=database_error");
            }
        } catch (SQLException e) {
            log("Database error in AddPolice servlet", e);
            response.sendRedirect("Addpolice.html?error=server_error");
        } finally {
            closeResources(ps, con);
        }
    }
    
    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }
    
    private void closeResources(AutoCloseable... resources) {
        for (AutoCloseable resource : resources) {
            if (resource != null) {
                try {
                    resource.close();
                } catch (Exception e) {
                    log("Error closing resource", e);
                }
            }
        }
    }
}
		
		/* 
		String pname = request.getParameter("pname");
		 
	    String pemail = request.getParameter("pemail");
	    String pcontact = request.getParameter("pcontact");
	    
	    try{
	    	Connection con= ConnectDB.getConnect();
        	PreparedStatement ps=con.prepareStatement("insert into  police(pname, pemail, pcontact) values(?,?,?)");
        	
            ps.setString(1, pname);
            ps.setString(2, pemail);
            ps.setString(3, pcontact);
             int rs = ps.executeUpdate();
         

			if(rs>0)
			{
				response.sendRedirect("Addpolice.html");
			}
			else
			{
				
				response.sendRedirect("index.jsp");
			}
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	}

}
*/
