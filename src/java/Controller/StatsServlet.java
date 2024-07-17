/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DashboardPlayerDAO;
import DAO.MatchScheduleDAO;
import DAO.PlayerDAO;
import Model.Dashboard1DTO;
import Model.MatchSchedule;
import Model.Player;
import Model.PlayerStat;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zanis
 */
public class StatsServlet extends HttpServlet {

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
            out.println("<title>Servlet StatsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatsServlet at " + request.getContextPath() + "</h1>");
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
                    ListStats(request, response);
                    break;
                case "ADD":
                    AddStats(request, response);
                    break;
                case "UPDATE":
                    UpdateStats(request, response);
                    break;
                case "DELETE":
                    
                    break;
                default:
                    ListStats(request, response);
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

    private void ListStats(HttpServletRequest request, HttpServletResponse response) {
        try{
            List<Dashboard1DTO> playerstats = new ArrayList<>();
        PlayerDAO pDAO = new PlayerDAO();
        MatchScheduleDAO mDAO = new MatchScheduleDAO();
        DashboardPlayerDAO d = new DashboardPlayerDAO();
        List<Player> allPlayer = pDAO.getAll();
            
            
        List<PlayerStat> pList = pDAO.getAllPlayerStats();
        List<MatchSchedule> mList = mDAO.getMatchAlreadyStatistic();
        
        request.getSession().setAttribute("all", allPlayer);
        
            response.sendRedirect("COACH/PlayerStats.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void AddStats(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PlayerDAO pDAO = new PlayerDAO();
        int pID,matchID,goalsscored,yellowcards,assists;
        pID = Integer.parseInt(request.getParameter("pid"));
        matchID = Integer.parseInt(request.getParameter("match"));
        goalsscored = Integer.parseInt(request.getParameter("goalsscored"));
        yellowcards = Integer.parseInt(request.getParameter("redcards"));
        assists = Integer.parseInt(request.getParameter("assists"));
        String sendto = "COACH/StatsInfor.jsp?id="+pID;
        pDAO.savePlayerStats(new PlayerStat(pID, matchID, goalsscored, assists, yellowcards, yellowcards));
        response.sendRedirect(sendto);
    }

    private void UpdateStats(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
