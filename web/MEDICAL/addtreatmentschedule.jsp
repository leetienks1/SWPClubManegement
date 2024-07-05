<%-- 
    Document   : addtreatmentschedule
    Created on : Jul 4, 2024, 5:59:30 PM
    Author     : Hoa-Nguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../INCLUDES/head.jsp" %>
        <div id="add-form" style="display: none" >
            <div class="overlay">
                <form class="card card-on card-add-form mx-auto" action="../TreatmentScheduleController" method="GET" style="transition: ease-in 0.5s">
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add TreatmentSchedule</h3>
                    <input type="hidden" name="command" value="ADD" />


                    <div class="form-group">
                        <label for="treatmentID">Treatment ID</label>
                        <input type="text" name="treatmentID" id="treatmentID" placeholder="Treatment ID" value="" required="You are not fill"/>
                    </div>

                    <div class="form-group">
                        <label for="Player">Player</label>

                        <select name="userID" id="userID" required="">
                            <c:forEach var="p" items="${players}">
                                <option value="${p.playerID}">  ${p.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="Treatmentdate">Treatment Date</label>
                        <input type="date" name="treatmentdate" id="treatmentdate" placeholder="Treatment Date" value="" required="You are not fill"/>
                    </div>


                    <div class="form-group">
                        <label for="Treatmenttime">Treatment Time</label>
                        <input type="time" name="treatmenttime" id="treatmenttime" placeholder="Treatment Time" value="" required="You are not fill"/>
                    </div>


                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" name="description" id="description" placeholder="Description" value="" required="You are not fill"/>
                    </div>

                    <div class="button-choice" style="text-align: center;">
                        <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
