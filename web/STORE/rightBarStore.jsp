<style>
    #rightBar
    {
        background-image:  url('https://culers.fcbarcelona.com/free.45372e369dba37f0f8a4.png');
        background-size: cover;
        background-repeat: no-repeat;
    }
</style>
<div id="rightBar">




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



</div>
