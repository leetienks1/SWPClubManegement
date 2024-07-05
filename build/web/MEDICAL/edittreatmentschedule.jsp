<%-- 
    Document   : edittreatmentschedule
    Created on : Jul 4, 2024, 6:35:12?PM
    Author     : Hoa-Nguyen
--%>

<%@page import="java.time.Instant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.TreatmentSchedule"%>
<%@page import="DAO.TreatmentScheduleDAO"%>
<%@page import="java.util.ArrayList"%>


<%@include file="../INCLUDES/head.jsp" %>
<div id="edit-form" style="display: none" >
    <%
        TreatmentScheduleDAO tdao2 = new TreatmentScheduleDAO();
        String pid1 = request.getParameter("dip");
        String open = request.getParameter("open");
        if (open != null && pid1 != null) {
            TreatmentSchedule p1 = tdao2.get(Integer.parseInt(pid1)).get();
            request.setAttribute("openEdit", open);
            request.setAttribute("treatment", p1);
        }

        if (open != null) {
            request.getSession().removeAttribute("Message");
        }

    %>
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../TreatmentScheduleController" method="GET" style="transition: ease-in 0.5s">
            <i id="close-edit" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Edit TreatmentSchedule</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="treatmentID" value="${treatment.treatmentID}" />

            <div class="form-group">
                <label for="player">Player</label>
                <select name="playerId" id="playerId" >
                    <c:forEach var="po" items="${players}">
                        <option <c:if test="${treatment.playerID == po.playerID}">selected="${po.playerID}"</c:if>  value="${po.playerID}" >${po.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="Treatmentdate">Treatment Date</label>
                <input type="date" name="treatmentdate" id="treatmentdate" placeholder="Treatment Date" value="${treatment.treatmentDate}" required="You are not fill"/>
            </div>


            <div class="form-group">
                <label for="Treatmenttime">Treatment Time</label>
                <input type="time" name="treatmenttime" id="treatmenttime" placeholder="Treatment Time" value="${treatment.treatmentTime}" required="You are not fill"/>
            </div>


            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" name="description" id="description" placeholder="Description" value="${treatment.treatmentDescription}" required="You are not fill"/>
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>