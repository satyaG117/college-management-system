<%-- 
    Document   : teacher-menu
    Created on : Apr 27, 2023, 11:59:31 AM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher's Menu</title>
        <link rel="stylesheet" href="styles/menu.css"/>
        <link rel="stylesheet" href="styles/global.css"/>
        <%@ include file="partials/bootstrap.jsp" %>
    </head>
    <body>
        <%
              if(session == null || session.getAttribute("role") == null || !("admin".equals((String)session.getAttribute("role")))){
              response.sendRedirect("dashboard.jsp");
            }
            
        %>
        <%@ include file="partials/dashboard-nav.jsp" %>
        <%@ include file="partials/user-status.jsp" %>
        <div class="container col-md-6 offset-md-3 text-center p-3 my-5">
            <h2>Faculty Menu</h2>
            <a href="add-faculty.jsp">
                <div class="card menu-item m-3">
                    <div class="card-body">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
                        Add a new faculty member
                    </div>
                </div>
            </a>
            <a href="view-faculty.jsp">

                <div class="card menu-item m-3">
                    <div class="card-body">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                        View faculty member profiles
                    </div>
                </div>
            </a>
        </div>
    </body>
</html>
