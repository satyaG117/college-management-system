<%-- 
    Document   : faculty-registration-form
    Created on : Apr 14, 2023, 5:43:26 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Faculty</title>
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
            <form class="border p-4 registration-form" action="add-faculty" method="post">
                <h2>Register a new faculty</h2>
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


                <button type="submit" class="btn btn-primary">Register</button>
            </form>
        </div>
    </body>
</html>
