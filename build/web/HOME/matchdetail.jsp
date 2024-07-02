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
                margin-top: 100px;
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
        </style>
    </head>
    <body>
        <%@include file="../INCLUDES/nav.jsp" %>
        <div class="container">
            <div style="display: flex;justify-content: space-between; padding: 20px;">
                <img src="${match.homeTeam.flag}" width="150px" height="75px" alt="alt"/>
                <img src="${match.awayTeam.flag}" width="150px" height="75px" alt="alt"/>
            </div>
            <h1 class="my-4 text-center">MATCH STATISTIC</h1>
            <div style="display: flex;justify-content: space-between; padding: 20px;">
                <div>
                    ${match.homeTeam.teamName}
                    ${match.matchHomeTeam.score}
                </div>
                <div>
                    ${match.awayTeam.teamName}
                    ${match.matchAwayTeam.score}
                </div>
            </div>
            <div>
                <div style="text-align: center"> 
                    ${match.matchHomeTeam.ballPossession}
                    <span style="font-size: 15px; margin:  0  10px">Ball Possession</span>
                    ${match.matchAwayTeam.ballPossession}
                </div>
                
                <div style="text-align: center"> 
                    ${match.matchHomeTeam.cornerKicks}
                    <span style="font-size: 15px; margin:  0  10px">Corner Kicks</span>
                    ${match.matchAwayTeam.cornerKicks}
                </div>
                
                <div style="text-align: center"> 
                    ${match.matchHomeTeam.totalShots}
                    <span style="font-size: 15px; margin:  0  10px"> Total Shots</span>
                    ${match.matchAwayTeam.totalShots}
                </div>
                
                <div style="text-align: center"> 
                    ${match.matchHomeTeam.redCards}
                    <span style="font-size: 15px; margin:  0  10px"> Red Cards</span>
                    ${match.matchAwayTeam.redCards}
                </div>
                
                <div style="text-align: center"> 
                    ${match.matchHomeTeam.yellowCards}
                    <span style="font-size: 15px; margin:  0  10px"> Yellow Cards</span>
                    ${match.matchAwayTeam.yellowCards}
                </div>
                
            </div>

        </div>
        <!-- Link to Bootstrap JS and dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
