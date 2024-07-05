<%@page import="Model.MatchStatistic"%>
<%@page import="Model.Team"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="java.util.List"%>
<%@page import="DAO.TeamDAO"%>
<%@page import="DAO.MatchStatisticDAO"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Match Schedule</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <!--<link rel="stylesheet" href="../CSS//>-->


        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f2f2f2;
                background-position: center; /* Center the image */
                background-repeat: no-repeat;
                background-size: cover;
            }

            h1, h2 {
                text-align: center;
                color: #333;
            }
            tr
            {
                cursor: pointer;
            }
            td, th
            {
                text-align: center;
            }
            table#example {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 1em;
                font-family: 'Arial', sans-serif;
            }

            table#example tbody tr {
                border-bottom: 1px solid #dddddd;
                transition: transform 0.2s ease, border-left 0.2s ease, box-shadow 0.2s ease;

            }
            table#example tbody td {
                font-family: fantasy;

                padding: 12px 0;
                align-items: center;
                text-align: center;
                border: 0;
                width: 16.666%;  /* Adjust width as needed */
                height: 3rem;
                vertical-align: middle;
                border-left: rgb(98,45,95) 0px solid;
                font-size: 1.2rem;
                font-weight: 400;
                color: black;


            }
            table#example tbody tr:hover
            {
                border-radius: 25px;
                transform: scale(1.025);
                border-left: rgb(98,45,95) 5px solid;
                box-shadow: 0 0 10px rgba(98, 45, 95, 0.5);
            }
            table#example tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }
            table#example tbody tr:hover {
                background-color: #f1f1f1;
            }
            table#example tbody img {
                width: 40px;
                height: 40px;
            }
            .header {
                position: fixed;
                text-align: center;
                color: #fdc52c;
                top: 4.5rem;
                width: 100vw;
                height: 100vh;
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 500;
                font-size: 2rem;
                z-index: 20;
            }

            .header-image {
                width: 100%;
                height: auto;
                opacity: 0.8;
            }



            .header-content {
                position: absolute;
                top: 20%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .header-content  {
                font-family: fantasy;
                font-size: 2.5em;
                margin: 0;
                padding: 0;
                color: #fdc52c;
            }
            .container
            {
                position: relative;
                border-radius: 25px;
                z-index: 200;
                background-color: white;
                padding: 2rem;


            }
            .finished-icon {
                position: absolute;
            font-size: 1.5em;
            color: #090;
        }
        </style>
    </head>
    <%
        MatchScheduleDAO mdao = new MatchScheduleDAO();
        MatchStatisticDAO msdao = new MatchStatisticDAO();
        TeamDAO tdao = new TeamDAO();
        List<MatchSchedule> matches = null;
        matches = mdao.getTop2MatchFinish();
        for (MatchSchedule m : matches) {
            Team homeTeam1 = tdao.get(m.getHomeTeamID()).orElse(null);
            m.setHomeTeam(homeTeam1);

            Team AwayTeam1 = tdao.get(m.getAwayTeamID()).orElse(null);
            m.setAwayTeam(AwayTeam1);

            //
            MatchStatistic home = msdao.getByTeamIdAndMatchId(m.getHomeTeamID(), m.getMatchID()).orElse(null);
            m.setMatchHomeTeam(home);

            MatchStatistic Away = msdao.getByTeamIdAndMatchId(m.getAwayTeamID(), m.getMatchID()).orElse(null);
            m.setMatchAwayTeam(Away);
//                    mstList.add(mstdao.get(m.getMatchID()).get());
        }

        request.setAttribute("matchFinish", matches);
    %>
    <body>
        <!-- Enhanced Navigation bar -->
        <%@include file="../INCLUDES/head.jsp" %>

        <%@include file="../INCLUDES/nav.jsp" %>

        <header class="header" style="position: fixed;">
            <img src="https://www.fcbarcelona.com/photo-resources/2024/05/26/875d9770-800a-49d7-8572-8b3dd932f9bd/2024-05-26_SEVILLAvsFCB_48.JPG?width=1200&height=525" alt="Barça on Tour 2024" class="header-image">
            <div class="header-content">
                Real FC Schedule
            </div>
        </header>

        <div class="container" style="background-color: #f2f2f2; ackground-color: #f2f2f2;
             padding: 10px;
             border-radius: 10px;


             margin: 300px auto 0 auto;
             width: 98%;
             max-width: 2000px;  ">
            <table id="example" class="table table-bordered table-hover">

                <tbody>
                    <c:set var="now" value="${currentDate}" />
                    <c:forEach items="${matches}" var="match">
                        <tr onclick="window.location.href = '/SWPClubManegement/HOME/matchDetail.jsp?mid=${match.matchID}'">

                            <td>
                                <fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                                <fmt:formatDate value="${parsedDate}" pattern="MMMM dd, yyyy" />
                            </td>
                            <td>${match.matchLocation}</td>

                            <td>${match.homeTeam.teamName} <img src="${match.homeTeam.flag}" width="30px" height="40px" alt="alt"/></td>
                            <td style="width: 2.5rem;">${match.matchHomeTeam.score} - ${match.matchAwayTeam.score}</td>
                            <td> <img src="${match.awayTeam.flag}" width="30px" height="40px" alt="alt"/>${match.awayTeam.teamName} </td>
                            <td>${match.tournament}</td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>



            <!--đã đá-->
            <table id="example" class="table table-bordered table-hover">

                <tbody>

                    <c:forEach items="${matchFinish}" var="match" >
                        <tr onclick="window.location.href = '/SWPClubManegement/HOME/matchStat.jsp?mid=${match.matchID}'">

                            <td>
                                <div style="position: relative; width: 100%">
                                    <fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="MMMM dd, yyyy" />
                                    <i class="fas fa-check-circle finished-icon"></i>
                                </div>
                            </td>
                            <td>${match.matchLocation}</td>

                            <td>${match.homeTeam.teamName} <img src="${match.homeTeam.flag}" width="30px" height="40px" alt="alt"/></td>
                            <td style="width: 2.5rem;">${match.matchHomeTeam.score} - ${match.matchAwayTeam.score}</td>
                            <td> <img src="${match.awayTeam.flag}" width="30px" height="40px" alt="alt"/>${match.awayTeam.teamName} </td>
                            <td>${match.tournament}</td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        <%@include file="../INCLUDES/footer.jsp" %>

        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

        <script>
                            $(document).ready(function () {
                                $('#example').DataTable();
                            });
        </script>
    </body>
</html>
