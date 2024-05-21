<%-- 
    Document   : changePass
    Created on : May 21, 2024, 6:04:21 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/HOMECSS/changePass.css"/>

    </head>
    <body>
        <div class="mainDiv">
            <div class="cardStyle">
                <form action="http://localhost:8080/SWPWedRealClubManagement/ChangePasswordServlet?uid=${user.userId}" method="post" name="signupForm" id="signupForm">

                    <img src="" id="signupLogo"/>

                    <h2 class="formTitle">
                        Change your password
                    </h2>

                    <div class="inputDiv">
                        <label class="inputLabel" for="password">New Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword">
                    </div>

                    <div class="buttonWrapper">
                        <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                            <span>Continue</span>
                            
                        </button>
                        <p>${notFit}</p>
                    </div>

                </form>
            </div>
        </div>
    </body>
</html>
