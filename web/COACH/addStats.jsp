<%@page import="Model.PlayerStat"%>
<%@page import="DAO.PlayerDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Team"%>
<%@page import="DAO.TeamDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    MatchScheduleDAO mDAO = new MatchScheduleDAO();
    TeamDAO tDAO = new TeamDAO();
    PlayerDAO pdao = new PlayerDAO();
    int playerid = Integer.parseInt(request.getParameter("id"));
    List<PlayerStat> psList = pdao.getPlayerStatss(playerid);
    List<MatchSchedule> mList = mDAO.getMatchAlreadyStatistic();
    Map<Integer, String> TeamVS = new HashMap<>();

    // Lọc danh sách các trận đấu không có trong danh sách thống kê của người chơi
    List<MatchSchedule> filteredList = new ArrayList<>();
    for (MatchSchedule ms : mList) {
        boolean matchFound = false;
        for (PlayerStat pstats : psList) {
            if (ms.getMatchID() == pstats.getMatchID()) {
                matchFound = true;
                break;
            }
        }
        if (!matchFound) {
            filteredList.add(ms);
        }
    }

    for (MatchSchedule m : filteredList) {
        Team teama = tDAO.get(m.getAwayTeamID()).get();
        Team teamh = tDAO.get(m.getHomeTeamID()).get();
        String vs = teamh.getTeamName() + " VS " + teama.getTeamName();
        TeamVS.put(m.getMatchID(), vs);
    }
    
    if (filteredList.isEmpty()) {
        TeamVS.put(0, "none");
    }

    request.setAttribute("match", filteredList);
    request.setAttribute("teamvs", TeamVS);
%>
<div id="add-course-form" class="hidden">
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../StatsServlet" method="GET" style="transition: ease-in 0.5s">
            <i id="add-course-close" class="fas fa-times"></i>
            <h3 class="form-heading">Add New Stats</h3>
            <input type="hidden" name="command" value="ADD" />
            <input type="hidden" name="pid" value="<%=playerid%>" />

            <div class="form-group">
                <label>Match</label>
                <select name="match" required="">
                    <c:forEach var="entry" items="${teamvs}">
                        <option value="${entry.key}">${entry.value}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <input type="number" name="goalsscored" placeholder="Goals Scored" value="" required=""/>
            </div>
            <div class="form-group">
                <input type="number" name="yellowcards" placeholder="Yellow Cards" value="" required=""/>
            </div>
            <div class="form-group">
                <input type="number" name="redcards" placeholder="Red Cards" value="" required=""/>
            </div>
            <div class="form-group">
                <input type="number" name="assists" placeholder="Assists" value="" required=""/>
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
