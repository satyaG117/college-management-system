<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.erp.dao.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Section</title>
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
            <h2>Add a section</h2>
            <form action="add-section" method="post">
                <div class="mb-3">
                    <label for="section" class="form-label">Section name</label>
                    <input type="text" class="form-control" id="section" name="section-name">                
                </div>

                <div class="mb-3">
                    <label for="branch" class="form-label">Select branch</label>
                    <select id="branch" class="form-select" name="branch" title="Select a branch">
                        <%
                try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "SELECT * FROM branch";
            PreparedStatement statement = con.prepareStatement(query);
            
            ResultSet rs = statement.executeQuery();
            while(rs.next()){ %>
                        <option value="<%= rs.getString(1) %>"> <%= rs.getString(2) %></option>
                        <% }
                        con.close();
                        statement.close();

                    } catch (Exception e) { %>
                        <p class="my-3">Unable to fetch content</p>
                        <% }
                        %>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <div class="container my-3 p-3 border col-lg-4 offset-lg-4">
            <h2>Existing sections</h2>
            <%
                try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "SELECT b.branch_name , s.section_name  FROM section s JOIN branch b ON s.branch_id = b.branch_id";
            PreparedStatement statement = con.prepareStatement(query);
            
            ResultSet rs = statement.executeQuery();
            while(rs.next()){ %>
            <div class="card m-2">
                <div class="card-body">
                    <%= rs.getString(1) %> - <%= rs.getString(2) %>
                </div>
            </div>
            <% }
            con.close();
            statement.close();

        } catch (Exception e) { %>
            <p class="my-3">Unable to fetch content</p>
            <% }
            %>
        </div>

    </body>
</html>
