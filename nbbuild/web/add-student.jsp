<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.erp.dao.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student</title>
        <%@ include file="partials/bootstrap.jsp"%>
    </head>
    <body>

        <%
              if(session == null || session.getAttribute("role") == null || !("admin".equals((String)session.getAttribute("role")))){
              response.sendRedirect("dashboard.jsp");
            }
            
        %>
        <%@ include file="partials/dashboard-nav.jsp" %>
        <%@ include file="partials/user-status.jsp" %>

        <div class="container col-lg-6 offset-lg-3 my-5">
            <form class="border p-4 registration-form" action="add-student" method="post">
                <h2>Register a new sudent</h2>
                <hr />

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                    <p class="feedback-message"></p>
                </div>

                <div class="mb-3">
                    <label for="phoneno" class="form-label">Phone number</label>
                    <input type="text" class="form-control" id="phoneno" name="phone">
                    <p class="feedback-message"></p>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email">
                    <p class="feedback-message"></p>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                    <p class="feedback-message"></p>
                </div>
                <div class="mb-3">
                    <label for="rtpassword" class="form-label">Retype Password</label>
                    <input type="password" class="form-control" id="rtpassword" name="rtpassword">
                    <p class="feedback-message"></p>
                </div>
                <div class="mb-3">
                    <label class="form-label">Select Gender</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
                        <label class="form-check-label" for="male">
                            Male
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                        <label class="form-check-label" for="female">
                            Female
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="other" value="other">
                        <label class="form-check-label" for="other">
                            Other
                        </label>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Section</label>
                    <select class="form-select" name="section">

                        <%
                            try {
                        DBConnection dbc = new DBConnection();
                        Connection con = dbc.getConnection();

                        String query = "SELECT s.section_id , b.branch_name , s.section_name  FROM section s JOIN branch b ON s.branch_id = b.branch_id";
                        PreparedStatement statement = con.prepareStatement(query);
            
                        ResultSet rs = statement.executeQuery();
                        while(rs.next()){ %>
                        <option value="<%= rs.getString(1) %>"> <%= rs.getString(2) %> - <%= rs.getString(3) %></option>
                        <% }
                        con.close();
                        statement.close();

                    } catch (Exception e) { %>
                        <h5 class="my-3">Unable to fetch content</h5>
                        <% }
                        %>

                    </select>
                </div>


                <button type="submit" class="btn btn-primary">Register</button>
            </form>
        </div>
    </body>
</html>
