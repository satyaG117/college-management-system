package com.erp.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import com.erp.dao.*;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet(name = "AdminLogin", urlPatterns = {"/admin-login"})
public class AdminLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public AdminLogin() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");

        try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("id",rs.getString(1));
                session.setAttribute("email", email);
                session.setAttribute("role", "admin");
                response.sendRedirect("dashboard.jsp");
               
            } else {
                response.sendRedirect("admin-login.jsp");
            }
            // closing resources
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
