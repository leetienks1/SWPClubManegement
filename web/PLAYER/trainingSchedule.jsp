<%-- 
    Document   : Training
    Created on : Jun 1, 2024, 7:41:32 AM
    Author     : Zanis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

    </head>
    <body>
        <div>
            <%@include file="../PLAYER/siderbar.jsp" %>
        </div>  
        <div class="coach-fun-content" style="padding: 10px; background-color: white;">
            <div style="width: 100%; height: 100px"></div>
            <h1 style="text-align: center; color: black;">Training Schedule</h1>
            <table id="example" class="table table-bordered"  style="color: black">
                <thead>
                    <tr>
                        <th>
                            TrainingID
                        </th>
                        <th>
                            TrainingDate
                        </th>
                        <th>
                            TrainingTime
                        </th>
                        <th>
                            Location
                        </th>
                        <th>
                            Description
                        </th>

                    </tr>

                </thead>
                <tbody>
                    <c:forEach var="c" items="${sessionlist}">

                        <tr>
                            <td>${c.getTrainingID()}</td>
                            <td>${c.getTrainingDate()}</td>
                            <td>${c.getTrainingTime()}</td>
                            <td>${c.getLocation()}</td>
                            <td>${c.getDescription()}</td>
                            <!--                            <td>
                                                            <a class="update-course-button" href="Training.jsp?cid=${c.getTrainingID()}" onclick="event.handleLinkClick(event);">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                            <c:if test="${not empty sessionlist}">
                                <a href="${deleteLink}" onclick="if (!(confirm('Sure?')))
                                            return false">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </c:if>
                        </td>-->
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

    </body>

</html>
