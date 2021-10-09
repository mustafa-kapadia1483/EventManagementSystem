<%-- 
    Document   : userHome
    Created on : 8 Oct, 2021, 9:14:22 PM
    Author     : Mustafa Kapadia
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*;" %>
<%@page import="java.sql.*;" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    </head>
    <body>
        
        <% 
            if(session.getAttribute("username") == null) {
                out.print("You are not allowed to see this page");
            } else {
        %>
        <div class="container">
                <nav class="navbar" role="navigation" aria-label="main navigation">
                    <div class="navbar-brand">
                      <a class="navbar-item" href="./">
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
                              <h3 class="title is-5 is-capitalized">Welcome <%= session.getAttribute("username") %></h3>
                          </div>
                        <div class="navbar-item">
                          <div class="buttons">
                              <a class="button is-secondary" href="LogOutUser">
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
            <form class="columns" method="GET" action="register">
                <article class="column">
                    <%
                        ResultSet resultSet = null;
                        LocalDate ld = LocalDate.now();
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/EventManagementSystem","APP","1483");
                            String query = "SELECT event_id, event_name, event_date, event_description FROM EVENTS WHERE event_date BETWEEN '" + ld + "' AND '" + ld.plusDays(7) + "'";
                            Statement statement = con.createStatement();
                            resultSet = statement.executeQuery(query);
                        }
                        catch(Exception e) {
                            out.println(e);
                        }
                    %>
                    <h2 class="title is-4">Current Events</h2>
                    <% while(resultSet.next()) { %>
                    <div class="card mt-2">
                        <header class="card-header">
                            <p class="card-header-title">
                                <% out.print(resultSet.getString("event_name")); %>
                            </p>
                        </header>
                        <div class="card-content">
                          <div class="content">
                              <% out.print(resultSet.getString("event_description")); %>
                              <br><br>
                              <% out.print("<time datetime=\"" + resultSet.getString("event_date") + "\">" + resultSet.getString("event_date") + "</time>"); %>
                          </div>
                        </div>
                        <footer class="card-footer">
                            <% out.print("<button class=\"card-footer-item button is-primary\" name=\"register-btn\" value=\"" + resultSet.getString("event_id") + "\">Register</button>"); %>
                         </footer>
                    </div>
                    <% } %>
                </article>
                
                <article class="column">
                    <%
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/EventManagementSystem","APP","1483");
                            String query = "SELECT event_id, event_name, event_date, event_description FROM EVENTS WHERE event_date BETWEEN '" + ld.plusDays(7) + "' AND '" + ld.plusDays(14) + "'";
                            Statement statement = con.createStatement();
                            resultSet = statement.executeQuery(query);
                        }
                        catch(Exception e) {
                            out.println(e);
                        }
                    %>
                    <h2 class="title is-4">Upcoming Events</h2>
                    <% while(resultSet.next()) { %>
                    <div class="card mt-2">
                        <header class="card-header">
                            <p class="card-header-title">
                                <% out.print(resultSet.getString("event_name")); %>
                            </p>
                        </header>
                        <div class="card-content">
                          <div class="content">
                              <% out.print(resultSet.getString("event_description")); %>
                              <br><br>
                              <% out.print("<time datetime=\"" + resultSet.getString("event_date") + "\">" + resultSet.getString("event_date") + "</time>"); %>
                          </div>
                        </div>
                        <footer class="card-footer">
                            <% out.print("<button class=\"card-footer-item button is-primary\" name=\"register-btn\" value=\"" + resultSet.getString("event_id") + "\">Register</button>"); %>
                         </footer>
                    </div>
                    <% } %>
                </article>
                
                <article class="column">
                    <%
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/EventManagementSystem","APP","1483");
                            String query = "SELECT event_id, event_name, event_date, event_description FROM EVENTS WHERE event_date < '" + ld + "'";
                            Statement statement = con.createStatement();
                            resultSet = statement.executeQuery(query);
                        }
                        catch(Exception e) {
                            out.println(e);
                        }
                    %>
                    <h2 class="title is-4">Past Events</h2>
                    <% while(resultSet.next()) { %>
                    <div class="card mt-2">
                        <header class="card-header">
                            <p class="card-header-title">
                                <% out.print(resultSet.getString("event_name")); %>
                            </p>
                        </header>
                        <div class="card-content">
                          <div class="content">
                              <% out.print(resultSet.getString("event_description")); %>
                              <br><br>
                              <% out.print("<time datetime=\"" + resultSet.getString("event_date") + "\">" + resultSet.getString("event_date") + "</time>"); %>
                          </div>
                        </div>
                        <footer class="card-footer">
                            <% out.print("<button class=\"card-footer-item button is-secondary\" disabled>Event Concluded</button>"); %>
                         </footer>
                    </div>
                    <% } %>
                </article>
            </form>
        </section>
         <section class="container mt-6">
                    <h2 class="title is-4">Registered For Events</h2>
                <article>
                
                    <%
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/EventManagementSystem","APP","1483");
                            String query = "SELECT event_name, event_date, event_description FROM EVENTS WHERE EVENT_ID IN (SELECT EVENT_ID FROM REGISTRATION WHERE USERNAME = '" + session.getAttribute("username") + "')";
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
