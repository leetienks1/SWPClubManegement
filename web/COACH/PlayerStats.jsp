<%-- 
    Document   : PlayerStats
    Created on : Jun 20, 2024, 8:36:52 AM
    Author     : Zanis
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Dashboard1DTO"%>
<%@page import="Model.PlayerStat"%>
<%@page import="DAO.DashboardPlayerDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
    </head>
    <body>
        <div>
            <%@include file="../COACH/CoachFun.jsp" %>
        </div>  
        <div class="coach-fun-content">
            <table class="table-course" border="1">
                <thead class="thead-form" style="background-color: #0d6efd;">
                    <tr>
                        <th>
                            Player Name
                        </th>
                        <th>
                            GoalsScored
                        </th>
                        <th>
                            YellowCards
                        </th>
                        <th>
                            RedCards
                        </th>
                        <th>
                            Assists
                        </th>
                        <th>
                            Action
                        </th>
                    </tr>

                </thead>
                <tbody>
                    <%
                        DashboardPlayerDAO dDAO = new DashboardPlayerDAO();
                        PlayerDAO pDAO = new PlayerDAO();
                        List<Player> all = pDAO.getAll();
                        List<PlayerStat> lsPT = new ArrayList<PlayerStat>();
                        for (Player p : all) {
                            Dashboard1DTO db = dDAO.getDashboard1DTO(p.getUserID());
                            if (db == null) {
                                db = new Dashboard1DTO(0, 0, 0, 0);
                            }
                            PlayerStat ps = new PlayerStat(p.getPlayerID(), db.getTotalGoals(), db.getTotalAssists(), db.getTotalYellow(), db.getTotalRed());
                            lsPT.add(ps);
                        }
                        request.setAttribute("playerstats", lsPT);

                    %>
                    <c:forEach var="a" items="${all}">
                        <c:forEach var="p" items="${playerstats}">
                            <c:if test="${a.getPlayerID()==p.getPlayerID()}">
                                <tr>
                                    <td>${a.getName()}</td>
                                    <td>${p.getGoalsScored()}</td>
                                    <td>${p.getYellowCards()}</td>
                                    <td>${p.getRedCards()}</td>
                                    <td>${p.getAssists()}</td>
                                    <td>
                                        <a class="update-course-button" href="StatsInfor.jsp?id=${a.getPlayerID()}" onclick="event.handleLinkClick(event);">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:if>

                        </c:forEach>

                    </c:forEach>

                </tbody>

            </table>


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
