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
        <link href="vendor/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">

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

            <div class="main-banner-container">
                <div class="main-banner" id="slide-1">
                    <div class="container">
                        <div class="row">
                        <c:forEach var="n" items="${listnews}">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-6 align-self-center">
                                        <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <h2>${n.getTitle()}</h2>
                                                    <h5>${n.getSummary()}</h5>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                            <img style="width: 446px; height:268px; "  src="${n.getImageURL()}" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>>
                    </div>
                </div>
            </div>
            <div class="main-banner" id="slide-2" style="display: none;">
                <div class="container">
                    <div class="row">
                        <c:forEach var="n" items="${listsecond}">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-6 align-self-center">
                                        <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <h2>${n.getTitle()}</h2>
                                                    <h5>${n.getSummary()}</h5>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                            <img style="width: 446px; height:268px;" src="${n.getImageURL()}" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>>
                    </div>
                </div>
            </div>
            <div class="main-banner" id="slide-3" style="display: none;">
                <div class="container">
                    <div class="row">
                        <c:forEach var="n" items="${listlast}">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-6 align-self-center">
                                        <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <h2>${n.getTitle()}</h2>
                                                    <h5>${n.getSummary()}</h5>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                                            <img style="width: 446px; height:268px;" src="${n.getImageURL()}" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>>
                    </div>
                </div>
            </div>

        </div>

        <%-- search mentor by skill name ------------------------------------------------------------------------- --%>
        <div class="container">    
            <form action="searchMentor" method="post">
                <div class="input-group mb-3">
                    <input name="searchBySkill" type="text" class="form-control" placeholder="Search skill">
                    <button class="btn btn-success" type="submit">Go</button>
                </div>
            </form>
        </div>
        <%-- ---------------------------------------------------------------------------------------------------- --%>

        <div id="services" class="services section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
                            <h4>Amazing <em>Skill</em> for you</h4>
                            <img src="assets/images/heading-line-dec.png" alt="">
                            <p>If you need the greatest collection of HTML templates for your business, please visit <a rel="nofollow" href="https://www.toocss.com/" target="_blank">TooCSS</a> Blog. If you need to have a contact form PHP script, go to <a href="https://templatemo.com/contact" target="_parent">our contact page</a> for more information.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--            <div class="container">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="service-item first-service">
                                        <div class="icon"></div>
                                        <h4>App Maintenance</h4>
                                        <p>You are not allowed to redistribute this template ZIP file on any other website.</p>
                                        <div class="text-button">
                                            <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="service-item second-service">
                                        <div class="icon"></div>
                                        <h4>Rocket Speed of App</h4>
                                        <p>You are allowed to use the Chain App Dev HTML template. Feel free to modify or edit this layout.</p>
                                        <div class="text-button">
                                            <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="service-item third-service">
                                        <div class="icon"></div>
                                        <h4>Multi Workflow Idea</h4>
                                        <p>If this template is beneficial for your work, please support us <a rel="nofollow" href="https://paypal.me/templatemo" target="_blank">a little via PayPal</a>. Thank you.</p>
                                        <div class="text-button">
                                            <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="service-item fourth-service">
                                        <div class="icon"></div>
                                        <h4>24/7 Help &amp; Support</h4>
                                        <p>Lorem ipsum dolor consectetur adipiscing elit sedder williamsburg photo booth quinoa and fashion axe.</p>
                                        <div class="text-button">
                                            <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
            <div class="container">  
                <div class="row">
                    <c:forEach   items="${listSkill}" var = "item">
                        <div class="col-lg-3">
                            <div class="service-item first-service">
                                <div  >
                                    <img src="${item.image}" height="237" width="246" alt="alt"/>
                                </div>                          
                                <h4> ${item.title} ${item.skillName}</h4>
                                <p> ${item.skill_description}</p>
                                <div class="text-button">
                                    <a href="#">Read More <i class="fa fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div id="about" class="about-us section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 align-self-center">
                            <div class="section-heading">
                                <h4>About <em>What We Do</em> &amp; Who We Are</h4>
                                <img src="assets/images/heading-line-dec.png" alt="">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor incididunt ut labore et dolore magna.</p>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="box-item">
                                        <h4><a href="#">Maintance Problems</a></h4>
                                        <p>Lorem Ipsum Text</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="box-item">
                                        <h4><a href="#">24/7 Support &amp; Help</a></h4>
                                        <p>Lorem Ipsum Text</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="box-item">
                                        <h4><a href="#">Fixing Issues About</a></h4>
                                        <p>Lorem Ipsum Text</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="box-item">
                                        <h4><a href="#">Co. Development</a></h4>
                                        <p>Lorem Ipsum Text</p>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor idunte ut labore et dolore adipiscing  magna.</p>
                                    <div class="gradient-button">
                                        <a href="#">Start 14-Day Free Trial</a>
                                    </div>
                                    <span>*No Credit Card Required</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-image">
                                <img src="assets/images/about-right-dec.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="clients" class="the-clients">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="section-heading">
                                <h4>Check What <em>The Clients Say</em> About Our App Dev</h4>
                                <img src="assets/images/heading-line-dec.png" alt="">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor incididunt ut labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="naccs">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col-lg-7 align-self-center">
                                            <div class="menu">
                                                <div class="first-thumb active">
                                                    <div class="thumb">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <h4>David Martino Co</h4>
                                                                <span class="date">30 November 2021</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                                <span class="category">Financial Apps</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <span class="rating">4.8</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="thumb">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <h4>Jake Harris Nyo</h4>
                                                                <span class="date">29 November 2021</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                                <span class="category">Digital Business</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <span class="rating">4.5</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="thumb">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <h4>May Catherina</h4>
                                                                <span class="date">27 November 2021</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                                <span class="category">Business &amp; Economics</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <span class="rating">4.7</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="thumb">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <h4>Random User</h4>
                                                                <span class="date">24 November 2021</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                                <span class="category">New App Ecosystem</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <span class="rating">3.9</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="last-thumb">
                                                    <div class="thumb">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <h4>Mark Amber Do</h4>
                                                                <span class="date">21 November 2021</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                                                                <span class="category">Web Development</span>
                                                            </div>
                                                            <div class="col-lg-4 col-sm-4 col-12">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <span class="rating">4.3</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="col-lg-5">
                                            <ul class="nacc">
                                                <li class="active">
                                                    <div>
                                                        <div class="thumb">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="client-content">
                                                                        <img src="assets/images/quote.png" alt="">
                                                                        <p>“Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eismod tempor idunte ut labore et dolore magna aliqua darwin kengan
                                                                            lorem ipsum dolor sit amet, consectetur picing elit massive big blasta.”</p>
                                                                    </div>
                                                                    <div class="down-content">
                                                                        <img src="assets/images/client-image.jpg" alt="">
                                                                        <div class="right-content">
                                                                            <h4>David Martino</h4>
                                                                            <span>CEO of David Company</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div>
                                                        <div class="thumb">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="client-content">
                                                                        <img src="assets/images/quote.png" alt="">
                                                                        <p>“CTO, Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eismod tempor idunte ut labore et dolore magna aliqua darwin kengan
                                                                            lorem ipsum dolor sit amet, consectetur picing elit massive big blasta.”</p>
                                                                    </div>
                                                                    <div class="down-content">
                                                                        <img src="assets/images/client-image.jpg" alt="">
                                                                        <div class="right-content">
                                                                            <h4>Jake H. Nyo</h4>
                                                                            <span>CTO of Digital Company</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div>
                                                        <div class="thumb">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="client-content">
                                                                        <img src="assets/images/quote.png" alt="">
                                                                        <p>“May, Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eismod tempor idunte ut labore et dolore magna aliqua darwin kengan
                                                                            lorem ipsum dolor sit amet, consectetur picing elit massive big blasta.”</p>
                                                                    </div>
                                                                    <div class="down-content">
                                                                        <img src="assets/images/client-image.jpg" alt="">
                                                                        <div class="right-content">
                                                                            <h4>May C.</h4>
                                                                            <span>Founder of Catherina Co.</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div>
                                                        <div class="thumb">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="client-content">
                                                                        <img src="assets/images/quote.png" alt="">
                                                                        <p>“Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eismod tempor idunte ut labore et dolore magna aliqua darwin kengan
                                                                            lorem ipsum dolor sit amet, consectetur picing elit massive big blasta.”</p>
                                                                    </div>
                                                                    <div class="down-content">
                                                                        <img src="assets/images/client-image.jpg" alt="">
                                                                        <div class="right-content">
                                                                            <h4>Random Staff</h4>
                                                                            <span>Manager, Digital Company</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div>
                                                        <div class="thumb">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="client-content">
                                                                        <img src="assets/images/quote.png" alt="">
                                                                        <p>“Mark, Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eismod tempor idunte ut labore et dolore magna aliqua darwin kengan
                                                                            lorem ipsum dolor sit amet, consectetur picing elit massive big blasta.”</p>
                                                                    </div>
                                                                    <div class="down-content">
                                                                        <img src="assets/images/client-image.jpg" alt="">
                                                                        <div class="right-content">
                                                                            <h4>Mark Am</h4>
                                                                            <span>CTO, Amber Do Company</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>          
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="pricing" class="pricing-tables">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="section-heading">
                                <h4>We Have The Best Pre-Order <em>Prices</em> You Can Get</h4>
                                <img src="assets/images/heading-line-dec.png" alt="">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor incididunt ut labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="pricing-item-regular">
                                <span class="price">$12</span>
                                <h4>Standard Plan App</h4>
                                <div class="icon">
                                    <img src="assets/images/pricing-table-01.png" alt="">
                                </div>
                                <ul>
                                    <li>Lorem Ipsum Dolores</li>
                                    <li>20 TB of Storage</li>
                                    <li class="non-function">Life-time Support</li>
                                    <li class="non-function">Premium Add-Ons</li>
                                    <li class="non-function">Fastest Network</li>
                                    <li class="non-function">More Options</li>
                                </ul>
                                <div class="border-button">
                                    <a href="#">Purchase This Plan Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="pricing-item-pro">
                                <span class="price">$25</span>
                                <h4>Business Plan App</h4>
                                <div class="icon">
                                    <img src="assets/images/pricing-table-01.png" alt="">
                                </div>
                                <ul>
                                    <li>Lorem Ipsum Dolores</li>
                                    <li>50 TB of Storage</li>
                                    <li>Life-time Support</li>
                                    <li>Premium Add-Ons</li>
                                    <li class="non-function">Fastest Network</li>
                                    <li class="non-function">More Options</li>
                                </ul>
                                <div class="border-button">
                                    <a href="#">Purchase This Plan Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="pricing-item-regular">
                                <span class="price">$66</span>
                                <h4>Premium Plan App</h4>
                                <div class="icon">
                                    <img src="assets/images/pricing-table-01.png" alt="">
                                </div>
                                <ul>
                                    <li>Lorem Ipsum Dolores</li>
                                    <li>120 TB of Storage</li>
                                    <li>Life-time Support</li>
                                    <li>Premium Add-Ons</li>
                                    <li>Fastest Network</li>
                                    <li>More Options</li>
                                </ul>
                                <div class="border-button">
                                    <a href="#">Purchase This Plan Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <jsp:include page="footer.jsp"></jsp:include>

                <div class="modal fade" id="statisticsModal" tabindex="-1" role="dialog" aria-labelledby="statisticsModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document"> <!-- Added modal-lg class -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="statisticsModalLabel">Statistic Request Form</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table id="statisticsTable" class="table">
                                    <p style="text-align: center; color: red;"> ${errorMess}</p> 
                                <tbody>
                                    <c:set var="mentorStats" value="${mentorStats}" />
                                    <tr>
                                        <td>Processing Request Count:</td>
                                        <td>${mentorStats.processingRequestCount}</td>
                                    </tr>
                                    <tr>
                                        <td>Open Request Count:</td>
                                        <td>${mentorStats.openRequestCount}</td>
                                    </tr>
                                    <tr>
                                        <td>Cancel Request Count:</td>
                                        <td>${mentorStats.cancelRequestCount}</td>
                                    </tr>
                                    <tr>
                                        <td>Cancel Ratio:</td>
                                        <td>${mentorStats.cancelRatio}%</td>
                                    </tr>
                                    <tr>
                                        <td>Closed Ratio:</td>
                                        <td>${mentorStats.closedRatio}%</td>
                                    </tr>
                                    <tr>
                                        <td>Rating star:</td>
                                        <td>${mentorStats.averageRating}</td>
                                    </tr>
                                </tbody>

                            </table>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var slideIndex = 1;
                    showSlide(slideIndex);

                    function showSlide(n) {
                        var i;
                        var slides = document.getElementsByClassName("main-banner");
                        if (n > slides.length) {
                            slideIndex = 1
                        }
                        if (n < 1) {
                            slideIndex = slides.length
                        }
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        slides[slideIndex - 1].style.display = "block";
                    }

                    function nextSlide() {
                        showSlide(slideIndex += 1);
                    }

                    setInterval(nextSlide, 5000); // Chuyển slide sau mỗi 5 giây (5000 milliseconds)
                });

            </script>
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
