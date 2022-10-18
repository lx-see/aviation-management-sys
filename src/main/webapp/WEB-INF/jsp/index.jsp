<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Group ONE | Aviation Management System</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: NiceAdmin - v2.1.0
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="${pageContext.request.contextPath}/index" class="logo d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
            <span class="d-none d-lg-block">Group One</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
</header>
<!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/index">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <!-- Airline Module -->
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="ri-flight-takeoff-fill"></i><span>Airline Module</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/airline_view">
                        <i class="bi bi-circle"></i><span>Show & Manage Data</span>
                    </a>
                </li>
            </ul>
        </li>
        <!-- End Airline Module -->

        <!-- Airport Module -->
        <li class="nav-item">
            <a class="nav-link collapsed"
               data-bs-target="#airport-forms-nav" data-bs-toggle="collapse" href="#">
                <i class="ri-plane-fill"></i><span>Airport Module</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="airport-forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/airport_search">
                        <i class="bi bi-circle"></i><span>Search Airport</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/airport_show/page/1">
                        <i class="bi bi-circle"></i><span>Show Airport</span>
                    </a>
                </li>
                <li><a href="${pageContext.request.contextPath}/airport_manage/page/1"
                > <i class="bi bi-circle"></i><span>Manage
								Airport</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/airport_login"> <i class="bi bi-circle"></i><span>Verify
								Airport Entry</span>
                </a></li>
            </ul>
        </li>
        <!-- End Airport Module -->

        <!-- Route Module -->
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#route-forms-nav" data-bs-toggle="collapse" href="#">
                <i class="ri-flight-takeoff-fill"></i><span>Route Module</span><i class="bi bi-chevron-down ms-auto">
            </i>
            </a>
            <ul id="route-forms-nav" class="nav-content collapse"
                data-bs-parent="#sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/route_search/1"> <i
                        class="bi bi-circle"></i><span>Search Route</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/route_add_form"> <i
                        class="bi bi-circle"></i><span>Add New Route</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/route_manage/1"> <i
                        class="bi bi-circle"></i><span>Manage Route</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/route_chat"> <i
                        class="bi bi-circle"></i><span>Chat System</span>
                </a></li>
            </ul>
        </li>
        <!-- End Route Module -->

        <!-- Flightdelay Module -->
        <li class="nav-item">

            <a class="nav-link collapsed" data-bs-target="#flightdelay-forms-nav" data-bs-toggle="collapse" href="#">
                <i class="ri-flight-takeoff-fill"></i><span>Flight Delay Module</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="flightdelay-forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <input id="PageContent" type="hidden" value="${pageContext.request.contextPath}"/>
                    <a href="${pageContext.request.contextPath}/flightdelay_show/page/1/10/sort/flightId/0">
                        <i class="bi bi-circle"></i><span>Show Data</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/flightdelay_manage/page/1/10/sort/flightId/0">
                        <i class="bi bi-circle"></i><span>Manage Data</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/flightdelay_search">
                        <i class="bi bi-circle"></i><span>Advanced Search</span>
                    </a>
                </li>
            </ul>
        </li>
        <!-- End Flightdelay Module -->

    </ul>
</aside>
<!-- End Sidebar-->

