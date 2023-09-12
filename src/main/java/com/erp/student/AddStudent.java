
package com.erp.student;

import com.erp.dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.UUID;


public class AddStudent extends HttpServlet {

    
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = (String)request.getParameter("name");
        String phoneNo = (String)request.getParameter("phone");
        String email = (String)request.getParameter("email");
        String password = (String)request.getParameter("password");
        String gender = (String)request.getParameter("gender");
        String section = (String)request.getParameter("section");
        
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        
        HttpSession session = request.getSession();
        String adminId = (String)session.getAttribute("id");
        
        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "INSERT INTO student VALUES(?,?,?,?,?,?,?,?,CURRENT_DATE())";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1,id);
            statement.setString(2,name);
            statement.setString(3,email );
            statement.setString(4, phoneNo);
            statement.setString(5, password);
            statement.setString(6, gender);
            statement.setString(7, section);
            statement.setString(8, adminId);
            
            
            int i = statement.executeUpdate();
            // closing resources
            response.sendRedirect("view-students.jsp");
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
