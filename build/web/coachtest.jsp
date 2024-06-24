<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>4-2-3-1 Formation</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f0f0f0;
                background-image: url('IMAGE/HOME/Red and Black Sportive Next Match Youtube Thumbnail.png');
                background-size: cover; /* ??m b?o hình n?n bao ph? toàn b? khu v?c ch?i */
                background-position: center;
            }
            #playArea {
                position: relative;
                width: 500px;
                height: 700px;
                border: 1px solid black;
                margin: 0 auto;
                margin-right: 0px;
                right: 10px;
                background-image: url('IMAGE/HOME/Green Sport Highlight covers.png'); /* Thay URL_OF_YOUR_STADIUM_IMAGE b?ng URL c?a ?nh sân v?n ??ng */
                background-size: cover; /* ??m b?o hình n?n bao ph? toàn b? khu v?c ch?i */
                background-position: center; /* C?n gi?a hình n?n */
            }
            .player {
                position: absolute;
                width: 50px;
                height: 50px;
                background-color: #3498db;
                cursor: pointer;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-weight: bold;
            }
            .player.selected {
                display: block;
            }
            .player-list {
                margin: 20px;
            }
            .player-list label {
                display: block;
            }
            .player-list label {
                display: block;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>

        <div>
            <select id="formationSelect">
                <option value="4-4-2">4-4-2</option>
                <option value="4-3-3">4-3-3</option>
                <option value="3-5-2">3-5-2</option>
                <!-- Thêm các tùy ch?n khác t?i ?ây -->
            </select>
        </div>

        <div class="player-list">
            <label><input type="checkbox" id="check1" data-player="player1"> GK</label>
            <label><input type="checkbox" id="check2" data-player="player2"> RB</label>
            <label><input type="checkbox" id="check3" data-player="player3"> C?u th? 3</label>
            <label><input type="checkbox" id="check4" data-player="player4"> C?u th? 4</label>
            <label><input type="checkbox" id="check5" data-player="player5"> C?u th? 5</label>
            <label><input type="checkbox" id="check6" data-player="player6"> C?u th? 6</label>
            <label><input type="checkbox" id="check7" data-player="player7"> C?u th? 7</label>
            <label><input type="checkbox" id="check8" data-player="player8"> C?u th? 8</label>
            <label><input type="checkbox" id="check9" data-player="player9"> C?u th? 9</label>
            <label><input type="checkbox" id="check10" data-player="player10"> C?u th? 10</label>
            <label><input type="checkbox" id="check11" data-player="player11"> C?u th? 12</label>
            <label><input type="checkbox" id="check11" data-player="player12"> C?u th? 13</label>

            <label><input type="checkbox" id="check11" data-player="player13"> C?u th? 14</label>

            <label><input type="checkbox" id="check11" data-player="player14"> C?u th? 15</label>

        </div>
        <div id="playArea">
            <!-- T?o 11 c?u th? -->
            <div class="player" id="player1" data-position="GK">Ronaldo</div>
            <div class="player" id="player2" data-position="RB">james</div>
            <div class="player" id="player3" data-position="LCB">Ramos</div>
            <div class="player" id="player4" data-position="RCB">Pepe</div>
            <div class="player" id="player5" data-position="LB">marcelo</div>
            <div class="player" id="player6" data-position="CDM">Kiera</div>
            <div class="player" id="player7" data-position="CAM">Kaka</div>
            <div class="player" id="player8" data-position="RM">H.son</div>
            <div class="player" id="player9" data-position="LM">Messi</div>
            <div class="player" id="player10" data-position="CM">Pirlo</div>
            <div class="player" id="player11" data-position="ST">Balloteli</div>
            <div class="player" id="player12" data-position="ST">Torres</div>
            <div class="player" id="player13" data-position="ST">Tien linh</div>
            <div class="player" id="player14" data-position="CAM">Ronaldinho</div>


        </div>

        <script>




            document.addEventListener('DOMContentLoaded', (event) => {
                const playArea = document.getElementById('playArea');
                const playerCheckboxes = document.querySelectorAll('.player-list input[type="checkbox"]');
                const players = document.querySelectorAll('.player');

                var count = 0;

                
                
                const playerPositions = {
                    'GK': {top: '10%', left: '45%'},
                    'LCB': {top: '30%', left: '30%'},
                    'RCB': {top: '30%', left: '60%'},
                    'LB': {top: '30%', left: '15%'},
                    'RB': {top: '30%', left: '75%'},
                    'CDM': {top: '50%', left: '35%'},
                    'LCM': {top: '50%', left: '25%'},
                    'RCM': {top: '50%', left: '45%'},
                    'CM': {top: '50%', left: '55%'},
                    'LM': {top: '70%', left: '25%'},
                    'RM': {top: '70%', left: '65%'},
                    'CAM': {top: '70%', left: '45%'},
                    'ST': {top: '90%', left: '45%'},
                    'CF': {top: '90%', left: '45%'},
                    'LW': {top: '70%', left: '15%'},
                    'RW': {top: '70%', left: '75%'}
                };

                // ?n t?t c? các c?u th? ban ??u
                players.forEach(player => {
                    player.style.display = 'none';
                });

                // L?ng nghe s? ki?n khi checkbox thay ??i
                playerCheckboxes.forEach((checkbox, index) => {
                    checkbox.addEventListener('change', () => {
                        if (count < 11) {
                            const playerId = players[index].id;
                            const playerPosition = players[index].dataset.position;
                            if (checkbox.checked) {
                                players[index].style.display = 'block';
                                count++;
                                console.log(count);
                                // N?u c?u th? này có v? trí ???c ??nh ngh?a, ??t nó vào v? trí t??ng ?ng
                                if (playerPositions[playerPosition]) {
                                    players[index].style.top = playerPositions[playerPosition].top;
                                    players[index].style.left = playerPositions[playerPosition].left;
                                }
                            } else {
                                players[index].style.display = 'none';
                                count--;
                                console.log(count);
                            }
                        } else {
                            // Không cho phép ch?n thêm n?u ?ã ??t t?i s? l??ng t?i ?a
                            if (checkbox.checked === false)
                            {
                                count--;
                                players[index].style.display = 'none';


                            } else
                            {
                                checkbox.checked = false;
                                alert("ALREADY FULL SLOT (11)");
                            }
                            console.log(count);


                        }
                    });
                });
                let isDragging = false;
                let currentObject = null;

                // L?u c?u th? vào currentObject 
                document.querySelectorAll('.player').forEach(player => {
                    player.addEventListener('mousedown', function (event) {
                        isDragging = true;
                        currentObject = player;
                        event.preventDefault(); // Ng?n ch?n hành vi m?c ??nh (ví d?: kéo v?n b?n)
                    });
                });

                // Di chuy?n currentObject theo con tr? chu?t
                document.addEventListener('mousemove', function (event) {
                    if (isDragging && currentObject) {
                        const rect = playArea.getBoundingClientRect();

                        const x = event.clientX - rect.left - (currentObject.offsetWidth / 2);
                        const y = event.clientY - rect.top - (currentObject.offsetHeight / 2);

                        // ??m b?o v?t th? không b? di chuy?n ra kh?i khu v?c ch?i
                        const maxX = playArea.clientWidth - currentObject.clientWidth;
                        const maxY = playArea.clientHeight - currentObject.clientHeight;
                        currentObject.style.left = Math.max(0, Math.min(x, maxX)) + 'px';
                        currentObject.style.top = Math.max(0, Math.min(y, maxY)) + 'px';
                    }
                });

                document.addEventListener('mouseup', function () {
                    isDragging = false;
                    currentObject = null;
                });

                document.querySelectorAll('.player').forEach(player => {
                    player.addEventListener('mouseover', function () {
                        player.style.backgroundColor = 'red';
                    });

                    player.addEventListener('mouseout', function () {
                        player.style.backgroundColor = '#3498db';
                    });
                });
            });

        </script>
    </body>
</html>
