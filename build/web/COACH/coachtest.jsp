<%@page import="DAO.TeamDAO"%>
<%@page import="Model.Team"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="DAO.ExpectedLineupDAO"%>
<%@page import="Model.ExpectedLineups"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="DAO.MatchScheduleDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Position"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>4-2-3-1 Formation</title>
        <%@include file="../INCLUDES/head.jsp" %>
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

                bottom: -35px;
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
            .player-list {
                margin: 20px;
            }
            .player-list label {
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
            .player-list {
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
            .player-list label {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                padding: 10px;
                border-radius: 8px;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
                cursor: pointer;
                background: rgba(255,255,255,0.6);
                backdrop-filter: blur(5px);
                color: wheat;
                font-family: fantasy;
            }

            /* ??t ki?u cho checkbox */
            .player-list input[type="checkbox"] {
                margin-right: 10px;
                width: 20px;
                height: 20px;
                accent-color: #4A90E2; /* Màu checkbox */
            }

            /* Hi?u ?ng khi di chu?t qua nhãn */
            .player-list label:hover {
                background-color: rgba(255, 255, 255, 0.8);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* ??t ki?u cho nhãn cu?i cùng ?? b? kho?ng cách d??i */
            .player-list label:last-child {
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
        </style>
    </head>
    <body>
        <%
            List<String> positions = new ArrayList<>();
            for (Position position : Position.values()) {
                positions.add(position.toString());
            }
            request.getSession().setAttribute("positions", positions);
            MatchScheduleDAO mdao = new MatchScheduleDAO();
            List<MatchSchedule> listMatches = mdao.getMatchNotYetTakePlace();
            if (!listMatches.isEmpty()) {
                request.getSession().setAttribute("matches", listMatches);
            } else {
                request.getSession().setAttribute("matches", null);
            }
            ExpectedLineupDAO epdao = new ExpectedLineupDAO();
            List<ExpectedLineups> listLineup = epdao.getAll();
            List<MatchSchedule> listMatch = new ArrayList<MatchSchedule>();
            if (!listLineup.isEmpty()) {

                for (ExpectedLineups ex : listLineup) {
                    listMatch.add(mdao.get(ex.getMatchID()).orElse(null));
                }
                request.getSession().setAttribute("listM", listMatch);

                request.getSession().setAttribute("listLineup", listLineup);
            } else {
                request.getSession().setAttribute("listLineup", null);
            }
            TeamDAO tdao = new TeamDAO();
            Map<Integer, String> homeTeams = new HashMap<>();
            Map<Integer, String> awayTeams = new HashMap<>();

            for (MatchSchedule m : listMatches) {
                homeTeams.put(m.getHomeTeamID(), tdao.get(m.getHomeTeamID()).get().getTeamName());
                awayTeams.put(m.getAwayTeamID(), tdao.get(m.getAwayTeamID()).get().getTeamName());
            }

            request.setAttribute("homeTeams", homeTeams);
            request.setAttribute("awayTeams", awayTeams);
//            request.setAttribute("teamNames", teamNames);
        %>

        <div class="chooseArea">

            <button class="option-button" onclick="opendialog()">
                <i class="fa fa-file-alt"></i> Load
            </button>
        </div>
        <div class="container-List">
            <div class="match-info">Who vs Who</div>
            <label>
                List Players
            </label>
            <div id="player-List" class="player-list">


            </div>
        </div>

        <div id="playArea">


        </div>
        <div id="overlay"></div>
        <div id="myDialog">
            <span style="display: none;" id="close-button" class="close-btn" onclick="closeCard()">&times;</span>
            <div class="selectable" data-selection="selection1"><i class="fa fa-plus-circle"></i> New Lineup</div>

            <div class="selectable" data-selection="selection2"> <i class="fa fa-folder-open"></i> Load Line up</div>



        </div>

        <div id="selection1" class="selectionDialog" style="display: none;">
            <div>Select a player for New Line up:</div>

            <select name="selection1">
            </select>
            <div id="new-Button" class="selected-button">
                <button id="submitButton" onclick="submitSelection('selection1')">Confirm</button>
                <button onclick="showDialog('myDialog')">Back</button> <!-- Go back to selection2 -->
            </div>
        </div>


        <div id="selection2" class="selectionDialog" style="display: none;">
            <div>Load Line up:</div>


            <select name="selection2">

            </select>




            <div id="load-Button" class="selected-button">
                <button id="submitButton" onclick="submitSelection('selection2')">Submit</button>
                <button onclick="showDialog('myDialog')">Back</button> 
            </div>
        </div>

        <div class="button-save">
            <button id="saveButton">
                <i class="fa fa-save"></i> 
            </button>
            <button id="saveButton" onclick="deleteClick()">
                <i class="fa fa-trash"></i>
            </button>

        </div>
        <div id="nameCard" class="name-card" style="display: none;">
            <div class="name-card-content">
                <span class="close-btn" onclick="closeCard()">&times;</span>
                <h2>Enter Your Note</h2>
                <input type="text" id="note" placeholder="Your Note">
                <button onclick="submitName()">Submit</button>
            </div>
        </div>

        <div class="success-message" id="successMessage">
            <i class="fas fa-check"></i> 
        </div>
        <div class="error-message" id="errorMessage">

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
            ///////////////////////////////////////////////// load lua chon /////////////////////////////////////////////////


            //////////////////////////////////////////////

            document.getElementById('saveButton').addEventListener('click', function () {
                if (selectedPlayers.length <= 10)
                {

                    var errorMessage = document.getElementById('errorMessage');
                    errorMessage.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + ' Please Select Full 11 players ';
                    errorMessage.classList.add('show');
                    setTimeout(function () {
                        errorMessage.classList.remove('show');
                    }, 3000);
                    return;
                }
                document.getElementById('nameCard').style.display = 'flex';
            });
//save-card-------------------------------------------------------------------------------
            function closeCard() {
                document.getElementById('nameCard').style.display = 'none';
                document.querySelector('#myDialog').style.display = 'none';
                document.querySelector('#overlay').style.display = 'none';
            }

            function opendialog()
            {

                document.querySelector('#myDialog').style.display = 'block';
                document.querySelector('#overlay').style.display = 'block';
                document.querySelector('#close-button').style.display = 'block';
                loadSelectData();

            }
            function submitName() {
                var note = document.getElementById('note').value;
                var action;
                if (note) {
                    if (selectionId === "selection1")
                    {
                        action = "ADD";
                    } else
                    {
                        action = "UPDATE";
                    }
//                    const selection = document.querySelector('select[name="' + selectionId + '"]').value;
                    console.log("ec" + selectionId);
//                    alert('Player name entered: ' + note + selection);

                    performAction(action, selectedPlayers, selection, note);

                    closeCard();
                } else {
                    alert('Please enter a player name.');
                }
            }

            function performAction(action, data, matchID, note) {
                console.log("data " + data);
                fetch('/SWPClubManegement/LineupServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({action: action, data: data, matchID: matchID, note: note})
                })
                        .then(response => response.json())
                        .then(data => {
                            console.log('Success:', data.message);
                            // Handle the response data
                            var success = document.getElementById('successMessage');
                            success.style.display = "flex";
                            successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Add operation successful';
                            setTimeout(function () {
                                success.style.display = "none";
                            }, 1000);

                            selectionId = "selection2";


                        })
                        .catch(error => {
                            console.error('Error:', error);
                        }).finally(() => {
                    loadSelectData();
                });
            }
// end save-card--------------------------------------------------------------


// start delete lineup -----------------------------------------------------------------------
            function deleteClick()
            {
                const selection = document.querySelector('select[name="' + selectionId + '"]').value;
                deleteAction(selection);
            }
            function deleteAction(matchID) {

                fetch('/SWPClubManegement/LineupServlet?command=DELETE&mid=' + matchID, {
                    method: 'GET'})
                        .then(response => response.text())
                        .then(text => {
                            const data = JSON.parse(text);


                            console.log("delete" + data);
                            if (data.status)
                            {
                                var errorMessage = document.getElementById('errorMessage');
                                errorMessage.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + data.message;
                                errorMessage.classList.add('show');
                                setTimeout(function () {
                                    errorMessage.classList.remove('show');
                                }, 3000);
                                return;
                            }
                            // Handle the response data
                            var success = document.getElementById('successMessage');
                            success.style.display = "flex";
                            successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Delete operation successful';
                            setTimeout(function () {
                                success.style.display = "none";
                            }, 1000);
                            const matchInfo = document.querySelector('.match-info');
                            matchInfo.textContent = "";
                            document.querySelector('#myDialog').style.display = 'block';
                            document.querySelector('#overlay').style.display = 'block';
                            playerDisplayOff(selectedPlayers);
                            selectedPlayers = [];
                            sessionStorage.removeItem('selectedPlayers');
                            sessionStorage.removeItem('selection');

                            defaultPlayers();
                            loadSelectData();
                            const dialog = document.querySelector('#myDialog');
                            const continueDiv = document.querySelector('.continue')
                            if (continueDiv)
                            {
                                dialog.removeChild(continueDiv);
                            }
//                            window.location.reload();
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });

            }





// end  delete lineup -----------------------------------------------------------------------







            // start load data select --------------------------------------------------
            function loadSelectData()
            {
                const newLineup = "selection1";
                const loadLineup = "selection2";
                listMatchNotyetHappen(newLineup);
                LoadLineup(loadLineup);
            }
            loadSelectData();
            // end load data select ------------------------------------------------------------

            // start open lua chon--------------------------------------------------------------           
            function showDialog(dialogId) {
                // Hide all dialogs
                var dialogs = document.querySelectorAll('.selectionDialog');
                dialogs.forEach(function (dialog) {
                    dialog.style.display = 'none';
                });
                // Show the specified dialog
                var selectedDialog = document.getElementById(dialogId);
                if (selectedDialog) {
                    selectedDialog.style.display = 'block';
                }
            }
            document.querySelectorAll('#myDialog .selectable').forEach(function (item) {
                item.addEventListener('click', function () {
                    // ?n t?t c? các h?p tho?i l?a ch?n
                    document.querySelector('#myDialog').style.display = 'none';
//                    document.querySelector('#myDialog').style.display = 'none';

                    document.querySelectorAll('.selectionDialog').forEach(function (dialog) {
                        dialog.style.display = 'none';
                    });
                    // Hi?n th? h?p tho?i l?a ch?n t??ng ?ng
                    selectionId = item.getAttribute('data-selection');
                    document.getElementById(selectionId).style.display = 'block';
                });
            });
            function submitSelection(selectionId) {

//                alert('Selection submitted for ' + selectionId);
                selection = document.querySelector('select[name="' + selectionId + '"]').value;

                if (selectionId === "selection1")
                {
                    playerDisplayOff(selectedPlayers);
                    selectedPlayers = [];
                    sessionStorage.removeItem('selectedPlayers');
                    defaultPlayers();
                } else
                {
                    var eid = document.querySelector('select[name="' + selectionId + '"]').value;
                    GetLineup(selectionId, eid);
                }
                updateMatchInforDiv(selectionId);
                loadSelectData();
                document.querySelector('#overlay').style.display = 'none';
                document.getElementById(selectionId).style.display = 'none';
            }

            function updateMatchInforDiv(selectionId)
            {
                const options = document.querySelectorAll('select[name="' + selectionId + '"] option');
                const matchInfo = document.querySelector('.match-info');
                let selectionList = [];
                options.forEach(option => {
                    if (option.selected) {
                        selectionList.push({
                            valueInput: option.value,
                            value: selectionId,
                            content: option.textContent.split("(")[0],
                            matchID: selection
                        });
                        matchInfo.textContent = option.textContent.split("(")[0];
                        sessionStorage.setItem('selection', JSON.stringify(selectionList));
                    }
                });
            }


            function listMatchNotyetHappen(selectionId)
            {
                var url = '/SWPClubManegement/LineupServlet?command=LIST';
                fetch(url, {method: "GET"})
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok " + response.statusText);
                            }
                            return response.json();
                        }).then(data => {
                    console.log(data);
                    const matches = data.matches;
                    const hometeam = data.homeTeam;
                    const awayteam = data.awayTeam;
                    const select = document.querySelector('select[name="' + selectionId + '"]');
                    select.options.length = 0;
                    if (matches.length === 0)
                    {
                        var buttonToHide = document.querySelector('#load-Button #submitButton');

                        if (buttonToHide) {
                            buttonToHide.style.display = 'none';
                        }
                        const select = document.querySelector('select[name="' + selectionId + '"]');
                        const option = document.createElement("option");
                        option.textContent = "There are no match yet";

                        option.disabled = true;
                        option.selected = true;
                        option.required = true;
                        select.appendChild(option);
                    } else
                    {
                        matches.forEach(m => {
                            const homeTeamName = hometeam[m.homeTeamID];
                            const awayTeamName = awayteam[m.awayTeamID];
                            // Ki?m tra s? t?n t?i c?a homeTeamName và awayTeamName
                            if (homeTeamName && awayTeamName) {
                                const option = document.createElement("option");
                                option.value = m.matchID;
                                option.textContent = homeTeamName + " vs " + awayTeamName + "(" + m.tournament + " " + m.matchDate + ")";
                                select.appendChild(option);
                            } else {
                                console.error("Team ID not found:", m.homeTeamID, m.awayTeamID);
                            }
                        });
                    }


                }).catch(error => {
                    console.error("There was a problem with the fetch operation ls:", error);
                    throw new Error(error); // ??m b?o reject v?i l?i ?? catch() có th? x? lý
                });
            }

            function LoadLineup(selectionId)
            {
                console.log("load " + selectionId)
                var url = '/SWPClubManegement/LineupServlet?command=LOAD';
                fetch(url, {method: "GET"})
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok " + response.statusText);
                            }
                            return response.json();
                        }).then(data => {
                    console.log(data);
                    if (data.length !== 0)
                    {

                        const matches = data.matches;
                        const hometeam = data.homeTeam;
                        const lineups = data.lineups;
                        const awayteam = data.awayTeam;
                        const select = document.querySelector('select[name="' + selectionId + '"]');
                        select.options.length = 0;
                        if (matches.length === 0)
                        {
                            var buttonToHide = document.querySelector('#load-Button #submitButton');

                            if (buttonToHide) {
                                buttonToHide.style.display = 'none';
                            }
                            const select = document.querySelector('select[name="' + selectionId + '"]');
                            const option = document.createElement("option");
                            option.textContent = "There are no Lineup yet";
                            option.disabled = true;
                            option.selected = true;
                            option.required = true;
                            select.appendChild(option);
                        } else
                        {
                            lineups.forEach(l => {
                                matches.forEach(m => {

                                    if (l.matchID === m.matchID)
                                    {
                                        const homeTeamName = hometeam[m.homeTeamID];
                                        const awayTeamName = awayteam[m.awayTeamID];
                                        // Ki?m tra s? t?n t?i c?a homeTeamName và awayTeamName
                                        if (homeTeamName && awayTeamName) {
                                            const option = document.createElement("option");
                                            option.value = m.matchID;
                                            option.textContent = homeTeamName + " vs " + awayTeamName + "(" + m.tournament + " " + m.matchDate + ")";
                                            select.appendChild(option);
                                        } else {
                                            console.error("Team ID not found:", m.homeTeamID, m.awayTeamID);
                                        }
                                    }
                                });
                            });
                            var buttonToHide = document.querySelector('#load-Button #submitButton');

                            if (buttonToHide) {
                                buttonToHide.style.display = 'block';
                            }
                        }



                    }
                }).catch(error => {
                    console.error("There was a problem with the fetch operation ls:", error);
                    throw new Error(error); // ??m b?o reject v?i l?i ?? catch() có th? x? lý
                });
            }

            function GetLineup(selectionId, eid)
            {
                console.log("load " + selectionId)
                var url = '/SWPClubManegement/LineupServlet?command=GET&eid=' + eid;
                fetch(url, {method: "GET"})
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok " + response.statusText);
                            }
                            return response.json();
                        }).then(data => {

                    console.log(data);
                    // Convert data to a string before storing it
                    const playerList = data.players;
                    const lineups = data.lineups;
                    playerDisplayOff(selectedPlayers);
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
                        })
                    });
                    sessionStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                    console.log(selectedPlayer);
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

                                players[playerIndex].style.top = player.top;
                                ;
                                players[playerIndex].style.left = player.left;
                                ;
                                count++;
                            }
                            players.forEach(p => {
                                if (p.id === player.id)
                                {
                                    p.dataset.position = player.position;
                                    var color = getColorByPosition(p.dataset.position);

                                    if (p.id.includes(' ')) {

                                        var playerNumber = p.id.split(' ')[1];
                                        p.innerHTML = '<p class="name" style="color:' + color + ';">' + playerNumber + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + player.position + '</p>';

                                        console.log(playerNumber);  // Output: "123"
                                    } else {
                                        p.innerHTML = '<p class="name" style="color:' + color + ';">' + p.id + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + player.position + '</p>';

                                    }
                                   

//                                    p.innerHTML = '<p style="color:' + color + ';">' + player.id + ' ' + player.position + '</p>';
                                }
                            });
                        }



                    });
                }).catch(error => {
                    console.error("There was a problem with the fetch operation ls:", error);
                    throw new Error(error); // ??m b?o reject v?i l?i ?? catch() có th? x? lý
                });
            }

            function playerDisplayOff(selectedPlayers)
            {
                players.forEach(player => {
                    player.style.display = 'none';
                });
                selectedPlayers.forEach(player => {
                    const playerCheckbox = document.querySelector('input[type="checkbox"][data-player="' + player.id + '"]');
                    console.log(playerCheckbox);
                    if (playerCheckbox) {
                        playerCheckbox.checked = false;
                        count--;
                    }
                });
            }

            // end open lua chon--------------------------------------------------------------           






            // default-- player- posstion -------------------------------------
            function defaultPlayers()
            {
                const url = "/SWPClubManegement/PlayerController?command=LOAD";
                fetch(url, {method: "GET"})
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok " + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log("fetch data:", data);
                            const listdefaultPlayers = data.players;
                            players.forEach(p => {
                                listdefaultPlayers.forEach(player =>
                                {
                                    if (p.id === player.name)
                                    {
                                        console.log("posi " + player.position);
                                        p.dataset.position = player.position;
                                        p.style.top = playerPositions[player.position].top;
                                        p.style.left = playerPositions[player.position].left;
                                    }
                                });
                            });
                        })
                        .catch(error => {
                            console.error("There was a problem with the fetch operation:", error);
                        });
            }
            // end default-- player- posstion -------------------------------------

            function ContinueChoice()
            {

                if (selectedPlayers.length !== 0 && sessionStorage.getItem('selection') !== null) {
                    const dialog = document.querySelector('#myDialog');
                    if (dialog) {
                        const conDiv = document.createElement('div'); // Corrected from createAttribute to createElement
                        conDiv.classList.add("selectable");
                        conDiv.classList.add("continue");// Add class if needed
                        const iconElement = document.createElement('i');
                        iconElement.classList.add('fa', 'fa-play'); // Thay 'fa-play' b?ng class icon c?a b?n

                        // T?o v?n b?n "Continue"
                        const textNode = document.createTextNode(" Continue");

                        // Thêm icon và v?n b?n vào conDiv
                        conDiv.appendChild(iconElement);
                        conDiv.appendChild(textNode);


                        conDiv.onclick = function () {
                            let selectionList = JSON.parse(sessionStorage.getItem('selection'));
                            if (selectionList && selectionList.length > 0) {
                                // Assuming you want to get the first selection item for demonstration
                                const selectionItem = selectionList[0];
                                selectionId = selectionItem.value;
                                selection = selectionItem.matchID;
                                console.log(selectionId);
                                const content = selectionItem.content;
                                const value = selectionItem.valueInput;
                                console.log(value);
                                const ec = document.querySelectorAll('select[name="' + selectionId + '"] option');
                                console.log("ec " + ec);
                                ec.forEach(op => {
                                    console.log("oploop " + op.value);
                                    if (op.value === value)
                                    {
                                        console.log("op " + op.value);
                                        op.selected = true;
                                    }
                                });
                                console.log("op " + document.querySelector('select[name="' + selectionId + '"] ').value);
                                const matchInfo = document.querySelector('.match-info');
                                matchInfo.textContent = content;
                            } else {
                                console.error("No selection found in session storage");
                            }
                            closeCard();
                        }
                        ;
                        dialog.appendChild(conDiv); // Append the new div element to the dialog
                    } else {
                        console.error("Dialog element not found!");
                    }
                }
            }
















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
            ListPlayers().then(data => {



//                sessionStorage.removeItem('selectedPlayers');
                selectedPlayers = JSON.parse(sessionStorage.getItem('selectedPlayers')) || [];
                console.log(sessionStorage.getItem('selectedPlayers'));
                ContinueChoice();
                players = document.querySelectorAll('.player');
                console.log("player" + players.length);
                playArea = document.getElementById('playArea');
                playerCheckboxes = document.querySelectorAll('.player-list input[type="checkbox"]');
                players.forEach(player => {
                    player.style.display = 'none';
                });
                loadSelectedPlayer();
                function closeDialog() {
                    document.getElementById('myDialog').style.display = 'none';
                    document.getElementById('overlay').style.display = 'none';
                }




                console.log("load " + sessionStorage.getItem('selectedPlayers'));
                // Hi?n th? l?i c?u th? ?ã ch?n



//             







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
                // L?ng nghe s? ki?n khi checkbox thay ??i
                playerCheckboxes.forEach((checkbox, index) => {

                    checkbox.addEventListener('change', () => {
                        const playerId = players[index].id;
                        const playerPosition = players[index].dataset.position;
                        const pid = players[index].dataset.pid;
//                    const playerTop = players[index].style.top;
//                    const playerLeft = players[index].style.left;
                        const position = playerPositions[playerPosition];
                        if (checkbox.checked && count < 11) {
                            players[index].style.display = 'flex';
                            count++;
                            // L?u thông tin c?a c?u th? ???c ch?n vào localStorage
//                        selectedPlayers.push({id: playerId, position: playerPosition});
                            selectedPlayers.push({
                                id: playerId,
                                position: playerPosition,
                                top: position.top,
                                left: position.left,
                                pid: pid

                            });
//                            localStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                            // N?u c?u th? này có v? trí ???c ??nh ngh?a, ??t nó vào v? trí t??ng ?ng
//                        const position = playerPositions[playerPosition];
                            if (position) {
                                players[index].style.top = position.top;
                                players[index].style.left = position.left;
                            }
                        } else if (!checkbox.checked) {
                            players[index].style.display = 'none';
                            count--;
                            // Xóa c?u th? kh?i m?ng n?u checkbox không ???c ch?n
                            const selectedIndex = selectedPlayers.findIndex(player => player.id === playerId);
                            if (selectedIndex !== -1) {
                                selectedPlayers.splice(selectedIndex, 1);
//                                localStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                            }
                        } else {
                            // Không cho phép ch?n thêm n?u ?ã ??t ??n s? l??ng t?i ?a
                            checkbox.checked = false;
                            alert("Full player");
                        }
                        sessionStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
//                    
                        loadSelectedPlayer();
                        console.log(selectedPlayers);
                        console.log("count check " + count);
                    });
                });
                if (players.length > 0)
                {

                    let isDragging = false;
                    let currentObject = null;
                    var tempTop;
                    var tempLeft;
                    var tempPosition;
                    // L?u c?u th? vào currentObject 
                    document.querySelectorAll('.player').forEach(player => {
                        player.addEventListener('mousedown', function (event) {
                            isDragging = true;
                            currentObject = player;
                            players.forEach(p => {
                                p.style.transition = 'none';
                            });
                            console.log(currentObject);
                            event.preventDefault(); // Ng?n ch?n hành vi m?c ??nh (ví d?: kéo v?n b?n)
                            tempTop = currentObject.style.top;
                            tempLeft = currentObject.style.left;
                            tempPosition = currentObject.dataset.position;
                            console.log("temp " + tempPosition)
                        });
                    });
                    // Di chuy?n currentObject theo con tr? chu?t
                    document.addEventListener('mousemove', function (event) {
                        if (isDragging && currentObject) {
//                    console.log("mouse move");
                            const rectArea = playArea.getBoundingClientRect();
                            const x = event.clientX - rectArea.left - (currentObject.offsetWidth / 2);
                            const y = event.clientY - rectArea.top - (currentObject.offsetHeight / 2);
                            // ??m b?o v?t th? không b? di chuy?n ra kh?i khu v?c ch?i
                            const maxX = playArea.clientWidth - currentObject.clientWidth;
                            const maxY = playArea.clientHeight - currentObject.clientHeight;
                            const constrainedX = Math.max(0, Math.min(x, maxX));
                            const constrainedY = Math.max(0, Math.min(y, maxY));
                            const parentWidth = playArea.clientWidth;
                            const parentHeight = playArea.clientHeight;
                            const leftPercentage = (constrainedX / parentWidth) * 100;
                            const topPercentage = (constrainedY / parentHeight) * 100;
                            currentObject.style.left = leftPercentage + '%';
                            currentObject.style.top = topPercentage + '%';
                            // doi vi tri tuong ung khi dang di chuyen
                            const rect = currentObject.getBoundingClientRect();
                            const playAreaRect = document.getElementById('playArea').getBoundingClientRect();
                            const top = ((rect.top - playAreaRect.top) / playAreaRect.height) * 100;
                            const left = ((rect.left - playAreaRect.left) / playAreaRect.width) * 100;
                            for (const [position, pos] of Object.entries(playerPositions)) {
                                const posTop = parseFloat(pos.top);
                                const posLeft = parseFloat(pos.left);
                                // Ki?m tra n?u v? trí hi?n t?i g?n v?i v? trí ??nh s?n (trong ph?m vi 5%)
                                if (Math.abs(top - posTop) < 13 && Math.abs(left - posLeft) < 18) {
//                            currentObject.style.top = pos.top;
//                            currentObject.style.left = pos.left;
//                            console.log("mouse move" + position);

                                    currentObject.dataset.position = position;
                                    var color = getColorByPosition(currentObject.dataset.position);
//                               
                                    if (currentObject.id.includes(' ')) {

                                        var playerNumber = currentObject.id.split(' ')[1];
                                        currentObject.innerHTML = '<p class="name" style="color:' + color + ';">' + playerNumber + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + currentObject.dataset.position + '</p>';

                                        console.log(playerNumber);  // Output: "123"
                                    } else {
                                        currentObject.innerHTML = '<p class="name" style="color:' + color + ';">' + currentObject.id + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + currentObject.dataset.position + '</p>';

                                    }
                                    break;
                                }
                            }
                        }
                    });
                    document.addEventListener('mouseup', function () {
                        players.forEach(p => {
                            p.style.transition = 'all 0.5s ease';
                        });
                        if (isDragging && currentObject) {
                            isDragging = false;
                            // Ki?m tra v? trí c?a c?u th? và c?n ch?nh n?u c?n thi?t
                            const rect = currentObject.getBoundingClientRect();
                            const playAreaRect = document.getElementById('playArea').getBoundingClientRect();
                            const top = ((rect.top - playAreaRect.top) / playAreaRect.height) * 100;
                            const left = ((rect.left - playAreaRect.left) / playAreaRect.width) * 100;
                            let closestPlayer = null;
                            let closestDistance = Infinity;
                            const playerList = document.querySelectorAll('.player');
                            document.querySelectorAll('.player').forEach(p => {
                                if (p !== currentObject) {
                                    const pRect = p.getBoundingClientRect();
                                    const pTop = ((pRect.top - playAreaRect.top) / playAreaRect.height) * 100;
                                    const pLeft = ((pRect.left - playAreaRect.left) / playAreaRect.width) * 100;
                                    // Calculate distance between currentObject and p
                                    const distance = Math.sqrt(Math.pow(top - pTop, 2) + Math.pow(left - pLeft, 2));
                                    // Check if p is closer than the current closest
                                    if (distance < closestDistance) {
                                        closestDistance = distance;
                                        closestPlayer = p;
                                    }
                                }
                            });
                            if (closestPlayer && closestDistance < 5) {
                                // Swap positions with the closest player
//                        const tempTop = currentObject.style.top;
//                        const tempLeft = currentObject.style.left;
//                        const tempPosition = currentObject.dataset.position;

                                currentObject.style.top = closestPlayer.style.top;
                                currentObject.style.left = closestPlayer.style.left;
                                closestPlayer.style.top = tempTop;
                                closestPlayer.style.left = tempLeft;
                                // Update dataset.position if necessary
//                        const tempDatasetPosition = currentObject.dataset.position;
                                currentObject.dataset.position = closestPlayer.dataset.position;
                                closestPlayer.dataset.position = tempPosition;
                            }
                            // c?p nh?t v? trí cho current
                            selectedPlayers.forEach(ps => {
                                if (ps.id === currentObject.id)
                                {
                                    console.log(ps.id);
                                    console.log("current" + currentObject.id);
                                    ps.position = currentObject.dataset.position;
                                    ps.top = currentObject.style.top;
                                    ps.left = currentObject.style.left;
                                }
                            });
                            // c?p nh?t v? trí cho closet
                            selectedPlayers.forEach(ps => {
                                if (ps.id === closestPlayer.id)
                                {
                                    console.log(ps.id);
                                    console.log("current" + closestPlayer.id);
                                    ps.position = closestPlayer.dataset.position;
                                    ps.top = closestPlayer.style.top;
                                    ps.left = closestPlayer.style.left;
                                }
                            });
                            sessionStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                            var color = getColorByPosition(closestPlayer.dataset.position);
                            if (closestPlayer.id.includes(' ')) {

                                var playerNumber = closestPlayer.id.split(' ')[1];
                                closestPlayer.innerHTML = '<p class="name" style="color:' + color + ';">' + playerNumber + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + closestPlayer.dataset.position + '</p>';

                                console.log(playerNumber);  // Output: "123"
                            } else {
                                closestPlayer.innerHTML = '<p class="name" style="color:' + color + ';">' + closestPlayer.id + '</p>' + '<p class="postion" style="color:' + color + ';"> ' + closestPlayer.dataset.position + '</p>';

                            }


                            currentObject = null;
                        }

                    });
                    document.querySelectorAll('.player').forEach(player => {
                        player.addEventListener('mouseover', function () {
                            player.style.backgroundColor = 'red';
                        });
                        player.addEventListener('mouseout', function () {
                            player.style.backgroundColor = '#3498db';
                        });
                    });
                }
//                


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

                function savePosition() {
                    if (selectedPlayer) {
                        var position = document.getElementById('positionSelect').value;
                        var switchPosition = "";
                        selectedPlayer.dataset.position = position;
                        count = 0;
                        selectedPlayers.forEach((player, index) => {
                            console.log("seletPlayer " + selectedPlayer.id);
                            if (player.id === selectedPlayer.id)
                            {
                                switchPosition = position;
                                console.log("switch " + switchPosition);
                                console.log("seletPlayer " + position);
                                SwitchPosition(switchPosition, player.position);
                                player.position = position;
                            }

                        });
                        sessionStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                        loadSelectedPlayer();
                        console.log(selectedPlayers);
                        console.log("count check " + count);
                        closeDialog();
                    }
                }
                function SwitchPosition(switchPosition, oldPosition)
                {
                    selectedPlayers.forEach((player, index) => {
                        console.log("seletPlayer " + selectedPlayer.id);
                        if (player.position === switchPosition)
                        {
                            player.position = oldPosition;
                        }




                    });
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
                const playerListDiv = document.getElementById('player-List');
                players.forEach((player, index) => {
                    const label = document.createElement('label');
                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.id = `check\${index + 1}`;
                    checkbox.setAttribute('data-player', player.name);
                    label.style.color = getColorByPosition(player.position);
                    label.appendChild(checkbox);
                    label.appendChild(document.createTextNode(` \${player.name} - \${player.position}`));
                    playerListDiv.appendChild(label);
                    playerListDiv.appendChild(document.createElement('br'));
                });
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
                console.log("done");
            }



        </script>
    </body>
</html>
