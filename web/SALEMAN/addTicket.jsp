<%-- 
    Document   : addTraining
    Created on : Jun 3, 2024, 2:49:44 PM
    Author     : Zanis
--%>

<%@page import="DAO.TeamDAO"%>
<%@page import="Model.Team"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="java.util.List"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    MatchScheduleDAO mDAO = new MatchScheduleDAO();
    TeamDAO tdao = new TeamDAO();
    List<MatchSchedule> matches = mDAO.getMatchNotYetTakePlace();
    List<MatchSchedule> matchHome = new ArrayList<>();
    Team homeTeam = tdao.get(7).get();
    for (MatchSchedule m : matches) {
        if (m.getMatchLocation().trim().equals(homeTeam.getStadium().trim())) {
            matchHome.add(m);
        }
    }
    request.setAttribute("matchs", matchHome);

%>
<div id="add-course-form" class="hidden" >
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../TicketServlet" method="GET" style="transition: ease-in 0.5s">
            <i id="add-course-close" class="fas fa-times"></i>
            <h3 class="form-heading">Add New Ticket</h3>
            <input type="hidden" name="command" value="ADD" />
            <div class="form-group">
                <select name="matchId" id="matchId" required="">
                    <c:if test="${not empty matchs}">
                        <c:forEach var="m" items="${matchs}">

                            <option value="${m.getMatchID()}">${m.getMatchID()}</option>

                        </c:forEach>
                    </c:if>
                    <c:if test="${empty matchs}">

                        <option value="">null</option>


                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <input type="number" name="seatNumber" placeholder="Number" value="" />
            </div>
            <div class="form-group">
            <select name="zone" required="">
                <option value="A ">Zone A</option>
                <option value="B ">Zone B</option>
                <option value="C ">Zone C</option>
                <option value="D ">Zone D</option>
            </select>
            </div>
            <div class="form-group">
                <input type="number" name="price" placeholder="Price" value="" />
            </div>
            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
