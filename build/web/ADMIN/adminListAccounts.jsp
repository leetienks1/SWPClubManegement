<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="../CSS/ADMIN/admin.css"/>
        <style>
            .overlay{
                background-color: rgba(0,0,0,0.5);
                position: fixed;
                top:0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 500;
            }
            #sidebar
            {

            }

            #content
            {
                width: 100%;
            }

            .scrollable-content::-webkit-scrollbar {
                width: 12px; /* Width of the scrollbar */
            }

            .scrollable-content::-webkit-scrollbar-track {
                background: #f1f1f1; /* Background of the scrollbar track */
            }

            .scrollable-content::-webkit-scrollbar-thumb {
                background: #888; /* Color of the scrollbar thumb */
                border-radius: 6px; /* Rounded corners for the scrollbar thumb */
            }

            .scrollable-content::-webkit-scrollbar-thumb:hover {
                background: #555; /* Color of the scrollbar thumb on hover */
            }

            .table-container {
                max-height: 600px;
                overflow-y: auto;

            }

            /* Custom scrollbar styles */
            .table-container::-webkit-scrollbar {
                width: 12px; /* Width of the scrollbar */
            }

            .table-container::-webkit-scrollbar-track {
                background: #f1f1f1; /* Background of the scrollbar track */
            }

            .table-container::-webkit-scrollbar-thumb {
                background: #888; /* Color of the scrollbar thumb */
                border-radius: 6px; /* Rounded corners for the scrollbar thumb */
            }

            .table-container::-webkit-scrollbar-thumb:hover {
                background: #555; /* Color of the scrollbar thumb on hover */
            }
            .col-md-4
            {
                margin-bottom: 1.5rem ;

            }
            .card {
                height: 100%; /* Đảm bảo tất cả các cột có chiều cao bằng nhau */
                transition: box-shadow 0.3s ease; /* Hiệu ứng khi di chuột vào card */
                text-align: left; /* Căn giữa nội dung trong card */
                border-radius: 45px;
            }
            .card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Hiển thị bóng đổ lớn hơn khi di chuột vào */
            }
            label {
                width: 100px; /* Độ rộng của nhãn */
                font-weight: bold; /* Chữ in đậm */
            }
            .user-info
            {
                margin-left: 1rem;
            }
            .toggle-button {
                position: relative;
                display: inline-block;
                width: 40px;
                height: 20px;
            }

            .toggle-input {
                display: none;
            }

            .toggle-label {
                position: absolute;
                top: 0;
                left: 0;
                width: 40px;
                height: 20px;
                border-radius: 20px;
                background-color: #ccc;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .toggle-handle {
                position: absolute;
                top: 2px;
                left: 2px;
                width: 16px;
                height: 16px;
                border-radius: 50%;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                transition: left 0.3s ease;
            }

            .toggle-input:checked + .toggle-label {
                background-color: #66bb6a;
            }

            .toggle-input:checked + .toggle-label + .toggle-handle {
                left: 22px;
            }
            .search-container {
            position: relative;
            width: 300px; /* Chiều rộng */
        }
            .search {
                width: 100%;
                padding: 10px;
                border: 2px solid #ccc;
                border-radius: 25px; /* Đường viền cong */
                font-size: 16px;
                font-family: Arial, sans-serif;
                outline: none;
                transition: border-color 0.3s;
                box-sizing: border-box; /* Đảm bảo padding không làm thay đổi kích thước của trường nhập */
            }

            /* Style the search icon */
            .search-icon {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: #999;
            }

            /* Style the input field when it is focused */
            .search:focus {
                border-color: dodgerblue;
            }
        </style>
    </head>
    <body onload="search()">
        <%@include file="../INCLUDES/head.jsp" %>
        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                    <img src="../IMAGE/HOME/REALFC.png" alt="alt"/>
                </div>

                <ul class="list-unstyled components">
                    <h3 >ADMIN</h3>
                    <li class="active">
                        <a href="/SWPClubManegement/BanAccountController"> <img src="../IMAGE/HOME/friend.png"  width="28px" height="28px"/> List Accounts</a>
                    </li>
                    <li>
                        <a href="listFullBin.php"> <img src="../IMAGE/HOME/user.png"  width="32px" height="32px"/> Create Account</a>
                    </li>
                    <li >
                        <a href="/SWPClubManegement/PlayerController"><img src="../IMAGE/HOME/soccer-player.png" width="32px" height="32px" alt="alt"/> CRUD Player</a>
                    </li>                    
                    <li >
                        <a href="/SWPClubManegement/NewsController"> <img src="../IMAGE/HOME/news.png"  width="28px" height="28px"/> CRUD News</a>
                    </li>
                    <li>
                        <a href="logout.php"> <img src="../IMAGE/HOME/soccer.png"  width="28px" height="28px"/> CRUD match schedule</a>
                    </li>

                    <li>
                        <a href="/SWPClubManegement/LogoutServlet"> <img src="../IMAGE/HOME/logout.png"  width="28px" height="28px"/> Log Out</a>
                    </li>

                </ul>
            </nav>

            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="navbar-toggler">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>

                        <span class="navbar-text"><h4>List All News</h4></span>
                    </div>
                </nav>


                <div class="search-container">

                    <input class="search" type="text" placeholder="ID, Name, Role,Email...">

                    <i class="search-icon fas fa-search"></i>
                </div>
                <div class="table-container">
                    <table class="table table-dark table-striped">

                        <thead class="thead-form" style="background-color: #0d6efd;">
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    UserName
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Role
                                </th>
                                <th>
                                    Status
                                </th>

                            </tr>

                        </thead>
                        <tbody id="accountTableBody">
                            <c:forEach var="u" items="${listAccounts}" varStatus="status">


                                <!--
                                                                <tr>
                                                                    <td>${u.userId}</td>
                                                                    <td><img class="avatar" src="${u.image}" width="45px" height="45px" alt="alt" style="border-radius: 90px"/> ${u.userName}  </td>
                                                                    <td>${u.email}</td>                                    
                                                                    <td>${u.role}</td>
                                
                                
                                
                                
                                                                    <td>
                                
                                
                                
                                                                        <div class="toggle-button">
                                                                            <input type="checkbox" id="statusToggle${u.userId}" class="toggle-input" 
                                <c:if test="${u.status == true}">checked</c:if> />
                         <label for="statusToggle${u.userId}" class="toggle-label"></label>
                         <div class="toggle-handle"></div>
                     </div>

                 </td>

             </tr>-->
                            <script>
                                $(document).ready(function () {
                                    $('#sidebarCollapse').on('click', function () {
                                        $('#sidebar').toggleClass('active');
                                        $(this).toggleClass('active');
                                    });
                                });
                                function avatarOnload()
                                {
                                    var avatarImages = document.getElementsByClassName('avatar');
                                    var check = false
                                    // Loop through each avatar image element
                                    for (var i = 0; i < avatarImages.length; i++) {
                                        var avatarImage = avatarImages[i];
                                        // Attach an onload event handler if it's not already attached



                                        avatarImage.onload = function () {
                                            console.log(this.src);
                                            check = true;
                                            console.log("onLoad" + check);
                                        }
                                        avatarImage.onerror = function () {

                                            this.src = "https://tse4.mm.bing.net/th?id=OIP.65QkEmpKBM_c-VSeqJfgdQAAAA&pid=Api&P=0&h=220";
                                        };


                                        // Set the source to the base64 encoded image


                                    }
                                }
                                avatarOnload();
                                function search() {
                                    var input = document.querySelector(".search").value;
                                    console.log(input);

                                    // Save the input value to localStorage
                                    localStorage.setItem('searchInput', input);

                                    var url = '/SWPClubManegement/BanAccountController?search=' + input + '&command=SEARCH';
                                    console.log(url);

                                    fetch(url, {method: 'GET'})
                                            .then(response => {
                                                if (!response.ok) {
                                                    throw new Error('Network response was not ok');
                                                }
                                                return response.text(); // Get response as text
                                            })
                                            .then(text => {
                                                try {
                                                    var data = JSON.parse(text); // Convert text to JSON
                                                    console.log(data);
                                                    if (data.error) {
                                                        console.error('Server Error:', data.error);
                                                        return;
                                                    }
                                                    // Call the function to update the table
                                                    updateAccountTable(data);
                                                } catch (error) {
                                                    console.error('Error parsing JSON', error);
                                                    console.log('Response Text:', text);
                                                }
                                            })
                                            .catch(error => console.error('Error:', error));
                                }

                                function restoreInput() {
                                    var savedInput = localStorage.getItem('searchInput');
                                    if (savedInput) {
                                        document.querySelector(".search").value = savedInput;
                                    }
                                }

                                function updateAccountTable(accounts) {
                                    if (!Array.isArray(accounts)) {
                                        console.error('Expected array but got:', accounts);
                                        return;
                                    }

                                    const tableBody = document.querySelector("#accountTableBody"); // Assuming you have an ID for tbody
                                    tableBody.innerHTML = ""; // Clear the existing table body

                                    accounts.forEach(u => {
                                        const row = document.createElement('tr');

                                        const userIdCell = document.createElement('td');
                                        userIdCell.textContent = u.userId;
                                        row.appendChild(userIdCell);

                                        const userImageCell = document.createElement('td');
                                        const img = document.createElement('img');
                                        img.classList.add('avatar');
                                        img.src = u.image;
                                        img.width = 45;
                                        img.height = 45;
                                        img.alt = 'alt';
                                        img.style.borderRadius = '90px';
                                        userImageCell.appendChild(img);
                                        userImageCell.appendChild(document.createTextNode(" " + u.userName));
                                        row.appendChild(userImageCell);

                                        const emailCell = document.createElement('td');
                                        emailCell.textContent = u.email;
                                        row.appendChild(emailCell);

                                        const roleCell = document.createElement('td');
                                        roleCell.textContent = u.role;
                                        row.appendChild(roleCell);

                                        const statusCell = document.createElement('td');
                                        const toggleDiv = document.createElement('div');
                                        toggleDiv.classList.add('toggle-button');

                                        const checkbox = document.createElement('input');
                                        checkbox.type = 'checkbox';
                                        checkbox.id = `statusToggle` + u.userId;
                                        checkbox.classList.add('toggle-input');
                                        if (u.status === true) {
                                            checkbox.checked = true;
                                        }
                                        toggleDiv.appendChild(checkbox);

                                        const label = document.createElement('label');
                                        label.setAttribute('for', `statusToggle` + u.userId);
                                        label.classList.add('toggle-label');
                                        toggleDiv.appendChild(label);

                                        const handleDiv = document.createElement('div');
                                        handleDiv.classList.add('toggle-handle');
                                        toggleDiv.appendChild(handleDiv);

                                        statusCell.appendChild(toggleDiv);
                                        row.appendChild(statusCell);

                                        tableBody.appendChild(row);

                                        document.getElementById('statusToggle' + u.userId).addEventListener('change', function () {
                                            console.log(this);
                                            console.log(u.userId);
                                            toggleStatus(this, u.userId);
                                        });
                                        avatarOnload();
                                    });
                                }

                                document.addEventListener('DOMContentLoaded', function () {
                                    document.querySelector(".search").addEventListener('input', search);
                                    restoreInput();
                                });












                                // Định nghĩa một hàm JavaScript để xử lý sự kiện thay đổi trạng thái của checkbox
                                function toggleStatus(statusCheckbox, userId) {
                                    // Lấy giá trị trạng thái mới
                                    const newStatus = statusCheckbox.checked;
                                    const userid = userId;
                                    console.log(" status" + newStatus);
                                    console.log(" userid" + userId);
                                    // Xây dựng URL với trạng thái mới
                                    const url = '/SWPClubManegement/BanAccountController?status=' + newStatus + '&command=UPDATE&uid=' + userId;
                                    console.log(url);
                                    // Gửi yêu cầu GET tới URL
                                    fetch(url, {method: 'GET'})
                                            .then(response => response.text())
                                            .then(data => {
                                                console.log(data);
                                            })
                                            .catch(error => console.error('Error:', error));
                                }

                                // Gắn sự kiện thay đổi cho checkbox
