<%-- 
    Document   : updateStats
    Created on : Jul 16, 2024, 8:14:35?PM
    Author     : Zanis
--%>

<div id="update-course-form" class="hidden">
    <%
        
    %>
    <div class="overlay">

        <form class="card card-on card-update-form  mx-auto" action="../StatsServlet" method="GET">
            <div id="update-course-close" style="width: 20%">
                <i class="add-course-button fas fa-times"></i>
            </div>
            <h3 class="form-heading" style="margin-bottom:  0">Edit Stats</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="cid" value="" />
            <div class="form-group">
                <input type="number" name="goalsscored" placeholder="Goals Scored" value="" required=""/>
            </div>
            <div class="form-group">
                <input type="number" name="yellowcards" placeholder="Yellow Cards" value="" required=""/>
            </div>
            <div class="form-group">
                <input type="number" name="redcards" placeholder="Red Cards" value="" required=""/>
            </div>
            <div class="form-group">
                <input type="number" name="assists" placeholder="Assists" value="" required=""/>
            </div>
            
            <div class="button-choice" style="text-align: center;">
                <button id="done-course-update" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>

        </form>
    </div>

</div>
