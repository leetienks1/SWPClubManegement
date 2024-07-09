<%-- 
    Document   : newsList
    Created on : May 25, 2024, 1:49:11 PM
    Author     : Desktop
--%>

<%@page import="java.util.List"%>
<%@page import="Model.News"%>
<%@page import="DAO.NewsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>

        <style>
            body
            {
                position: relative;

                /*background-image: url('https://www.fcbarcelona.com/photo-resources/2024/06/27/bd74349a-2501-44f3-b63e-120938f48524/1080-1920.jpg?width=1200&height=525');*/
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }
            .bg-image {
                position: relative;
                width: 100%;
                padding-top: 56.25%; /* 16:9 aspect ratio */
                overflow: hidden;
                border-radius: 5px;
                margin-bottom: 1rem;
            }

            .news-image {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover; /* This ensures the image covers the container without stretching */
                border-radius: 5px;
            }
            .title
            {
                text-align: center;

            }
            .container
            {
                position: relative;
                border-radius: 25px;
                z-index: 200;
                background-color: white;
                padding: 2rem;

            }
            .header {
                position: fixed;
                text-align: center;
                color: #fdc52c;
                top: 4.5rem;
                width: 100vw;
                height: 100vh;
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 500;
                font-size: 2rem;
                
            }

            .header-image {
                width: 100%;
                height: auto;
            }

            

            .header-content {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .header-content h1 {
                font-family: fantasy;
                font-size: 2.5em;
                margin: 0;
                padding: 0;
            }
            .news-card
            {
                max-height: 19rem;
                height: 19rem;
                overflow: hidden;
                position: relative;
            }
            .news-card:hover .news-title
            {
                display: block;
                bottom: 5rem;

            }
            .news-card:hover .description
            {
                display: inline-block;
            }

            .news-title
            {
                width: 100%;
                background: rgba(255,255,255,0.5);
                max-height: 5.5rem;
                bottom: 0;
                position: absolute;
                transition: 0.4s ;
            }
            .news-title h5
            {
                font-family:  fcb-extra-bold, Arial, "Helvetica Neue", Helvetica, sans-serif;
                font-weight: 400px;
            }
            .description
            {
                display: none;

            }
        </style> 
    </head>
    <body>

        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="../INCLUDES/nav.jsp" %>

        <%
            NewsDAO ndao = new NewsDAO();
            News news = ndao.getAll().get(0);
            if (news != null) {
                request.getSession().setAttribute("n", news);

            }
//            request.getSession().setAttribute("listNews", ndao.getAll());

            int pageNumber = 1;
            int rowsPerPage = 6;

            if (request.getParameter("page") != null) {
                pageNumber = Integer.parseInt(request.getParameter("page"));
            }

//            int offset = (pageNumber - 1) * rowsPerPage;
            List<News> newsList = ndao.getNewsByPage(pageNumber, rowsPerPage);

            int totalNews = ndao.getAll().size();
            int totalPages = (int) Math.ceil((double) totalNews / rowsPerPage);

            request.setAttribute("listNews", newsList);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", pageNumber);

//            RequestDispatcher dispatcher = request.getRequestDispatcher("newsList.jsp");
//            dispatcher.forward(request, response);
        %>

        <header class="header">
            <img src="https://www.fcbarcelona.com/photo-resources/2024/03/19/5cc063cf-1608-4302-8f8e-34610354cf9c/202403_USA_Summer_Tour_Web_Nota_Premsa_3200x2000_01-1-1-.jpg?width=1200&height=525" alt="Barça on Tour 2024" class="header-image">
            <div class="header-content">
                <h1>Real FC News</h1>
            </div>
        </header>
        <div class="container" style="margin-top: 500px;">


            <section class="section1 border-bottom pb-4 mb-5">
                <div class="row gx-5">
                    <div class="col-md-6 mb-4">
                        <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5" data-mdb-ripple-color="light">
                            <img src="/SWPClubManegement/IMAGE/NEWS/${n.newsImageDescription}" class="img-fluid news-image" />
                            <a href="/SWPClubManegement/NEWS/newsDetails.jsp?nid=${n.newsId}">
                                <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <span class="badge bg-danger px-2 py-1 shadow-1-strong mb-3">News of the day</span>
                        <h4><strong>${n.newsTitle}</strong></h4>
                        <p class="text-muted">
                            ${n.description}
                        </p>
                        <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary" onclick="window.location.href = '/SWPClubManegement/NEWS/newsDetails.jsp?nid=${n.newsId}'">Read more</button>
                    </div>
                </div>
            </section>
            <!--Section: News of the day-->

            <!--Section: Content-->
            <section>
                <div class="row gx-lg-5">
                    <c:forEach var="n" items="${listNews}">

                        <div class="col-lg-4 col-md-12  " style="margin-bottom: 6rem;">
                            <!-- News block -->
                            <div class="news-card" style="cursor: pointer;" onclick="window.location.href = '/SWPClubManegement/NEWS/newsDetails.jsp?nid=${n.newsId}'">
                                <!-- Featured image -->
                                <div class="bg-image hover-overlay shadow-1-strong ripple rounded-5 mb-4" data-mdb-ripple-color="light">
                                    <img src="/SWPClubManegement/IMAGE/NEWS/${n.newsImageDescription}" class="img-fluid news-image" />
                                    <a href="/SWPClubManegement/NEWS/newsDetails.jsp?nid=${n.newsId}">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </a>
                                </div>

                                <!-- Article data -->
                                <div class="news-content  mb-3">


                                    <div class="news-title">
                                        <div class="row mb-3">
                                            <div class="col-6">
                                                RealClub News
                                            </div>

                                            <div class="col-6 text-end">
                                                <u> ${n.datePosted}</u>
                                            </div>
                                        </div>

                                        <h5>${n.newsTitle}</h5>

                                        <p class="description">
                                            ${n.description}
                                        </p>

                                    </div>
                                </div>

                            </div>
                            <!-- News block -->
                        </div>
                    </c:forEach>


                </div>
            </section>
            <!--Section: Content-->

            <!-- Pagination -->
            <nav class="my-4" aria-label="...">
                <ul class="pagination pagination-circle justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="page">
                        <li class="page-item ${page == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${page}">${page} <c:if test="${page == currentPage}"><span class="sr-only">(current)</span></c:if></a>
                            </li>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!--Main layout-->
    </body>
</html>
