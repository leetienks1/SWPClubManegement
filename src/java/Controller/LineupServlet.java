/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ExpectedLineupDAO;
import DAO.MatchScheduleDAO;
import DAO.PlayerDAO;
import DAO.TeamDAO;
import Model.ExpectedLineups;
import Model.MatchSchedule;
import Model.Player;
import Model.Position;
import Model.Team;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.json.JSONParser;

/**
 *
 * @author Desktop
 */
public class LineupServlet extends HttpServlet {

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
            out.println("<title>Servlet LineupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LineupServlet at " + request.getContextPath() + "</h1>");
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
                    ListMatch(request, response);
                    break;
                case "LOAD":
                    LoadLineup(request, response);
                    break;
                case "GET":
                    GetLineup(request, response);
                    break;
                case "DELETE":
                    DeleteLineup(request, response);
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
        BufferedReader reader = request.getReader();
        String requestbody = reader.lines().collect((Collectors.joining(System.lineSeparator())));
        JsonElement jsonElement = JsonParser.parseString(requestbody);
        JsonObject jsonObject = jsonElement.getAsJsonObject();
        String action = jsonObject.get("action").getAsString();
        String matchID = jsonObject.get("matchID").getAsString();
        String note = jsonObject.get("note").getAsString();

        ExpectedLineupDAO exdao = new ExpectedLineupDAO();
        // Read the request body data
        JsonArray dataArray;
        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
//        responseJson.addProperty("status", "success");
//        responseJson.addProperty("message", gson.toJson(dataArray));

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(responseJson);
        out.flush();
        switch (action) {
            case "ADD":
                dataArray = jsonObject.getAsJsonArray("data");
                for (JsonElement jsonValue : dataArray) {
                    JsonObject player = jsonValue.getAsJsonObject();
                    String id = player.get("pid").getAsString();
                    String position = player.get("position").getAsString();
                    String top = player.get("top").getAsString();
                    String left = player.get("left").getAsString();
                    int pid = Integer.parseInt(id);
                    Double xlocation = Double.valueOf(left.substring(0, left.length() - 1));
                    Double ylocation = Double.valueOf(top.substring(0, top.length() - 1));
                    ExpectedLineups ex = new ExpectedLineups(Integer.parseInt(matchID), pid, note, Position.valueOf(position), xlocation, ylocation);
                    exdao.save(ex);
                    responseJson.addProperty("status", "Success");
                    responseJson.addProperty("message", gson.toJson(jsonElement));
                }
                break;
            case "UPDATE":
                ExpectedLineupDAO edao = new ExpectedLineupDAO();
                List<ExpectedLineups> lineups = edao.getAllLineupByMatchID(Integer.parseInt(matchID));
                dataArray = jsonObject.getAsJsonArray("data");
                if (lineups.size() != dataArray.size()) {
                    responseJson.addProperty("status", "Error");
                    responseJson.addProperty("message", "Mismatch between number of players in database and JSON data");
                } else {
                    // Iterate over each element in the JSON array and corresponding ExpectedLineups object
                    for (int i = 0; i < lineups.size(); i++) {
                        JsonObject player = dataArray.get(i).getAsJsonObject();

                        // Extract player details
                        String id = player.get("pid").getAsString();
                        String position = player.get("position").getAsString();
                        String top = player.get("top").getAsString();
                        String left = player.get("left").getAsString();

                        int pid = Integer.parseInt(id);
                        Double xlocation = Double.valueOf(left.substring(0, left.length() - 1));
                        Double ylocation = Double.valueOf(top.substring(0, top.length() - 1));

                        // Get the ExpectedLineups object
                        ExpectedLineups lineupToUpdate = lineups.get(i);

                        // Update the ExpectedLineups object with the new values
                        lineupToUpdate.setLineupName(note);
                        lineupToUpdate.setPlayerID(pid);
                        lineupToUpdate.setPosition(Position.valueOf(position));
                        lineupToUpdate.setxLocation(xlocation);
                        lineupToUpdate.setyLocation(ylocation);

                        // Save the updated ExpectedLineups object back to the database
                        edao.update(lineupToUpdate);
                    }

                    // Send response
                    responseJson.addProperty("status", "Success");
                    responseJson.addProperty("message", "Lineups updated successfully");
                }
                break;
            case "DELETE":
//                handleDelete(requestBody, response);
                break;
            default:
                response.setContentType("application/json");
                responseJson.addProperty("status", "Error");
                responseJson.addProperty("message", "Loi");
                out.print("{\"status\":\"error\",\"message\":\"Invalid action\"}");
                out.flush();
                break;
        }
    }

    public void DeleteLineup(HttpServletRequest request, HttpServletResponse response) {
        try {
            PrintWriter out = response.getWriter();
            String midString = request.getParameter("mid");
            int mid ;
            if (midString != null) {
                mid = Integer.parseInt(midString);
            } else {
                SendErrorMessage(out, "match ID is Null");
                return;

            }

            ExpectedLineupDAO exdao = new ExpectedLineupDAO();
            List<ExpectedLineups> listEx = exdao.getAllLineupByMatchID(mid);
            if (!listEx.isEmpty()) {
                for (ExpectedLineups ex : listEx) {
                    exdao.delete(ex.getLineupID());
                }
            } else {
                SendErrorMessage(out, "Delete Fail");
                return;
            }

            Gson gson = new Gson();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(listEx));
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void ListMatch(HttpServletRequest request, HttpServletResponse response) {
        try {
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            TeamDAO tdao = new TeamDAO();

            Map<Integer, String> homeTeam = new HashMap<>();
            Map<Integer, String> awayTeam = new HashMap<>();

            List<MatchSchedule> matches = mdao.getMatchNotYetTakePlace();

            for (MatchSchedule m : matches) {
                homeTeam.put(m.getHomeTeamID(), tdao.get(m.getHomeTeamID()).get().getTeamName());
                awayTeam.put(m.getAwayTeamID(), tdao.get(m.getAwayTeamID()).get().getTeamName());
            }

            Gson gson = new Gson();
            JsonObject json = new JsonObject();
            json.add("matches", gson.toJsonTree(matches));
            json.add("homeTeam", gson.toJsonTree(homeTeam));
            json.add("awayTeam", gson.toJsonTree(awayTeam));

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void LoadLineup(HttpServletRequest request, HttpServletResponse response) {
        try {
            TeamDAO tdao = new TeamDAO();

            ExpectedLineupDAO exdao = new ExpectedLineupDAO();
            List<ExpectedLineups> listEx = exdao.getAllNotDuplicate();
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            Map<Integer, String> homeTeam = new HashMap<>();
            Map<Integer, String> awayTeam = new HashMap<>();
            List<MatchSchedule> matches = new ArrayList<>();

            for (ExpectedLineups ex : listEx) {
                matches.add(mdao.get(ex.getMatchID()).orElse(null));
            }
            for (MatchSchedule m : matches) {
                homeTeam.put(m.getHomeTeamID(), tdao.get(m.getHomeTeamID()).get().getTeamName());
                awayTeam.put(m.getAwayTeamID(), tdao.get(m.getAwayTeamID()).get().getTeamName());
            }
            Gson gson = new Gson();
            JsonObject json = new JsonObject();
            json.add("matches", gson.toJsonTree(matches));
            json.add("lineups", gson.toJsonTree(listEx));
            json.add("homeTeam", gson.toJsonTree(homeTeam));
            json.add("awayTeam", gson.toJsonTree(awayTeam));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json.toString());
            response.getWriter().flush();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void GetLineup(HttpServletRequest request, HttpServletResponse response) {
        try {
            String eidString = request.getParameter("eid");
            ExpectedLineupDAO exdao = new ExpectedLineupDAO();
            PlayerDAO pdao = new PlayerDAO();
            List<Player> listPlayers = new ArrayList<>();
            if (eidString != null) {
                int eid = Integer.parseInt(eidString);
                List<ExpectedLineups> listEx = exdao.getAllLineupByMatchID(eid);
                for (ExpectedLineups ex : listEx) {
                    listPlayers.add(pdao.get(ex.getPlayerID()).orElse(null));
                }
                Gson gson = new Gson();
                JsonObject json = new JsonObject();
                json.add("players", gson.toJsonTree(listPlayers));
                json.add("lineups", gson.toJsonTree(listEx));
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json.toString());
                response.getWriter().flush();
            } else {
                Gson gson = new Gson();

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("Error");
                response.getWriter().flush();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void SendErrorMessage(PrintWriter out, String message) {
        Map<String, String> errors = new HashMap<>();

        errors.put("status", "error");
        errors.put("message", message);

        Gson gson = new Gson();

        out.print(gson.toJson(errors));
        out.flush();

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
