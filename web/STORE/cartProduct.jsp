<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <link rel="apple-touch-icon" href="../css/STORE/apple-touch-icon.png">
        <link rel="stylesheet" href="../CSS/STORE/bootstrap.min.css">
        <link rel="stylesheet" href="../CSS/STORE/normalize.css">
        <link rel="stylesheet" href="../CSS/STORE/font-awesome.min.css">
        <link rel="stylesheet" href="../CSS/STORE/icomoon.css">
        <link rel="stylesheet" href="../CSS/STORE/jquery-ui.css">
        <link rel="stylesheet" href="../CSS/STORE/owl.carousel.css">
        <link rel="stylesheet" href="../CSS/STORE/transitions.css">
        <link rel="stylesheet" href="../CSS/STORE/main.css">
        <link rel="stylesheet" href="../CSS/STORE/color.css">
        <link rel="stylesheet" href="../CSS/STORE/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <style>
            .container-cart {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                font-family: Arial, sans-serif;
            }

            /* Heading */
            .container-cart h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            /* Table */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            thead {
                background-color: #e0e0e0;
            }

            thead th {
                padding: 10px;
                text-align: left;
                font-weight: bold;
            }

            tbody tr {
                border-bottom: 1px solid #ddd;
            }

            tbody td {
                padding: 10px;
                text-align: left;
                vertical-align: middle !important;
            }

            tbody td input[type="checkbox"] {
                margin: 0 auto;
                display: block;

            }

            /* Total */
            .total {
                text-align: right;
                font-size: 18px;
                margin-bottom: 20px;
            }

            .total span {
                font-weight: bold;
            }

            /* Button */
            .btn {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .btn:hover {
                background-color: #0056b3;
            }

            /* Specific Button */
            .btn-update {
                display: block;
                margin: 0 auto;
                background-color: #28a745;
            }

            .btn-update:hover {
                background-color: #218838;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .container {
                    width: 95%;
                }

                table, thead, tbody, th, td, tr {
                    display: block;
                }

                thead tr {
                    display: none;
                }

                tbody td {
                    position: relative;
                    padding-left: 50%;
                }

                tbody td:before {
                    content: attr(data-label);
                    position: absolute;
                    left: 10px;
                    width: 45%;
                    padding-right: 10px;
                    white-space: nowrap;
                }
            }
        </style>

        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!--************************************
                            Header Start
            *************************************-->
            <header id="tg-header" class="tg-header tg-haslayout">
                <div class="tg-topbar">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <ul class="tg-addnav">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <i class="fas fa-address-book"></i>
                                            <em>Contact</em>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <i class="fas fa-question-circle"></i>
                                            <em>Help</em>
                                        </a>
                                    </li>
                                </ul>

                                <div class="tg-userlogin">
                                    <figure><a href="javascript:void(0);"><img src="${user.image}" alt="image description"></a></figure>
                                    <span>${user.userName}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tg-navigationarea">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <nav id="tg-nav" class="tg-nav">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#tg-navigation" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                    <div id="tg-navigation" class="collapse navbar-collapse tg-navigation">
                                        <ul>

                                            <li class="menu-item-has-children">
                                                 <a href="/SWPClubManegement/STORE/product.jsp">Home </a>

                                            </li>

                                            <li><a href="products.html">Best Selling</a></li>
                                            <li><a href="products.html">Weekly Sale</a></li>
                                            <li class="menu-item-has-children">
                                                <a href="/SWPClubManegement/NewsServlet">Latest News</a>

                                            </li>
                                            <li><a href="contactus.html">Contact</a></li>


                                            <li><a href="/SWPClubManegement/STORE/cartProduct.jsp"> Cart</a></li>


                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!--************************************
                            Header End
            *************************************-->
            <!--************************************
                            Inner Banner Start
            *************************************-->

            <!--************************************
                            Inner Banner End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************-->



            <main id="tg-main" class="tg-main tg-haslayout">
                <!--************************************
                                News Grid Start
                *************************************-->
                <div class="tg-sectionspac tg-haslayout">
                    <div class="container-cart">
                        <h1>Shopping Cart</h1>
                        <table>
                            <thead>
                                <tr>

                                    <th>Select</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Size</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="cart-items" style="vertical-align: middle;"></tbody>
                        </table>
                        <div class="total">
                            Total: <span id="cart-total">$0.00</span>
                        </div>
                        <button class="btn btn-update" onclick="selectItemsTrue()">Buy </button>
                    </div>
                </div>
        </div>





    </body>
    <script>
        let cart = [];
        const user = ${user.userId};
        console.log(user);
        function saveCart()
        {
            sessionStorage.setItem('usercart' + user, JSON.stringify(cart));
        }
        function loadCart() {
            const storedCart = sessionStorage.getItem('usercart' + user);
            if (storedCart) {
                cart = JSON.parse(storedCart);
                renderCart();
            } else
            {
                alert('empty');
            }
            console.log(storedCart);
        }

        function updateCart() {
            const rows = document.querySelectorAll('#cart-items .sub-item');
            const totalItem = document.querySelector('.total-in-cart');
            let total = 0;
            let totalIncart = 0;
            cart.forEach(function (item, index) {
                const str = item.price;
                const priceParts = str.split('/'); // Tách chu?i thành m?ng các ph?n, phân tách b?i d?u "/"
                const firstPrice = priceParts[0].substring(1); // L?y ph?n t? ??u tiên và lo?i b? d?u "$"
                console.log(firstPrice); // Output: "39.99"
                console.log(firstPrice + item.quantity);
                const itemTotal = parseFloat(firstPrice).toFixed(2) * parseInt(item.quantity);
                total += itemTotal;
                totalIncart += item.quantity;
                totalItem.textContent = totalIncart;
            });
            document.getElementById('cart-total').textContent = '$' + total.toFixed(2);
            saveCart();
        }

        function renderCart() {
            const cartItems = document.getElementById('cart-items');
            cartItems.innerHTML = '';
            let total = 0;
            cart.forEach((item, index) => {
                const itemTotal = item.price * item.quantity;
                if (item.selected) {
                    total += itemTotal;
                }
                console.log(item.price);
                const row = document.createElement('tr');
                row.innerHTML =
                        '<input type="hidden" value="' + item.id + '" readonly>' +
                        '<td><input type="checkbox" ' + (item.selected ? 'checked' : '') + ' onclick="toggleSelect(' + index + ')"></td>' +
                        '<td>' + item.name + '</td>' +
                        '<td>$' + item.price + '</td>' +
                        '<td>' + item.size + '</td>' +
                        '<td><input type="number" min="1" value="' + item.quantity + '" onchange="updateQuantity(' + index + ', this.value)"></td>' +
                        '<td>$' + itemTotal.toFixed(2) + '</td>' +
                        '<td><button class="btn btn-remove" onclick="removeItem(' + index + ')">Remove</button></td>';
                cartItems.appendChild(row);
            });
            document.getElementById('cart-total').textContent = '$' + parseFloat(total).toFixed(2);
            saveCart();
        }

        function toggleSelect(index) {
            cart[index].selected = !cart[index].selected;
            renderCart();
        }

        function updateQuantity(index, quantity) {
            cart[index].quantity = parseInt(quantity);
            renderCart();
        }

        function removeItem(index) {
            cart.splice(index, 1);
            renderCart();
        }

        function updateCart() {
            renderCart();
        }
        function selectItemsTrue()
        {
            let itemTrue = [];
            cart.forEach((item) => {

                if (item.selected === true)
                {
                    itemTrue.push(item);
                }

            });
            console.log(itemTrue);
            sessionStorage.setItem("itemTrue" + user, JSON.stringify(itemTrue));
            window.location.href = '/SWPClubManegement/STORE/paymentJersey.jsp';
        }
        window.onload = function () {
            loadCart();
        };


    </script>
</html>
