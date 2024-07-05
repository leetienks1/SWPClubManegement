<%-- 
    Document   : editDiaPlan
    Created on : Jul 2, 2024, 3:40:17?PM
    Author     : Hoa-Nguyen
--%>
<%@page import="java.time.Instant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.Player"%>
<%@page import="Model.DietPlan"%>
<%@page import="DAO.PlayerDAO"%>
<%@page import="DAO.DietPlanDAO"%>
<%@page import="java.util.ArrayList"%>


<%@include file="../INCLUDES/head.jsp" %>
<div id="edit-form" style="display: none" >
    <%
        PlayerDAO pdao1 = new PlayerDAO();
        DietPlanDAO ddao1 = new DietPlanDAO();
        String pid1 = request.getParameter("dip");
        String uid1 = request.getParameter("uid");
        String open = request.getParameter("open");
        if (uid1 != null && open != null && pid1 != null) {
            Player p = pdao1.get(Integer.parseInt(uid1)).get();
            DietPlan dp = ddao1.get(Integer.parseInt(pid1)).get();
            request.setAttribute("openEdit", open);
            request.setAttribute("player", p);
            request.setAttribute("dietplan", dp);
        }

        if (open != null) {
            request.getSession().removeAttribute("Message");
        }

    %>
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../DietPlanController" method="GET" style="transition: ease-in 0.5s">
            <i id="close-edit" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Edit Diet Plan</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="dietplanID" value="${dietplan.dietPlanID}" />

            <div class="form-group">
                <label for="player">Player</label>
                <select name="playerId" id="playerId" >
                    <c:forEach var="po" items="${players}">
                        <option <c:if test="${player.playerID == po.playerID}">selected="${po.playerID}"</c:if>  value="${po.playerID}" >${po.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="Description">Description</label>
                <input type="text" name="planDescription" id="planDescription" placeholder="Description" value="${dietplan.planDescription}" required="You are not fill"/>
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
