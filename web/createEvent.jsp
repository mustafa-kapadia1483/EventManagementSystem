<%-- 
    Document   : createEvent
    Created on : 8 Oct, 2021, 10:09:49 PM
    Author     : Mustafa Kapadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Event</title>
        
        <!-- Bulma CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
        
        <link href="https://cdn.jsdelivr.net/npm/bulma-calendar@6.0.7/dist/css/bulma-calendar.min.css" rel="stylesheet">
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
                      <a class="navbar-item" href="">
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
                              <strong>View Events</strong>
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
            <div class="columns is-centered">
                <form class="column is-half" method="GET" action="addEvent">
                    
                    <div class="field">
                        <label class="label">Event ID:</label>
                        <div class="control">
                            <input class="input" type="text" placeholder="" name="event-id">
                        </div>
                     </div>
                    
                    <div class="field">
                        <label class="label">Event Name</label>
                        <div class="control">
                            <input class="input" type="text" placeholder="" name="event-name">
                        </div>
                     </div>
                    
                    <div class="field">
                        <label class="label">Select the Date of the event</label>
                        <div class="control">
                            <input class="input" type="date" name="date">
                        </div>
                      </div>
                    
                    <div class="field">
                        <label class="label">Event Description</label>
                        <div class="control">
                            <textarea class="textarea" placeholder="Textarea" name="event-description"></textarea>
                        </div>
                     </div>
                    
                    <div class="field">
                        <div class="control">
                          <button class="button is-link">Create Event</button>
                        </div>
                      </div>
                </form>
            </div>
        </section>
        
        <% } %>
    </body>
</html>
