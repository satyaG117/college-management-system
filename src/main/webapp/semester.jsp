<%-- 
    Document   : semester
    Created on : May 2, 2023, 9:35:54 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.erp.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Semester details</title>
        <%@ include file="partials/bootstrap.jsp"%>
        <style>
            .sem-details-container{
                border-left: 4px solid blue
            }
        </style>
    </head>
    <body>
        <%@ include file="partials/dashboard-nav.jsp" %>
        <%@ include file="partials/user-status.jsp" %>
        <div class="container">
            <div class="sem-details-container">
                <%
                        String id = (String)request.getParameter("id");
                        try {
                        DBConnection dbc = new DBConnection();
                        Connection con = dbc.getConnection();

                        String query = "SELECT sem.sem_id , sem.start_date , sem.end_date ,sem.sem_no , br.branch_name , sec.section_name FROM semester sem JOIN section sec ON sem.section_id = sec.section_id JOIN branch br ON br.branch_id = sec.branch_id WHERE sem_id=?";
                        PreparedStatement statement = con.prepareStatement(query);
                        statement.setString(1,id);
                        ResultSet sem = statement.executeQuery();
                        while(sem.next()){ %>
                <div class="p-2">
                    <span class="fw-bold">SEM ID : </span><small class="text-muted"><%= sem.getString(1) %></small>

                </div>
                <div class="row p-2">
                    <div class="col-3"><span class="fw-bold">SEM NO : </span><small><%= sem.getString(4) %></small></div>
                    <div class="col-3"><span class="fw-bold">BRANCH : </span><small><%=sem.getString(5)%></small></div>
                    <div class="col-3"><span class="fw-bold">SECTION : </span><small><%=sem.getString(6)%></small></div>
                </div>
                <div class="row p-2">
                    <div class="col-3"><span class="fw-bold">START : </span><small><%=sem.getString(2)%></small></div>
                    <div class="col-3"><span class="fw-bold">END : </span><small><%=sem.getString(3)%></small></div>
                </div>

                <% } %> 

            </div>
            <div class="container p-3 m-3">
                <%
                    query = "SELECT * FROM FACULTY";
                    statement = con.prepareStatement(query);
                    ResultSet faculties = statement.executeQuery();
                        
                    query = "SELECT * FROM SUBJECT";
                    statement = con.prepareStatement(query);
                    ResultSet subjects = statement.executeUpdate();
                        

                %>
                <h3>Add a class to this semester</h3>
                <form method="post" action="add-class">
                    <div class="mb-3">
                        <label for="subject" class="form-label">Select subject</label>
                        <select id="subject" class="form-select" name="subject" title="Select a subject" >
                            <%
                                while(subjects.next()){
                            %>
                            <option value="<%= subjects.getString(1) %>"> <%= subjects.getString(2) %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="faculty" class="form-label">Assign teacher</label>
                        <select id="faculty" class="form-select" name="faculty" title="Select a faculty" >
                            <%
                                while(faculties.next()){
                            %>
                            <option value="<%= faculties.getString(1) %>"> <%= faculties.getString(2) %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Select Days on which class is to be conducted</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="days[]" id="monday" value="monday">
                            <label class="form-check-label" for="monday">
                                Monday
                            </label>
                        </div>
                        
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="days[]" id="tuesday" value="tuesday">
                            <label class="form-check-label" for="tuesday">
                                Tuesday
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="days[]" id="wednesday" value="wednesday">
                            <label class="form-check-label" for="wednesday">
                                Wednesday
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="days[]" id="thursday" value="thursday">
                            <label class="form-check-label" for="thursday">
                                Thursday
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="days[]" id="friday" value="friday">
                            <label class="form-check-label" for="friday">
                                Friday
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="days[]" id="saturday" value="saturday">
                            <label class="form-check-label" for="saturday">
                                Saturday
                            </label>
                        </div>
                        
                    </div>
                        <button type="submit" class="btn btn-primary">Submit</button>

                </form>
            </div>

        </div><%con.close();
                statement.close();

            } catch (Exception e) { %>
        <h5 class="my-3">Unable to fetch content</h5>
        <% }
        %>
    </body>
</html>
