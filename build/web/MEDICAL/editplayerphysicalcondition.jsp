<%-- 
    Document   : editplayerphysicalcondition
    Created on : Jul 4, 2024, 5:36:31?PM
    Author     : Hoa-Nguyen
--%>

<%@page import="java.time.Instant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
<%@page import="Model.PlayerPhysicalCondition"%>
<%@page import="DAO.PlayerPhysicalConditionDAO"%>
<%@page import="java.util.ArrayList"%>


<%@include file="../INCLUDES/head.jsp" %>
<div id="edit-form" style="display: none" >
    <%
        PlayerPhysicalConditionDAO pdao2 = new PlayerPhysicalConditionDAO();
        String pid1 = request.getParameter("dip");
        String open = request.getParameter("open");
        if (open != null && pid1 != null) {
            PlayerPhysicalCondition p1 = pdao2.get(Integer.parseInt(pid1)).get();
            request.setAttribute("openEdit", open);
            request.setAttribute("condition", p1);
        }

        if (open != null) {
            request.getSession().removeAttribute("Message");
        }

    %>
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../PlayerPhysicalConditionController" method="GET" style="transition: ease-in 0.5s">
            <i id="close-edit" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Edit PlayerPhysicalCondition</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="conditionID" value="${condition.conditionID}" />

            <div class="form-group">
                <label for="player">Player</label>
                <select name="playerId" id="playerId" >
                    <c:forEach var="po" items="${players}">
                        <option <c:if test="${condition.playerID == po.playerID}">selected="${po.playerID}"</c:if>  value="${po.playerID}" >${po.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="ConditionDescription">Condition Description</label>
                <input type="text" name="conditionDescription" id="conditionDescription" placeholder="Condition Description" value="${condition.conditionDescription}" required="You are not fill"/>
            </div>

            <div class="form-group">
                <label for="dateRecorded">Date Recorded</label>
                <input type="date" name="daterecorded" id="daterecorded" placeholder="Date Recorded" value="${condition.dateRecorded}" required="You are not fill"/>
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>

