/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MatchScheduleDAO;
import DAO.MatchStatisticDAO;
import DAO.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.MatchSchedule;
import Model.MatchStatistic;
import Model.Team;
import Model.Tournament;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Desktop
 */
public class MatchScheduleController extends HttpServlet {

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
            out.println("<title>Servlet MatchScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MatchScheduleController at " + request.getContextPath() + "</h1>");
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

                    response.sendRedirect("/SWPClubManegement/ADMIN/adminListMatchSchedule.jsp");
                    break;
                case "ADD":
                    AddMatch(request, response);
                    break;
                case "LOAD":

                    break;
                case "UPDATE":
                    UpdateMatch(request, response);
                    break;
                case "DELETE":
//                    DeleteMatch(request, response);
                    break;
                default:

            }

        } catch (Exception ex) {

            Logger.getLogger(PlayerController.class.getName()).log(Level.SEVERE, null, ex);
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
        ListMatch(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DeleteMatch(request, response);
        } catch (SQLServerException ex) {
            Logger.getLogger(MatchScheduleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void ListMatch(HttpServletRequest request, HttpServletResponse response) {
        try {
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchStatisticDAO mstdao = new MatchStatisticDAO();
            TeamDAO tdao = new TeamDAO();
            List<Team> homeTeam = new ArrayList<>();
            List<Team> awayTeam = new ArrayList<>();
            String searchValue = request.getParameter("search");
            List<MatchSchedule> matches = null;
             List<MatchSchedule> matchesAlreadyStats = mdao.getMatchAlreadyStatistic();
//            List<MatchStatistic> mstList = new ArrayList<>();

            if (searchValue == null) {
                matches = mdao.getAll();
                for (MatchSchedule m : matches) {
                    homeTeam.add(tdao.get(m.getHomeTeamID()).get());
                    awayTeam.add(tdao.get(m.getAwayTeamID()).get());
//                    mstList.add(mstdao.get(m.getMatchID()).get());
                }

            } else {
                matches = mdao.SearchMatch(searchValue);
                for (MatchSchedule m : matches) {
                    homeTeam.add(tdao.get(m.getHomeTeamID()).get());
                    awayTeam.add(tdao.get(m.getAwayTeamID()).get());
                    
                }
            }

            // Chuyển đổi đối tượng bao bọc thành JSON
            // Sử dụng Gson để kiểm tra và chuyển đổi đối tượng bao bọc thành JSON
            Gson gson = new Gson();
            JsonObject json = new JsonObject();
            json.add("matches", gson.toJsonTree(matches));
            json.add("homeTeam", gson.toJsonTree(homeTeam));
            json.add("awayTeam", gson.toJsonTree(awayTeam));
            json.add("matchAlreadyStats", gson.toJsonTree(matchesAlreadyStats));
// Gửi đối tượng JSON dưới dạng phản hồi HTTP
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void AddMatch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchSchedule ms = new MatchSchedule();

            int awayTeam = Integer.parseInt(request.getParameter("awayteam"));

            int homeTeam = Integer.parseInt(request.getParameter("hometeam"));
            String location = request.getParameter("location");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate mathchDate = LocalDate.parse(request.getParameter("matchdate"), formatter);
            Tournament tour = ms.getTournament().valueOf(request.getParameter("tour"));
            ms.setAwayTeamID(awayTeam);
            ms.setHomeTeamID(homeTeam);
            ms.setLocation(location);
            ms.setMatchDate(mathchDate);
            ms.setTournament(tour);
            mdao.save(ms);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdateMatch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            MatchStatisticDAO mstdao = new MatchStatisticDAO();

            int mid = Integer.parseInt(request.getParameter("mid"));
            int awayTeam = Integer.parseInt(request.getParameter("awayteam1"));
            int homeTeam = Integer.parseInt(request.getParameter("hometeam1"));
            String location = request.getParameter("matchlocation");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate mathchDate = LocalDate.parse(request.getParameter("matchdate1"), formatter);

            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchSchedule ms = mdao.get(mid).get();
            if (!mstdao.getMatchStatByTeamID(ms.getAwayTeamID(), ms.getMatchID()).isEmpty()) {
                MatchStatistic mst = mstdao.getMatchStatByTeamID(ms.getAwayTeamID(), ms.getMatchID()).get();
                mst.setTeamID(awayTeam);
                mstdao.update(mst);
            }

            Tournament tour = ms.getTournament().valueOf(request.getParameter("tour1"));
            ms.setAwayTeamID(awayTeam);
            ms.setHomeTeamID(homeTeam);
            ms.setLocation(location);
            ms.setMatchDate(mathchDate);
            ms.setTournament(tour);
            mdao.update(ms);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void DeleteMatch(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLServerException {
        try {

            int mid = Integer.parseInt(request.getParameter("mid"));
            Gson gson = new Gson();
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            List<MatchSchedule> m = mdao.getAll();
            if (mdao.deleteB(mid) == true) {

                String json = gson.toJson(m);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            } else {
                String json = gson.toJson("fail");
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                response.getWriter().flush();
            }

        } catch (Exception e) {
            e.printStackTrace();

        }

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
