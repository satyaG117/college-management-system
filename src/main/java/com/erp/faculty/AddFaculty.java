/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.erp.faculty;

import com.erp.dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

/**
 *
 * @author ROG
 */
public class AddFaculty extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = (String) request.getParameter("name");
        String phoneNo = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        String gender = (String) request.getParameter("gender");

        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();

        HttpSession session = request.getSession();
        String adminId = (String) session.getAttribute("id");

        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "INSERT INTO faculty VALUES(?,?,?,?,?,?,?,CURRENT_DATE())";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, name);
            statement.setString(3, email);
            statement.setString(4, phoneNo);
            statement.setString(5, password);
            statement.setString(6, gender);
            statement.setString(7, adminId);

            int i = statement.executeUpdate();
            // closing resources
            response.sendRedirect("view-faculty.jsp");
            con.close();
            statement.close();

        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head><title>Error</title></head>");
            out.println("<body>");
            out.println("<h1>" + e + "</h1>");
            out.println("</body></html>");
        }

    }
}
