<%-- 
    Document   : addDietPlanFood
    Created on : Jul 4, 2024, 11:14:13 PM
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
                <form class="card card-on card-add-form mx-auto" action="../DietPlanFoodController" method="GET" style="transition: ease-in 0.5s">
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add Diet Plan Food</h3>
                    <input type="hidden" name="command" value="ADD" />
                    
                    <div class="form-group">
                        <label for="dietPlanID">Diet PlanID</label>
                        <select name="dietPlanID" id="dietPlanID" required="">
                            <c:forEach var="p1" items="${dplan}">
                                <option value="${p1.dietPlanID}">  ${p1.dietPlanID}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="foodid">Food</label>
                        <select name="foodID" id="foodID" required="">
                            <c:forEach var="p" items="${foods}">
                                <option value="${p.foodID}">  ${p.foodName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="fortionSize">Fortion Size</label>
                        <input type="number" step="0.01"  name="portionsize" id="portionsize" placeholder="Fortion Size" value="" required="You are not fill"/>
                    </div>
                    
                    <div class="button-choice" style="text-align: center;">
                        <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
