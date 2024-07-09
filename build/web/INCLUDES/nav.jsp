
<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    .nav
    {
        background-color: #005EB4;
        height: 4.5rem;
        width: 100%;
        display: flex;
        /*justify-content: center;*/
        align-items: center;


    }
    .nav-logo
    {
        margin-left: 10px;

    }
    .nav-elements
    {
        display: flex;
        gap: 40px;
        align-items: center;
        height: 100%;
        width: 70%;
        margin-left: 80px
    }
    .nav-click
    {
        text-decoration: none;
        color: white;
        text-transform: uppercase;
        cursor: pointer;
        transition: transform 0.3s ease;

    }
    .nav-click:hover
    {
        color: black;
        background: rgba(128, 128, 128, 0.2);

        transform: scale(1.1);

    }
    .nav-icons
    {
        display: flex;
        width: 15%;
        gap: 15px;
        justify-content: end;

    }
    .fa-search , .fa-user
    {
        font-size: 24px;
        cursor: pointer;
    }
    .fa-search:hover
    {
        color: white;
    }
    .fa-user:hover
    {
        color: white;
    }

    #rightBar
    {

        position: fixed;
        top: 60px;
        right: 10px;
        bottom: 0;
        z-index: 900; /* ??m b?o left-bar n?m tr�n c�c ph?n t? kh�c */
        width: 250px; /* ?i?u ch?nh ?? r?ng c?a left-bar */
        height: 250px;
        background-color: #FFFFFF; /* M�u n?n c?a left-bar */
        padding: 20px; /* Kho?ng c�ch gi?a c�c ph?n t? trong left-bar */
        overflow-y: auto;
        border-radius: 20px;
        align-items: center;

    }
    #rightBar
    {
        display: none;
    }

    #search{
        display: none;
    }
    .overlay{
        background-color: rgba(0,0,0,0.5);
        position: fixed;
        top:0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 500;
    }
    .search-block
    {
        background-color: #f0f0f0;
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        height: 200px;
        z-index: 400;
        padding: 40px 100px 40px 100px;
        /*    text-align: center;*/
    }
    .search-block p
    {
        color: rgb(80, 91, 115);
        font-family: cursive;
    }
    .search-form
    {
        display: flex;
        gap :10px;
        align-items: center;
        border-bottom: black 1px solid;
    }
    .search-input
    {
        width: 100%;
        height: 48px;
        border: none;
        background-color: #f0f0f0;
    }

    .search-input:focus
    {
        outline: none;

    }
    .search-input::placeholder
    {
        font-size: 20px;
        font-family: initial;
    }
    .fa-times
    {
        position: fixed;
        right: 10px;
        top: 10px;
        cursor: pointer;
        font-size: 20px;
    }
    .avatar
    {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        object-fit: cover;

    }
    .avatar:hover
    {
        border: wheat 1px solid;
    }
    .login-block
    {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .edit , .changepass, .logout
    {
        transition: transform 0.3s ease;

        border-radius: 45px;
    }
    .changepass:hover
    {
        color: orangered;
        transform: scale(1.1);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        ;
    }
    .logout:hover
    {
        color: orangered;
        transform: scale(1.1);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        ;
    }
    .edit:hover
    {
        color: orangered;
        transform: scale(1.1);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        ;
    }
    .avatar
    {
        transition: transform ease-in 0.1s ;
    }
    .avatar:hover
    {
        transform: scale(1.1);
        border: wheat ;
    }
    #rightBar
    {
        background-image:  url('https://culers.fcbarcelona.com/free.45372e369dba37f0f8a4.png');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .Login {
        margin-top: 30px;
        padding: 5px 0 5px 0;
        background: linear-gradient(111.98deg, #00b8ff 18.07%, #1574c4 90.31%);
        color: white;
        transition: transform 0.3s ease;
    }
    .Login, .register {
        text-align: center;
        border-radius: 50px;
    }
    .Login:hover {
        transform: scale(1.1);
    }
    .register {
        background: white;
        margin-top: 30px;
        padding: 5px 0 5px 0;
        color: black;
        border: black 1px solid;
        border-radius: 50px;
        transition: transform 0.3s ease;
    }
    .Login, .register {
        text-align: center;
        border-radius: 50px;
    }

</style>
<div class="nav" style="position: fixed; width: 100% ; top: 0; z-index: 300">

    <div class="nav-logo" style="cursor: pointer" onclick=" window.location.href = '/SWPClubManegement/HomeServlet'"> <img src="/SWPClubManegement/IMAGE/HOME/logo 1.png" alt="alt"/> </div>
    <div class="nav-elements">
        <a class="nav-click">About </a>
        <a class="nav-click">Match Centre</a>
        <a href="/SWPClubManegement/NEWS/newsList.jsp" class="nav-click">News</a>
        <a class="nav-click" href="/SWPClubManegement/Players">Player</a>
        <a class="nav-click">Ticket</a>
        <a href="/SWPClubManegement/ShopJerseyServlet" class="nav-click">Store</a>
        <a class="nav-click" href="../CreateMatchScheduleServlet">Match</a>


                </div>
    <div class="nav-icons">

        <div class="nav-user">
            <c:choose>
                <c:when test="${user == null}">
                    <i class="fas fa-user icon"></i>

                </c:when>
                <c:otherwise>
                    <c:if test="${user.image == null}">
                        <i class="icon"><img style="height: 2rem; width: 2rem; border: black 1px solid; cursor: pointer" class="avatar"  src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="alt"/></i>

                    </c:if>
                    <c:if test="${user.image != null}">
                        <i class="icon"><img style="height: 2rem; width: 2rem; border: black 1px solid; cursor: pointer" class="avatar"  src="${user.image}" alt="alt"/></i>
                    </c:if>

                </c:otherwise>
            </c:choose>

        </div>
    </div>

</div>

<div id="rightBar">

    <c:choose>
        <c:when test="${user == null}">
            <div class="Login" >

                <a href="/SWPClubManegement/LoginServlet" style=" color: white; text-decoration:none ;font-size: 12px;text-height: 500">SIGN IN</a>

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


                        <img id="image-bar" class="avatar" src="${user.image}" alt="alt"/>

                    </c:otherwise>
                </c:choose> 
                <h5> ${user.name}</h5>
                <div class="edit">
                    <a href="../EditProfileServlet" style="color: white; text-decoration: none; font-size: 12px;">
                        <i class="fas fa-user-edit"></i> Edit Profile
                    </a>
                </div>

                <div class="changepass">
                    <a href="/SWPClubManegement/ChangePasswordServlet" style="color: white; text-decoration: none; font-size: 12px;">
                        <i class="fas fa-key"></i> Change Password
                    </a>
                </div>

                <div class="changepass">
                    <a href="/SWPClubManegement/P/historyPayment.jsp" style="color: white; text-decoration: none; font-size: 12px;">
                        <i class="fas fa-history"></i> History Payment
                    </a>
                </div>

                <div class="logout">
                    <a href="/SWPClubManegement/LogoutServlet" style="color: white; text-decoration: none; font-size: 12px;">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
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