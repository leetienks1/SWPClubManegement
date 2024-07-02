<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Match Statistics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            margin: 20px;
            text-align: center;
        }
        .statistics-card {
            background-color: #b7162a;
            color: #ffffff;
            padding: 20px;
            border-radius: 15px;
            width: 70%;
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .statistics-card h1, .statistics-card h2 {
            margin-bottom: 20px;
        }
        .statistics-card img {
            vertical-align: middle;
            margin: 0 10px;
        }
        .statistics-table {
            width: 100%;
            margin: 20px 0;
            text-align: center;
        }
        .statistics-table th, .statistics-table td {
            padding: 10px;
            border-bottom: 1px solid #fff;
        }
        .statistics-table th {
            text-align: center;
        }
        .statistics-table td {
            text-align: center;
        }
        .statistics-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .statistics-column {
            flex: 1;
            text-align: center;
        }
        .statistics-column:first-child {
            text-align: left;
        }
        .statistics-column:last-child {
            text-align: right;
        }
    </style>
</head>
<body>

<div class="statistics-card">
    <h1>Match Statistics</h1>
    <h2>
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1200px-Flag_of_Vietnam.svg.png" alt="Vietnam" width="40px" height="30px"> 
        Vietnam 4 - 0 Indonesia 
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/1200px-Flag_of_Indonesia.svg.png" alt="Indonesia" width="40px" height="30px">
    </h2>

    <table class="statistics-table">
        <c:forEach var="statistic" items="${statistics}">
            <tr class="statistics-row">
                <td class="statistics-column">${statistic.homeValue}</td>
                <td class="statistics-column">${statistic.label}</td>
                <td class="statistics-column">${statistic.awayValue}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
