/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.erp.student;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import com.erp.dao.DBConnection;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ROG
 */
public class DeleteStudent extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = (String)request.getParameter("id");
        PrintWriter out = response.getWriter();
        try {
            
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "DELETE FROM student WHERE student_id=?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, id);
            
            int i = statement.executeUpdate();
            if(i == 1){
                response.sendRedirect("view-students.jsp");
            }else{
                response.setContentType("text/html");
                out.println("Couldn't perform operation");
                out.println("<a href=\"view-students.jsp\">Student-List</a>");
            }
            // closing resources
            con.close();
            statement.close();

        } catch (Exception e) {
            response.setContentType("text/html");
            
            out.println("<html>");
            out.println("<head><title>Error</title></head>");
            out.println("<body>");
            out.println("<h1>"+ e +"</h1>");
            out.println("</body></html>");
        }
    }

    
}
