<%-- 
    Document   : editPage
    Created on : May 19, 2024, 9:36:50 PM
    Author     : Desktop
--%>

<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <% UserDAO udao = new UserDAO();
            User u = udao.get(1).get();
            request.setAttribute("u", u);
            String errorMessage = (String) request.getAttribute("errorMessage");
            String randomParam = String.valueOf(Math.random());
        %>
        <%@include file="../INCLUDES/head.jsp" %> 
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>

                                <li class="nav-item"><a class="nav-link px-2" href="https://www.bootdey.com/snippets/view/bs4-edit-profile-page" target="__blank"><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <img src="${u.image}" width="150px" height="150px" alt="alt"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${u.userName}</h4>

                                                    <div class="mt-2">
                                                        <form action="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" enctype="multipart/form-data" method="POST">
                                                            <input type="hidden" name="command" value="EDITIMAGE" />
                                                            <input type="hidden" name="uid" value="${u.userId}" />
                                                            <input type="file" name="file2" />
                                                            <input type="submit" value="Upload" class="btn btn-primary mt-2"/>
                                                            <c:if test="<%= errorMessage != null%>">
                                                                <p class="text-danger">
                                                                    <%= errorMessage%>
                                                                </p>
                                                            </c:if>
                                                        </form>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" novalidate="">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">

                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>UserName</label>
                                                                        <input class="form-control" type="text" name="username" placeholder="johnny.s" value="${u.userName}">
                                                                        <c:choose>
                                                                            <c:when test="${c == 'editname'}">
                                                                                <form action="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" method="GET">
                                                                                    <input type="hidden" name="command" value="EDITNAME" />
                                                                                    <input type="hidden" name="uid" value="${u.userId}" />
                                                                                    <input type="hidden" name="c" value="0" />
                                                                                    <input class="form-control"  type="text" name="name" value="${u.name}" class="form-control"/>
                                                                                    <input type="submit" value="OK" class="btn btn-primary mt-2"/>
                                                                                </form>
                                                                            </c:when>
                                                                            <c:when test="${c != 'editname'}">
                                                                                <c:if test="${u.name == null}">
                                                                                    <%-- Gán giá trị mới cho thuộc tính name của đối tượng u --%>
                                                                                    <% u.setName("Chua co");%>
                                                                                </c:if>
                                                                                <p>${u.name}</p>
                                                                                <button onclick="window.location.href = '<c:url value="/EditProfileServlet?c=editname"/>'" class="btn btn-secondary mt-2">Edit</button>

                                                                            </c:when>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Email</label>

                                                                        <c:choose>
                                                                            <c:when test="${c == 'editemail'}">
                                                                                <form action="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" method="GET">
                                                                                    <input type="hidden" name="command" value="EDITEMAIL" />
                                                                                    <input type="hidden" name="uid" value="${u.userId}" />
                                                                                    <input type="hidden" name="c" value="0" />
                                                                                    <input class="form-control" type="email" name="email" value="${u.email}" class="form-control"/>
                                                                                    <input id="" type="submit" value="OK" class="btn btn-primary mt-2"/>
                                                                                </form>
                                                                            </c:when>
                                                                            <c:when test="${c != 'editemail'}">
                                                                                <p>${u.email}</p>
                                                                                <button onclick="window.location.href = '<c:url value="/EditProfileServlet?c=editemail"/>'" class="btn btn-secondary mt-2">Edit</button>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Date Of Birth</label>
                                                                        <input class="form-control" type="date" name="date" placeholder="user@example.com" value="${u.dateOfBirth}">
                                                                        <c:choose>
                                                                            <c:when test="${c == 'editdate'}">
                                                                                <form action="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" method="GET">
                                                                                    <input type="hidden" name="command" value="EDITDATE" />
                                                                                    <input type="hidden" name="uid" value="${u.userId}" />
                                                                                    <input type="hidden" name="c" value="0" />
                                                                                    <input type="date" name="date" value="${u.dateOfBirth}" class="form-control"/>
                                                                                    <input type="submit" value="OK" class="btn btn-primary mt-2"/>
                                                                                </form>
                                                                            </c:when>
                                                                            <c:when test="${c != 'editdate'}">
                                                                                <p>${u.dateOfBirth}</p>
                                                                                <button onclick="window.location.href = '<c:url value="/EditProfileServlet?c=editdate"/>'" class="btn btn-secondary mt-2">Edit</button>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col d-flex justify-content-end">
                                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-3 mb-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <form action="LogOutServlet">
                                            <button class="btn btn-block btn-secondary">
                                                <i class="fa fa-sign-out"></i>
                                                <span>Logout</span>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>
