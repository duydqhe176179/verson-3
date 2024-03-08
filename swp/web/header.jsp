<%-- 
    Document   : header
    Created on : Feb 26, 2024, 5:52:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .header-area{
                height: 45px;
                display: flex; /* Sử dụng flexbox */
                align-items: center; /* Canh các phần tử theo chiều dọc */
            }
        </style>
    </head>
    <body>
<!--         ***** Preloader Start ***** 
-->                <div id="js-preloader" class="js-preloader">
                    <div class="preloader-inner">
                        <span class="dot"></span>
                        <div class="dots">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                </div><!--
         ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="home" class="logo">
                                <img src="img/logo.png" alt="Chain App Dev" style="height: 30px">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <c:if test="${account eq null}">
                                <ul class="nav navbar-nav ">

                                    <div class="gradient-button">
                                        <a  href="signin"><i class="fa fa-sign-in-alt"></i> Sign In Now</a>
                                        <a href="signup" >Sign up</a>
                                    </div>

                                </ul>
                            </c:if>
                            <c:if test="${account ne null}">
                                <ul class="nav navbar-nav ">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${account.getUser()} <span class="caret"></span></a>
                                        <ul class="dropdown-menu">

                                            <!--nếu là Mentee-->
                                            <c:if test="${account.getRole() eq 'Mentee'}">
                                                <li class="scroll-to-section"><a  class="dropdown-item" href="profileMentee" >ProfileMentee</a></li>
                                                <li class="scroll-to-section"><a class="dropdown-item"  href="listrequest" >List Request</a></li>
                                                <li class="scroll-to-section"><a  class="dropdown-item" href="statisticreq">Statistic Request</a></li>
                                                <li class="scroll-to-section"><a class="dropdown-item"  href="news" >News</a></li>
                                                <li class="scroll-to-section"><a class="dropdown-item"  href="blog" >BLOG</a></li>
                                                </c:if>
                                            <!------------------------------- -->    

                                            <!--nếu là Mentor-->
                                            <c:if test="${account.getRole() eq 'Mentor'}">
                                                <li class="scroll-to-section"><a  class="dropdown-item" href="profilecv?idMentor=${account.getId()}" >Profile</a></li>

                                                <li class="scroll-to-section"><a class="dropdown-item"  href="createcv" >Create CV</a></li>
                                                <li class="scroll-to-section"><a class="dropdown-item"  href="#" data-toggle="modal" data-target="#statisticsModal">View Statistic</a></li>
                                                <li class="scroll-to-section"><a  class="dropdown-item" href="reqmentor" >View Request</a></li>
                                                <li class="scroll-to-section"><a  class="dropdown-item" href="viewrequestmentee" >View invitingRequest</a></li>
                                                <li class="scroll-to-section"><a class="dropdown-item"  href="news" >News</a></li>
                                                <li class="scroll-to-section"><a class="dropdown-item"  href="blog" >BLOG</a></li>
                                                </c:if>
                                            <!------------------------------- -->    

                                            <li class="scroll-to-section"><a  class="dropdown-item" href="rate" >Rate</a></li>
                                            <!--<li class="scroll-to-section"><a  class="dropdown-item" href="Request?action=create" >Create Request</a></li>-->

                                            <li class="scroll-to-section"><a href="changePass">changePass</a></li>
                                            <li class="dropdown-divider"></li> <!-- Đường nằm ngang -->
                                            <li><a href="logoutUser">Log out <i class="fa-solid fa-right-from-bracket"></i></a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <input type="text" value="${account.user}" name="user" style="display: none">

                            </c:if>
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <!--                                <li class="scroll-to-section"><a href="profileMentee" >ProfileMentee</a></li>
                                                                <li class="scroll-to-section"><a href="profilecv" >Profile</a></li>
                                                                <li class="scroll-to-section"><a href="statisticreq">Statistic Request</a></li>
                                                                <li class="scroll-to-section"><a href="createcv" >Create CV</a></li>
                                                                <li class="scroll-to-section"><a href="rate" >Rate</a></li>
                                                                <li class="scroll-to-section"><a href="Request?action=create" >Create Request</a></li>
                                                                <li class="scroll-to-section"><a href="#" data-toggle="modal" data-target="#statisticsModal">View Statistic</a></li>
                                                                <li class="scroll-to-section"><a href="reqmentor" >View Request</a></li>
                                                                <li class="scroll-to-section"><a href="listrequest" >List Request</a></li>
                                                                <li class="scroll-to-section"><a href="viewrequestmentee" >View invitingRequest</a></li>-->
                                <!--                                <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                                                                <li class="scroll-to-section"><a href="#services">Services</a></li>
                                                                <li class="scroll-to-section"><a href="#about">About</a></li>
                                                                <li class="scroll-to-section"><a href="#pricing">Pricing</a></li>
                                                                <li class="scroll-to-section"><a href="#newsletter">Newsletter</a></li>-->

                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->
    </body>
</html>
