<%-- 
    Document   : editMedicalDietPlanFood
    Created on : Jul 4, 2024, 6:49:01?PM
    Author     : Hoa-Nguyen
--%>

<%@page import="java.time.Instant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.DietPlanFood"%>
<%@page import="DAO.DietPlanFoodDAO"%>
<%@page import="java.util.ArrayList"%>


<%@include file="../INCLUDES/head.jsp" %>
<div id="edit-form" style="display: none" >
    <%
        DietPlanFoodDAO dpfdao2 = new DietPlanFoodDAO();
        String pid1 = request.getParameter("dip");
        String idFood = request.getParameter("uid");
        String open = request.getParameter("open");
        System.out.println(pid1);
        System.out.println(idFood);
        if (open != null && pid1 != null) {
            DietPlanFood p1 = dpfdao2.getdietPlanFood(Integer.parseInt(pid1), Integer.parseInt(idFood)).get();
            request.setAttribute("openEdit", open);
            request.setAttribute("dpfood", p1);
            request.setAttribute("idFood", idFood);
        }

        if (open != null) {
            request.getSession().removeAttribute("Message");
        }

    %>
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../DietPlanFoodController" method="GET" style="transition: ease-in 0.5s">
            <i id="close-edit" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Edit Diet Plan Food</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="dietPlanID" value="${dpfood.dietPlanID}" />
            <input type="hidden" name="idFoodOld" value="${idFood}" />
            <div class="form-group">
                <label for="foodID">FooD Name</label>
                <select name="foodID" id="foodID" >
                    <c:forEach var="po" items="${foods}">
                        <option <c:if test="${idFood == po.foodID}">selected="${po.foodID}"</c:if>  value="${po.foodID}" >${po.foodName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="fortionSize">Fortion Size</label>
                <input type="number" step="0.01"  name="portionsize" id="portionsize" placeholder="Fortion Size" value="${dpfood.portionSize}" required="You are not fill"/>
            </div>

            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
