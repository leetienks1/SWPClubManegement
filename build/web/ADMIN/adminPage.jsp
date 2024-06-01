<%-- 
    Document   : adminPage
    Created on : May 24, 2024, 8:06:18 AM
    Author     : Desktop
--%>

<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
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
        <style>
            .overlay{
                background-color: rgba(0,0,0,0.5);
                position: fixed;
                top:0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 500;
            }
            .card-on
            {

                background-color: #f0f0f0;
                position: fixed;
                top: 100px;
                right: 0;
                left: 0;
                bottom: 50px;
                height: 500px;
                width: 800px;
                z-index: 400;
                padding: 40px 100px 40px 100px;
                text-align: center;
                overflow: scroll;
                /*    text-align: center;*/
            }
            .card-add-form::-webkit-scrollbar {
                width: 10px; /* Chiều rộng của thanh cuộn */
            }

            .card-add-form::-webkit-scrollbar-track {
                background: #f1f1f1; /* Màu nền của thanh cuộn */
            }

            .card-add-form::-webkit-scrollbar-thumb {
                background: #888; /* Màu của thanh cuộn */
                border-radius: 5px; /* Bo tròn góc của thanh cuộn */
            }

            .card-add-form::-webkit-scrollbar-thumb:hover {
                background: #555; /* Màu của thanh cuộn khi hover */
            }
            .card-add-form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .form-group {
                width: 100%;
                margin-bottom: 15px;
                text-align: left;
            }

            .form-group input,
            .form-group select,
            .form-group textarea,
            .form-group .upload-input {
                width: calc(100% - 20px); /* Độ rộng của input là 100% trừ đi khoảng cách margin ở cả hai phía */
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .form-upload {
                width: 100%;
                margin-bottom: 15px;
            }

            .form-upload input {
                width: calc(100% - 20px); /* Độ rộng của input là 100% trừ đi khoảng cách margin ở cả hai phía */
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .button-choice {
                width: 100%;
                text-align: center;
            }

            .button-choice button {
                width: 20%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-group input,
            .form-group select,
            .form-group textarea,
            .form-group .upload-input {
                width: 95%; /* hoặc 100% */
                /* Thiết lập các thuộc tính khác */
            }
            .form-group label {
                /* Độ rộng của label */
                text-align: right; /* Canh chỉnh văn bản sang phải */
                margin-right: 15px; /* Khoảng cách giữa label và input */
                font-weight: 700;
            }
            .add-player-close {
                position: absolute; /* Đặt vị trí tuyệt đối */
                top: 0; /* Đặt phần tử ở phía trên cùng của thẻ cha */
                left: 0; /* Đặt phần tử ở phía bên trái của thẻ cha */
                padding: 10px; /* Tăng khoảng cách giữa icon và viền của thẻ cha */
                cursor: pointer; /* Biến con trỏ thành dấu nhấp chuột khi di chuột qua */
                z-index: 9999; /* Đảm bảo phần tử nằm trên các phần tử khác */
                font-size: 32px;
            }
            .button-choice button.save {
                width: 20%;
                background-color: #4CAF50; /* Màu xanh lá cây */
                color: white; /* Màu chữ trắng */
                border: none;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px; /* Bo tròn góc */
                transition: transform ease 0.3s; /* Hiệu ứng shadow */
            }

            .button-choice button.save:hover {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Hiệu ứng shadow khi hover */
                transform: scale(1.1);
            }

            #add-button
            {
                transition: transform ease 0.2s;
                border-radius: 45px;
            }
            #add-button:hover
            {
                background-color: #009926;
                transform: scale(1.1);
            }
            .success-message {
                display: flex;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                border-radius: 5px;
                z-index: 1000;
                align-items: center;
            }
            .success-message i {
                margin-right: 5px;
            }
        </style>

    </head>
    <body>
        <%
            UserDAO udao = new UserDAO();
            PlayerDAO pdao = new PlayerDAO();
//            String pid = request.getParameter("pid");
//            if (pid != null) {
//                Player p = pdao.get(Integer.parseInt(pid)).get();
//                request.getSession().setAttribute("player", p);
//                request.getSession().setAttribute("user", udao.get(p.getUserID()).get());
//
//            }

            List<String> positions = new ArrayList<>();

            // Lặp qua tất cả các giá trị enum và thêm chúng vào danh sách
            request.getSession().setAttribute("listUsers", udao.getListUserUnknow("Player"));

            // Lặp qua tất cả các giá trị enum và thêm chúng vào danh sách
            for (Position position : Position.values()) {
                positions.add(position.toString());
            }


        %>
        <!------ Include the above in your HEAD tag ---------->

        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                    <img src="../IMAGE/HOME/REALFC.png" alt="alt"/>
                </div>

                <ul class="list-unstyled components">
                    <h3 >ADMIN</h3>
                    
                    <li >
                        <a href="/SWPClubManegement/BanAccountController"> <img src="../IMAGE/HOME/friend.png"  width="28px" height="28px"/> List Accounts</a>
                    </li>
                    <li>
                        <a href="listFullBin.php"> <img src="../IMAGE/HOME/user.png"  width="32px" height="32px"/> Create Account</a>
                    </li>
                    <li class="active">
                        <a href="/SWPClubManegement/PlayerController"><img src="../IMAGE/HOME/soccer-player.png" width="32px" height="32px" alt="alt"/> CRUD Player</a>
                    </li>                    
                    <li >
                        <a href="/SWPClubManegement/NewsController"> <img src="../IMAGE/HOME/news.png"  width="28px" height="28px"/> CRUD News</a>
                    </li>
                    <li>
                        <a href="logout.php"> <img src="../IMAGE/HOME/soccer.png"  width="28px" height="28px"/> CRUD match schedule</a>
                    </li>

                    <li>
                        <a href="/SWPClubManegement/LogoutServlet"> <img src="../IMAGE/HOME/logout.png"  width="28px" height="28px"/> Log Out</a>
                    </li>
                </ul>
            </nav>

            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="navbar-toggler">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>

                        <span class="navbar-text"><h4>List All Player</h4></span>
                    </div>
                </nav>

                <p class="d-none d-md-block">
                    This page list all of the Player you would like to monitor. Player ID uniquely identifies each of the Player, the Description tells details of the Player .
                </p>

                <table class="table table-dark table-striped">

                    <thead class="thead-form" style="background-color: #0d6efd;">
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Name
                            </th>
                            <th>
                                Position
                            </th>
                            <th>
                                Age
                            </th>


                            <th>
                                Weight
                            </th>
                            <th>
                                Height
                            </th>
                            <th>
                                Action
                            </th>
                        </tr>

                    </thead>
                    <tbody>

                        <c:forEach var="p"  items="${listPlayer}">

                            <c:url var="deleteLink" value="../PlayerController">
                                <c:param name="command" value="DELETE"></c:param>
                                <c:param name="pid" value="${p.playerID}"></c:param>
                            </c:url>

                            <tr>
                                <td>${p.playerID}</td>
                                <td>${p.name}</td>
                                <td>${p.position}</td>
                                <td>${p.age}</td>

                                <td>${p.weight} KG</td>
                                <td>${p.height} CM</td>



                                <td>



                                    <a class="update-button" href="adminPage.jsp?pid=${p.playerID}&uid=${p.userID}&open=openedit" onclick="event.handleLinkClick(event);"> <i class="fas fa-edit"></i></a>
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

        <%@include file="../ADMIN/addPlayer.jsp" %>

        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="editPlayer.jsp" %>

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
