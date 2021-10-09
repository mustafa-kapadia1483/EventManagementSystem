<%-- 
    Document   : adminHome
    Created on : 8 Oct, 2021, 9:37:41 PM
    Author     : Mustafa Kapadia
--%>

<%@page import="java.util.*;" %>
<%@page import="java.sql.*;" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        
        <!-- Bulma CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    </head>
    <body>
        
        <% 
            if(session.getAttribute("adminname") == null) {
                out.print("You are not allowed to see this page");
            } else {
        %>
        <div>
            <div class="container">
                <nav class="navbar" role="navigation" aria-label="main navigation">
                    <div class="navbar-brand">
                      <a class="navbar-item" href="./adminHome.jsp">
                          <strong>Event Management System</strong>
                      </a>

                      <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                      </a>
                    </div>

                    <div id="navbarBasicExample" class="navbar-menu">

                      <div class="navbar-end">
                          <div class="navbar-item">
                              <h3 class="title is-5 is-capitalized">Welcome <%= session.getAttribute("adminname") %></h3>
                          </div>
                        <div class="navbar-item">
                          <div class="buttons">
                              <a class="button is-primary" href="./createEvent.jsp">
                              <strong>Create Event</strong>
                            </a>
                              <a class="button is-secondary" href="LogOutAdmin">
                              <strong>Log Out</strong>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </nav>
            </div>
        </div>
         <section class="container mt-6">
                    <h2 class="title is-4">Events Created</h2>
                <article>
                
                    <%
                        ResultSet resultSet = null;
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/EventManagementSystem","APP","1483");
                            String query = "SELECT event_name, event_date, event_description FROM EVENTS WHERE CREATED_BY = '" + (String)session.getAttribute("adminname") + "'";
                            Statement statement = con.createStatement();
                            resultSet = statement.executeQuery(query);
                        }
                        catch(Exception e) {
                            out.println(e);
                        }
                            while(resultSet.next()) {
                     %>
                     <div class="card mt-2">
                        <header class="card-header">
                            <p class="card-header-title">
                                <% out.print(resultSet.getString(1));%>
                            </p>
                        </header>
                        <div class="card-content">
                          <div class="content">
                              <% out.print(resultSet.getString(3));%>
                          </div>
                        </div>
                    </div>
                        <%
                            }
                        %>
                        </article>
        </section>
                          <% } %>
    </body>
</html>
