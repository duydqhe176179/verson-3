<%-- 
    Document   : event-single
    Created on : Feb 29, 2024, 10:16:30 PM
    Author     : trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Programing</title>
        <!-- ** Plugins Needed for the Project ** -->
        <!-- Bootstrap -->
        <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
        <!-- slick slider -->
        <link rel="stylesheet" href="plugins/slick/slick.css">
        <!-- themefy-icon -->
        <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
        <!-- animation css -->
        <link rel="stylesheet" href="plugins/animate/animate.css">
        <!-- aos -->
        <link rel="stylesheet" href="plugins/aos/aos.css">
        <!-- venobox popup -->
        <link rel="stylesheet" href="plugins/venobox/venobox.css">

        <!-- Main Stylesheet -->
        <link href="css/styleevent.css" rel="stylesheet">

        <!--Favicon-->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">

    </head>
    <body>

        <div class="navigation w-100">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light p-0">
                     <a class="navbar-brand" href="home"><img src="assets/images/logo.png" alt="logo"></a>
                    <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation"
                            aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navigation">
                        <ul class="navbar-nav ml-auto text-center">
                            <li class="nav-item ">
                                <a class="nav-link" href="home">Home</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="home">About</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="home">COURSES</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="news">EVENTS</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="blog">BLOG</a>
                            </li>

                            
                        </ul>
                    </div>
                </nav>
            </div>
        </div>



        <!-- page title -->
        <section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <ul class="list-inline custom-breadcrumb">
                            <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="news">Upcoming Events</a></li>
                            <li class="list-inline-item text-white h3 font-secondary nasted">Event Details</li>
                        </ul>
                        <p class="text-lighten"></p>
                    </div>
                </div>
            </div>
        </section>
        <!-- /page title -->

        <!-- event single -->
        <section class="section-sm">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 class="section-title">${requestScope.news.getTitle()}</h2>
                    </div>
                    <!-- event image -->
                    <div class="col-12 mb-4">
                        <img src="${requestScope.news.getImageURL()}" alt="event thumb" class="img-fluid w-100">
                    </div>
                </div>
                <!-- event info -->
                <div class="row align-items-center mb-5">
                    <div class="col-lg-9">
                        <ul class="list-inline">

                            <li class="list-inline-item mr-xl-5 mr-4 mb-3 mb-lg-0">
                                <div class="d-flex align-items-center">
                                    <i class="ti-calendar text-primary icon-md mr-2"></i>
                                    <div class="text-left">
                                        <h6 class="mb-0">DATE</h6>
                                        <p class="mb-0">${requestScope.news.getEventday()}-${requestScope.news.getMonthdate()}-${requestScope.news.getYeardate()}</p>  
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>

                    <!-- border -->
                    <div class="col-12 mt-4 order-4">
                        <div class="border-bottom border-primary"></div>
                    </div>
                </div>
                <!-- event details -->
                <div class="row">
                    <div class="col-12 mb-50">
                        <h3>About Event</h3>
                        <p>
                            ${requestScope.news.getContent()}
                        </p>
                    </div>
                </div>
            </section>
                <!-- /event single -->

                <!-- more event -->
                
                <!-- /more event -->

                <!-- footer -->
                <div class="footer bg-footer section border-bottom container-fluid">
                    <div class="row">
                        <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
                            <!-- logo -->
                            <a class="logo-footer" href="index.html"><img class="img-fluid mb-4" src="assets/images/logo.png" alt="logo"></a>
                            <ul class="list-unstyled">
                                <li class="mb-2">23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA</li>
                                <li class="mb-2">+1 (2) 345 6789</li>
                                <li class="mb-2">+1 (2) 345 6789</li>
                                <li class="mb-2">contact@yourdomain.com</li>
                            </ul>
                        </div>
                        <!-- company -->
                        <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
                            <h4 class="text-white mb-5">COMPANY</h4>
                            <ul class="list-unstyled">
                                <li class="mb-3"><a class="text-color" href="about.html">About Us</a></li>
                                <li class="mb-3"><a class="text-color" href="teacher.html">Our Teacher</a></li>
                                <li class="mb-3"><a class="text-color" href="contact.html">Contact</a></li>
                                <li class="mb-3"><a class="text-color" href="blog.html">Blog</a></li>
                            </ul>
                        </div>
                        <!-- links -->
                        <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
                            <h4 class="text-white mb-5">LINKS</h4>
                            <ul class="list-unstyled">
                                <li class="mb-3"><a class="text-color" href="courses.html">Courses</a></li>
                                <li class="mb-3"><a class="text-color" href="event.html">Events</a></li>
                                <li class="mb-3"><a class="text-color" href="gallary.html">Gallary</a></li>
                                <li class="mb-3"><a class="text-color" href="faqs.html">FAQs</a></li>
                            </ul>
                        </div>
                        <!-- support -->
                        <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
                            <h4 class="text-white mb-5">SUPPORT</h4>
                            <ul class="list-unstyled">
                                <li class="mb-3"><a class="text-color" href="#">Forums</a></li>
                                <li class="mb-3"><a class="text-color" href="#">Documentation</a></li>
                                <li class="mb-3"><a class="text-color" href="#">Language</a></li>
                                <li class="mb-3"><a class="text-color" href="#">Release Status</a></li>
                            </ul>
                        </div>
                        <!-- support -->
                        <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
                            <h4 class="text-white mb-5">RECOMMEND</h4>
                            <ul class="list-unstyled">
                                <li class="mb-3"><a class="text-color" href="#">WordPress</a></li>
                                <li class="mb-3"><a class="text-color" href="#">LearnPress</a></li>
                                <li class="mb-3"><a class="text-color" href="#">WooCommerce</a></li>
                                <li class="mb-3"><a class="text-color" href="#">bbPress</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- /footer -->
                <!-- /footer -->

                <!-- jQuery -->
                <script src="plugins/jQuery/jquery.min.js"></script>
                <!-- Bootstrap JS -->
                <script src="plugins/bootstrap/bootstrap.min.js"></script>
                <!-- slick slider -->
                <script src="plugins/slick/slick.min.js"></script>
                <!-- aos -->
                <script src="plugins/aos/aos.js"></script>
                <!-- venobox popup -->
                <script src="plugins/venobox/venobox.min.js"></script>
                <!-- mixitup filter -->
                <script src="plugins/mixitup/mixitup.min.js"></script>
                <!-- google map -->
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&libraries=places"></script>
                <script src="plugins/google-map/gmap.js"></script>

                <!-- Main Script -->
                <script src="js/script.js"></script>


                </body>
                </html>
