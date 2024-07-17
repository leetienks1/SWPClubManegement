<%-- 
    Document   : LineupView
    Created on : Jul 11, 2024, 4:07:06 PM
    Author     : Desktop
--%>

<%@page import="Model.User"%>
<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.Team"%>
<%@page import="java.util.List"%>
<%@page import="DAO.TeamDAO"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            @keyframes gradientAnimation {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }

            body {
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f0f0f0;
                background-image: url('../IMAGE/HOME/Red and Black Sportive Next Match Youtube Thumbnail.png');
                background-size: cover; /* Ensures the background image covers the entire viewport */
                background-position: 0% 50%; /* Initial position for the animation */
                animation: gradientAnimation 15s ease infinite; /* Animation runs continuously */
                position: relative;
            }
            #playArea {
                position: relative;
                width: 500px;
                height: 700px;
                border: 1px solid black;
                margin: 0 auto;
                background-image: url('../IMAGE/HOME/Untitled design.jpg'); /* Replace with the actual URL */
                background-size: cover;
                background-position: center;
                transition: all 0.5s ease-in-out;
                overflow: hidden; /* ?n ph?n n?i dung ra ngoài khu v?c ch?i */
                animation: slideInPlayArea 1s ease forwards; /* Áp d?ng animation */
                opacity: 0; /* ?n playArea ban ??u */
            }
            @keyframes slideInPlayArea {
                0% {
                    opacity: 0;
                    transform: translateY(-100px); /* Di chuy?n t? trên xu?ng */
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .player .name
            {
                position: absolute;

                bottom: -25px;
                width: 100px;
                text-align: center;
                color: rgb(149,25,26);
                font-family: fantasy;
            }
            .player .postion
            {
                position: absolute;

                top: -20px;
                width: 100px;
                text-align: center;
                color: rgb(149,25,26);
                font-family: fantasy;
            }
            .player.selected {
                display: block;
            }
            .match-List {
                margin: 20px;
            }
            .match-List label {
                display: block;
                margin-bottom: 5px;
            }
            .player {
                position: absolute;
                width: 50px; /* ?? r?ng c?a c?u th? */
                height: 50px; /* ?? cao c?a c?u th? */
                background-color: #3498db; /* Màu n?n */
                border-radius: 20%; /* ?? t?o hình tròn */
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease; /* ?? tr? khi di chuy?n */
                transform: translateX(-100%); /* ??y ra ngoài phía bên trái */
                opacity: 0; /* ?n ?i ban ??u */
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }

            /* Hi?u ?ng khi di chu?t qua c?u th? */
            .player:hover {
                background-color: #2980b9;
            }

            /* Hi?u ?ng di chuy?n vào v? trí ban ??u */


            /* Áp d?ng hi?u ?ng cho các c?u th? */
            .player:nth-child(odd) {
                animation: slideIn 0.5s ease forwards;
            }
            .player:nth-child(even) {
                animation: slideIn 0.5s ease forwards;
                animation-delay: 0.1s; /* Delay cho các c?u th? ch?n ?? t?o hi?u ?ng ??ng th?i */
            }

            @keyframes slideIn {
                0% {
                    transform: translateX(-100%);
                    opacity: 0;
                }
                100% {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
            .container-List
            {
                margin: 20px auto;
                padding: 20px;
                text-align: center;
                width: 350px;
            }
            .container-List label {


                border-radius: 8px;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
                cursor: pointer;

                font-size: 1.1rem;
                color: #000;
                font-family: fantasy;
            }
            /* ??nh d?ng cho player-list */
            .match-List {
                background: url('../IMAGE/HOME/get ready.png') ;
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                /*                background-size: 400% 400%;*/
                border: 1px solid #ccc;
                border-radius: 12px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
                max-width: 400px;
                margin: 20px auto;
                animation: gradientAnimation 15s ease infinite;
                position: relative;
                max-height: 400px;
                overflow-y: scroll;
            }

            /* Hi?u ?ng chuy?n ??ng cho n?n */
            @keyframes gradientAnimation {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 150% 0%;
                }
            }

            /* ??t ki?u cho nhãn c?a m?i checkbox */
            .match-List div {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                padding: 10px;
                border-radius: 8px;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
                cursor: pointer;
                background: rgba(255,255,255,0.6);
                backdrop-filter: blur(5px);
                color: black;
                font-family: fantasy;
            }

            /* ??t ki?u cho checkbox */
            .match-List input[type="checkbox"] {
                margin-right: 10px;
                width: 20px;
                height: 20px;
                accent-color: #4A90E2; /* Màu checkbox */
            }

            /* Hi?u ?ng khi di chu?t qua nhãn */
            .match-List div:hover {
                background-color: rgba(255, 255, 255, 0.8);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* ??t ki?u cho nhãn cu?i cùng ?? b? kho?ng cách d??i */
            .match-List div:last-child {
                margin-bottom: 0;
            }
            #myDialog {
                display: block;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                border: 1px solid #ccc;
                padding: 30px;
                background: linear-gradient(45deg, #8EC5FC, #E0C3FC, #C2E9FB, #81FBB8);
                background-size: 300% 300%;
                z-index: 1000;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                animation: gradientAnimation 5s ease infinite;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            @keyframes gradientAnimation {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
            #myDialog:hover {
                /*                transform: scale(1.05);      Phóng to nh? */
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* T?ng bóng ?? */
            }

            /* ??t ki?u cho t?ng ph?n t? con bên trong h?p tho?i */
            #myDialog .selectable ,.selectable-none{
                margin-bottom: 10px;
                font-size: 16px;
                color: #333;
                padding: 10px;
                background-color: #ffffff;
                border-radius: 8px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            /* ??t ki?u cho ph?n t? cu?i cùng ?? b? kho?ng cách d??i */
            #myDialog .selectable:last-child {
                margin-bottom: 0;
            }

            /* Hi?u ?ng khi di chu?t qua t?ng ph?n t? con */
            #myDialog .selectable:hover {
                background-color: #e0e0e0;
                color: #000;
            }

            /* ??nh ngh?a animation cho gradient n?n */
            @keyframes gradientAnimation {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }

            /* ??t ki?u cho h?p tho?i l?a ch?n */
            .selectionDialog {

                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                border: 1px solid #ccc;
                padding: 30px;
                background: linear-gradient(45deg, #8EC5FC, #E0C3FC, #C2E9FB, #81FBB8);
                background-size: 300% 300%;
                z-index: 1000;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                animation: gradientAnimation 5s ease infinite;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                display: none;
                transform: translate(-50%, -50%);

                /*                max-height: 600px;*/
            }
            .selectionDialog select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                background: #f9f9f9;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            /* Hi?u ?ng khi di chu?t qua select */
            .selectionDialog select:hover {
                background: linear-gradient(45deg, #6AC1E9, #4A90E2)
            }

            /* ??t ki?u cho nút submit */
            .selectionDialog button {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                background: linear-gradient(45deg, #6AC1E9, #4A90E2);
                border: none;
                border-radius: 8px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            /* Hi?u ?ng khi di chu?t qua nút submit */
            .selectionDialog button:hover {
                background: linear-gradient(45deg, #4A90E2, #6AC1E9);
            }
            #overlay {
                display: block;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 500;
            }
            .selected-button
            {
                display: flex;
                gap: 5px;
            }
            .button-save
            {
                position: absolute;
                top:50%;
                right: 5%;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            .button-save button {
                background-color: #4CAF50; /* Green background */
                color: white; /* White text */
                border: none; /* Remove borders */
                padding: 5px 10px; /* Some padding */
                text-align: center; /* Centered text */
                text-decoration: none; /* Remove underline */
                display: inline-block; /* Make the button inline */
                font-size: 16px; /* Increase font size */
                /* Some margin */
                cursor: pointer; /* Pointer/hand icon on hover */
                border-radius: 12px; /* Rounded corners */
                transition: background-color ease-in 0.3s; /* Smooth transition for hover effect */
            }

            /* Hover effect for the button */
            .button-save button:hover {
                background-color: #45a049; /* Darker green */
                color: #007bff;
            }
            .name-card {
                display: flex;
                justify-content: center;
                align-items: center;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
            }

            .name-card-content {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                width: 300px;
                text-align: center;
                position: relative;
            }

            /* Close button styles */
            .close-btn {
                position: absolute;
                top: -10px;
                right: 10px;
                font-size: 30px;
                cursor: pointer;
            }
            .close-btn:hover
            {
                color: rosybrown;
            }

            /* Input styles */
            .name-card-content input {
                width: 80%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            /* Submit button styles */
            .name-card-content button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .name-card-content button:hover {
                background-color: #45a049;
            }
            .success-message {
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                border-radius: 5px;
                z-index: 1000;
                align-items: center;
                justify-content: center;
            }
            .success-message i {
                margin-right: 5px;
            }
            .success-message p
            {
                color: snow;
                font-size: 12px;
            }
            .error-message {
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #f8d7da;
                color: #721c24;
                padding: 10px;
                border: 1px solid #f5c6cb;
                border-radius: 5px;
                z-index: 2000;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .error-message.show {
                display: block;
                animation: fadeOut 2s forwards;
            }
            .match-info {
                font-size: 20px;
                font-weight: bold;

                color: #333;
                animation: textAnimation 7s linear infinite;
                ;
            }
            @keyframes textAnimation {
                0% {
                    transform: translateX(-50%);
                    opacity: 0;
                }
                50% {
                    opacity: 1;
                }
                100% {
                    transform: translateX(50%);
                    opacity: 0;
                }
            }
            .option-button {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: white;
                cursor: pointer;
                transition: background-color 0.3s ease;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .option-button:hover {
                background-color: #0056b3;
            }
            .chooseArea
            {
                text-align: center;
                display: flex;
                flex-direction: column;


            }
            ::-webkit-scrollbar {
                width: 8px; /* Width of the scrollbar */
            }

            ::-webkit-scrollbar-track {
                background: #f1f1f1; /* Color of the track */
            }

            ::-webkit-scrollbar-thumb {
                background-color: #888; /* Color of the thumb */
                border-radius: 4px; /* Roundness of the thumb */
            }

            ::-webkit-scrollbar-thumb:hover {
                background-color: #555; /* Color of the thumb on hover */
            }
            .active {
                background-color: rgba(0, 255, 255, 0.6) !important; /* Example style for active state */
            }
        </style>

        <%
            User u = (User) request.getSession().getAttribute("user");
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("/SWPClubManegement/home.jsp");
            }
            Player player = null;
            int userID = u.getUserId();
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            TeamDAO tdao = new TeamDAO();
            PlayerDAO pdao = new PlayerDAO();
            List<Player> players = pdao.getAll();
            for (Player p : players) {
                if (p.getUserID() == userID) {
                    player = p;
                    break;
                }
            }
            List<MatchSchedule> matches = mdao.getMatchInLineUpByPlayerID(player.getPlayerID());
            if(matches.size()>5)
            {
                matches = matches.subList(0, 5);
            }
            List<Team> teamList = tdao.getAll();
            Map<Integer, Team> teams = new HashMap();
            for (Team t : teamList) {
                teams.put(t.getTeamID(), t);
            }
            for (MatchSchedule match : matches) {
                match.setHomeTeam(teams.get(match.getHomeTeamID()));
                match.setAwayTeam(teams.get(match.getAwayTeamID()));
            }
            request.getSession().setAttribute("matches", matches);
        %>
        <div>
            <%@include file="../PLAYER/siderbar.jsp" %>
        </div> 

        <div class="container-List">

            <div id="match-List" class="match-List">
                <c:choose>
                    <c:when test="${not empty matches}">
                        <c:forEach var="m" items="${matches}">
                            <div class="selectable" data-selection="${m.matchID}"> ${m.homeTeam.teamName} VS ${m.awayTeam.teamName} (${m.tournament} ${m.matchDate})</div>
                        </c:forEach>
                    </c:when>
                        <c:otherwise>
                            <div>You are not in Any lastest match lineup</div>
                        </c:otherwise>
                </c:choose>
                <c:if test="${not empty matches}">

                </c:if>




            </div>
        </div>

        <div id="playArea">


        </div>
        <!--        <div id="overlay"></div>-->
        <!--        <div id="myDialog">
                    <span style="display: none;" id="close-button" class="close-btn" onclick="closeCard()">&times;</span>
                    <div class="selectable" data-selection="selection1"><i class="fa fa-plus-circle"></i> New Lineup</div>
                    <div class="selectable" data-selection="selection2"> <i class="fa fa-folder-open"></i> Load Line up</div>
                </div>-->











    </div>
    <script>
        var selectionId;
        var playArea;
        var playerCheckboxes;
        var players;
        let selectedPlayer = null;
        let selectedPlayers = [];
        var count = 0;
        var selection;
        var linupList;


        // start open lua chon--------------------------------------------------------------           
//        function showDialog(dialogId) {
//            // Hide all dialogs
//            var dialogs = document.querySelectorAll('.selectionDialog');
//            dialogs.forEach(function (dialog) {
//                dialog.style.display = 'none';
//            });
//            // Show the specified dialog
//            var selectedDialog = document.getElementById(dialogId);
//            if (selectedDialog) {
//                selectedDialog.style.display = 'block';
//            }
//        }
        document.querySelectorAll('#match-List .selectable').forEach(function (item) {
            const selectables = document.querySelectorAll('.selectable');
            item.addEventListener('click', function () {
                selectionId = item.getAttribute('data-selection');
                selectables.forEach(item => item.classList.remove('active'));

                // Add 'active' class to the clicked selectable
                item.classList.add('active');
                console.log("selection" + selectionId);
                GetLineup(selectionId);
            });
        });




        const playerPositions = {
            'GK': {top: '95%', left: '45%'},
            'LCB': {top: '75%', left: '25%'},
            'CB': {top: '80%', left: '45%'},
            'RCB': {top: '75%', left: '65%'},
            'LB': {top: '70%', left: '5%'},
            'LWB': {top: '65%', left: '5%'},
            'RB': {top: '70%', left: '85%'},
            'RWB': {top: '65%', left: '85%'},
            'CDM': {top: '60%', left: '45%'},
            'LCM': {top: '45%', left: '25%'},
            'RCM': {top: '45%', left: '65%'},
            'CM': {top: '45%', left: '45%'},
            'LM': {top: '35%', left: '3%'},
            'RM': {top: '35%', left: '87%'},
            'RAM': {top: '28%', left: '65%'},
            'CAM': {top: '28%', left: '45%'},
            'LAM': {top: '28%', left: '30%'},
            'ST': {top: '5%', left: '45%'},
            'CF': {top: '16%', left: '45%'},
            'LW': {top: '15%', left: '5%'},
            'RW': {top: '15%', left: '85%'}
        };



        function GetLineup(eid)
        {

            var url = '/SWPClubManegement/LineupServlet?command=GET&eid=' + eid;
            fetch(url, {method: "GET"})
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok " + response.statusText);
                        }
                        return response.json();
                    }).then(data => {

                console.log(data);
                document.querySelectorAll(".player").forEach(player => {
                    player.style.display = 'none';
                });
                // Convert data to a string before storing it
                const playerList = data.players;
                const lineups = data.lineups;

                selectedPlayers = [];
                console.log("xoa " + selectedPlayer);
                count = 0;
                playerList.forEach(p => {

                    lineups.forEach(l => {
                        if (p.playerID === l.playerID)
                        {
                            selectedPlayers.push({
                                id: p.name,
                                position: l.position,
                                top: l.yLocation + "%",
                                left: l.xLocation + "%",
                                pid: p.playerID

                            });
                        }
                    });
                });

                sessionStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                console.log(selectedPlayer);
                selectedPlayers.forEach(player => {

                    players.forEach(p => {
                        if (p.id === player.id)
                        {
                            p.style.display = 'flex';
//                            const position = playerPositions[player.dataset.position];

                            p.style.top = player.top;
                            ;
                            p.style.left = player.left;
                            ;
                            count++;
                            p.dataset.position = player.position;
                            var color = getColorByPosition(p.dataset.position);

                            if (p.id.includes(' ')) {

                                var playerNumber = p.id.split(' ')[1];
                                p.innerHTML = '<p class="name" style="color:' + color + ';">' + playerNumber + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + player.position + '</p>';

                                console.log(playerNumber);  // Output: "123"
                            } else {
                                p.innerHTML = '<p class="name" style="color:' + color + ';">' + p.id + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + player.position + '</p>';

                            }


//                                    
                        }
                    });
                });




            }).catch(error => {
                console.error("There was a problem with the fetch operation ls:", error);
                throw new Error(error); // ??m b?o reject v?i l?i ?? catch() có th? x? lý
            });
        }
        ListPlayers().then(data => {




            selectedPlayers = JSON.parse(sessionStorage.getItem('selectedPlayers')) || [];
            console.log(sessionStorage.getItem('selectedPlayers'));


            players = document.querySelectorAll('.player');

            console.log("player" + players.length);
            playArea = document.getElementById('playArea');

            loadSelectedPlayer();









            function LoadListMatch()
            {
                const url = "/SWPClubManegement/PlayerController?command=GETLISTFORPLAYER";
                fetch(url, {method: "GET"})
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok " + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log("fetch data:", data);

                            if (data.length !== 0 || data !== null)
                            {
                                const matches = data.matches;
                                const hometeam = data.homeTeam;
                                const awayteam = data.awayTeam;
                                const listMatch = document.querySelector("#listMatch");
                                var newDiv = document.createElement("div");

                                matches.forEach(mEx => {
                                    newDiv.className = "selectable";


                                    newDiv.setAttribute("data-selection", mEx.matchID);


                                    const homeTeamName = hometeam[mEx.homeTeamID];
                                    const awayTeamName = awayteam[mEx.awayTeamID];
                                    // Ki?m tra s? t?n t?i c?a homeTeamName và awayTeamName
                                    if (homeTeamName && awayTeamName) {
                                        newDiv.textContent = homeTeamName + " vs " + awayTeamName + "(" + m.tournament + " " + m.matchDate + ")";
                                    } else {
                                        console.error("Team ID not found:", m.homeTeamID, m.awayTeamID);
                                    }



                                    listMatch.appendChild(newDiv);
                                });

                            }

                        })
                        .catch(error => {
                            console.error("There was a problem with the fetch operation:", error);

                        });

            }







            // Hi?n th? l?i c?u th? ?ã ch?n
            function loadSelectedPlayer()
            {
                count = 0;
                selectedPlayers.forEach(player => {
                    console.log("count load " + count);
                    const playerCheckbox = document.querySelector('input[type="checkbox"][data-player="' + player.id + '"]');
                    console.log(playerCheckbox);
                    if (playerCheckbox) {
                        playerCheckbox.checked = true;
                        const playerIndex = Array.from(players).findIndex(p => p.id.toLowerCase() === player.id.toLowerCase());
                        if (playerIndex !== -1) {
                            players[playerIndex].style.display = 'flex';
//                            const position = playerPositions[player.dataset.position];
                            if (player.top && player.left) {
                                players[playerIndex].style.top = player.top;
                                players[playerIndex].style.left = player.left;
                            }
                            count++;
                        }
                        players.forEach(p => {
                            if (p.id === player.id)
                            {
                                p.dataset.position = player.position;
                                var color = getColorByPosition(p.dataset.position);
                                if (player.id.includes(' ')) {

                                    var playerNumber = player.id.split(' ')[1];
                                    p.innerHTML = '<p class="name" style="color:' + color + ';">' + playerNumber + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + player.position + '</p>';

                                    console.log(playerNumber);  // Output: "123"
                                } else {
                                    p.innerHTML = '<p class="name" style="color:' + color + ';">' + player.id + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + player.position + '</p>';

                                }
                            }
                        });
                    }
                });
            }



            function getColorByPosition(position) {
                if (position.includes("B")) {
                    return "rgb(6,43,87)";
                } else if (position.includes("M")) {
                    return "rgb(0,119,0)";
                } else if (position.includes("T") || position.includes("CF")) {
                    return "rgb(187,0,0)";
                } else if (position.includes("W")) {
                    return "rgb(187,0,0)";
                } else {
                    return "rgb(250,179,102)"; // Default color if no conditions match
                }
            }


        });
        function getColorByPosition(position) {
            if (position.includes("B")) {
                return "rgb(6,43,87)";
            } else if (position.includes("M")) {
                return "rgb(0,119,0)";
            } else if (position.includes("T") || position.includes("CF")) {
                return "rgb(187,0,0)";
            } else if (position.includes("W")) {
                return "rgb(187,0,0)";
            } else {
                return "rgb(250,179,102)"; // Default color if no conditions match
            }
        }
        function ListPlayers()
        {
            const url = "/SWPClubManegement/PlayerController?command=LOAD";
            return new Promise((resolve, reject) => {
                fetch(url, {method: "GET"})
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok " + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log("fetch data:", data);
                            UpdateListPlayersDiv(data);
                            resolve(data); // ??m b?o resolve v?i d? li?u ?? then() có th? x? lý
                        })
                        .catch(error => {
                            console.error("There was a problem with the fetch operation:", error);
                            reject(error); // ??m b?o reject v?i l?i ?? catch() có th? x? lý
                        });
            });
        }
        function UpdateListPlayersDiv(data)
        {
            const players = data.players;
            console.log("fetch" + players);
            const users = data.users;


            const playArea = document.getElementById('playArea');
            players.forEach(player => {
                const playerDiv = document.createElement('div');
                playerDiv.className = 'player';
                playerDiv.id = player.name;
                playerDiv.setAttribute('data-position', player.position);
                playerDiv.setAttribute('data-pid', player.playerID);
                users.forEach(u =>
                {
                    if (u.userId === player.userID)
                    {
                        var imagePath = u.image;
//                             var encodedImagePath = encodeURIComponent(imagePath);

                        if (imagePath.includes(' ')) {

//                                imagePath = encodeURIComponent(imagePath);
                        }
                        console.log(player.name + imagePath);

                        playerDiv.style.backgroundImage = 'url(\'' + imagePath + '\')';
                        console.log(player.name + playerDiv.style.backgroundImage);
                    }
                });
                const playerName = document.createElement('p');
                playerName.textContent = player.name;
                playerDiv.appendChild(playerName);
                playArea.appendChild(playerDiv);
            });
            document.querySelectorAll(".player").forEach(player => {
                player.style.display = 'none';
            });
            console.log("done");
        }



    </script>
</body>

</html>
