<%-- 
    Document   : view-faculty.jsp
    Created on : Apr 27, 2023, 12:16:06 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.erp.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Faculty</title>
        <%@ include file="partials/bootstrap.jsp" %>
        <link rel="stylesheet" href="styles/table.css"/>
    </head>
    <body>
        <%@ include file="partials/dashboard-nav.jsp" %>
        <%@ include file="partials/user-status.jsp" %>

        <!-- Modal -->
        <div class="modal fade" id="delete-modal" tabindex="-1" aria-labelledby="delete-modal-label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="delete-modal">Delete student profile</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete <span class="user-name"></span>'s account ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <a role="button" class="btn btn-danger confirm-delete-btn" href="#">Delete</a>
                    </div>
                </div>
            </div>
        </div>


        <div class="table-container container-fluid">
            <h2>Faculty members list</h2>
            <table class="table table-striped table-info">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Joined</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                try {
            DBConnection dbc = new DBConnection();
            Connection con = dbc.getConnection();

            String query = "SELECT * FROM faculty";
            PreparedStatement statement = con.prepareStatement(query);
            
            ResultSet rs = statement.executeQuery();
            while(rs.next()){ 
                    %>

                    <tr>
                        <th scope="row"><%= rs.getString(1) %></th>
                        <th scope="row"><%= rs.getString(2) %></th>
                        <th scope="row"><%= rs.getString(3) %></th>
                        <th scope="row"><%= rs.getString(4) %></th>
                        <th scope="row"><%= rs.getString(6) %></th>
                        <th scope="row"><%= rs.getString(8) %></th>
                        <th scope="row"> 
                            <a href="edit-faculty.jsp?id=<%= rs.getString(1) %>" role="button" class="btn btn-success m-2 btn-sm">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                </svg>
                            </a>
                            <button  role="button" class="btn btn-warning m-2 btn-sm delete-btn" data-bs-toggle="modal" data-bs-target="#delete-modal" data-id="<%= rs.getString(1)%>" data-name="<%= rs.getString(2)%>" data-entity="faculty">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
                                </svg>
                            </button>
                        </th>
                    </tr>

                    <% }
                    con.close();
                    statement.close();

                } catch (Exception e) { %>
                <p class="my-3">Unable to fetch content</p>
                <% }
                %>
                </tbody>

            </table>
        </div>
                <script type ="text/javascript" src="scripts/generate-delete-link.js"></script>


    </body>
</html>