<main id="main" class="main">
    <div class="pagetitle">
        <h1>Aviation Management System</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index">Aviation Management System</a></li>
                <li class="breadcrumb-item active">Home</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Airline Card -->
                    <div class="col-xxl-3 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Airline <span>/2015</span></h5>
                                <div class="d-flex align-items-center">
                                    <img src="${pageContext.request.contextPath}/assets/img/2.jpg"
                                         style="width: 6em; height: 6em;">
                                    <a href="${pageContext.request.contextPath}/airline_view" style="padding-left: 1em;" class="card-title">Airline</a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End Airline Card -->

                    <!-- Airport Card -->
                    <div class="col-xxl-3 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Airport <span>/2015</span></h5>
                                <div class="d-flex align-items-center">
                                    <img src="${pageContext.request.contextPath}/assets/img/1.jpg"
                                         style="width: 6em; height: 6em;">
                                    <a href="${pageContext.request.contextPath}/airport_show/page/1" style="padding-left: 1em;" class="card-title">Airport</a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End Airport Card -->

                    <!-- Route Card -->
                    <div class="col-xxl-3 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Route <span>/2015</span></h5>
                                <div class="d-flex align-items-center">
                                    <img src="${pageContext.request.contextPath}/assets/img/3.jpg"
                                         style="width: 6em; height: 6em;">
                                    <a href="${pageContext.request.contextPath}/route_search/1" style="padding-left: 1em;" class="card-title">Route</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Route Card -->

                    <!-- Flightdelay Card -->
                    <div class="col-xxl-3 col-md-6">
                        <div class="card info-card">
                            <div class="card-body">
                                <h5 class="card-title">Flightdelay <span>/2015</span></h5>
                                <div class="d-flex align-items-center">
                                    <img src="${pageContext.request.contextPath}/assets/img/4.jpg"
                                         style="width: 6em; height: 6em;">
                                    <a href="${pageContext.request.contextPath}/flightdelay_show/page/1/10/sort/flightId/0"
                                       style="padding-left: 1em;" class="card-title">Flight</a>
                                </div>
                            </div>
                        </div>
                    </div><!-- End Flightdelay Card -->

                    <!-- Welcome -->
                    <div class="col-12">
                        <div class="card">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img alt="welcome" class="img-fluid rounded-start"
                                         src="${pageContext.request.contextPath}/assets/img/07.jpg">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">Welcome <span>/Home</span></h5>
                                        <h2 style="color: #0b48a1" class="card-text">Welcome to our Website!</h2>
                                        <p class="card-text">Aliquefauctor ac nulla ant vestibulum ris sed tincidunt
                                            pede ut faucibus. Necpellus vel orci pede justo eros elit eget tellus ero
                                            nunc. Hendnibh pretium nec lorem tor tempus vel nibh urna quis morbi.</p>
                                        <p class="card-text">Maecenatoquetamet tempus arcu adipis duis partur convallisi
                                            sed eget et inte. Fauctormassa ligula por nam velit id eros et curabitudin
                                            dolor id.</p>
                                    </div>
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End Welcome -->

                    <!-- Safety -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Safety <span>/About Safety</span></h5>
                                <div>
                                    <h2 style="color: #0b48a1" class="card-text">About Safety</h2>
                                    <p class="card-text"><strong>At vero eos et accusamus</strong> et iusto odio
                                        dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                                        corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
                                        provident, similique sunt in culpa qui officia deserunt mollitia animi, id est
                                        laborum et dolorum fuga quod maxime. </p>
                                    <p class="card-text"><strong>Et harum quidem rerum</strong> facilis est et expedita
                                        distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil
                                        impedit quo minus id quod maxime placeat facere possimus, omnis voluptas
                                        assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut.</p>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Safety -->


                </div>
            </div><!-- End Left side columns -->

            <!-- Right side columns -->
            <div class="col-lg-4">

                <!-- Contact Us -->
                <div class="card">
                    <img class="card-img-top" alt="contact" src="${pageContext.request.contextPath}/assets/img/5.jpg">
                    <div class="card-img-overlay">
                        <h5 class="card-title">Contact US <span>| Info</span></h5>
                        <div class="pad_1">
                            <h2 style="color: #0b48a1" class="card-text">Contact Us</h2>
                            <p class="card-text">
                                Country: Malaysia<br>
                                Address: No 14, Jln Tu, Kampar Perak.<br>
                                Telephone: +605 1234567<br>
                                Email: group1aviation@gmail.com<br>
                            </p>
                        </div>
                    </div>
                </div><!-- End Contact Us -->

                <!-- Services -->
                <div class="card">
                    <img class="card-img-top" alt="contact" src="${pageContext.request.contextPath}/assets/img/6.jpg">
                    <div class="card-body">
                        <h5 class="card-title">Services <span>| Our Services</span></h5>
                        <div class="pad_1">
                            <h2 style="color: #0b48a1" class="card-text">Airline Management</h2>
                            <p class="card-text"><strong>At vero eos et accusamus</strong> et iusto odio dignissimos
                                ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et
                                quas molestias excep- turi sint occaecati cupiditate.</p>
                            <p class="card-text"><strong>Non provident</strong>, similique sunt in culpa qui officia
                                deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis
                                est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio
                                cumque nihil impedit quo minus id quod maxime placeat facere possimus omnis.</p>
                            <br>
                        </div>
                    </div>
                </div><!-- End Services -->

            </div><!-- End Right side columns -->
        </div>
    </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
        Reserved
    </div>
    <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
</footer>
<!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/echarts/echarts.min.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>