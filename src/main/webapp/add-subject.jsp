<%-- 
    Document   : add-subject
    Created on : Apr 30, 2023, 5:11:14 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.erp.dao.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Subject</title>
        <%@ include file="partials/bootstrap.jsp"%>
        <link rel="stylesheet" href="styles/global.css"/>
    </head>
    <body>
        <%
              if(session == null || session.getAttribute("role") == null || !("admin".equals((String)session.getAttribute("role")))){
              response.sendRedirect("dashboard.jsp");
            }
            
        %>
        <%@ include file="partials/dashboard-nav.jsp" %>
        <%@ include file="partials/user-status.jsp" %>

        <div class="container my-3 p-3 border col-lg-4 offset-lg-4">
            <h2>Add a subject</h2>
            <form action="add-subject" method="post">
                <div class="mb-3">
                    <label for="subject" class="form-label">Subject name</label>
                    <input type="text" class="form-control" id="subject" name="subject-name">                
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <div class="container my-3 p-3 border col-lg-4 offset-lg-4">
            <h2>Existing subjects</h2>
            <%
                try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "SELECT * FROM subject";
            PreparedStatement statement = con.prepareStatement(query);
            
            ResultSet rs = statement.executeQuery();
            while(rs.next()){ %>
            <div class="card m-2">
                <div class="card-body">
                    <%= rs.getString(2) %>
                </div>
            </div>
            <% }
            con.close();
            statement.close();

        } catch (Exception e) { %>
        <h5 class="my-3">Unable to fetch content</h5>
       <% }
            %>
        </div>

    </body>
</html>
