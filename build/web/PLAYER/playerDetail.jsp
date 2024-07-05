<%-- 
    Document   : playerDetail
    Created on : Jul 2, 2024, 1:43:51 AM
    Author     : Desktop
--%>

<%@page import="Model.PlayerStat"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/HOMECSS/home.css"/>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/HOMECSS/slide.css"/>
        <!--<link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>-->
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body>

        <style>
            body{
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;

            }
            p{
                margin: 0;
            }
            .large-name
            {
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;

                font-size: 20vw;
                font-style: italic;
                color: hsla(0, 0%, 100%, .1);
                position: absolute;
                line-height: .6;
                top: 4rem;
                left: 55%;
                text-transform: uppercase;
                /*                padding: 0 3%;*/
                opacity: 0.5;
                transform: translateX(-55%) translateY(2rem);
                transition: opacity .5s, transform;
                background: linear-gradient(180deg, hsla(0, 0%, 93%, .2), hsla(0, 0%, 100%, 0) 90%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                color: #fff;

            }
            .player-wrapper
            {
                height: 100%;
                background: linear-gradient(247deg, #154284, #181733);
                width: 100%;
            }
            .player-img
            {
                height: 100%;
                width: 100%;
                display: flex;
                align-items: end;

                justify-content:  center;

            }
            .player-img picture
            {
                width: 30vw;
                height: 65vh;
            }
            .player-img picture img
            {
                width: 100%;
                height: 100%;
            }
            .player-infor
            {
                /*border-radius: 25px;*/
                border-top-right-radius: 25px;
                border-top-left-radius: 25px;
                margin: 0 24px;

                font-family: serif;
                position: static;
                display: flex;
                background-color: rgb(9,16,35);
                align-items: center;
                flex-direction: column;

                justify-content:  center;
                padding: 1rem;
                border-bottom: wheat solid 1px;

            }
            .player-infor .player-po
            {
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;

                color: white;
                font-size :14px;
                font-weight: 400;
            }
            .player-infor .player-na
            {
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;

                color: white;
                font-size :26px;
                font-weight: 400;
            }

            .player-stat
            {
                border-bottom-right-radius: 25px;
                border-bottom-left-radius: 25px;

                margin: 0 24px;
                font-size: 1.2rem;
                font-family: fcb-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;
                font-family: serif;
                position: static;
                display: flex;
                background-color: rgb(9,16,35);
                align-items: center;
                flex-direction: column;

                justify-content:  center;
                padding: 2.5rem 0;
            }
            .player-stat ul
            {
                padding-left: 0;
                margin-top: 0;
                margin-bottom: 0;
                width: 100%;
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;
                display: flex;
                text-transform: uppercase;
                min-width: 0;
                justify-content: space-between;
            }
            .player-stat li
            {
                display: flex;
                width: 33.3333%;
                flex-direction: column;
                justify-content: space-between;
            }
            .player-stat .stat-title
            {
                color: white;
                font-size: 1.2rem;
                font-family: fcb-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;
                white-space: normal;
                height: 3rem;
                align-items: flex-end;
                justify-content: center;
                display: flex;
                width: 90%;
                text-align: center;
                margin: auto;
            }
            .stat-value
            {
                text-align: center;
                font-size: 6rem;
                line-height: 5rem;
                margin-bottom: .3rem;
                color: #fdc52c;
            }
            .player-Physical
            {
                justify-content: flex-start;
                background-color: #ffffff;
                margin: 0 24px;
                display: flex;
                flex-wrap: wrap;
                max-width: 133.6rem;

                padding: 4.4rem 2.4rem 6.4rem;
                border-top: .1rem solid #efefef;
                border-bottom: .1rem solid #efefef;
                justify-content: center;
                border-radius: 25px;
            }
            .player-Physical-infor
            {
                padding: 0 4.5rem 3.2rem 0;
            }
            .physical-label{
                margin-bottom: .4rem;
                color: #154284;
                font-size: 1.2rem;
                line-height: 1.2rem;
                text-transform: uppercase;
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 600;
            }
            .physical-value
            {
                font-size: 3.2rem;
                line-height: 3.4rem;
                font-family: fcb-light, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;
            }
            .player-card{
                position: relative;
                overflow: hidden;
            }
            .player-card .player-card-infor
            {
                display: block;
                position: absolute;
                bottom: 0px;
                left: 0px;
                right: 0px;
                bottom: -500px;
                transition: 0.4s;
                padding: 15px 0;
                background: rgba(0, 0, 0, 0.4);
            }
            .player-card:hover .player-card-infor
            {
                left: 0px;
                right: 0px;

                bottom: 0px;
            }

        </style>
        <%
            String pidString = request.getParameter("pid");
            int pid = Integer.parseInt(pidString);
            PlayerDAO pdao = new PlayerDAO();
            Player p = pdao.get(pid).orElse(null);
            UserDAO udao = new UserDAO();
            User user = udao.get(p.getUserID()).get();
            request.getSession().setAttribute("player", p);
            request.getSession().setAttribute("u", user);

            List<Player> players = pdao.getAll();
            List<User> users = udao.getAll();
            List<PlayerStat> stats = pdao.getPlayerStats(pid);
            int goals = 0;
            int assists = 0;
            int redCards = 0;
            int yellows = 0;
            int attend = 0;
            for (PlayerStat stat : stats) {
                attend++;
                goals += stat.getGoalsScored();
                assists += stat.getAssists();
                redCards += stat.getRedCards();
                yellows += stat.getYellowCards();

            }

            request.getSession().setAttribute("users", users);
            request.getSession().setAttribute("players", players);


        %>
        <%@include file="../INCLUDES/head.jsp" %>

        <%@include file="../INCLUDES/nav.jsp" %>

        <div class="player-wrapper" style="margin-top: 4rem;">
            <span class="large-name">${player.name}</span>

            <div class="player-img">
                <picture >
                    <img src="${u.image}" alt="alt"/>
                </picture>
            </div>
            <div class="player-infor">
                <div class="player-po">
                    ${player.position}
                </div>
                <div class="player-na">
                    ${player.name}
                </div>
            </div>
            <div class="player-stat">
                <ul>
                    <li>
                        <div class="stat-title">Appearances</div>
                        <div class="stat-value"><%= attend%></div>
                    </li>
                    <li>
                        <div class="stat-title">Goals</div>
                        <div class="stat-value"><%= goals%></div>
                    </li>
                    <li>
                        <div class="stat-title">Assists</div>
                        <div class="stat-value"><%= assists%></div>
                    </li>
                    <li>
                        <div class="stat-title">Red Cards</div>
                        <div class="stat-value"><%= redCards%></div>
                    </li>
                    <li>
                        <div class="stat-title">Yellow Cards</div>
                        <div class="stat-value"><%= yellows%></div>
                    </li>
                </ul>
            </div>
            <div class="player-Physical">
                <div class="player-Physical-infor">
                    <div class="physical-label">Date of birth</div>
                    <div class="physical-value">
                        ${player.age}
                    </div>
                </div>
                <div class="player-Physical-infor">
                    <div class="physical-label">Weight</div>
                    <div class="physical-value">
                        ${player.weight}

                    </div>
                </div >
                <div class="player-Physical-infor">
                    <div class="physical-label">Height</div>
                    <div class="physical-value">
                        ${player.height}

                    </div>
                </div>

            </div>
            <div class="player owl-carousel owl-theme">

                <c:forEach var="p" items="${players}">
                    <c:forEach var="us" items="${users}">
                        <c:if test="${p.userID == us.userId}">
                            <div  class="player-card" style="background-image: url('${us.image}');">

                                <div class="player-card-infor" style="background-color: rgba(0,0,0,0.5); text-align: center; cursor: pointer;" onclick="window.location.href = '/SWPClubManegement/PLAYER/playerDetail.jsp?pid=${p.playerID}'" >
                                    <p style="font-size: 2rem; font-weight: 500" class="player-name">${p.name}</p>
                                    <p style="font-size: 2.5rem;" class="player-position"> ${p.position}</p></div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>


            </div>
                        

        </div>
                        <%@include file="../INCLUDES/footer.jsp" %>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
    <script>
                                    $(document).ready(function () {


                                        var owl = $('.player');
                                        owl.owlCarousel({
                                            items: 4,
                                            margin: 0,
                                            loop: false,
                                            autoplay: true,
                                            autoplayTimeout: 3000,
                                            autoplayHoverPause: true,

                                        });


                                    });


    </script>
</html>
