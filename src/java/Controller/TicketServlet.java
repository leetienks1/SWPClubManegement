/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.TicketDAO;
import Model.Ticket;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zanis
 */
public class TicketServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TicketServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        try {

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    ListTicket(
                        request,
                        response
                    );
                    break;
                case "ADD":
                    AddTicket(
                        request,
                        response
                    );
                    break;
                case "UPDATE":
                    
                    break;
                case "DELETE":
                    DeleteTicket(
                        request,
                        response
                    );
                    break;
                default:
                    ListTicket(
                        request,
                        response
                    );
            }

        } catch (Exception ex) {

        }
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

    private void DeleteTicket(HttpServletRequest request, HttpServletResponse response) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        new TicketDAO().delete(cid);
        ListTicket(request, response);
    }

    private void AddTicket(HttpServletRequest request, HttpServletResponse response) {
        TicketDAO tDAO = new TicketDAO();
        
        Integer matchId = Integer.parseInt(request.getParameter("matchId"));
        int seatNumber = Integer.parseInt(request.getParameter("seatNumber"));
        String zone = request.getParameter("zone");
        BigDecimal price = BigDecimal.valueOf(Double.parseDouble(request.getParameter("price")));
        for (int i=1;i<=seatNumber;i++){
            Ticket t = new Ticket(matchId, zone+i, price);
        tDAO.save(t);
        }
        
        ListTicket(
            request,
            response
        );
    }

    private void ListTicket(HttpServletRequest request, HttpServletResponse response) {
        try {
            TicketDAO tdao = new TicketDAO();
            List<Ticket> list = tdao.getAll();
            request.getSession().setAttribute(
                        "sessionlist",
                list
            );
            response.sendRedirect("SALEMAN/listTicket.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
