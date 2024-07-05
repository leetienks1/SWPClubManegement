<%-- 
    Document   : home
    Created on : May 18, 2024, 12:13:40 AM
    Author     : Desktop
--%>

<%@page import="DAO.TeamDAO"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@page import="Model.News"%>
<%@page import="DAO.NewsDAO"%>
<%@page import="Model.Player"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="DAO.PlayerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/INCLUDES/head.jsp" %>

        <link rel="stylesheet" href="../CSS/HOMECSS/home.css"/>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/HOMECSS/slide.css"/>
        <!--<link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>-->

        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap" rel="stylesheet">




    </head>
    <body>
        <%session.removeAttribute("error");

            PlayerDAO pdao = new PlayerDAO();
            UserDAO udao = new UserDAO();
            NewsDAO ndao = new NewsDAO();
            TeamDAO tdao = new TeamDAO();
            List<Player> players = pdao.getAll();
            List<User> users = udao.getAll();
            List<News> listNews = ndao.getAll();
            request.getSession().setAttribute("players", players);
            request.getSession().setAttribute("users", users);
            request.getSession().setAttribute("listNews", listNews);
            request.getSession().setAttribute("teams", tdao.getAll());
            request.getSession().setAttribute("hometeam", tdao.get(7).orElse(null));

            String[] tournaments = {
                "PREMIER_LEAGUE",
                "LA_LIGA",
                "BUNDESLIGA",
                "SERIE_A",
                "LIGUE_1",
                "CHAMPIONS_LEAGUE",
                "EUROPA_LEAGUE",
                "Friendly"
            };

            MatchScheduleDAO mdao = new MatchScheduleDAO();

            for (String tournament : tournaments) {
                MatchSchedule match = mdao.getMatchByTour(tournament).orElse(null);
                request.getSession().setAttribute(tournament + "_match", match);
            }

        %>
        <style>
            p{
                margin: 0;
            }
            .news-card-title {
                width: 100%;
                border-bottom-left-radius: 45px;
                border-bottom-right-radius: 45px;

                margin: 0;
                padding: 10px;
                background: rgba(0, 0, 0, 0.5); /* Optional background for text readability */
                color: white;
                text-align: center;
            }

            .matchSchedule
            {
                height: 50vh;
                padding-left: 50px;
                margin: 0;

            }
            .MatchSchedule-card
            {
                height: 25vh;
            }
            .MatchSchedule-card p , .card-infor
            {
                background: rgba(000,000,000,0.2);
                border-radius: 25px;
            }
            .card-infor
            {
                margin-bottom: 8px;
            }
            .slide
            {
                height: 90vh;
            }

            MatchSchedule-card
            {
                width: 20vw;
                height: 20vh;
                border-radius: 30px;
                padding: 10px 20px 10px 20px;

            }
            .match-card-4
            {
                background-image:url(https://i.pinimg.com/736x/81/e2/08/81e20877698e3927d2f79c2906f3cb13.jpg) ;
                color: white;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .match-card-5
            {
                background-image:url(data:image/png;base64,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) ;
                color: white;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .match-card-6
            {
                background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS77sLQGMbi4n56ewgzfa4A8dZohbSCzawZoA&s) ;
                color: black;
/*                font-weight: 700;*/
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .match-card-7
            {
                background-image:url(data:image/jpeg;base64,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) ;
                color: white;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .match-card-8
            {
                background-image:url(data:image/jpeg;base64,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) ;
                color: white;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .card-infor {
                display: flex;
                width: 100%;
                gap: 5px;



            }
            p{
                margin-bottom: 0.5rem;

            }
            .card-infor div
            {
                font-size: 16px;

            }
            .card-infor div img
            {
                border-radius: 90px;
                width: 15px !important;
                height: 15px !important;
            }
            .card-infor {
                display: flex;
                align-items: center;
                justify-content: start;

                width: 100%;



            }

            .team-info {
                /*width: 50%;*/
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 3px;
            }

            .team-info.home-team {
                justify-content: flex-end;
            }

            .team-info.away-team {
                justify-content: flex-start;
            }

            .team-flag {
                width: 15px;
                height: 15px;

            }

            .vs-text {
                font-weight: bold;
                font-size: 1.2em;
            }
            .MatchSchedule-card .card-name
            {
                display: flex;
                gap: 3px;
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
            .slider-item
            {
                height: 700px;
            }
            .slide-title
            {
                color: white;
                font-family: cursive;
                background-color: rgba(0,0,0,0.5);
                border-radius: 45px;
                padding: 0 0.5rem;
            }

        </style>
        <%@include file="../INCLUDES/nav.jsp" %>
        <div id="owl-demo" class="slide owl-carousel owl-theme" style="margin-top: 4.5rem; height: 700px">
            <div class="slider-item slider-item-one" style="background-image:url(https://hanoispiritofplace.com/wp-content/uploads/2017/06/hinh-nen-bong-da-dep-3.jpg) ;">
                <div class="slide-card">
                    <p  class="slide-title">
                        Welcome to Realclub</p>
                    <div class="slide-detail">
                        <a href="">More Details</a>
                    </div>
                </div>
            </div>
            <div class="slider-item slider-item-two" style="background-image:url('/SWPClubManegement/IMAGE/HOME/RealFC%20Yersey%20Store.jpg') ;">
                <div class="slide-card" >
                    <p style="color: rgb(253,197,44)" class="slide-title">Jersey Store</p>
                    <div class="slide-detail">
                        <a href="/SWPClubManegement/ShopJerseyServlet">More Details</a>
                    </div>
                </div>

            </div> 
            <div class="slider-item slider-item-three">
                <div class="slide-card">
                    <p class="slide-title">Match Tickets</p>
                    <div class="slide-detail">
                        <a href="">More Details</a>
                    </div>
                </div>

            </div> 



        </div>

        <div class="matchSchedule">
            <div class="match-title">
                <h3 class="matchSchedule-title"> Match schedule</h3>
            </div>
            <div class="typeMatchSchedule owl-carousel owl-theme">
                <c:choose >
                    <c:when test="${sessionScope['PREMIER_LEAGUE_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <c:set var="match" value="${sessionScope['PREMIER_LEAGUE_match']}"></c:set>

                            <div class="MatchSchedule-card match-card-1">

                                <p class="card-name"> 
                                    <img style="width: 20px;height: 20px; border-radius: 90px;" src="https://img.uefa.com/imgml/uefacom/elements/logos/competitions/dark/uel.svg" alt="alt"/>Europe
                                </p>
                                <p class="card-date"><i class="fas fa-calendar-alt"></i>:${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>
                        </div>
                    </c:otherwise>
                </c:choose>



                <c:choose >
                    <c:when test="${sessionScope['CHAMPIONS_LEAGUE_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-2">
                            <c:set var="match" value="${sessionScope['CHAMPIONS_LEAGUE_match']}"></c:set>
                                <p class="card-name">
                                    <img style="width: 20px;height: 20px; border-radius: 90px;"   src="https://img.uefa.com/imgml/uefacom/elements/logos/competitions/dark/wucl.svg" alt="alt"/> UEFA Champions league
                                </p>
                                <p class="card-date">${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>






                <c:choose >
                    <c:when test="${sessionScope['LA_LIGA_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-3">

                            <c:set var="match" value="${sessionScope['LA_LIGA_match']}"></c:set>
                                <p class="card-name">
                                    <img style="width: 20px;height: 20px; border-radius: 90px;" src="https://tse2.mm.bing.net/th?id=OIP.F9mp4IIzSi9-EpjDaSiuEgHaGD&pid=Api&P=0&h=220" alt="alt"/> Laliga
                                </p>
                                <p class="card-date"> <i class="fas fa-calendar-alt"></i>: ${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>



                <c:choose >
                    <c:when test="${sessionScope['LIGUE_1_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-4">


                            <c:set var="match" value="${sessionScope['LIGUE_1_match']}"></c:set>
                                <p class="card-name">
                                    <img style="width: 20px;height: 20px; border-radius: 90px;" src="data:image/png;base64,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" alt="alt"/> LIGUE 1
                                </p>
                                <p class="card-date"><i class="fas fa-calendar-alt"></i>:${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>

                <c:choose >
                    <c:when test="${sessionScope['PREMIER_LEAGUE_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-5">



                            <c:set var="match" value="${sessionScope['PREMIER_LEAGUE_match']}"></c:set>
                                <p class="card-name">
                                    <img style="width: 20px;height: 20px; border-radius: 90px;" src="data:image/png;base64,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" alt="alt"/> PREMIER LEAGUE
                                </p>
                                <p class="card-date"><i class="fas fa-calendar-alt"></i>:${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>



                <c:choose >
                    <c:when test="${sessionScope['Friendly_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-6" style="color: white">




                            <c:set var="match" value="${sessionScope['Friendly_match']}"></c:set>
                                <p class="card-name">
                                    Friendly
                                </p>
                                <p class="card-date"><i class="fas fa-calendar-alt"></i>:${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>


                <c:choose >
                    <c:when test="${sessionScope['SERIE_A_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-7">





                            <c:set var="match" value="${sessionScope['SERIE_A_match']}"></c:set>
                                <p class="card-name">
                                    <img style="width: 20px;height: 20px; border-radius: 90px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABUFBMVEX///8Aj9cCRJQALXH/HxEAQZPkDSwaVZ0AvhsAPpEARZcAKm4AHmsAi9ZSebH/HQAAI23c5vEAKG/rCCXO1+QAN4/XETMAesEhPYhxLmuOnLg6aahvOW+itNElPn8Ak9zu8vaAwOgAS48AwRABYnw7PYfaDS1EOH0zOoA3UYcSN3gBUoYAtyQBlkqvucwuSoIAGWmKM15VOHyyLktrep8UetEBf2GXJVl9kLHwIRtfMXEAX6MIUJ0AE2cAM43j8vpYbpkBjVS2HkoBXH3N5/ZZreG02fGQyOoAb7UOaLsLXK0GR5FFYJHAytkACmWXpsB6lsCNpck6PXtghLYyn9yl0+5js+MMhdaHxekOab0AY6g5pN6Zut6Gq9YAL38AAGMAozoBrS6bMFK1K0BeOG7EKToBcG8BfGTjIhwCNpyrL1GCNWSJKF+RMliOMlucI1bzuvc6AAAMGUlEQVR4nO2c+3vayBWGbWTsIMlGGkNMSAMTp4mDtgV2Q1KSgMNuLmtbYOI4u9kmbbKXbJtmt+3//1vnIgldZgZhY2nk6t3n2Vhi4JmPc3S+mSPZKys5OTk5OTk5OTk5OTk5OTk5OTk5OTk5S+TZzSjP0p7UUnm+GeV52pNaJs9WWTxJe1pL5OYmQ+DmzbSntTyeNJkxfH15gvgtK4QoiN+mPbGl8ZopcHX1XdoTWxYv2CFEvEh7akviHU/g5iUJ4jNuCFffXI5aw7QKJ4g/pD25ZQDZVkFpwrSntwQ4VuEE8bu0p3d+IM8qKK9h2hM8N3yroEHMvmE8n6Mw8zsM9q7CT9a3id+LQ5j9HcaTuSHM+jbxu3khzLxhiK2C8jrtSZ6HOVbhBDHLhjHHKhyFGTaMOHUGk91aI9hVBIKYWcPgNKCiNLMaROGuIhDEjLak4OvYCjO6w3gRU99qZg3jXdwQZrUlJWhAMSRmcYcR0yochRk0DGEDKkoGW1IxdhWBIGZuhzGnARUlc4YRa1cRCGLWDGNu9yKi8Pu0p7wY/CXpW67GbC1OuVaxaXNfyVQQIS9OzQP7zaUIIt8qdu37vJcyZRj8e6La4D5XfYZaUtwlafMxGNznpumb7BgGvwFloRjy0zQzLSn+vYodBSvk6s/MDoNrFc3HGlbITdOs7DAES1KLxJAfxIy0pLgNqOaBRhXyg5iNJxe4IWzuOgq5tSYbOwx+92ITKFThIX9ZngXD4O4qmgeOwsOjA+6XkIGW1BN+fFCSYoWHR4MBd8wb+Q2D34DaQQIVzf7r0cBWdrhBlH6HwbcKtGIjCpHAmrbLDaL0LSlB98KmMRzYyBUtfjmSfYfB3VWgFRvBsmtY6AG3CfAOpq1BCD+EaMVGFWKBirbLVSh5EPm7ik2LKnTh1hq5n41+xm90HwQFam/5Q2U2jB/4SbrrKNQowOKnqcyGIbhX4cZu97EDf6jELSnBvQo3SbWdJkUgUOIdBt8qVp0k1SyBMk+htC0pwT1RvK0gCh/Huekm7T0M/r2K5ltXId8k/AolbUmJnoBqLJCkq9K2pPhWQbcVsZNU1paUoAFFtxWxk3RV0l/cE1iFu2ITbCnC75DxKSmBVXhmKLL5UBBh2noiCDaG3ooNxE1SKXcYgodlNy1loUpKg5i2oDCCBlTzDEkqYUtK8KTlWZJUvh2G6Akod8WmWM0ogrfJZRgCqyCNYKpwNwL/yQzZDEP0UP6ut7vXIohqj1SGIfr9rZ1g+yII4Pb3JTMMwRNQ3oqNiaA1LFVLSvRQfrjHFkZUX+UxDNFD+TuiEKI0FfTcJDIMwZOWzQ1xCIVpKk1LSvSk5bwkFaapNIYh2FU0D+YJFG6Km2lLowiWpLMVm4cVViiyRElaUqKH8jfDIbPsSBBFaSpFS0pkFbMVm4s9CCsEojSVoiV18/7mDpfdcAgHEYWWzX/75hsZggj/dlSoMZac5P7L4HAQvvCimtnv1ZRaQf27HH5hbr3n2vrhUeTCC1HjvQDeX5+kLc2j3TDYs9TswwFXghig1GHaunyYo2N2GLWjuUFk6xt2KmmLCtFudZnmbh0enSGIujVNW1AUWFdYqYrydOEgAqNnpi2HiTnSWam6aJ5qekeeChNmajHCaM11jFAA+zBtHQJgbxgJozZYIIjacCxbhQkz6URT9Si2YxiKhBUmTLTiaHbMIAJjJGeFCVMZGaHHg+Llqd5ppz312LS7enDyR5EFdzSAH6SuMGFgv+u/GufnqdaVvsKEmQTWONpA7BgGyECFCQP7gYojCiKqMFkLIKUynqWqZvMdw5BxERqTtjWrOANOEMEwUxUmDOwZ3r01pkSgt+RdhMZjMtY1N08ZCapMYdozPDew7oYxEkSgZ84i2FTGQ43madAxDHAj7aktDVpxtEAQQVfSbe7ZgH2SqjOJoJv5ChNmMjY0rWZbrgVm2iI41A1DsUkQtW7rclSYMOZoqOBiYxjZ2SUtSrvx3kYVBqY9jwsE9kutyxtAygSmPYOcnJwcOYGTdrs9cdbRsOLDf+yts50XVvwDYegT/eNTB+3jdYxBna4+NDy60H9s0Zu6pm7oHfSTqejewGE9+Jn9IR0jBZBs4jWyoe2j4/qsNQMM6D/WumMcF9PQQAu9YPoeCNODCmEL7UR0WZYGvS6SApA8oAxxzwwrAjqFxNA9xpMeoQEmGuwq1Gj49eOgwgneahm95MWwwPM0RhVzUu98GOETSBEYtR18x9MxkqpPAgo1yx0Y3Gv0cKdVa8DE1bCoGApwrpg2+QcpMvq+AbPjEVBwHvsVNpifCYGmAPp1SEBF9xRS+ArbXZJ58xVO0GeiMBqjC5rzYlTQ9230Teid4CvsG+Sn+QqROlDpAE2DzJcThpQ9A7RGfZqkWJHW6RGmzjHSBVfg1KmP/kqj0IHBnhRKUtDC75OkmrbJnXuAPA24ilCJJG44co8BPsI1l/igXyG1Q70S/ETsHhVNA+PE1TCZNLoG0OgdiBVHIcAQb/D7o6FgJQGFZCAwAgpH6NNQUMeoMMHE1TCB01GrAQzkbsCkWdpoEcjl5/ghCjSgHe6AQjow0JiCFiDBqxtKV440xUCz0kdB6k6d6w5S8EvYD8ftNrpcnYITqDS+gS6o5ILxdDrtoXGjhHWIcUolp5a2UWgNUlDm1dIRoIsg7PqGDMtv6PZ2HSk8t0CXFV2HzVGI7cd9hpasENIGjoedKf6mJx3gZWkPzrLPVYhsXAtXGq1hwnCe9tE4q4NpKHRgyvTQZaY3Rr0xWmcBp9IodIYIOFOIjZOEJFBpnHGN2X1u9EUNJ0S0iUwfpN4chyN8r14D2C80sssj7gAcFzB9WTvt0iAy3AJ0vb1FBShe7qK1TWhblQrtxrFuYDXdIXX8Y91jiBT2j/VjohBaXf14hJQN9S51/tnAY+96w8PdbdPkg95lr+sSZlIfjVvj3tR0jnxAejyZvYJvCtfr+N42nPoGetsIfNLLTOcjZCDoaDk5OTk5OZcec7CRHoMkdlNmqZgepWQUFtIjV5grzBXmCv+fFTIKv3dafoU1Ae6YLyLYWBkxcSLRbiBs/8eq0VPpKFQfXRVBNBbtH/8U4sqDaqF6Qlpqj5HExkPCPd8HN9bJqY9q2goL32yv89m+hidY3P3p1pUgt75GCumD7NeLBbVRXiN85elRfyanyn+QQKFA4EzhlVgKy7/M9FDJl03h2lrDDeHHsiwK1d+3RewRhfZPtzCOOAJbYflLV9Cv8sSw8Ogan0fOmH88QPzzR6Lwa/zzg6dFZgw/Od/bq7JEClUR7syqiH/9GUfx1lP8cxUVUJbCMq2d6j2ZFMamShX+0f0AlsK1X4nAuw/XLq3C8l0kSf1PWSaFtdsekRM1/8B4Cn/Gku6syaNQvXbHY/0Rno76l3XvzFW/xLkKP5H/1ZBVeEcSKPSvabYdhdshP4yr8N4dahgqsYrPaSl8wnf8cyosf/4N/7NeIEf3viwzFCbyl7EKwf3O8mJYvlcjJXQPCy2/YigsFpIQuLIRUKj+Lorh+t5CCokNlv+Nk/STylK4kYjCrVCa7n3lQevK7dmJPf/AGArJUuYhLakMhaWtRBS+DCmMrmCiZ+IqdJejaAnOVPgyEYWTauFszFc421L8orIUVpN5atgchForghguqrBQ+ERD+JGlsJjIbQvEaTBNb+950OuwFj6xgEJnvXYV/RRVWDpNRmAwTf37w4e0lv734ezU3YVqKTrZWCsjflNZChNK0pUVGPCLJTo+VqgWcIdNZcWwuAETUrhyUr04hfgD6BYxorB6kpTAYBCXuabxfXFRhQmGcGXlxv5sItcECrfX7/rmjBRinjIVYj77ay9SiJkp3E/0r2hszMqpWrvr4dRS34nAmst+ivjCd+Y6guZD4xWiEASfanhHpWRWbC4BT4zrh4VisYT+C5xw71swRgfPJeaFLjeSvgNVSvwvvZycde12NhKsox4v9+fPa2nsJ7Pkjkhc6NbfOSimIxAlqprMxVhSU0hRymQjiYuxupHib1qap9WLDmOpepru781Mru9fpMbSvgR/l31yqlZLF1FziqWqepq+Pox5srVRrFZLy6RaLW5sncjwe10OZuXGyenW8jg9uWFKJE9u/geQjhuacXKRkQAAAABJRU5ErkJggg==" alt="alt"/> SERIE A
                                </p>
                                <p class="card-date"><i class="fas fa-calendar-alt"></i>:${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>

                <c:choose >
                    <c:when test="${sessionScope['BUNDESLIGA_match']==null}">

                    </c:when>
                    <c:otherwise>
                        <div class="MatchSchedule-card match-card-8">
                            <c:set var="match" value="${sessionScope['BUNDESLIGA_match']}"></c:set>
                                <p class="card-name">
                                    <img style="width: 20px;height: 20px; border-radius: 90px;" src="data:image/png;base64,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" alt="alt"/> BUNDESLIGA
                                </p>
                                <p class="card-date"><i class="fas fa-calendar-alt"></i>:${match.matchDate}</p>
                            <div class="card-infor">
                                <div class="team-info home-team">
                                    ${hometeam.teamName}
                                    <img src="${hometeam.flag}" alt="flag" class="team-flag" />
                                </div>
                                <div class="vs-text">VS</div>
                                <c:forEach var="t" items="${teams}">
                                    <c:if test="${t.teamID == match.awayTeamID}">
                                        <div class="team-info away-team">
                                            <img src="${t.flag}" alt="flag" class="team-flag" />
                                            ${t.teamName}
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <p> 
                                <i class="fas fa-futbol"></i>: ${match.matchLocation}  </p>

                        </div>

                    </c:otherwise>
                </c:choose>


            </div>

        </div>
        <div class="player owl-carousel owl-theme">

            <c:forEach var="p" items="${players}">
                <c:forEach var="u" items="${users}">
                    <c:if test="${p.userID == u.userId}">
                        <div  class="player-card" style="background-image: url('${u.image}');">

                            <div class="player-card-infor" style="background-color: rgba(0,0,0,0.5); text-align: center; cursor: pointer;" onclick="window.location.href = '/SWPClubManegement/PLAYER/playerDetail.jsp?pid=${p.playerID}'" >
                                <p style="font-size: 2rem; font-weight: 500" class="player-name">${p.name}</p>
                                <p style="font-size: 2.5rem;" class="player-position"> ${p.position}</p></div>
                        </div>



                    </c:if>
                </c:forEach>
            </c:forEach>


        </div>





    </div>
    <div class="news owl-carousel owl-theme">
        <div class="news-title">
            <h2 class="sub-news-title">NEWS</h2>

            <p class="sub-news-description">Keep up to date with all the latest news about our club.let Stay up to date with the latest information</p>
        </div>
        <c:forEach var="n" items="${listNews}" step="1" end="4">
            <div class="news-card news-card-1" style="background-image: url('/SWPClubManegement/IMAGE/NEWS/${n.newsImageDescription}');" >
                <h3 class="news-card-title" style="cursor: pointer;" onclick="window.location.href = '/SWPClubManegement/NEWS/newsDetails.jsp?nid=${n.newsId}'"> ${n.newsTitle}</h3>
            </div>
        </c:forEach>

    </div>

    <%@include file="../INCLUDES/footer.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
    <script>
                    $(document).ready(function () {

                        $("#owl-demo").owlCarousel({
                            loop: true,
                            navigation: true, // Show next and prev buttons
                            nav: false,
                            slideSpeed: 300,
                            paginationSpeed: 300,
                            items: 1,
                            itemsDesktop: false,
                            itemsDesktopSmall: false,
                            itemsTablet: false,
                            itemsMobile: false,
                            autoplay: true,
                            autoplayTimeout: 5000,
                            autoplayHoverPause: false

                        });
                        var owl = $('.player');
                        owl.owlCarousel({
                            items: 4,
                            margin: 0,
                            loop: false,
                            autoplay: true,
                            autoplayTimeout: 3000,
                            autoplayHoverPause: true
                        });
                        var owl = $('.news');
                        owl.owlCarousel({
                            items: 4,
                            margin: 0,

                            loop: false,
                            autoplay: false,
                            nav: false // Disable built-in navigation
                                    //                autoplayTimeout: 5000,
                                    //                autoplayHoverPause: true
                        });
                        var owl = $('.typeMatchSchedule');
                        owl.owlCarousel({
                            items: 4, // Number of items to display at a time
                            margin: 0,
                            loop: false,
                            autoplay: false,
                            autoplayTimeout: 5000,
                            autoplayHoverPause: true,
                            nav: false
                        });

                    });


    </script>
</body>
</html>
