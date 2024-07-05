<%@page import="DAO.MatchStatisticDAO"%>
<%@page import="Model.MatchStatistic"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="Model.Team"%>
<%@page import="DAO.TeamDAO"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <!-- Link to Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                max-width: 80%;
                margin: 0 auto;
                margin-top: 4.5rem;
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 20px;
            }
            .forgot-password {
                font-size: 14px;
            }
            .btn-login {
                width: 100%;
                font-size: 16px;
            }
            .circle-image {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                object-fit: cover;
                display: inline-block;
                border: 5px solid #6e000b;
            }
            .elements-div
            {
                border-radius: 25px;
            }
            .nav-back
            {
                text-decoration: none;
                position: fixed;
                display: flex;
                top: 5rem;
                left: 0;
                border-radius: 0 .2rem .2rem 0;
                padding: 1.3rem 1.6rem 1.3rem .8rem;
                align-items: center;
                background-color: rgba(24,23,51,.9);
                box-shadow: 0 .1rem .2rem 0 rgba(0,0,0,.15);
                z-index: 300;
                transition: background-color .25s ease,top .25s ease;
                color: white;
                font-family: fantasy;
                cursor: pointer;

            }
            .nav-back:hover
            {
                background-color: wheat;
                color: black;
            }
            .overlay
            {

                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(11,10,34,0.8); /* Semi-transparent overlay */
                z-index: 20; /* Ensure overlay is above other content */


            }
            .bg
            {
                opacity: 0.9;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;

                z-index: 20; /* Ensure overlay is above other content */
            }
        </style>
    </head>
    <body>
        <%

            String midString = request.getParameter("mid");
            TeamDAO tdao = new TeamDAO();
            Team homeTeam;
            Team awayTeam;
            MatchSchedule match;
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            MatchStatisticDAO msdao = new MatchStatisticDAO();

            if (midString != null) {
                match = mdao.get(Integer.parseInt(midString)).orElse(null);
                homeTeam = tdao.get(match.getHomeTeamID()).orElse(null);
                awayTeam = tdao.get(match.getAwayTeamID()).orElse(null);
                match.setHomeTeam(homeTeam);
                match.setAwayTeam(awayTeam);
                MatchStatistic home = msdao.getByTeamIdAndMatchId(match.getHomeTeamID(), match.getMatchID()).orElse(null);
                match.setMatchHomeTeam(home);

                MatchStatistic Away = msdao.getByTeamIdAndMatchId(match.getAwayTeamID(), match.getMatchID()).orElse(null);
                match.setMatchAwayTeam(Away);
                request.setAttribute("match", match);
            }

        %>
        <%@include file="../INCLUDES/nav.jsp" %>
        <%@include file="../INCLUDES/head.jsp" %>

        <div class="container" style="color: white; margin: 3rem 0 0 0 ; width: 100vw; max-width: 100vw; position: relative;  ">
            <a  class="nav-back" id="backLink">
                <i class="fas fa-arrow-left"></i>
                <img src="${homeTeam.flag}" width="30px" height="30px alt="Home Team Flag">
                FC Real
            </a>
            <div class="bg" style="background-image: url('https://hanoispiritofplace.com/wp-content/uploads/2017/11/hinh-nen-barcelona-10.jpg');
                 background-size: cover;
                 background-repeat: no-repeat;" >

            </div>
            <div class="overlay" style=" z-index: 200"></div>
            <!--            <div style="display: flex;justify-content: space-between; padding: 10px;">
                            <img src="https://vntre.vn/uploads/images/2024/06/03/hinh-anh-va-y-nghia-logo-euro-2024-4-1717381187.jpg" width="150px" height="90px" alt="alt"/>
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/UEFA_Champions_League_logo.svg/2560px-UEFA_Champions_League_logo.svg.png" width="180px" height="90px" alt="alt"/>
                            <img src="https://irp.cdn-website.com/c57d8c85/dms3rep/multi/logo-world-cup-2022.webp" width="150px" height="90px" alt="alt"/>
                        </div>-->
            <div style="position: relative; z-index: 201">


                <div style="display: flex;justify-content: space-between; padding: 20px 15%; ">
                    <div style="display: flex;justify-content: space-between;align-items: center;height: 80px;background-color: white; border-radius: 45%  0  0 45% ;width: 50%;  ">
                        <img class="circle-image" src="${match.homeTeam.flag}" width="150px" height="90px" alt="alt"/>

                        <span style="margin: 0; color: #9e1a27; font-weight:  bold ; font-size: 35px;text-align: center;">${match.homeTeam.teamName}</span>
                        <span style="background-color: #9e1a27;color: white;font-weight:  bold ; font-size: 35px;height: 80px; padding: 10px 10px 0 10px;"> ${match.matchHomeTeam.score}</span>
                    </div>
                    <div style="display: flex;justify-content: space-between;;align-items: center;height: 80px; background-color: white;border-radius: 0 45% 45% 0  ;width: 50%;   ">
                        <span style="background-color: #9e1a27;color: white;font-weight:  bold ; font-size: 35px;height: 80px; padding: 10px 10px 0 10px;">${match.matchAwayTeam.score} </span>
                        <span style="margin: 0; color: #9e1a27; font-weight:  bold ; font-size: 35px; text-align: center;">${match.awayTeam.teamName}</span>
                        <img class="circle-image" src="${match.awayTeam.flag}" width="150px" height="90px" alt="alt"/>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                    <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.passes}</span>
                        <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Passes</span>
                        <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.passes}</span>
                    </div>

                    <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.cornerKicks}</span>
                        <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Corner Kicks</span>
                        <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.cornerKicks}</span>
                    </div>

                    <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.totalShots}</span>
                        <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Total Shots</span>
                        <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.totalShots}</span>
                    </div>

                    <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.redCards}</span>
                        <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Red Cards</span>
                        <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.redCards}</span>
                    </div>

                    <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.yellowCards}</span>
                        <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Yellow Cards</span>
                        <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                        <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.yellowCards}</span>
                    </div>

                </div>
            </div>

        </div>
        <script>
            document.getElementById("backLink").addEventListener("click", function (event) {
                event.preventDefault();
                window.history.back();
            });
        </script>
        <!-- Link to Bootstrap JS and dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>