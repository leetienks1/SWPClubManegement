
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="nav">
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
    <div class="Login" >
        <a style=" color: white; text-decoration:none ;font-size: 12px;text-height: 500">SIGN IN</a>
    </div>
    <div  class="register">
        <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="signUp" > SIGN UP</a>
    </div>
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
        $(".fa-times").click(function()
        {
           toggleCloseSearch(); 
        });
        $(".nav-search").click(function()
        {
           toggleOpenSearch(); 
        });
    });
</script>