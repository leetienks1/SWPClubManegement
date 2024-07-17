<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Player Attendance Statistics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .player-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }
        .present {
            background-color: #d4edda !important; /* light green */
            color: #155724 !important; /* dark green */
            text-align: center;
        }
        .absent {
            background-color: #f8d7da !important; /* light red */
            color: #721c24 !important; /* dark red */
            text-align: center;
        }
        .not-marked {
            background-color: #fff3cd !important; /* light yellow */
            color: #856404 !important; /* dark yellow */
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #343a40;
            color: #fff;
        }
        td {
            text-align: center;
        }
        .coach-fun-content {
            margin: 20px;
        }
        .back-button {
            margin-bottom: 20px;
            background-color: #6c757d;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }
        .back-button:hover {
            background-color: #5a6268;
            color: #fff;
        }
        .alert-warning {
            color: #856404;
            background-color: #fff3cd;
            border-color: #ffeeba;
            text-align: center;
            margin: 20px 0;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="coach-fun-content">
        <a href="COACH/CoachWelcome.jsp" class="back-button">Back</a>
        <c:if test="${empty attendanceData}">
            <div class="alert alert-warning" role="alert">
                No attendance data available.
            </div>
        </c:if>
        <c:if test="${not empty attendanceData}">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Player Image</th>
                        <th>Player Name</th>
                        <c:forEach var="trainingId" items="${trainingIds}">
                            <th>
                                <fmt:parseDate value="${trainingDates[trainingId]}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                                <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                            </th>
                        </c:forEach>
                        <th>Total Present</th>
                        <th>Attendance Rate</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="entry" items="${attendanceData}">
                        <c:set var="player" value="${players[entry.key]}" />
                        <tr>
                            <td>
                                <img src="${userImages[player.userID]}" alt="${player.name}" class="player-image">
                            </td>
                            <td>${player.name}</td>
                            <c:set var="presentCount" value="0" />
                            <c:forEach var="trainingId" items="${trainingIds}">
                                <c:choose>
                                    <c:when test="${entry.value[trainingId] == true}">
                                        <td class="present">Present</td>
                                        <c:set var="presentCount" value="${presentCount + 1}" />
                                    </c:when>
                                    <c:when test="${entry.value[trainingId] == false}">
                                        <td class="absent">Absent</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="not-marked">N/A</td>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <td>${presentCount}</td>
                            <td>
                                <fmt:formatNumber type="percent" maxFractionDigits="2" value="${presentCount / trainingIds.size()}" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
