
<%-- 
    Document   : matchDetail
    Created on : Jul 3, 2024, 6:10:58 PM
    Author     : Desktop
--%>

<%@page import="Model.MatchStatistic"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.List"%>
<%@page import="DAO.MatchStatisticDAO"%>
<%@page import="Model.Team"%>
<%@page import="DAO.TeamDAO"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <style>
        body
        {
            margin: 0;
        }
        tr
            {
                cursor: pointer;
            }
        .main
        {

            display: flex;
        }
        .overlay
        {

            position: absolute;
            top: 0;
            left: 0;
            right: 30%;
            bottom: 0;
            background: rgba(11,10,34,0.8); /* Semi-transparent overlay */
            z-index: 20; /* Ensure overlay is above other content */


        }
        .bg
        {
            opacity: 0.9;
            position: absolute;
            top: 0;
            left: 0;
            right: 30%;
            bottom: 0;

            z-index: 20; /* Ensure overlay is above other content */
        }
        .match-infor
        {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 70%;

            position: relative;
            margin-top: auto;
            height: 100vh;
            z-index: 30;

        }
        .match-stats
        {
            width: 30%;

        }
        .match-date
        {
            text-align: center;
            margin: .4rem 0 .8rem;
            color: #fdc52c;
            font-size: 3.2rem;
            line-height: 3.8rem;
            font-style: italic;
            font-family: fcb-extra-bold,Arial,Helvetica Neue,Helvetica,sans-serif;
            font-weight: 400;
            text-transform: uppercase
        }
        .team-flag
        {
            margin: 0 1rem;
            height: 7rem;
            width: 7rem;
        }
        .team-name
        {
            text-align: center;
            font-size: 2.4rem;
            line-height: 4.2rem;
            font-family: fantasy;
            letter-spacing: 0.5rem;
            font-weight: 400;
            align-self: center;
            text-transform: uppercase;
            color: #fff;
            width: auto

        }
        .team-flag img
        {
            height: 7rem;
            width: 7rem;
        }
        .countdown {
            font-family: fantasy;
            font-size: 2rem;
            color: #ff0000;
            margin-top: 5px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            justify-items: center;
        }

        .countdown div {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .countdown span {
            font-size: 0.8em;
            color: #fdc52c;

        }

        .countdown .time-value {

            color: #fff;
            padding: 5px;
            border-radius: 3px;
        }
        .fixture-infor
        {
            display: flex;
            padding: 2.4rem 5.6rem;
            justify-content: center;
            align-items: center
        }
        .fixture-infor-team
        {
            display: flex;
            justify-content: center;
            align-items: center;

        }
        .fixture-infor-time
        {
            text-align: center;
            font-size: 2.4rem;
            line-height: 4.2rem;
            font-family: fantasy;
            letter-spacing: 0.5rem;
            font-weight: 400;
            align-self: center;
            text-transform: uppercase;
            color: #fff;
            width: auto
        }
        .nav-back
        {
            text-decoration: none;
            position: fixed;
            display: flex;
            top: .8rem;
            left: 0;
            border-radius: 0 .2rem .2rem 0;
            padding: 1.3rem 1.6rem 1.3rem .8rem;
            align-items: center;
            background-color: rgba(24,23,51,.9);
            box-shadow: 0 .1rem .2rem 0 rgba(0,0,0,.15);
            z-index: 50;
            transition: background-color .25s ease,top .25s ease;
            color: white;
            font-family: fantasy;


        }
        .nav-back:hover
        {
            background-color: wheat;
            color: black;
        }
        .match-stats
        {
            background: rgb(11,10,34);
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
            transition: background-color 0.2s ease, border-left 0.2s ease, box-shadow 0.2s ease;

        }
        table#example tbody td {
            font-family: fantasy;

            padding: 12px 0;
            align-items: center;
            text-align: center;
            border: 0;
            /*width: 33.3333%;*/
            height: 3rem;
            vertical-align: middle;
            border-left: rgb(98,45,95) 0px solid;
            font-size: 1.2rem;
            font-weight: 400;
            color: white;


        }
        table#example tbody tr:hover
        {
            /*border-radius: 25px;*/
            /*transform: scale(1.025);*/
            /*border-left: rgb(98,45,95) 5px solid;*/
            /*box-shadow: 0 0 10px rgba(98, 45, 95, 0.5);*/
            background-color: white;


        }

        table#example tbody tr:hover td{
            color: black;
        }
        table#example tbody img {
            width: 40px;
            height: 40px;
        }
        .stats-title
        {
            font-family: fantasy;
            font-style: italic;

            font-size: 1.2rem;
            font-weight: 400;
            color: white;
            text-align: center;
        }
        .match-result
        {
            display: flex;
            flex-direction: column;
            gap: 0.4rem;
        }
        .match-result label
        {
            font-size: 0.5rem;
        }
        .match-result div
        {
            padding: 0.2rem;
            background-color: rgb(21,66,132);
        }
        .team-info
        {
            display: flex;
            flex-direction: column;
        }
    </style>
    <%
        String midString = request.getParameter("mid");
