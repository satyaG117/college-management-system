<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<%@include file="partials/bootstrap.jsp" %>
<link rel="stylesheet" href="styles/global.css"/>
<link rel="stylesheet" href="styles/dashboard.css"/>
</head>
<body>
    <!-- Redirect if not logged in -->
    <%
        if((String)session.getAttribute("email") == null){
            response.sendRedirect("index.jsp");
        }
    %>
    
    <%@include file="partials/dashboard-nav.jsp" %>
    <%@include file="partials/user-status.jsp" %>
    
    <%
        // import the admin dashboard if logged in as admin
        String role = (String)session.getAttribute("role");
        if((role != null) && (role.equals("admin"))){
    %>
    <%@include file="partials/admin-dashboard-items.jsp" %>
    <% 
        }
    %>
    
    <%@include file="partials/footer.jsp" %>
</body>
</html>