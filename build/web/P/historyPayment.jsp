<%-- 
    Document   : historyPayment
    Created on : Jun 30, 2024, 11:28:46 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../INCLUDES/head.jsp" %> 
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>

    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
             background-image: url('https://culers.fcbarcelona.com/assets/images/backgrounds/home_culer_profile.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 1em;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 2em;
        }

        .export-button-container {
            text-align: right;
            padding: 1em;
        }

        .export-button {
            background-color: #ffffff;
            border: none;
            padding: 0.75em 1.5em;
            cursor: pointer;
            border-radius: 25px;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .export-button:hover {
            background-color: #e0e0e0;
        }

        nav {
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
        }

        .tabs {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        .tab {
            padding: 1em 2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .tab:hover {
            background-color: #e0e0e0;
        }

        .tab.active {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        main {
            margin: 2em auto;
            width: 90%;
            max-width: 1200px;
        }

        .table-container {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .table-header, .table-row {
            display: flex;
            padding: 1em 2em;
        }

        .table-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        .table-row {
            background-color: #ffffff;
            transition: background-color 0.3s ease;

        }

        .table-row:nth-child(even) {
            background-color: #f8f9fa;
        }

        .table-row:hover {
            background-color: #e9ecef;
        }

        .table-header div, .table-row div {
            flex: 1;
            text-align: center;
            padding: 0.5em 0;
        }

        .table-header div {
            border-right: 1px solid #0062cc;
        }

        .table-header div:last-child {
            border-right: none;
        }
        .nav-borders {
            background-color: white;
            border-bottom: 1px solid #dee2e6;
            padding: 10px;
        }
        .nav-borders .nav-link.active {
            color: #0061f2;
            border-bottom-color: #0061f2;
        }
        .nav-borders .nav-link {
            color: #69707a;
            border-bottom-width: 0.125rem;
            border-bottom-style: solid;
            border-bottom-color: transparent;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0;
            padding-right: 0;
            margin-left: 1rem;
            margin-right: 1rem;

        }
        .con
        {
            margin-top: 4rem;
        }
        footer a
        {
            text-decoration: none;
            color: white;

        }
        .table-content{
            max-height: 60vh;
            overflow-y: scroll;
        }
    </style>
    <body>
        <%@include file="../INCLUDES/nav.jsp" %>

        <div class="container-xl px-4  con">
            <nav class="nav nav-borders" style="background-color:  white;">
                <a class="nav-link " href="/SWPClubManegement/EditProfileServlet" target="__blank">Profile</a>
                <a class="nav-link" href="/SWPClubManegement/ChangePasswordServlet" target="__blank">Change Password</a>
                <a class="nav-link active ms-0" href="/SWPClubManegement/P/historyPayment.jsp" target="__blank">History Payment</a>


            </nav>

            <nav>
                <ul class="tabs">
                    <li class="tab active" data-tab="ticket-history">Ticket History</li>
                    <li class="tab" data-tab="jersey-history">Jersey History</li>
                </ul>
            </nav>
            <main>
                <div class="content" id="ticket-history">
                    <div class="table-container">
                        <div class="table-header">
                            <div>Date</div>
                            <div>Transaction ID</div>
                            <div>Amount</div>
                            <div>Status</div>
                        </div>
                        <div class="table-row">
                            <div>2024-01-01</div>
                            <div>TX12345</div>
                            <div>$100.00</div>
                            <div>Completed</div>
                        </div>
                        <div class="table-row">
                            <div>2024-01-02</div>
                            <div>TX12346</div>
                            <div>$200.00</div>
                            <div>Pending</div>
                        </div>
                        <div class="table-row">
                            <div>2024-01-03</div>
                            <div>TX12347</div>
                            <div>$150.00</div>
                            <div>Completed</div>
                        </div>
                        <!-- Add more ticket history rows as needed -->
                    </div>
                </div>
                <div class="content" id="jersey-history" style="display: none;">
                    <div class="table-container">
                        <div class="table-header">
                            <div>Order ID</div>
                            <div>Date</div>
                            <div>Jersey name</div>
                            <div>Jersey Size</div>
                            <div>Quantity</div>
                            <div>Total</div>



                        </div>
                        <div class="table-content">

                            <c:forEach var="o" items="${orderJerseys}">
                                <div class="table-row">
                                    <div>${o.orderId}</div>
                                    <div>${o.orderDate}</div>
                                    <div>${o.jerseyName}</div>
                                    <div>${o.jerseySize}</div>
                                    <div>${o.jerseyQuantity}</div>
                                    <div>${o.orderTotal}</div>
                                </div>
                            </c:forEach>

                        </div>

                        <!-- Add more jersey history rows as needed -->
                    </div>
                </div>
            </main>
        </div>
        <%--<%@include file="../INCLUDES/footer.jsp" %>--%>

        <script>
            const tabs = document.querySelectorAll('.tab');
            const contents = document.querySelectorAll('.content');

            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    tabs.forEach(t => t.classList.remove('active'));
                    tab.classList.add('active');

                    const target = tab.getAttribute('data-tab');
                    contents.forEach(content => {
                        content.style.display = content.id === target ? 'block' : 'none';
                    });
                });
            });
        </script>
    </body>
</html>
