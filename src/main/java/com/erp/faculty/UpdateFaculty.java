/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.erp.faculty;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import com.erp.dao.*;

/**
 *
 * @author ROG
 */
public class UpdateFaculty extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = (String)request.getParameter("id");
        String name = (String)request.getParameter("name");
        String phoneNo = (String)request.getParameter("phone");
        String gender = (String)request.getParameter("gender");
      
       
        
        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "UPDATE faculty SET name=? , phone_no=?,gender=? WHERE f_id=?";
            PreparedStatement statement = con.prepareStatement(query);
            
            statement.setString(1,name);
            statement.setString(2,phoneNo);
            statement.setString(3,gender);
            statement.setString(4,id);
            
            
            
            int i = statement.executeUpdate();
//            PrintWriter out = response.getWriter();
//            out.println(i);
//             closing resources
            response.sendRedirect("view-faculty.jsp");
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