//        String midString = "83";

        MatchScheduleDAO mdao = new MatchScheduleDAO();
        TeamDAO tdao = new TeamDAO();
        Team homeTeam;
        Team awayTeam;
        MatchSchedule match;
        if (midString != null)
            {
            request.removeAttribute("matches");
            match = mdao.get(Integer.parseInt(midString)).orElse(null);
            homeTeam = tdao.get(match.getHomeTeamID()).orElse(null);
            awayTeam = tdao.get(match.getAwayTeamID()).orElse(null);
            request.getSession().setAttribute("match", match);
            request.getSession().setAttribute("homeTeam", homeTeam);
            request.getSession().setAttribute("awayTeam", awayTeam);

            MatchStatisticDAO msdao = new MatchStatisticDAO();

            List<MatchSchedule> matches = null;
            matches = mdao.getMatchFinishByAwayteamID(awayTeam.getTeamID());
            if (matches.size() > 0) {
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

                request.setAttribute("matches", matches);
            }else
            {
                request.setAttribute("matches", null);

            }

        }

    %>
    <body>
        <div class="main">
            <a href="/SWPClubManegement/CreateMatchScheduleServlet" class="nav-back">
                <i class="fas fa-arrow-left"></i> 
                <img src="${homeTeam.flag}" width="30px" height="30px">
                FC Real
            </a>
            <div class="bg" style="background-image: url('https://www.fcbarcelona.com/fcbarcelona/photo/2018/11/14/556cbe5c-ad94-43c6-ac7b-3dcba97230c3/foto_aficio.jpg');
                 background-size: cover;
                 background-repeat: no-repeat;" >

            </div>
            <div class="overlay"></div>
            <div class="match-infor">
                <div class="match-date"><fmt:parseDate value="${match.matchDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                    <fmt:formatDate value="${parsedDate}" pattern="MMMM dd, yyyy" /></div>
                <div class="countdown" data-date="${match.matchDate}"></div>
                <div class="fixture-infor">
                    <div class="fixture-infor-team">
                        <div class="team-name">${homeTeam.teamName}</div>
                        <div class="team-flag" >
                            <img src="${homeTeam.flag}" alt="alt"/>
                        </div>


                    </div>

                    <div class="fixture-infor-time">VS</div>

                    <div class="fixture-infor-team">
                        <div class="team-flag" >
                            <img src="${awayTeam.flag}" alt="alt"/>
                        </div>
                        <div class="team-name">${awayTeam.teamName}</div>

                    </div>

                </div>


            </div>
            <div class="match-stats">
                <div class="table-wraper" style="margin: 5rem 1rem">
                    <c:choose>
                        <c:when test="${matches != null}">
                            <div class="stats-title">Last 5 Meetings</div>
                            <table id="example" class="table table-bordered table-hover">

                                <tbody>

                                <c:forEach items="${matches}" var="match">
                                    <tr onclick="window.location.href='/SWPClubManegement/HOME/matchStat.jsp?mid=${match.matchID}'">




                                        <td style="width: 40%">
                                            <div class="team-infor">
                                                <img src="${match.homeTeam.flag}" width="30px" height="40px" alt="alt"/>  <div>${match.homeTeam.teamName}</div> 
                                            </div>
                                        </td>
                                        <td style="width: 20%">
                                            <div class="match-result">
                                                <label>${match.tournament}</label>
                                                <div>
                                                    ${match.matchHomeTeam.score} - ${match.matchAwayTeam.score}
                                                </div>
                                            </div>
                                        </td>
                                        <td style="width: 40%"> <div class="team-infor">
                                                <img src="${match.awayTeam.flag}" width="30px" height="40px" alt="alt"/><div>${match.awayTeam.teamName}</div>
                                            </div> 
                                        </td>


                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <div class="stats-title">Never Met Before</div>

                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
        <script>
            function startCountdown(element, endDate) {
                function updateCountdown() {
                    const now = new Date().getTime();
                    const distance = endDate - now;

                    if (distance < 0) {
                        element.innerHTML = "Match Started";
                        return;
                    }

                    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    element.innerHTML = `
                    <div>
                        <div class="time-value">\${days} : </div>
                        <span>Days</span>
                    </div>
                    <div>
                        <div class="time-value">\${hours} : </div>
                        <span>Hours</span>
                    </div>
                    <div>
                        <div class="time-value">\${minutes} : </div>
                        <span>Mins</span>
                    </div>
                    <div>
                        <div class="time-value">\${seconds}</div>
                        <span>Secs</span>
                    </div>
                `;
                }

                updateCountdown();
                setInterval(updateCountdown, 1000);
            }

            document.addEventListener("DOMContentLoaded", function () {
                const countdownElements = document.querySelectorAll(".countdown");
                countdownElements.forEach(function (element) {
                    const date = element.getAttribute("data-date");
                    const endDate = new Date(date).getTime();
                    startCountdown(element, endDate);
                });
            });
        </script>
    </body>
</html>
