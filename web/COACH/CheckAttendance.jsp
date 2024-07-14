<%-- 
    Document   : editTraining
    Created on : Jun 3, 2024, 2:49:56 PM
    Author     : Zanis
--%>

<%@page import="java.util.Map"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.AttendanceDAO"%>
<%@page import="Model.Attendance"%>
<%@page import="DAO.TrainingScheduleDAO"%>
<%@page import="Model.TrainingSchedule"%>
<%@page import="Model.Player"%>
<%@page import="java.util.List"%>
<%@page import="DAO.PlayerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="update-course-form" class="hidden">
    <%
        int TrainingID = 0;
        if (request.getParameter("cid") != null) {
            TrainingID = Integer.parseInt(request.getParameter("cid"));
            TrainingSchedule train = new TrainingScheduleDAO().get(TrainingID).get();
            if (train != null) {
                request.setAttribute("train", train);
            }
        }
        AttendanceDAO aDAO = new AttendanceDAO();
        List<Attendance> listAtten = aDAO.getAttendance(TrainingID);
        PlayerDAO pDAO = new PlayerDAO();
        List<Player> p = pDAO.getAll();
        request.setAttribute("p", p);
        request.setAttribute("a", listAtten);
        UserDAO uDAO = new UserDAO();
        request.setAttribute("img", uDAO.getAll());

    %>
    <div class="overlay">

        <form class="card card-on card-update-form  mx-auto" action="../AttendanceServlet" method="GET">
            <div id="update-course-close" style="width: 20%">
                <i class="add-course-button fas fa-times"></i>
            </div>
            <h3 class="form-heading" style="margin-bottom:  0">Check Attendance</h3>
            <input type="hidden" name="command" 
                   <%                       if (listAtten.isEmpty()) {
                           out.print("value=\"ADD\"");
                       } else {
                           out.print("value=\"UPDATE\"");
                       }
                   %>
                   />
            <input type="hidden" name="cid" value="${train.getTrainingID()}" />
            <c:forEach var="c" items="${p}">

                <div style="display: flex;align-items: center;">
                    <div style="width: 100%; font-size: 20px;">${c.getName()}</div>
                    <c:forEach var="u" items="${img}">
                        <c:if test="${c.getUserID() == u.getUserId()}">
                            <img height="200" width="150" src="${u.getImage()}" alt="alt"/>

                        </c:if>
                    </c:forEach>
                    <input type="checkbox" name="check" value="${c.getPlayerID()}"
                           <c:forEach var="a" items="${a}">
                               <c:if test="${c.getPlayerID()==a.getPlayerID()&&a.isIsPresent()}">
                                   checked=""
                               </c:if>
                           </c:forEach>
                           />
                </div>
            </c:forEach>
            <div class="button-choice" style="text-align: center;">
                <button id="done-course-update" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>

        </form>
    </div>

</div>
