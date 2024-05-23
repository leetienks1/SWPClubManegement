
<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div class="nav" style="position: fixed; width: 100% ; top: 0; z-index: 300">
    <div class="nav-logo"> <img src="../IMAGE/HOME/logo 1.png" alt="alt"/> </div>
    <div class="nav-elements">
        <a class="nav-click">About </a>
        <a class="nav-click">Match Centre</a>
        <a class="nav-click">News</a>
        <a class="nav-click">Player</a>
        <a class="nav-click">Ticket</a>

    </div>
    <div class="nav-icons">
        <div class="nav-search">
            <i class="fas fa-search icon"></i>
        </div>
        <div class="nav-user">

            <i class="fas fa-user icon"></i>

        </div>
    </div>

</div>

<div id="rightBar">

    <c:choose>
        <c:when test="${user == null}">
            <div class="Login" >
                <a href="login.jsp" style=" color: white; text-decoration:none ;font-size: 12px;text-height: 500">SIGN IN</a>
            </div>
            <div  class="register">
                <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="signUp.jsp" > SIGN UP</a>
            </div>
        </c:when>
        <c:otherwise>

            <div class="login-block">
                <c:choose >
                    <c:when test="${user.image==null}">
                        <img class="avatar" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="alt"/>
                    </c:when>
                    <c:otherwise>
                        <img class="avatar" src="${user.image}" alt="alt"/>

                    </c:otherwise>
                </c:choose> 
                <h5> ${user.name}</h5>
                <div class="edit" >
                    <a href="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" style=" color: Black; text-decoration:none ;font-size: 12px;text-height: 500">Edit Profile</a>
                </div>
                <div  class="changepass">
                    <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="http://localhost:8080/SWPWedRealClubManagement/ChangePasswordServlet" > Change Password</a>
                </div>
                <div  class="logout">
                    <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="http://localhost:8080/SWPWedRealClubManagement/LogoutServlet" > Logout</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>


</div>

<div id="search">
    <div class="overlay">
        <div class="search-block">
            <i class="fas fa-times"></i>
            <p>What are you looking for ? </p>
            <div class="search-form">
                <i class="fas fa-search"></i>
                <input class="search-input"  type="text"  placeholder="NEWS , Player , Match , ...."/>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
//     $("#rightBar").hide();

        function toggleRightBar()
        {
            $("#rightBar").toggle();
        }
        function toggleCloseSearch()
        {
            $("#search").toggle();
        }
        function toggleOpenSearch()
        {
            $("#search").toggle();
        }


        $(".nav-user").click(function ()
        {
            toggleRightBar();
        });
        $(".fa-times").click(function ()
        {
            toggleCloseSearch();
        });
        $(".nav-search").click(function ()
        {
            toggleOpenSearch();
        });
    });
</script>