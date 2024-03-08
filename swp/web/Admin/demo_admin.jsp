<%-- 
    Document   : demo_admin
    Created on : Mar 5, 2024, 9:47:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>ADMIN-Happy Programming</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <!--        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
                <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
                <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Custom styles for this template -->
        <!--        <link href="../css/resume.min.css"  type="text/css" rel="stylesheet">-->
        <link href="../css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/4c292f6960.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resume.min.css"/>
        <style>
            .search {
                width: 400px;
                height: 40px;
                margin: 5px auto;
                background: #fff;
                background: transparent;
                border-radius:  5px;
                border: 1px solid #06357a;
                margin-right: 15px;
                padding-right: 0px;

                input {
                    width: 200px;
                    padding: 5px 5px;
                    float: left;
                    color: #444;
                    border: 0;
                    background: transparent;
                    border-radius: 3px 3px 3px 3px;
                    &:focus {
                        outline: 0;
                        background:transparent;
                    }
                }

                button {
                    font-size: medium;
                    position: relative;
                    float: right;
                    border: 0;
                    padding: 0;
                    cursor: pointer;
                    height: 40px;
                    width: 120px;
                    color: #444;
                    background: transparent;
                    border-left: 1px solid #212529;
                    border-radius: 3px 3px 3px 3px;
                    &:hover {
                        background: rgba(0,0,0,.2);
                        color:#444;
                    }
                    &:active {
                        box-shadow: 0px 0px 12px 0px rgba(225, 225, 225, 1);
                    }
                    &:focus {
                        outline: 0;
                    }
                }
            }
            .pagination{
                display: inline-block;
            }
            .pagination a{
                color:black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active{
                background-color: #4CAF50;
                color: white;
            }
            
            .pagination a:hover:not(.active){
                background-color: chocolate;
            }
            td, th {
                border: 1px solid black;
                padding: 8px;
            }
        </style>
    </head>

    <body id="page-top">

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">Start Bootstrap</span>
                <span class="d-none d-lg-block">
                    <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/profile.jpg" alt="">
                </span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#news">News</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#mentor">Mentor</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#mentee">Mentee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#skills">Skills</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#request">Requests</a>
                    </li>

                </ul>
            </div>
        </nav>

        <div class="container-fluid p-0">

            <section class="resume-section p-3 p-lg-5 d-flex d-column" id="news">
                <div class="my-auto">
                    <h1 class="mb-0">
                        <span class="text-primary">News</span>
                    </h1>
                    <div class="table-responsive">
                         <c:set var="page4" value="${requestScope.page4}"/>
                            <div class="pagination">
                                <c:forEach begin="1" end="${requestScope.num4}" var="i">
                                    <a class="${i==page4 ? 'active' : ''}" href="admin?page4=${i}">${i}</a>
                                </c:forEach>
                            </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Event Dates</th>
                                    <th>Content</th>
                                    <th>Summary</th>
                                    <th>Postdate</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="s" items="${news}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td><img src="${s.getImageURL()}" width="100rem"  alt="alt"/></td>
                                        <td>${s.getTitle()}</td>
                                        <td>${s.getEventday()}-${s.getMonthdate()}-${s.getYeardate()}</td>
                                        <td>${s.getContent()}</td>
                                        <td>${s.getSummary()}</td>
                                        <td>${s.getPostDate()}</td>
                                        <td><a href="updatenews?newsID=${s.getNewsID()}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                                        <td><a href="deletenews?newsID=${s.getNewsID()}" onclick="return confirmDelete()"><i class="fa-solid fa-trash-alt"></i></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="mentor">
                <div class="my-auto">
                    <h2 class="mb-5">Mentor</h2>
                </div>
                <div class="container">
                    <section  class="row" style="margin: 30px; text-align: end; font-size: 18px;">
                        <form class="search" action="admin" method="get">
                            <input name="search" type="search" value ="${param.search}" placeholder="Search here..."   >
                            <button type="submit">Search</button>
                        </form>   
                    </section>


                    <section class="row " style="background: white">

                        <div>                              
                            <div class="table-responsive">
                                <c:set var="page1" value="${requestScope.page1}"/>
                                <div class="pagination">
                                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                                        <a class="${i==page1 ? 'active' : ''}" href="admin?page1=${i}">${i}</a>
                                    </c:forEach>
                                </div>

                                <table class="table table-bordered">
                                    <thead>
                                        <tr style="background: whitesmoke;">
                                            <th>STT</th>
                                            <th>ID</th>
                                            <th>FullName</th>
                                            <th>Account</th>
                                            <th>Profession</th>
                                            <th>Accepted request</th>
                                            <th>Percentage completed</th>
                                            <th>Rate</th>
                                            <th>Active</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="a" items="${lis}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${a.getID()}</td>
                                                <td>${a.getFullName()}</td>                                           
                                                <td>${a.getAccountname()}</td>
                                                <td>${a.getProfession()}</td>
                                                <td>${a.getAcceptrequest()}</td>
                                                <td>${a.getPercentcompleted()}%</td>
                                                <td>${a.getRate()}<i class="fa-solid fa-star" style="color: #FFD43B;"></i></td>

                                                <c:if test="${a.getActive() eq 1}">
                                                    <td style="color: #01df1f">
                                                        <p style="font-size: large">Active</p>
                                                        <a class="btn btn-danger" href="activementor?id=${a.getID()}"  style="width: 70%">Inactive</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${a.getActive() eq 0}">
                                                    <td style="color: #ff1921">
                                                        <p style="font-size: large">Inactive</p>
                                                        <a class="btn" style="background-color: #4acd3d; color: white; width: 70%;" href="activementor?id=${a.getID()}" >Active</a>
                                                    </td>
                                                </c:if>


                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </section>
            </section>
            <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="mentee">
                <div class="my-auto">
                    <h2 class="mb-5">Mentee</h2>
                    <div class="header">             
                        <h5>Total of Mentee: ${result}</h5>            
                    </div>
                    <c:set var="page2" value="${requestScope.page2}"/>
                            <div class="pagination">
                                <c:forEach begin="1" end="${requestScope.num2}" var="i">
                                    <a class="${i==page2 ? 'active' : ''}" href="admin?page2=${i}">${i}</a>
                                </c:forEach>
                            </div>
                    <table border="1px" class="container">
                        <tr style="background: whitesmoke;" >
                            <td >Full Name</td>
                            <td >Username</td>
                            <td >NumRequests</td>
                            <td >TotalHours</td>
                            <td >TotalSkills</td>
                        </tr>
                        <c:forEach items="${list2}"  var="e">
                            <tr>
                                <td>${e.getFullName()}</td>
                                <td>${e.getUserName()}</td>
                                <td>${e.getNumRequests()}</td>
                                <td>${e.getTotalHours()}</td>
                                <td>${e.getTotalSkills()}</td>               
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </section>

            <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="skills">
                <div class="my-auto">
                    <h2 class="mb-5">Skills</h2>
                    <c:set var="page" value="${requestScope.page}"/>
                            <div class="pagination">
                                <c:forEach begin="1" end="${requestScope.num3}" var="i">
                                    <a class="${i==page ? 'active' : ''}" href="admin?page=${i}">${i}</a>
                                </c:forEach>
                            </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="s" items="${listSkill22}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${s.getId()}</td>
                                    <td>${s.getTiltle()}</td>
                                    <td><img src="${s.getImage()}" width="100rem"  alt="alt"/></td>
                                    <td>${s.getSkillName()}</td>
                                    <td>${s.getSkill_description()}</td>
                                    <c:if test="${s.getStatus() eq 'enable'}" >
                                        <td style="color: #01df1f">
                                            <p style="font-size: large">${s.getStatus()}</p>
                                            <a class="btn btn-danger" href="activeSkill?idSkill=${s.getId()}" style="width: 70%">Disable</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${s.getStatus() ne 'enable'}" >
                                        <td style="color: #ff1921">
                                            <p style="font-size: large">${s.getStatus()}</p>
                                            <a class="btn" style="background-color: #4acd3d; color: white;" href="activeSkill?idSkill=${s.getId()}" style="width: 70%">Enable</a>
                                        </td>
                                    </c:if>
                                    <td><a href="updateSkill?idSkill=${s.getId()}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>

            <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="request">
                <div class="my-auto">
                    <h2 class="mb-5">Requests</h2>
                    <body style="font-family: verdana, geneva, sans-serif;">
                        <header class="header">        
                            <div class="logo">
                                <div class="search_box">
                                    <form action="admin" method="get">
                                        <input type="text" name="searchTerm" placeholder="Search Here" value="${param.searchTerm}">
                                        <input type="hidden" name="page" value="${currentPage}" />
                                        <!-- Include other filter parameters as needed -->
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </header>

                        <div class="container">
                            <div class="main-body">            
                                <form method="get" action="admin" id="combinedFilterForm" onsubmit="return submitCombinedForm()">
                                    <div class="checkstaus">
                                        <c:forEach var="s" items="${statusList}">
                                            <input type="checkbox" name="selectedStatusArray" value="${s}" id="${s}" ${selectedStatusArray != null && Arrays.asList(selectedStatusArray).contains(s) ? 'checked' : ''} />
                                            <label for="${s}">${s}</label><br />
                                        </c:forEach>
                                    </div>

                                    <div class="checkdate">
                                        <div class="input-date">
                                            <label for="startDate">Start Date:</label>
                                            <input type="date" name="startDate" id="startDate" value="${param.startDate}" onchange="submitCombinedForm()">

                                            <label for="endDate">End Date:</label>
                                            <input type="date" name="endDate" id="endDate" value="${param.endDate}" onchange="submitCombinedForm()">
                                        </div>
                                    </div>

                                    <button type="submit"><i class="fa fa-search"></i> Filter</button>
                                </form>
                            </div>
                            <!-- Display selected dates -->
                            <div id="result"></div>

                            <!-- Pagination Links -->
                            <div class="pagination">
                                <c:if test="${totalPages > 1}">
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <c:url value="admin" var="paginationUrl">
                                            <c:param name="page6" value="${i}" />
                                        </c:url>
                                        <a href="${paginationUrl}" class="${i == page6 ? 'active' : ''}">${i}</a>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <div class="history_lists">
                                <div class="list1">
                                    <!-- Your existing content -->
                                    <table style="width: 1100px;">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Id Request</th>
                                                <th>Account</th>
                                                <th>Title</th>
                                                <th>Content</th>
                                                <th>Skill</th>
                                                <th>Start date</th>
                                                <th>End date</th>
                                                <th>Status</th>
                                                <th>dealine hour</th>
                                                <th>Reason Reject</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="r" items="${listRequest}" varStatus="loop">
                                                <tr>
                                                    <td>${loop.index + 1}</td>
                                                    <td>
                                                        <!-- Assuming you want to link to the detail page -->
                                                        <a href="detailreq?id=${r.idRequest}" style="text-decoration: none; color: red;">${r.idRequest}</a>

                                                    </td>
                                                    <td>${r.username}</td>
                                                    <td>${r.title}</td>
                                                    <td>${r.content}</td>
                                                    <td>${r.skill}</td>
                                                    <td>${r.startdate}</td>
                                                    <td>${r.deadline}</td>
                                                    <td>
                                                        <select id="status-${r.idRequest}" onchange="changeStatus(this)">
                                                            <!-- Default option showing the current status -->
                                                            <option value="${r.status}" selected>${r.status}</option>
                                                            <!-- Options for status -->
                                                            <option value="Open" ${r.status == 'Open' ? 'disabled style="display:none;"' : ''}>Open</option>
                                                            <option value="Accepted" ${r.status == 'Accepted' ? 'disabled style="display:none;"' : ''}>Accepted</option>
                                                            <option value="Rejected" ${r.status == 'Rejected' ? 'disabled style="display:none;"' : ''}>Rejected</option>
                                                            <option value="Learning" ${r.status == 'Learning' ? 'disabled style="display:none;"' : ''}>Learning</option>
                                                            <option value="Completed" ${r.status == 'Completed' ? 'disabled style="display:none;"' : ''}>Completed</option>
                                                            <option value="Closed" ${r.status == 'Closed' ? 'disabled style="display:none;"' : ''}>Closed</option>
                                                            <option value="Cancel" ${r.status == 'Cancel' ? 'disabled style="display:none;"' : ''}>Cancel</option>
                                                            <!-- Add more options as needed -->
                                                        </select>
                                                    </td>



                                                    <td>${r.hour}</td>
                                                    <td>${r.reasonreject}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>

                <script>
                    function submitCombinedForm() {
                        document.getElementById('combinedFilterForm').submit();
                    }
                    function changeStatus(selectElement) {
                        var requestId = selectElement.id.split('-')[1]; // Extracting the request ID
                        var selectedValue = selectElement.value; // Getting the selected value

                        // Call the controller using AJAX
                        // Example using jQuery AJAX
                        $.get("changestatus", {requestId: requestId, status: selectedValue}, function (response) {
                            // Handle response if needed
                        });
                    }
                </script>
                </body>

            </section>


        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/resume.min.js"></script>

    </body>

</html>
