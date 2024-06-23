<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Match Schedule</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f2f2f2;
            }
            h1, h2 {
                text-align: center;
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            .match-type {
                margin-bottom: 10px;
                font-size: 18px;
                font-weight: bold;
                color: #333;
            }
            .upcoming-match {
                background-color: #e0f7fa;
            }
            .completed-match {
                background-color: #cfe2f3;
            }
            .home-button {
                display: block;
                width: 100px;
                margin: 20px auto;
                padding: 10px;
                text-align: center;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }
            .home-button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>Match Schedule</h1>

        <h2 class="match-type">Matches</h2>
        <table>
            <tr>
                <th>Match ID</th>
                <th>Home Team</th>
                <th>Away Team</th>
                <th>Match Date</th>
                <th>Match Location</th>
                <th>Tournament</th>
                <th>Score</th>
                <th>Status</th>
            </tr>
            <c:set var="now" value="${currentDate}" />
            <c:forEach items="${matches}" var="match">


                <td>${match.matchID}</td>
                <td>${match.homeTeam.teamName}</td>
                <td>${match.awayTeam.teamName}</td>
                <td>${match.matchDate}</td>
                <td>${match.matchLocation}</td>
                <td>${match.tournament}</td>
                <td>${match.matchHomeTeam.score}-${match.matchAwayTeam.score}</td>
                <td>
                    <c:choose>
                        <c:when test="${match.matchDate.isBefore(now)}">
                            Completed
                        </c:when>
                        <c:otherwise>
                            Upcoming
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="HOME/home.jsp" class="home-button">Home</a>
</body>
</html>
