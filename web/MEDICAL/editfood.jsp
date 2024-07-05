<%-- 
    Document   : editfood
    Created on : Jul 4, 2024, 5:05:50?PM
    Author     : Hoa-Nguyen
--%>

<%@page import="java.time.Instant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="DAO.FoodDAO"%>
<%@page import="Model.Food"%>
<%@page import="java.util.ArrayList"%>


<%@include file="../INCLUDES/head.jsp" %>
<div id="edit-form" style="display: none" >
    <%
        FoodDAO fdao = new FoodDAO();
        String pid = request.getParameter("dip");
        String open = request.getParameter("open");
        if (open != null && pid != null) {
            Food p = fdao.get(Integer.parseInt(pid)).get();
            request.setAttribute("openEdit", open);
            request.setAttribute("food", p);
        }
        if (open != null) {
            request.getSession().removeAttribute("Message");
        }

    %>
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../FoodController" method="GET" style="transition: ease-in 0.5s">
            <i id="close-edit" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Edit Food</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="foodID" value="${food.foodID}" />

            <div class="form-group">
                <label for="playerName">Food Name</label>
                <input type="text" name="foodname" id="foodname" placeholder="Food Name" value="${food.foodName}" required="You are not fill"/>
            </div>

            <div class="form-group">
                <label for="playerName">Description</label>
                <input type="text" name="description" id="description" placeholder="Description" value="${food.description}" required="You are not fill"/>
            </div>

            <div class="form-group">
                <label for="playerName">Calo</label>
                <input type="text" name="calo" id="calo" placeholder="Calo" value="${food.calo}" required="You are not fill"/>
            </div>

            <div class="form-group">
                <label for="Description">Proteins</label>
                <input type="text" name="proteins" id="proteins" placeholder="Proteins" value="${food.proteins}" required="You are not fill"/>
            </div>


            <div class="form-group">
                <label for="Description">Carbohydrates</label>
                <input type="text" name="carbohydrates" id="carbohydrates" placeholder="Carbohydrates" value="${food.carbohydrates}" required="You are not fill"/>
            </div>


            <div class="form-group">
                <label for="Description">Fats</label>
                <input type="text" name="fats" id="fats" placeholder="Fats" value="${food.fats}" required="You are not fill"/>
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
