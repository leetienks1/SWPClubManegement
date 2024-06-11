<%-- 
    Document   : product
    Created on : Jun 7, 2024, 3:44:49 PM
    Author     : Desktop
--%>

<%@page import="DAO.JerseySizeDAO"%>
<%@page import="DAO.JerseyDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Book Library</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <style>
            li.menu-item-has-children > a:before {
                top: 0;
                right: 20px;
                content: none;
                position: absolute;
                font-size: inherit;
                line-height: inherit;
                font-family: 'FontAwesome';


            }
            .tg-sectionspace
            {
                padding: 0;
            }
            .radio-container {
                display: flex;
            }

            /* CSS cho mỗi radio button và label */
            .radio-container div {
                margin-right: 10px; /* Khoảng cách giữa các radio button */

            }

            .radio-container input[type="radio"] {
                display: none; /* Ẩn radio button */
            }

            .radio-container label {
                display: inline-block;
                width: 80px; /* Đặt chiều rộng cố định cho label */
                padding: 5px 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-align: center; /* Căn giữa nội dung */
                box-sizing: border-box; /* Đảm bảo padding không tăng kích thước của label */
                margin-right: 10px; /* Khoảng cách giữa các label */

            }
            .radio-container label:hover
            {
                background-color: buttonface;
            }

            /* Khi radio button được chọn */
            .radio-container input[type="radio"]:checked + label {
                background-color: #007bff; /* Màu nền khi được chọn */
                color: #fff; /* Màu chữ khi được chọn */
            }
            .content-container {
                display: flex;
                flex-direction: column; /* Hiển thị các div theo chiều dọc */
                gap: 20px;
                align-items: start;
                /* Căn giữa theo chiều ngang */

            }

            /* CSS cho mỗi div */
            .content-container > div {
                color: #676D89; /* Màu chữ */
                margin-bottom: 10px; /* Khoảng cách giữa các div */
                text-align: center; /* Căn giữa nội dung */
            }

            /* CSS cho kích thước font của mỗi div */
            .content-container > div:nth-child(1) {
                font-size: 2rem;
                text-transform: uppercase;
            }

            .content-container > div:nth-child(2) {
                font-size: 4rem;
                color: #181733;
                font-family: fantasy;
                letter-spacing: 5px;
            }

            .content-container > div:nth-child(3)
            {
                font-size: 2rem;


            }
            .content-container > div:nth-child(4) {
                font-size: 2rem;
            }
            .button-container {
                text-align: center; /* Căn giữa nút */
            }

            /* CSS cho nút "Add to cart" */
            .button-container button {
                width: 100%;
                background-color: #007bff; /* Màu nền */
                color: #fff; /* Màu chữ */
                padding: 10px 20px; /* Khoảng cách nội dung */
                border: none; /* Không có viền */
                border-radius: 5px; /* Bo góc */
                cursor: pointer; /* Biến con trỏ thành hình bàn tay khi di chuột */
                transition: transform 0.3s ease; /* Hiệu ứng chuyển đổi màu nền */
                font-size: 16px;
            }

            /* Khi di chuột vào nút */
            .button-container button:hover {
                background-color: #0056b3; /* Màu nền khi di chuột vào */
                transform: scale(1.05);
            }
            .tg-innerbanner
            {
                height: 600px;
            }
            .guide-size
            {
                cursor: pointer;
                transition: transform 0.3s ease;
            }
            .guide-size:hover
            {
                transform: scale(1.1);
            }
            .cart-icon {
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #007bff;
                color: #fff;
                padding: 10px;
                border-radius: 50%;
                cursor: pointer;
                z-index: 1000;
            }

            .cart-icon i {
                font-size: 24px;
            }

            .cart {
                display: none; /* Ẩn giỏ hàng */
                position: fixed;
                top: 60px;
                right: 20px;
                width: 300px;
                background-color: #fff;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                border-radius: 5px;
                z-index: 1000;
            }

            .cart h2 {
                margin-top: 0;
                text-align: center;
            }

            .cart ul {
                list-style-type: none;
                padding: 0;
            }

            .cart ul li {
                padding: 5px 0;
            }


            .quantity {
                margin: 10px 0;
            }

            .quantity label {
                margin-right: 10px;
            }

            .quantity input[type="number"] {
                width: 60px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="number"] {
                width: 60px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .cart table {
                width: 100%;
                border-collapse: collapse;
            }

            .cart h2 {
                margin: 0;
            }

            .cart p {

                margin-bottom: 0;
            }

            .cart {
                padding: 10px;
                box-sizing: border-box;
                overflow-y: scroll;
                max-height: 500px;
            }

            .sub-item {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;

            }

            .sub-item figure {
                margin: 0;
                padding: 0;
                margin-right: 15px;
            }

            .sub-item img {
                max-width: 100px;
                height: auto;
                border-radius: 5px;
            }

            .sub-item div {
                display: flex;
                flex-direction: column;
            }

            .sub-item h5 {
                margin: 0;
                font-size: 1.2em;
                color: #333;
            }

            .sub-item h6 {
                margin: 5px 0;
                font-size: 1em;
                color: #666;
            }
            .cart-total
            {

                display: flex;
                justify-content: space-around;
                position: fixed;

                right: 4%;
                top: 8%;
                background: aquamarine;
                width: 250px;
                border-radius: 45px;
                align-items: center;
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
            <div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"  
                 style="background-image: url('../IMAGE/HOME/RealFC Yersey Store.jpg'); background-size: cover; background-repeat: no-repeat">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tg-innerbannercontent">
                                <h1>All Products</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="javascript:void(0);">home</a></li>
                                    <li class="tg-active">Products</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--************************************
                            Inner Banner End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************-->


            <%
                JerseyDAO jdao = new JerseyDAO();

                request.getSession().setAttribute("listJersey", jdao.getAll());
            %>
            <main id="tg-main" class="tg-main tg-haslayout">
                <!--************************************
                                News Grid Start
                *************************************-->
                <div class="tg-sectionspac tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div id="tg-twocolumns" class="tg-twocolumns">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-12 pull-right" >
                                    <div id="tg-content" class="tg-content">
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6" style="text-align: center;  "><img class="jersey-image" style="border-radius: 45px " src="../IMAGE/STORE/${je.jerseyImage}" width="100%" height="100%" alt="alt"/></div> 
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6" style="padding: 20px 10px;"> 
                                            <div class="content-container" style="margin-bottom: 4rem;">
                                                <input type="hidden" class="jid" value="${je.jerseyID}"> 
                                                <div class="jname">${je.jerseyName}</div>
                                                <div class="jdescription">${je.jerseyDescription}</div>
                                                <div class="jprice">$${je.jerseyPrice}/<del style="color: firebrick; font-size: 16px">$50.20</del>
                                                </div>

                                            </div >
                                            <div class="size-container" style="display: flex; justify-content: space-between">
                                                <label style="font-weight: bold">Size</label> 
                                                <div  class="guide-size">  <i class="fas fa-tshirt fa-xs"></i>  Size Guide </div></div>
                                            <div class="radio-container" style="margin-bottom: 1rem;">

                                                <%
                                                    JerseySizeDAO jsdao = new JerseySizeDAO();
                                                    int jid = Integer.parseInt(request.getParameter("jid"));
                                                    request.getSession().setAttribute("listSize", jsdao.getSizeByJerseyID(jid));
                                                %>
                                                <c:forEach var="s" items="${listSize}">

                                                    <div><input type="radio" id="size${s.jerseySize}" name="size" value="${s.jerseySize}"> <label for="size${s.jerseySize}">${s.jerseySize}</label><label class="available">${s.jerseyQuantity}</label></div>

                                                </c:forEach>
                                            </div>
                                            <div class="quantity" style="margin-bottom: 4rem;">
                                                <label for="quantity">Quantity:</label>
                                                <input type="number" id="quantity" name="quantity" value="1" min="1">
                                            </div>
                                            <div class="button-container">
                                                <button type="submit" onclick="addToCart()"> <i class="fa fa-shopping-cart"></i> ADD TO CART</button>
                                            </div>
                                            <div class="button-container">
                                                <button style=" background-color: #f04124;" type="submit" onclick="BuyNow()" > <i class="fa fa-shopping-cart"></i> Buy Now</button>
                                            </div>

                                            <div class="cart-icon" onclick="toggleCart()">
                                                <i class="fa fa-shopping-cart"></i>
                                                <label style="position: fixed; font-weight:  bolder ; color: red; top: 8%;" class="total-in-cart">0</label>
                                            </div>
                                            <div class="cart">
                                                <h2>Cart</h2>
                                                <div id="cart-items"></div>
                                                <div class="cart-total" >

                                                    <a href="/SWPClubManegement/STORE/cartProduct.jsp">Go to Your Cart</a>
                                                    <span id="cart-total">$0.00</span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%@include file="../STORE/sizeGuide.jsp" %>
                        </div>

                        <h2 style="margin: 50px 0; border-bottom: 1px #ccc solid">
                            WE THINK I WOULD LIKE IT
                        </h2>

                        <div id="owl-demo" class="slide owl-carousel owl-theme">
                            <c:forEach var="j" items="${listJersey}">
                                <div class="col-xs-6 col-sm-6 col-md-4 col-lg-12">
                                    <div class="tg-postbook">
                                        <figure class="tg-featureimg">
                                            <div class="tg-bookimg">
                                                <div class="tg-frontcover"><img src="../IMAGE/STORE/${j.jerseyImage}" alt="image description" style="height: 35vh"></div>
                                                <div class="tg-backcover"><img src="../IMAGE/STORE/${j.jerseyImage}"  alt="image description" style="height: 35vh"></div>
                                            </div>
                                            <a class="tg-btnaddtowishlist" href="/SWPClubManegement/ProductDetailServlet?jid=${j.jerseyID}">
                                                <i class="fa fa-shopping-basket"></i>
                                                <span>Buy Now</span>
                                            </a>
                                        </figure>
                                        <div class="tg-postbookcontent">
                                            <ul class="tg-bookscategories">
                                                <li><a href=href="/SWPClubManegement/ProductDetailServlet?jid=${j.jerseyID}">Art &amp; Photography</a></li>
                                            </ul>
                                            <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                            <div class="tg-booktitle">
                                                <h3><a href="/SWPClubManegement/ProductDetailServlet?jid=${j.jerseyID}">${j.jerseyName} </a></h3>
                                            </div>
                                            <span class="tg-bookwriter"> ${j.jerseyDescription}</span>

                                            <span class="tg-bookprice">
                                                <ins>$${j.jerseyPrice}</ins>
                                                <del>$47.20</del>
                                            </span>
                                            <a class="tg-btn tg-btnstyletwo" href="/SWPClubManegement/ProductDetailServlet?jid=${j.jerseyID}">
                                                <i class="fa fa-shopping-basket"></i>
                                                <em>Buy now</em>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>


                        </div>
                    </div>
                </div>
        </div>
        <!--************************************
                        News Grid End
        *************************************-->
    </main>
    <!--************************************
                    Main End
    *************************************-->
    <!--************************************
                    Footer Start
    *************************************-->
    <footer id="tg-footer" class="tg-footer tg-haslayout">
        <div class="tg-footerarea">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <ul class="tg-clientservices">
                            <li class="tg-devlivery">
                                <span class="tg-clientserviceicon"><i class="icon-rocket"></i></span>
                                <div class="tg-titlesubtitle">
                                    <h3>Fast Delivery</h3>
                                    <p>Shipping Worldwide</p>
                                </div>
                            </li>
                            <li class="tg-discount">
                                <span class="tg-clientserviceicon"><i class="icon-tag"></i></span>
                                <div class="tg-titlesubtitle">
                                    <h3>Open Discount</h3>
                                    <p>Offering Open Discount</p>
                                </div>
                            </li>
                            <li class="tg-quality">
                                <span class="tg-clientserviceicon"><i class="icon-leaf"></i></span>
                                <div class="tg-titlesubtitle">
                                    <h3>Eyes On Quality</h3>
                                    <p>Publishing Quality Work</p>
                                </div>
                            </li>
                            <li class="tg-support">
                                <span class="tg-clientserviceicon"><i class="icon-heart"></i></span>
                                <div class="tg-titlesubtitle">
                                    <h3>24/7 Support</h3>
                                    <p>Serving Every Moments</p>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <div class="tg-footerbar">
            <a id="tg-btnbacktotop" class="tg-btnbacktotop" href="javascript:void(0);"><i class="icon-chevron-up"></i></a>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <span class="tg-paymenttype"><img src="images/paymenticon.png" alt="image description"></span>

                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--************************************
                    Footer End
    *************************************-->
</div>
<!--************************************
                Wrapper End
*************************************-->


<script src="../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>

<script>
                                                $(document).ready(function () {
                                                    $(".cart-icon").click(function () {
                                                        $(".cart").toggleClass('show');
                                                    });

                                                    function reviewClose() {
                                                        $("#review-form").toggle();
                                                    }

                                                    $(".review-close").click(function () {
                                                        reviewClose();
                                                    });

                                                    $("#owl-demo").owlCarousel({
                                                        loop: true,
                                                        navigation: true, // Show next and prev buttons
                                                        nav: false,
                                                        slideSpeed: 300,
                                                        paginationSpeed: 300,
                                                        items: 3,
                                                        itemsDesktop: false,
                                                        itemsDesktopSmall: false,
                                                        itemsTablet: false,
                                                        itemsMobile: false,
                                                        autoplay: true,
                                                        autoplayTimeout: 5000,
                                                        autoplayHoverPause: false
                                                    });
                                                });

                                                let cart = [];
                                                const user = ${user.userId}; // Sử dụng userId trong một môi trường hợp lệ
                                                console.log(user);

                                                function saveCart() {
                                                    sessionStorage.setItem('usercart' + user, JSON.stringify(cart));
                                                }

                                                function loadCart() {
                                                    const storedCart = sessionStorage.getItem('usercart' + user);
                                                    if (storedCart) {
                                                        cart = JSON.parse(storedCart);
                                                        renderCart();
                                                    }
                                                }

                                                function addToCart() {
                                                    const selectedSize = document.querySelector('input[name="size"]:checked');
                                                    if (!selectedSize) {
                                                        alert('Please select a size.');
                                                        return;
                                                    }
                                                    const parentDiv = selectedSize.closest('div');
                                                    const availableLabel = parentDiv.querySelector('label.available').textContent;

                                                    const productId = document.querySelector('.jid').value;
                                                    const image = document.querySelector('.jersey-image').src;
                                                    const productName = document.querySelector('.jname').textContent;
                                                    const productPrice = document.querySelector('.jprice').textContent.split('/')[0].substring(1);
                                                    const quantity = parseInt(document.getElementById('quantity').value);

                                                    let itemExists = false;
                                                    for (let i = 0; i < cart.length; i++) {
                                                        let item = cart[i];
                                                        if (item.name === productName && item.size === selectedSize.value) {
                                                            item.quantity += quantity;
                                                            itemExists = true;
                                                            break;
                                                        }
                                                    }

                                                    if (!itemExists) {
                                                        const product = {
                                                            id: productId,
                                                            name: productName,
                                                            image: itemImage,
                                                            size: selectedSize.value,
                                                            price: firstPrice,
                                                            quantity: quantity,
                                                            selected: true,
                                                            quantityAvailable: availableLabel
                                                        };
                                                        cart.push(product);
                                                    }

                                                    saveCart();
                                                    updateCart();
                                                    renderCart();
                                                }

                                                function updateCart() {
                                                    const totalItem = document.querySelector('.total-in-cart');
                                                    let total = 0;
                                                    let totalIncart = 0;

                                                    cart.forEach(function (item) {
                                                        const itemTotal = parseFloat(item.price) * parseInt(item.quantity);
                                                        total += itemTotal;
                                                        totalIncart += item.quantity;
                                                    });

                                                    totalItem.textContent = totalIncart;
                                                    document.getElementById('cart-total').textContent = '$' + total.toFixed(2);
                                                    saveCart();
                                                }

                                                function removeItem(index) {
                                                    cart.splice(index, 1);
                                                    saveCart();
                                                    renderCart();
                                                }

                                                function updateQuantity(index, quantity) {
                                                    cart[index].quantity = parseInt(quantity);
                                                    if (quantity == 0) {
                                                        removeItem(index);
                                                    } else {
                                                        saveCart();
                                                        updateCart();
                                                    }
                                                }

                                                function renderCart() {
                                                    const cartItems = document.getElementById('cart-items');
                                                    cartItems.innerHTML = '';

                                                    cart.forEach((item, index) => {
                                                        const row = document.createElement("div");
                                                        row.className = 'sub-item';
                                                        row.innerHTML = `
            <figure><img src="${item.image}"></figure>
            <div>
                <h5>${item.name}</h5>
                <h6>Size: ${item.size}</h6>
                <h6 class="price">Price: ${item.price}</h6>
                <input type="number" min="0" value="${item.quantity}" onchange="updateQuantity(${index}, this.value)" max="${item.quantityAvailable}">
            </div>`;
                                                        cartItems.appendChild(row);
                                                    });
                                                    updateCart();
                                                }

                                                function BuyNow() {
                                                    let cartNow = [];
                                                    const selectedSize = document.querySelector('input[name="size"]:checked');
                                                    if (!selectedSize) {
                                                        alert('Please select a size.');
                                                        return;
                                                    }
                                                    const parentDiv = selectedSize.closest('div');
                                                    const availableLabel = parentDiv.querySelector('label.available').textContent;

                                                    const productId = document.querySelector('.jid').value;
                                                    const image = document.querySelector('.jersey-image').src;
                                                    const productName = document.querySelector('.jname').textContent;
                                                    const productPrice = document.querySelector('.jprice').textContent.split('/')[0].substring(1);
                                                    const quantity = parseInt(document.getElementById('quantity').value);

                                                    const product = {
                                                        id: productId,
                                                        name: productName,
                                                        image: itemImage,
                                                        size: selectedSize.value,
                                                        price: firstPrice,
                                                        quantity: quantity,
                                                        selected: true,
                                                        quantityAvailable: availableLabel
                                                    };
                                                    cartNow.push(product);

                                                    sessionStorage.setItem('itemTrue' + user, JSON.stringify(cartNow));
                                                    window.location.href = '/SWPClubManegement/STORE/paymentJersey.jsp';
                                                }

                                                window.onload = function () {
                                                    loadCart();
                                                };

                                                document.addEventListener('click', function (event) {
                                                    if (event.target.classList.contains('guide-size') || event.target.classList.contains('fa-tshirt')) {
                                                        const reviewButton = document.getElementById('review-form');
                                                        reviewButton.style.display = 'block';
                                                    }
                                                });

                                                document.querySelectorAll('input[name="size"]').forEach(item => {
                                                    item.addEventListener('change', function () {
                                                        const selectedSize = document.querySelector('input[name="size"]:checked');
                                                        const parentDiv = selectedSize.closest('div');
                                                        const availableLabel = parentDiv.querySelector('label.available').textContent;

                                                        const quantityInput = document.getElementById('quantity');
                                                        if (parseInt(quantityInput.value) > parseInt(availableLabel)) {
                                                            quantityInput.value = availableLabel;
                                                        }
                                                        quantityInput.max = availableLabel;
                                                    });
                                                });

</script>
<script src="../CSS/STORE/vendor/jquery-library.js"></script>
<script src="../CSS/STORE/vendor/bootstrap.min.js"></script>
<script src="https://maps.google.com/maps/api/js?key=AIzaSyCR-KEWAVCn52mSdeVeTqZjtqbmVJyfSus&amp;language=en"></script>
<script src="../CSS/STORE/owl.carousel.min.js"></script>
<script src="../CSS/STORE/jquery.vide.min.js"></script>
<script src="../CSS/STORE/countdown.js"></script>
<script src="../CSS/STORE/jquery-ui.js"></script>
<script src="../CSS/STORE/parallax.js"></script>
<script src="../CSS/STORE/countTo.js"></script>
<script src="../CSS/STORE/appear.js"></script>
<script src="../CSS/STORE/gmap3.js"></script>
<script src="../CSS/STORE/main.js"></script>
</body>

</html>