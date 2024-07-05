<%-- 
    Document   : addplayerphysicalcondition
    Created on : Jul 4, 2024, 5:17:40 PM
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
                <form class="card card-on card-add-form mx-auto" action="../PlayerPhysicalConditionController" method="GET" style="transition: ease-in 0.5s">
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add PlayerPhysicalCondition</h3>
                    <input type="hidden" name="command" value="ADD" />


                    <div class="form-group">
                        <label for="conditionID">conditionID</label>
                        <input type="text" name="conditionID" id="conditionID" placeholder="conditionID" value="" required="You are not fill"/>
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
                        <label for="ConditionDescription">ConditionDescription</label>
                        <input type="text" name="conditionDescription" id="conditionDescription" placeholder="Condition Description" value="" required="You are not fill"/>
                    </div>
                    
                     <div class="form-group">
                        <label for="dateRecorded">Date Recorded</label>
                        <input type="date" name="daterecorded" id="daterecorded" placeholder="Date Recorded" value="" required="You are not fill"/>
                    </div>

                    <div class="button-choice" style="text-align: center;">
                        <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
