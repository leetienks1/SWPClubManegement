<%-- 
    Document   : listJersey
    Created on : Jul 1, 2024, 9:47:12 AM
    Author     : Zanis
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
         <link rel="stylesheet" href="../CSS/COACH/navbar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    </head>
    <body>
        <div class="sidebar">
            <header>SALE</header>
            <ul>
                <li><a href="/SWPClubManegement/JerseyServlet"><i class="fas fa-qrcode"></i>Jersey</a></li>
                <li><a href="/SWPClubManegement/TicketServlet"><i class="fas fa-link"></i>Ticket</a></li>
              <li><a href="/SWPClubManegement/LogoutServlet"><i class="fas fa-sliders-h"></i>Logout</a></li>
            </ul>
        </div>
        <div class="coach-fun-content">
            <table class="table-course" border="1">
                <thead class="thead-form" style="background-color: #0d6efd;">
                    <tr>
                        <th>
                            Match ID
                        </th>
                        <th>
                            Seat Number
                        </th>
                        <th>
                            Price
                        </th>
                        <th>
                            Action
                        </th>
                    </tr>

                </thead>
                <tbody>
                    <c:forEach var="c" items="${sessionlist}">
                        <c:url var="deleteLink" value="../TicketServlet">
                            <c:param name="command" value="DELETE"></c:param>
                            <c:param name="cid" value="${c.getTicketId()}"></c:param>
                        </c:url>
                        <tr>
                            <td>${c.getMatchId()}</td>
                            <td>${c.getSeatNumber()}</td>
                            <td>${c.getPrice()}</td>
                            <td>
                                <a class="update-course-button" href="" onclick="event.handleLinkClick(event);">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <c:if test="${not empty sessionlist}">
                                    <a href="${deleteLink}" onclick="if (!(confirm('Sure?')))
                                                return false">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            <i id="add-course-button"  class=" fas fa-plus"></i>
                        </td>
                    </tr>

                </tbody>

            </table>
            <%@include file="addTicket.jsp" %>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                // Ẩn left-bar mặc định khi trang được tải
                                                $("#leftBar").hide();
                                                //       
                                                if (localStorage.getItem('updateCourseFormVisible') === 'true') {
                                                    $("#update-course-form").show();
                                                } else {
                                                    $("#update-course-form").hide();
                                                }

                                                // Function to toggle update course form visibility
                                                function toggleUpdateCourseForm() {
                                                    $("#update-course-form").toggle();
                                                    localStorage.setItem('updateCourseFormVisible', $("#update-course-form").is(":visible"));
                                                }


                                                // Xử lý sự kiện click trên nút cập nhật khóa học

                                                // Function to toggle left bar visibility
                                                function toggleLeftBar() {
                                                    $("#leftBar").toggle();
                                                }
                                                //
                                                // Function to toggle login form visibility
                                                function toggleLoginForm() {
                                                    $("#logInForm").toggle();
                                                }
                                                //
                                                //        // Function to toggle add course form visibility
                                                function toggleAddCourseForm() {
                                                    $("#add-course-form").toggle();
                                                }
                                                //
                                                //
                                                //        // Xử lý sự kiện click trên nút tắt/bật left-bar
                                                $("#toggleLeftBarBtn").click(function () {
                                                    toggleLeftBar();
                                                });
                                                //
                                                //        // Xử lý sự kiện click trên nút tắt/bật login form
                                                $(".toggleCloseLoginForm").click(function () {
                                                    toggleLoginForm();
                                                });
                                                //
                                                //        // Xử lý sự kiện click trên nút thêm khóa học
                                                $("#add-course-button").click(function () {
                                                    toggleAddCourseForm();
                                                });
                                                $("#add-course-close").click(function () {
                                                    toggleAddCourseForm();
                                                });
                                                //
                                                $(".update-course-button").click(function () {
                                                    toggleUpdateCourseForm();
                                                });
                                                $("#update-course-close").click(function () {
                                                    toggleUpdateCourseForm();
                                                });
                                                $("#done-course-update").click(function () {
                                                    toggleUpdateCourseForm();
                                                });
                                                //
                                            });
        </script>

    </body>
</html>
