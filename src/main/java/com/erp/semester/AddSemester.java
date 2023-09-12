/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.erp.semester;

import com.erp.dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.UUID;

/**
 *
 * @author ROG
 */
public class AddSemester extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        
        
        int semNo = Integer.parseInt(request.getParameter("sem-no"));
        String sectionId = (String) request.getParameter("section");
        String startDateString = (String) request.getParameter("start-date");
        String endDateString = (String) request.getParameter("end-date");
        
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        
        
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); // set date format
            java.util.Date startDateParsed = format.parse(startDateString); // parse date string to java.util.Date object
            java.sql.Date startDate = new java.sql.Date(startDateParsed.getTime());

            java.util.Date endDateParsed = format.parse(endDateString); // parse date string to java.util.Date object
            java.sql.Date endDate = new java.sql.Date(endDateParsed.getTime());

            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "INSERT INTO semester VALUES(?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1,id);
            statement.setInt(2,semNo);
            statement.setString(3,sectionId);
            statement.setDate(4,startDate);
            statement.setDate(5,endDate);
            
            int i = statement.executeUpdate();
            // closing resources
            response.sendRedirect("add-semester.jsp");
            con.close();
            statement.close();


        } catch (Exception e) {
            out.print(e);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
