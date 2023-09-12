
package com.erp.section;

import com.erp.dao.DBConnection;
import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author ROG
 */
public class AddSection extends HttpServlet {

   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        
        String branchId = request.getParameter("branch");
        String sectionName = request.getParameter("section-name");
        
        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "INSERT INTO section VALUES(?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, sectionName);
            statement.setString(3, branchId);
            int i = statement.executeUpdate();
            // closing resources
            response.sendRedirect("add-section.jsp");
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
