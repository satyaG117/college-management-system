
package com.erp.branch;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.util.UUID;


import com.erp.dao.DBConnection;

/**
 *
 * @author ROG
 */
public class AddBranch extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String branchName = (String)request.getParameter("branch-name");
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        
        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "INSERT INTO branch VALUES(?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, branchName);
            int i = statement.executeUpdate();
            // closing resources
            response.sendRedirect("add-branch.jsp");
            con.close();
            statement.close();

        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head><title>Error</title></head>");
            out.println("<body>");
            out.println("<h1>"+ e +"</h1>");
            out.println("</body></html>");
        }

    }

}
