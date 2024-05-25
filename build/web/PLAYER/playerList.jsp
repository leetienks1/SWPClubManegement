<%-- 
    Document   : playerList
    Created on : May 25, 2024, 2:04:07 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <style>
            #team {
                padding: 60px 0;
                text-align: center;
                background-color: #d1d1d1;
                color: #145889;
            }
            #team h2 {
                position: relative;
                padding: 0px 0px 15px;
            }
            #team p {
                font-size: 15px;
                font-style: italic;
                padding: 0px;
                margin: 25px 0px 40px;
            }
            #team h2::after {
                content: '';
                border-bottom: 2px solid #fff;
                position: absolute;
                bottom: 0px;
                right: 0px;
                left: 0px;
                width: 90px;
                margin: 0 auto;
                display: block;
            }
            #team .member {
                margin-bottom: 20px;
                position: relative;
                overflow: hidden;
                background-color: #ffffff;
                padding: 10px;
                border-radius: 15px 0px 15px 0px;
                box-shadow: 0px 1px 6px 0px rgba(0, 0, 0, 0.4);
            }
            #team .member .member-info {
                display: block;
                position: absolute;
                bottom: 0px;
                left: -200px;
                transition: 0.4s;
                padding: 15px 0;
                background: rgba(0, 0, 0, 0.4);
            }
            #team .member:hover .member-info {
                left: 0px;
                right: 0px;
            }
            #team .member h4 {
                font-weight: 700;
                margin-bottom: 2px;
                font-size: 18px;
                color: #fff;
            }
            #team .member span {
                font-style: italic;
                display: block;
                font-size: 13px;
            }
            #team .member .social-links {
                margin-top: 15px;
            }
            #team .member .social-links a {
                transition: none;
                color: #fff;
            }
            #team .member .social-links a:hover {
                color: #ffc107;
            }
            #team .member .social-links i {
                font-size: 18px;
                margin: 0 2px;
            }
            

        </style>
        <%@include file="../INCLUDES/head.jsp" %>
        <section id="team">
            <div class="container">
                <div class="row justify-content-center ">
                    <div class="col-md-6">
                        <h2>Goalkeeper</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t4.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Emma White</h4>
                                <span>Web Designer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t3.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Bobby Robins</h4>
                                <span>Web Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t2.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Gena lee</h4>
                                <span>SEO Expert</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Noel Flantier</h4>
                                <span>ISO Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Defender</h2>
                        
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t4.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Emma White</h4>
                                <span>Web Designer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t3.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Bobby Robins</h4>
                                <span>Web Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t2.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Gena lee</h4>
                                <span>SEO Expert</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Noel Flantier</h4>
                                <span>ISO Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                 <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Midfielder</h2>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t4.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Emma White</h4>
                                <span>Web Designer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t3.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Bobby Robins</h4>
                                <span>Web Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t2.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Gena lee</h4>
                                <span>SEO Expert</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Noel Flantier</h4>
                                <span>ISO Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                
                 <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Forwards</h2>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t4.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Emma White</h4>
                                <span>Web Designer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t3.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Bobby Robins</h4>
                                <span>Web Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t2.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Gena lee</h4>
                                <span>SEO Expert</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Noel Flantier</h4>
                                <span>ISO Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                
                
                
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Coach</h2>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t4.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Emma White</h4>
                                <span>Web Designer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t3.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Bobby Robins</h4>
                                <span>Web Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t2.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Gena lee</h4>
                                <span>SEO Expert</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Noel Flantier</h4>
                                <span>ISO Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Noel Flantier</h4>
                                <span>ISO Developer</span>
                                <div class="social-links">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
