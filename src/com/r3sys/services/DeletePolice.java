package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.r3sys.dbcon.ConnectDB;

public class DeletePolice extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        
        String pidStr = request.getParameter("pid");
        
        
        if (pidStr == null || pidStr.trim().isEmpty()) {
            response.sendRedirect("DeletePolice.html?error=invalid_id");
            return;
        }

        int pid;
        try {
            pid = Integer.parseInt(pidStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("DeletePolice.html?error=invalid_id");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        
        try {
         
            con = ConnectDB.getConnect();
            
          
            String sql = "DELETE FROM police WHERE pid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            
            
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
               
                response.sendRedirect("DeletePolice.html?success=true");
            } else {
               
                response.sendRedirect("DeletePolice.html?error=not_found");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
           
            response.sendRedirect("DeletePolice.html?error=server_error");
        } finally {
            
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
	/*	int pid = Integer.parseInt(request.getParameter("pid"));
		try{
            Connection con = ConnectDB.getConnect();
			
			PreparedStatement ps=con.prepareStatement("delete from police where pid=?");
			ps.setInt(1,pid);
			int  rs=ps.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("DeletePolice.html");
			}
			else
			{
				response.sendRedirect("dashboard.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
		}
*/