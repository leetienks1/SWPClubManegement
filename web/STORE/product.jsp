<%-- 
    Document   : product
    Created on : Jun 7, 2024, 3:44:49 PM
    Author     : Desktop
--%>

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
            .tg-innerbanner
            {
                height: 600px;
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
                                    <li><a href="/SWPClubManegement/HomeServlet">home</a></li>
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

                request.getSession().setAttribute("je", jdao.get(1).get());
                request.getSession().setAttribute("listJersey", jdao.getAll());
            %>
            <main id="tg-main" class="tg-main tg-haslayout">
                <!--************************************
                                News Grid Start
                *************************************-->
                <div class="tg-sectionspace tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div id="tg-twocolumns" class="tg-twocolumns">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
                                    <div id="tg-content" class="tg-content">
                                        <div class="tg-products">
                                            <div class="tg-sectionhead">
                                                <h2><span>People’s Choice</span>Bestselling Jersey</h2>
                                            </div>
                                            <div class="tg-featurebook alert" role="alert">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>




                                                <div class="tg-featureditm">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
                                                            <figure><img src="../IMAGE/STORE/${je.jerseyImage}" alt="image description"></figure>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                            <div class="tg-featureditmcontent">
                                                                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                                                                <div class="tg-booktitle">
                                                                    <h3><a href="/SWPClubManegement/ProductDetailServlet?jid=${je.jerseyID}">${je.jerseyName} </a></h3>
                                                                </div>
                                                                <span class="tg-bookwriter">${je.jerseyDescription}</span>

                                                                <div class="tg-priceandbtn">
                                                                    <span class="tg-bookprice">
                                                                        <ins>$${je.jerseyPrice}</ins>
                                                                        <del>$50.20</del>
                                                                    </span>
                                                                    <a class="tg-btn tg-btnstyletwo tg-active" href="/SWPClubManegement/ProductDetailServlet?jid=${je.jerseyID}">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Buy now</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tg-productgrid">
                                                <div class="tg-refinesearch">
                                                    <span>showing 1 to 8 of 20 total</span>
                                                    <form class="tg-formtheme tg-formsortshoitems">
                                                        <fieldset>
                                                            <div class="form-group">
                                                                <label>sort by:</label>
                                                                <span class="tg-select">
                                                                    <select>
                                                                        <option>name</option>
                                                                        <option>name</option>
                                                                        <option>name</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>show:</label>
                                                                <span class="tg-select">
                                                                    <select>
                                                                        <option>8</option>
                                                                        <option>16</option>
                                                                        <option>20</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                        </fieldset>
                                                    </form>
                                                </div>



                                                <!--         ÁO Ở ĐÂY                                       -->
                                                <c:forEach var="j" items="${listJersey}">
                                                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3">
                                                        <div class="tg-postbook">
                                                            <figure class="tg-featureimg">
                                                                <div class="tg-bookimg">
                                                                    <div class="tg-frontcover"><img src="../IMAGE/STORE/${j.jerseyImage}" alt="image description" style="height: 35vh"></div>
                                                                    <div class="tg-backcover"><img src="../IMAGE/STORE/${j.jerseyImage}"  alt="image description" style="height: 35vh"></div>
                                                                </div>
                                                                <a class="tg-btnaddtowishlist" href="/SWPClubManegement/ProductDetailServlet?jid=${j.jerseyID}">
                                                                    <i class="fa fa-shopping-basket"></i>
                                                                    <span>Buy now</span>
                                                                </a>
                                                            </figure>
                                                            <div class="tg-postbookcontent">
                                                                <ul class="tg-bookscategories">
                                                                    <li><a href="javascript:void(0);">Art &amp; Photography</a></li>
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
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
                                    <aside id="tg-sidebar" class="tg-sidebar">
                                        <div class="tg-widget tg-widgetsearch">
                                            <form class="tg-formtheme tg-formsearch">
                                                <div class="form-group">
                                                    <button type="submit"><i class="fas fa-search"></i> </button>
                                                    <input type="search" name="search" class="form-group" placeholder="Search by title, author, key...">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tg-widget tg-catagories">
                                            <div class="tg-widgettitle">
                                                <h3>Categories</h3>
                                            </div>
                                            <div class="tg-widgetcontent">
                                                <ul>
                                                    <li><a href="javascript:void(0);"><span>Art &amp; Photography</span><em>28245</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Biography</span><em>4856</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Children’s Book</span><em>8654</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Craft &amp; Hobbies</span><em>6247</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Crime &amp; Thriller</span><em>888654</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Fantasy &amp; Horror</span><em>873144</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Fiction</span><em>18465</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Fod &amp; Drink</span><em>3148</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Graphic, Anime &amp; Manga</span><em>77531</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>Science Fiction</span><em>9247</em></a></li>
                                                    <li><a href="javascript:void(0);"><span>View All</span></a></li>
                                                </ul>
                                            </div>
                                        </div>



                                    </aside>
                                </div>
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
