<%-- 
    Document   : add-semester
    Created on : May 1, 2023, 8:19:58 AM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.erp.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add sem</title>
        <%@ include file="partials/bootstrap.jsp"%>
        <link rel="stylesheet" href="styles/global.css"/>
        <link rel="stylesheet" href="styles/table.css"/>
    </head>
    <body>
        <%
              if(session == null || session.getAttribute("role") == null || !("admin".equals((String)session.getAttribute("role")))){
              response.sendRedirect("dashboard.jsp");
            }
            
        %>
        <%@ include file="partials/dashboard-nav.jsp" %>
        <%@ include file="partials/user-status.jsp" %>
        <div class="row p-3 m-3">
            <div class="col-lg-4 border m-3 p-2">
                <h2>Add a new semester</h2>
                <form action="add-semester" method="post">
                    <div class="mb-3">
                        <label for="sem-no" class="form-label">Enter semester no.</label>
                        <input type="number" class="form-control" id="sem-no" name="sem-no">                
                    </div>

                    <div class="mb-3">
                        <label for="start-date" class="form-label">Enter start date</label>
                        <input type="date" class="form-control" id="start-date" name="start-date" />
                    </div>
                    <div class="mb-3">
                        <label for="end-date" class="form-label">Enter end date</label>
                        <input type="date" class="form-control" id="end-date" name="end-date" />
                    </div>

                    <div class="mb-3">
                        <label for="section" class="form-label">Select a section</label>
                        <select id="section" class="form-select" name="section" title="select a section">

                            <%
                            try {
                        DBConnection dbc = new DBConnection();
                        Connection con = dbc.getConnection();

                        String query = "SELECT s.section_id , b.branch_name , s.section_name  FROM section s JOIN branch b ON s.branch_id = b.branch_id";
                        PreparedStatement statement = con.prepareStatement(query);
            
                        ResultSet sections = statement.executeQuery();
                        while(sections.next()){ %>
                            <option value="<%= sections.getString(1) %>"> <%= sections.getString(2) %> - <%= sections.getString(3) %></option>
                            <% } %>
                            

                        </select>
                    </div>



                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="border col-lg-7 m-3 p-2 table-container sem-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">SECTION</th>
                            <th scope="col">SEM NO</th>
                            <th scope="col">START</th>
                            <th scope="col">END</th>
                            <th scope="col">ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            query = "SELECT sem.sem_id , sem.start_date , sem.end_date ,sem.sem_no , br.branch_name , sec.section_name FROM semester sem JOIN section sec ON sem.section_id = sec.section_id JOIN branch br ON br.branch_id = sec.branch_id";
                            statement = con.prepareStatement(query);
                            ResultSet sems = statement.executeQuery();
                            while(sems.next()){
                        %>
                        <tr>
                            <td><%=sems.getString(5) %> - <%=sems.getString(6) %></td>
                            <td><%=sems.getString(4) %></td>
                            <td><%=sems.getString(2) %></td>
                            <td><%=sems.getString(3) %></td>
                            <td>
                                <a href="semester.jsp?id=<%=sems.getString(1)%>" class="btn btn-sm btn-primary" role="button">
                                    Details
                                </a>
                            </td>
                        </tr>
                        <% }con.close();
                            statement.close();

                        } catch (Exception e) { %>
                            <h5 class="my-3">Unable to fetch content</h5>
                            <% }
                            %>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
