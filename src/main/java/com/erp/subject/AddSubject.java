/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.erp.subject;

import com.erp.dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

/**
 *
 * @author ROG
 */
public class AddSubject extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subjectName = (String)request.getParameter("subject-name");
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        
        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "INSERT INTO subject VALUES(?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, subjectName);
            int i = statement.executeUpdate();
            // closing resources
            response.sendRedirect("add-subject.jsp");
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
