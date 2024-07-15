<%-- 
    Document   : addfoodpage
    Created on : Jul 4, 2024, 4:49:41 PM
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
                <form class="card card-on card-add-form mx-auto" action="../FoodController" method="GET" style="transition: ease-in 0.5s">
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add Food</h3>
                    <input type="hidden" name="command" value="ADD" />


<!--                    <div class="form-group">
                        <label for="playerName">FoodID</label>
                        <input type="text" name="foodID" id="foodID" placeholder="FoodID" value="" required="You are not fill"/>
                    </div>-->
                    
                     <div class="form-group">
                        <label for="playerName">Food Name</label>
                        <input type="text" name="foodname" id="foodname" placeholder="Food Name" value="" required="You are not fill"/>
                    </div>
                    
                     <div class="form-group">
                        <label for="playerName">Description</label>
                        <input type="text" name="description" id="description" placeholder="Description" value="" required="You are not fill"/>
                    </div>
                    
                     <div class="form-group">
                        <label for="playerName">Calo</label>
                        <input type="text" name="calo" id="calo" placeholder="Calo" value="" required="You are not fill"/>
                    </div>

                    <div class="form-group">
                        <label for="Description">Proteins</label>
                        <input type="text" name="proteins" id="proteins" placeholder="Proteins" value="" required="You are not fill"/>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="Description">Carbohydrates</label>
                        <input type="text" name="carbohydrates" id="carbohydrates" placeholder="Carbohydrates" value="" required="You are not fill"/>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="Description">Fats</label>
                        <input type="text" name="fats" id="fats" placeholder="Fats" value="" required="You are not fill"/>
                    </div>

                    <div class="button-choice" style="text-align: center;">
                        <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>