<%-- 
    Document   : event
    Created on : Feb 26, 2024, 10:18:12 AM
    Author     : trang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Educenter</title>

        <!-- mobile responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
        <!-- header -->
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
                                <a class="nav-link" href="news">NEWS</a>
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
                            <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="#">Upcoming Events</a></li>
                            <li class="list-inline-item text-white h3 font-secondary"></li>
                        </ul>
                        <p class="text-lighten">Event news will be gathered at this news page. We invite everyone to watch and read the news</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- /page title -->

        <!-- courses -->
        <section class="section" id="event-section">
            <div class="container">
                <div class="row">
                    <c:forEach var="e" items="${listN}" varStatus="loop">
                        <div class="col-lg-4 col-sm-6 mb-5 event-item ${loop.index > 5 ? 'hidden-event' : ''}">
                            <div class="card border-0 rounded-0 hover-shadow">
                                <div class="card-img position-relative">
                                    <img class="card-img-top rounded-0" style="width: 290px; height: 174px;" src="${e.getImageURL()}" alt="event thumb">
                                    <div class="card-date">
                                        <span>${e.getEventday()}</span><br>
                                        ${e.getMonthdate()} <br>
                                        ${e.getYeardate()}
                                    </div>
                                </div>
                                <div class="card-body">
                                    <a href="newsdetail?newsid=${e.getNewsID()}"><h4 class="card-title">${e.getTitle()}</h4></a>

                                </div>
                                <div  class="card-body" style="margin-top: 5px;">

                                    <p class="card-title">${e.getSummary()}</p>

                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="text-center">
                    <button id="see-all-btn" class="btn btn-primary">SEE ALL</button>
                </div>
            </div>
        </section>
        <!-- /courses -->
        <div class="footer bg-footer section border-bottom">
            <div class="container">
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
        </div>
        <!-- copyright -->
        <div class="copyright py-4 bg-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7 text-sm-left text-center">
                        <p class="mb-0">Copyright
                            <script>
                                var CurrentYear = new Date().getFullYear()
                                document.write(CurrentYear)
                            </script> 
                            © Theme By <a href="https://themefisher.com">themefisher.com</a></p> . All Rights Reserved.
                    </div>
                    <div class="col-sm-5 text-sm-right text-center">
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="d-inline-block p-2" href="https://www.facebook.com/themefisher"><i class="ti-facebook text-primary"></i></a></li>
                            <li class="list-inline-item"><a class="d-inline-block p-2" href="https://www.twitter.com/themefisher"><i class="ti-twitter-alt text-primary"></i></a></li>
                            <li class="list-inline-item"><a class="d-inline-block p-2" href="#"><i class="ti-instagram text-primary"></i></a></li>
                            <li class="list-inline-item"><a class="d-inline-block p-2" href="https://dribbble.com/themefisher"><i class="ti-dribbble text-primary"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- /footer -->
    <!-- footer -->


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
    <script src="js/scriptevent.js"></script>

    <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    var eventSection = document.getElementById('event-section');
                                    var allEvents = eventSection.querySelectorAll('.event-item');
                                    var seeAllBtn = document.getElementById('see-all-btn');

                                    // Ẩn các sự kiện nằm sau sự kiện thứ 6
                                    for (var i = 6; i < allEvents.length; i++) {
                                        allEvents[i].style.display = 'none';
                                    }

                                    // Bắt sự kiện click vào nút "SEE ALL"
                                    seeAllBtn.addEventListener('click', function () {
                                        // Hiển thị tất cả các sự kiện
                                        allEvents.forEach(function (event) {
                                            event.style.display = 'block';
                                        });

                                        // Ẩn nút "SEE ALL" sau khi đã hiển thị tất cả các sự kiện
                                        this.style.display = 'none';
                                    });

                                    // Kiểm tra nếu có ít hơn 6 sự kiện, ẩn luôn nút "SEE ALL"
                                    if (allEvents.length <= 6) {
                                        seeAllBtn.style.display = 'none';
                                    }
                                });

    </script>

</body>
</html>
