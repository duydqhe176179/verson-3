<%-- 
    Document   : home
    Created on : Jan 15, 2024, 2:39:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

        <title>Chain App Dev - App Landing Page HTML5 Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!--
        
        TemplateMo 570 Chain App Dev
        
        https://templatemo.com/tm-570-chain-app-dev
        
        -->

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/templatemo-chain-app-dev.css">
        <link rel="stylesheet" href="assets/css/animated.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <script src="https://kit.fontawesome.com/4c292f6960.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <jsp:include page="header.jsp"></jsp:include>

        <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12 align-self-center">
                                <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                    <form action="searchMentor" method="post">
                                        <div class="input-group mb-3">
                                            <input name="searchBySkill" type="text" class="form-control" placeholder="Search skill">
                                            <button class="btn btn-success" type="submit">Go</button>
                                        </div>
                                    </form>
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Course</th>
                                                    <th>Mentor</th>
                                                    <th>Username</th>
                                                    <th>Rating</th>
                                                    <th>Requests</th>
                                                    <th>Invites</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="o" items="${listM}" >
                                                    <tr>
                                                        <td><img src="${o.getImgSkill()}" alt="alt" style="width: 8rem"></td>
                                                        <td><a href="profilecv?action=view&idMentor=${o.getIdMentor()}" style="color: black">${o.getFullname()}</a></td>
                                                        <td>${o.getUser()}</td>
                                                        <td>${o.getRate()} <i class="fa-solid fa-star" style="color: #FFD43B;"></i></td>
                                                        <td>${o.getTotalRequest()}</td>
                                                        <td>${o.getInvite()}</td>
                                                        <td><button><a href="Request?action=create&idMentor=${o.getIdMentor()}">Invite</a></button></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <footer id="newsletter">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="section-heading">
                            <h4>Join our mailing list to receive the news &amp; latest trends</h4>
                        </div>
                    </div>
                    <div class="col-lg-6 offset-lg-3">
                        <form id="search" action="#" method="GET">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6">
                                    <fieldset>
                                        <input type="address" name="address" class="email" placeholder="Email Address..." autocomplete="on" required>
                                    </fieldset>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                    <fieldset>
                                        <button type="submit" class="main-button">Subscribe Now <i class="fa fa-angle-right"></i></button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>Contact Us</h4>
                            <p>Rio de Janeiro - RJ, 22795-008, Brazil</p>
                            <p><a href="#">010-020-0340</a></p>
                            <p><a href="#">info@company.co</a></p>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>About Us</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Testimonials</a></li>
                                <li><a href="#">Pricing</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Testimonials</a></li>
                                <li><a href="#">Pricing</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><a href="#">Free Apps</a></li>
                                <li><a href="#">App Engine</a></li>
                                <li><a href="#">Programming</a></li>
                                <li><a href="#">Development</a></li>
                                <li><a href="#">App News</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">App Dev Team</a></li>
                                <li><a href="#">Digital Web</a></li>
                                <li><a href="#">Normal Apps</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>About Our Company</h4>
                            <div class="logo">
                                <img src="assets/images/white-logo.png" alt="">
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <p>Copyright © 2022 Chain App Dev Company. All Rights Reserved. 
                                <br>Design: <a href="https://templatemo.com/" target="_blank" title="css templates">TemplateMo</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!-- Scripts -->
        <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="assets/js/owl-carousel.js"></script>
            <script src="assets/js/animation.js"></script>
            <script src="assets/js/imagesloaded.js"></script>
            <script src="assets/js/popup.js"></script>
            <script src="assets/js/custom.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
