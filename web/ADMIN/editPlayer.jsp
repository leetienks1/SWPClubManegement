<%-- 
    Document   : editPlayer
    Created on : May 24, 2024, 4:41:36?PM
    Author     : Desktop
--%>


<%@page import="java.time.Instant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Position"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UserDAO"%>
<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
<%@page import="java.util.ArrayList"%>



<%@include file="../INCLUDES/head.jsp" %>
<div id="edit-form" style="display: none" >
    <%
        UserDAO udao1 = new UserDAO();
        PlayerDAO pdao1 = new PlayerDAO();
        String pid1 = request.getParameter("pid");
        String open = request.getParameter("open");
        if (pid1 != null && open != null) {
            Player p = pdao1.get(Integer.parseInt(pid1)).get();
            request.setAttribute("openEdit", open);
            request.setAttribute("player", p);
            request.setAttribute("user", udao1.get(p.getUserID()).get());
        }
        

        if(open !=null)
        {
            request.getSession().removeAttribute("Message");
        }

    %>
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../PlayerController" method="GET" style="transition: ease-in 0.5s">
            <i id="close-edit" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Add New Player</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="pid" value="${player.playerID}" />
            <input type="hidden" name="uid" value="${player.userID}" />

            <div class="form-group">
                <label for="playerName">Player Name</label>
                <input type="text" name="playerName" id="playerName" placeholder="Player Name" value="${player.name}" required="required" />
            </div>

            <div class="form-group">
                <label for="position">Position</label>
                <select name="position" id="position" >
                    <c:forEach var="po" items="${positions}">
                        <option <c:if test="${player.position == po}">selected="${player.position}"</c:if> >${po}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="uid">Player Account</label>
                <input type="text"  id="uid" value="${user.email}" readonly="">
            </div>

            <div class="form-group">
                <label for="course_price">DateOfBirth</label>
                <input type="date" name="dateOfBirth" id="course_price" placeholder="DOB" value="${player.age}" required="required" />
            </div>

            <div class="form-group">
                <label for="course_describe">Weight</label>
                <input type="number" name="weight" id="weight" placeholder="Weight" min="1" title="Please enter a positive number" step="1" value="${player.weight}">
            </div>

            <div class="form-group">
                <label for="course_describe">Height</label>
                <input type="number" name="height" id="height" placeholder="Height" min="1" title="Please enter a positive number" step="1" value="${player.height}">
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
