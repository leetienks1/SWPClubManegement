<%@page import="java.util.Map"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="Model.Team"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@page import="DAO.TeamDAO"%>
<%@page import="Model.PlayerStat"%>
<%@page import="java.util.List"%>
<%@page import="DAO.PlayerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
    </head>
    <body>
        <%
            int playerID = Integer.parseInt((String) request.getParameter("id"));
            PlayerDAO plDAO = new PlayerDAO();
            MatchScheduleDAO maDAO = new MatchScheduleDAO();
            TeamDAO teDAO = new TeamDAO();
            List<MatchSchedule> mList2 = maDAO.getMatchAlreadyStatistic();
            Map<Integer, String> TeamVS2 = new HashMap<>();
            for (MatchSchedule m : mList2) {
                Team teama = teDAO.get(m.getAwayTeamID()).get();
                Team teamh = teDAO.get(m.getHomeTeamID()).get();
                String vs = teamh.getTeamName() + " VS " + teama.getTeamName();
                TeamVS2.put(m.getMatchID(), vs);
            }
            request.setAttribute("teamvs", TeamVS2);

            List<PlayerStat> ps = plDAO.getPlayerStatss(playerID);
            request.setAttribute("playerStats", ps);
            request.setAttribute("playerID", playerID);
        %>
        <div>
            <%@include file="../COACH/CoachFun.jsp" %>
        </div>  
        <h1 style="text-align: center">Stats For <%=plDAO.get(playerID).get().getName()%></h1>
        <div class="coach-fun-content">

            <table class="table-course" border="1">

                <thead class="thead-form" style="background-color: #0d6efd;">

                    <tr>
                        <th>
                            Match Name
                        </th>
                        <th>
                            GoalsScored
                        </th>
                        <th>
                            YellowCards
                        </th>
                        <th>
                            RedCards
                        </th>
                        <th>
                            Assists
                        </th>
                    </tr>

                </thead>
                <tbody>

                    <c:forEach var="p" items="${playerStats}">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${teamvs[p.matchID] != null}">
                                        ${teamvs[p.matchID]}
                                    </c:when>
                                    <c:otherwise>
                                        ${p.matchID}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${p.goalsScored}</td>
                            <td>${p.yellowCards}</td>
                            <td>${p.redCards}</td>
                            <td>${p.assists}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            <i id="add-course-button" class="fas fa-plus"></i>
                        </td>
                    </tr>
                </tbody>

            </table>
            <%@include file="../COACH/addStats.jsp" %>

        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Ẩn left-bar mặc định khi trang được tải
                $("#leftBar").hide();
                
                if (localStorage.getItem('updateCourseFormVisible') === 'true') {
                    $("#update-course-form").show();
                } else {
                    $("#update-course-form").hide();
                }

                function toggleUpdateCourseForm() {
                    $("#update-course-form").toggle();
                    localStorage.setItem('updateCourseFormVisible', $("#update-course-form").is(":visible"));
                }

                function toggleLeftBar() {
                    $("#leftBar").toggle();
                }

                function toggleLoginForm() {
                    $("#logInForm").toggle();
                }

                function toggleAddCourseForm() {
                    $("#add-course-form").toggle();
                }

                $("#toggleLeftBarBtn").click(function () {
                    toggleLeftBar();
                });

                $(".toggleCloseLoginForm").click(function () {
                    toggleLoginForm();
                });

                $("#add-course-button").click(function () {
                    toggleAddCourseForm();
                });
                $("#add-course-close").click(function () {
                    toggleAddCourseForm();
                });

                $(".update-course-button").click(function () {
                    toggleUpdateCourseForm();
                });
                $("#update-course-close").click(function () {
                    toggleUpdateCourseForm();
                });
                $("#done-course-update").click(function () {
                    toggleUpdateCourseForm();
                });
            });
        </script>
    </body>
</html>
