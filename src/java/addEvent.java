/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mustafa Kapadia
 */
@WebServlet(urlPatterns = {"/addEvent"})
public class addEvent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addEvent</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session=request.getSession(false);  
            String adminName = (String)session.getAttribute("adminname"),
                    eventId = request.getParameter("event-id"),
                    date = request.getParameter("date"),
                    name = request.getParameter("event-name"),
                    description = request.getParameter("event-description");
            
            Connection con;
            
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/EventManagementSystem","APP","1483");
                String query = "INSERT INTO EVENTS VALUES('" + eventId + "','" + name + "','" + date + "','" + description + "','" + adminName + "')";
                Statement statement = con.createStatement();
                int r = statement.executeUpdate(query);
                if(r > 0) {
                    out.println("Event Created Successfully Redirecting to Admin Home Page");
                    response.setHeader("Refresh", "2;url=adminHome.jsp");
                    
                } else {
                    out.println("There was a error while adding the event to database, redirecting to create event page");
                    response.setHeader("Refresh", "2;url=createEvent.jsp");
                }
            }
            catch(Exception e) {
                out.println(e.getMessage());
            }
            
            
            out.println("</body>");
            out.println("</html>");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
