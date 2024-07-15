<%-- 
    Document   : foodpage
    Created on : Jul 4, 2024, 2:49:39 PM
    Author     : Hoa-Nguyen
--%>

<%@page import="Model.Food"%>
<%@page import="DAO.FoodDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="../CSS/ADMIN/admin.css"/>
        <link rel="stylesheet" href="../CSS/MEDICALS/medicalcss.css"/>
     <style>
            body {
                background-image: url('https://images.pexels.com/photos/114296/pexels-photo-114296.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
                background-size: cover;
            }
        </style>

    </head>
    <body>

        <!------ Include the above in your HEAD tag ---------->

        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                     <div class="nav-logo" style="cursor: pointer" onclick=" window.location.href = '/SWPClubManegement/HomeServlet'"> <img src="../IMAGE/HOME/logo 1.png" alt="alt"/> </div>
                </div>
                <ul class="list-unstyled components">
                    <h3 >MEDICAL</h3>

                    <li>
                        <a href="/SWPClubManegement/DietPlanController">  Diet Plans</a>
                    </li>
                    <li>
                        <a href="/SWPClubManegement/DietPlanFoodController"> Diet Plans Food</a>
                    </li>
                    <li class="active">
                        <a href="/SWPClubManegement/FoodController"> Foods</a>
                    </li>          
                    <li >
                        <a href="/SWPClubManegement/PlayerPhysicalConditionController"> Playerphysicalcondition</a>
                    </li>  
                    <li >
                        <a href="/SWPClubManegement/TreatmentScheduleController"> TreatmentSchedule</a>
                    </li>  
                </ul>
            </nav>

            <div id="content" style="width: 100%;">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="navbar-toggler">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>

                        <span class="navbar-text"><h4>List Foods</h4></span>
                    </div>
                </nav>


                <table class="table table-dark table-striped">

                    <thead class="thead-form" style="background-color: #0d6efd;">
                        <tr>
                            <th>
                                FoodId
                            </th>
                            <th>
                                FoodName
                            </th>
                            <th>
                                Description
                            </th>
                            <th>
                                Calo
                            </th>
                            <th>
                                Proteins
                            </th>
                            <th>
                                Carbohydrates
                            </th>
                            <th>
                                Fats
                            </th>
                            <th>
                                Action
                            </th>
                        </tr>

                    </thead>
                    <tbody>

                        <c:forEach var="p3"  items="${foods}">
                            <c:url var="deleteLink" value="../FoodController">
                                <c:param name="command" value="DELETE"></c:param>
                                <c:param name="foodID" value="${p3.foodID}"></c:param>
                            </c:url>

                            <tr>
                                <td>${p3.foodID}</td>
                                <td>${p3.foodName}</td>
                                <td>${p3.description}</td>
                                <td>${p3.calo}</td>
                                <td>${p3.proteins}</td>
                                <td>${p3.carbohydrates}</td>
                                <td>${p3.fats}</td>
                                <td>
                                    <a class="update-button" href="foodpage.jsp?dip=${p3.foodID}&uid=${p3.foodID}&open=openedit" onclick="event.handleLinkClick(event);"> <i class="fas fa-edit"></i></a>
                                        <c:if test="${not empty deleteLink}">
                                        <a href="${deleteLink}" onclick="return handleDeleteClick(event);">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </c:if>
                                </td>

                            </tr>
                        </c:forEach>

                        <tr>
                            <td>
                                <i id="add-button"  class=" fas fa-plus"></i>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <c:if test="${Message != null}">
                    <div class="success-message" id="successMessage">
                        <i class="fas fa-check"></i> ${Message}
                    </div>
                </c:if>


            </div>
        </div>

        <!-- Import bootstrap 4 scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <%@include file="addfoodpage.jsp" %>
        <%@include file="editfood.jsp" %>

    </body>
    <script>
                                            $(document).ready(function () {
                                                $('#sidebarCollapse').on('click', function () {
                                                    $('#sidebar').toggleClass('active');
                                                    $(this).toggleClass('active');
                                                });

                                                function toggleCloseAddform() {
                                                    $("#add-form").toggle();
                                                }

                                                function toggleOpenAdd() {
                                                    $("#add-form").toggle();
                                                }



                                                function toggleOpenEdit() {
                                                    $("#edit-form").toggle();
                                                }
                                                function toggleCloseEdit() {
                                                    $("#edit-form").toggle();
                                                }

                                                $("#add-close").click(function () {
                                                    toggleCloseAddform();
                                                });

                                                $("#add-button").click(function () {
                                                    toggleOpenAdd();
                                                });
                                                $(".update-button").click(function () {
                                                    toggleOpenEdit();
                                                });
                                                $("#close-edit").click(function () {
                                                    toggleCloseEdit();
                                                });
                                                // Display success message if it exists
                                                openEdit();
                                                setTimeout(function () {
                                                    var successMessage = document.getElementById('successMessage');
                                                    var Message = "${Message}";

                                                    if (Message !== "") {
                                                        successMessage.style.display = 'none';
                                                        console.log(deleteMessage);
                                                    }
//                                                    if (openMessage == "")
//                                                    {
//                                                        successMessage.style.display = 'none';
//                                                        console.log(openMessage);
//                                                    }
                                                }, 800);

                                                function openEdit() {
                                                    var editForm = document.getElementById('edit-form');
                                                    var successMessage = document.getElementById('successMessage');
                                                    var Message = "${Message}";

                                                    var openMessage = "${openEdit}";
                                                    if (openMessage != "")
                                                    {
                                                        editForm.style.display = "block";
                                                    }
                                                    if (Message == "" && openMessage != "")
                                                    {
                                                        successMessage.style.display = 'none';
                                                    }
                                                }

                                                setTimeout(() => {
                                                    fetch('/SWPClubManegement/RemoveSessionSuccess', {method: 'DELETE'})
                                                            .then(response => response.text())
                                                            .then(data => {
                                                                console.log(data);

                                                            })
                                                            .catch(error => console.error('Error:', error));
                                                }, 1000);
                                            });



    </script>

</html>

