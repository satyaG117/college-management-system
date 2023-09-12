<%-- 
    Document   : edit-faculty
    Created on : Apr 30, 2023, 3:14:09 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.erp.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit faculty</title>
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
        
        <%
               String id = (String)request.getParameter("id");
               try {
           DBConnection dbc = new DBConnection();
           Connection con = dbc.getConnection();

           String query = "SELECT f_id , name  , phone_no , gender FROM faculty WHERE f_id = ?";
           PreparedStatement statement = con.prepareStatement(query);
           statement.setString(1,id);
            
           ResultSet rs = statement.executeQuery();
           while(rs.next()){ 
                String gender = (String)rs.getString(4);
            %>
            <div class="container col-lg-6 offset-lg-3 my-5">
            <form class="border p-4 registration-form" action="update-faculty" method="post">
                <h2>Edit faculty details</h2>
                <hr />
                <input type="hidden" value="<%= rs.getString(1)%>" name="id"/>
                
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString(2)%>">
                    <p class="feedback-message"></p>
                </div>
                    <div class="mb-3">
                    <label for="phoneno" class="form-label">Phone number</label>
                    <input type="text" class="form-control" id="phoneno" name="phone" value="<%= rs.getString(3)%>">
                    <p class="feedback-message"></p>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Select Gender</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" <% if (gender.equals("male")) {%> checked <% }%> >
                        <label class="form-check-label" for="male">
                            Male
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female" <% if (gender.equals("female")) {%> checked <% }%>>
                        <label class="form-check-label" for="female">
                            Female
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="other" value="other" <% if (gender.equals("other")) {%> checked <% }%>>
                        <label class="form-check-label" for="other">
                            Other
                        </label>
                    </div>
                </div>

                
               


                <button type="submit" class="btn btn-primary">Edit</button>
            </form>
        </div>
        <% }
        con.close();
        statement.close();

    } catch (Exception e) { %>
        <h5 class="my-3">Unable to fetch content</h5>
        <% }
        %>

       
        
    </body>
</html>
