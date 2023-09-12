

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acad menu</title>
        <link rel="stylesheet" href="styles/menu.css"/>
        <link rel="stylesheet" href="styles/global.css"/>
        <%@ include file="partials/bootstrap.jsp" %>
    </head>
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
            <h2>Academics Menu</h2>
            <a href="add-branch.jsp">
                <div class="card menu-item m-3">
                    <div class="card-body">
                        
                        Branch
                    </div>
                </div>
            </a>
            <a href="add-section.jsp">

                <div class="card menu-item m-3">
                    <div class="card-body">
                 
                        Section
                    </div>
                </div>
            </a>
            
            <a href="add-subject.jsp">

                <div class="card menu-item m-3">
                    <div class="card-body">
                 
                        Subject
                    </div>
                </div>
            </a>
            
            <a href="add-semester.jsp">

                <div class="card menu-item m-3">
                    <div class="card-body">
                 
                        Semester
                    </div>
                </div>
            </a>
        </div>
    </body>
</html>