//                                document.getElementById('statusToggle${u.userId}').addEventListener('change', function () {
//                                    console.log(this);
//                                    console.log(${u.userId});
//                                    toggleStatus(this, '${u.userId}');
//                                });
                            </script>               
                        </c:forEach>

                        <!--                    <tr>
                                                <td>
                                                    <i id="add-button"  class=" fas fa-plus"></i>
                                                </td>
                                            </tr>-->

                        </tbody>


                    </table>

                    <!--                    <div class="row">
                    <c:forEach var="u" items="${listAccounts}" varStatus="status">
                         Bắt đầu một hàng mới sau mỗi 3 cột 
                        <c:if test="${status.index % 3 == 0}">
                            <div class="row">
                        </c:if>

                        <div class="col-md-4">
                            <div class="card">

                                <div style="text-align: center; height: 150px">
                                    <img src="${u.image}" width="100px" height="150px" alt="alt"/>
                                </div>
                                <div class="user-info">
                                    <label>User ID:</label>
                                    <span>${u.userId}</span>
                                </div>
                                <div class="user-info">
                                    <label>Email:</label>
                                    <span>${u.email}</span>
                                </div>
                                <div class="user-info">
                                    <label>Role:</label>
                                    <span>${u.role}</span>
                                </div>
                                <div class="user-info">
                                    <label>Status:</label>
                                    <div class="toggle-button">
                                        <input type="checkbox" id="statusToggle${u.userId}" class="toggle-input" 
                        <c:if test="${u.status == true}">checked</c:if> />
                 <label for="statusToggle${u.userId}" class="toggle-label"></label>
                 <div class="toggle-handle"></div>
             </div>
         </div>

     </div>
 </div>
 <script>
     $(document).ready(function () {
         $('#sidebarCollapse').on('click', function () {
             $('#sidebar').toggleClass('active');
             $(this).toggleClass('active');
         });





     });
     // Định nghĩa một hàm JavaScript để xử lý sự kiện thay đổi trạng thái của checkbox
     function toggleStatus(statusCheckbox, userId) {
         // Lấy giá trị trạng thái mới
         const newStatus = statusCheckbox.checked;
         const userid = userId;
         console.log(" status" + newStatus);
         console.log(" userid" + userId);

         // Xây dựng URL với trạng thái mới
         const url = '/SWPClubManegement/BanAccountController?status=' + newStatus + '&command=UPDATE&uid=' + userId;
         console.log(url);
         // Gửi yêu cầu GET tới URL
         fetch(url, {method: 'GET'})
                 .then(response => response.text())
                 .then(data => {
                     console.log(data);
                 })
                 .catch(error => console.error('Error:', error));
     }

     // Gắn sự kiện thay đổi cho checkbox
     document.getElementById('statusToggle${u.userId}').addEventListener('change', function () {
         console.log(this);
         console.log(${u.userId});

         toggleStatus(this, '${u.userId}');
     });

 </script>               
  Đóng hàng sau mỗi 3 cột 
                        <c:if test="${status.index % 3 == 2}">
                        </div>
                        </c:if>
                    </c:forEach>
                     Đóng hàng cuối cùng nếu chưa đóng 
                    <c:if test="${listAccounts.size() % 3 != 0}">
                    </div>
                    </c:if>

                </div>
            </div>-->



                    <!--                    <tr>
                                            <td>
                                                <i id="add-button"  class=" fas fa-plus"></i>
                                            </td>
                                        </tr>-->



                </div>



            </div>
        </div>

        <!-- Import bootstrap 4 scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <%@include file="../ADMIN/addNews.jsp" %>

        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="../ADMIN/editNews.jsp" %>

    </body>
