<%-- 
    Document   : footer
    Created on : May 18, 2024, 8:27:46?AM
    Author     : Desktop
--%>


<style>
    

    .footer {
        position: relative;
        z-index: 1000;
        font-family: fcb-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
        background-color: #1A1A1D;
        padding: 20px 50px;
    }

    .footer .main-partners {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .footer .main-partners span {
        font-size: 1.2em;
        color: #FFC300;
    }
    .partners-logos
    {
        text-align: center;
        width: 60%;
        height: 10vh;
    }
    .footer .partners-logos img {

        margin: 0 50px;
        height: 70px;
    }

    .footer .view-all {
        background-color: #D00000;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }

    .footer .social-media {
        text-align: center;
    }

    .footer .social-media h2 {
        margin-bottom: 20px;
        font-weight: 500;
        color: white;
    }

    .footer .social-links {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
    }

    .footer .social-link {
        background-color: #222;
        padding: 20px;
        margin: 10px;
        width: 120px;
        text-align: center;
        border-radius: 5px;
    }

    .footer .social-link img {
        border-radius: 96px;
        width: 40px;
        height: 40px;
        margin-bottom: 10px;
    }

    .footer .social-link span {
        display: block;
        color: white;
        font-size: 0.8em;
    }
</style>

<footer class="footer">
    
    <div class="main-partners">
        <span>Main Partners</span>
        <div class="partners-logos">
            <img src="/SWPClubManegement/IMAGE/FOOTER/nike-4-logo-black-and-white.png" alt="Nike">
            <img src="/SWPClubManegement/IMAGE/FOOTER/spotify-2-logo-black-and-white.png" alt="Spotify">

        </div>
        <button onclick="window.location.href='/SWPClubManegement/Players'" class="view-all">View All Players</button>
    </div>
    <div class="social-media">
        <h2>Follow FC Barcelona on social media</h2>
        <div class="social-links">
            <div class="social-link facebook" style="background-color: #0061f2;">
                <img src="https://tse2.mm.bing.net/th?id=OIP.B1hpCXHYUBPSso6W4q9XpgHaHa&pid=Api&P=0&h=220" alt="Facebook">
                <span>FC Barcelona<br>@fcbarcelona</span>
            </div>
            <div class="social-link twitter" style="background-color: #00aff0;">
                <img src="https://tse4.mm.bing.net/th?id=OIP.ViVafOJ679_fuZxZdIu38wHaHa&pid=Api&P=0&h=220" alt="Twitter">
                <span>FC Barcelona<br>@fcbarcelona</span>
            </div>
            <div class="social-link youtube" style="background-color: rgb(187,0,0)">
                <img src="https://tse1.mm.bing.net/th?id=OIP.OVUMFVp8elGfMYh-27fTLAHaFO&pid=Api&P=0&h=220" alt="YouTube">
                <span>FC Barcelona<br>YouTube</span>
            </div>
            <div class="social-link instagram"style="background: radial-gradient(circle farthest-corner at 35% 90%, #fec564, transparent 50%), radial-gradient(circle farthest-corner at 0 140%, #fec564, transparent 50%), radial-gradient(ellipse farthest-corner at 0 -25%, #5258cf, transparent 50%), radial-gradient(ellipse farthest-corner at 20% -50%, #5258cf, transparent 50%), radial-gradient(ellipse farthest-corner at 100% 0, #893dc2, transparent 50%), radial-gradient(ellipse farthest-corner at 60% -20%, #893dc2, transparent 50%), radial-gradient(ellipse farthest-corner at 100% 100%, #d9317a, transparent), linear-gradient(#6559ca, #bc318f 30%, #e33f5f 50%, #f77638 70%, #fec66d);">
                <img src="https://tse3.mm.bing.net/th?id=OIP.xa0FgRBsvMi7bmVNCDYsCgHaHa&pid=Api&P=0&h=220" alt="Instagram">
                <span>FC Barcelona<br>@fcbarcelona</span>
            </div>
            <div class="social-link tiktok" style="background-color: black;">
                <img src="https://tse3.mm.bing.net/th?id=OIP.SmkemBJ2Ip8ca9IRfvyCqwHaHa&pid=Api&P=0&h=220" alt="TikTok">
                <span>FC Barcelona<br>TikTok</span>
            </div>
            <div class="social-link spotify" style="background-color: rgb(0,211,101);">
                <img src="/SWPClubManegement/IMAGE/FOOTER/spotify-2-logo-black-and-white.png" alt="Spotify">
                <span>Spotify<br>@spotify</span>
            </div>
        </div>
    </div>
</footer>
