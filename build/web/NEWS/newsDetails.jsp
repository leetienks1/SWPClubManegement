<%-- 
    Document   : newsDetails
    Created on : May 28, 2024, 2:46:20 PM
    Author     : Desktop
--%>

<%@page import="java.util.List"%>
<%@page import="Model.News"%>
<%@page import="DAO.NewsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<link rel="stylesheet" href="../CSS/HOMECSS/home.css"/>-->
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/HOMECSS/slide.css"/>
        <!--<link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>-->

        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap" rel="stylesheet">

        <style>
            /* styles.css */
            p {
                font-family: 'Times New Roman', Times, serif;
                line-height: 1.6;
                color: #333;

                margin: 0 auto;
                max-width: 800px;
                text-align: justify;
            }





            .card-body img {
                max-width: 100%;
                height: auto;
                display: block;
                width: 100vw;
            }


            .container{
                display: flex;
                justify-content: center;

            }
            .card-body
            {
                text-align: center;
                border-radius: 45px;
                background-color: white;
            }
            .img-title
            {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;

                background-size: cover;
                background-position: center;

            }
            h1
            {
                color: #672C5D;
            }
            /*            .news
                        {
                            height: 70vh;
                        }*/
            /*            .news-card {
                            width: 90%;
                            height: 90%;
                            padding-top: 85%;  1:1 Aspect Ratio 
                            position: relative;  If you want to position child elements 
                            background-size: cover;
                            background-position: center center;
                        }*/

            /*            .news-card-title {
                            position: absolute;
                            bottom: 0;
                            left: 0;
                            right: 0;
                            margin: 0;
                            padding: 10px;
                            background: rgba(0, 0, 0, 0.5);  Optional background for text readability 
                            color: white;
                            text-align: center;
                        }*/
            /*            .news-title {
                            margin-top: 100px;
                            margin-left: 30px;
                            margin-right: 20px;
                            color: white;
                        }*/
            .section-news {
                position: relative; /* or absolute, depending on your layout needs */
                z-index: 9999;
                background-color: white;
                padding: 20px;

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
            .container-news
            {
                margin: 20px 0;
            }
            .relative-news {
                font-size: 4rem;
                font-weight: bold;
                margin-bottom: 20px; /* Add margin below the title */
                text-align: center; /* Center the title */
                background: linear-gradient(180deg, #cd122d 0, #154284);
                color: whitesmoke;
            }
            .news-card
            {
                max-height: 19.5rem;
                height: 19.5rem;
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
    <%
        NewsDAO ndao = new NewsDAO();
        String nidString = request.getParameter("nid");
        if (nidString != null) {
            int nid = Integer.parseInt(nidString);
            News n = ndao.get(nid).orElse(null);
            request.getSession().setAttribute("news", n);
        } else {
            response.sendRedirect("/SWPClubManegement/HOME/home.jsp");
        }

        List<News> listNews = ndao.getNewsByPage(1, 9);

        request.getSession().setAttribute("listNews", listNews);

    %>
    <body>

        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="../INCLUDES/nav.jsp" %>

        <div class="container " style="margin-top: 500px">
            <div class="row img-title" style="background-image: url('/SWPClubManegement/IMAGE/NEWS/${news.newsImageDescription}')"></div>
            <div class="row" style="width: 100vw;">
                <div class="col-12">
                    <div class="card" style="width: 100vw;">
                        <div class="card-content card-body">
                            <h1>${news.newsTitle}</h1>
                            <!-- Hiển thị nội dung bài báo -->
                            ${news.newsContent}
                        </div>
                    </div>
                </div>

            </div>





        </div>
        <section class="section-news">
            <div class="relative-news" >Relative News</div>
            <div class="container-news row gx-lg-5">
                <c:forEach var="n" items="${listNews}">

                    <div class="col-lg-4 col-md-12  " style="margin-bottom: 5rem;">
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
            <%@include file="../INCLUDES/footer.jsp" %>
        </section>
        




        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                            $(document).ready(function () {
                                var owl = $('.news');
                                owl.owlCarousel({
                                    items: 4,
                                    margin: 0,

                                    loop: false,
                                    autoplay: false,
//                                                nav: false // Disable built-in navigation
//                autoplayTimeout: 5000,
//                autoplayHoverPause: true
                                });
                            });


        </script>
    </body>
</html>
