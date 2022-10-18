<%@ page import="com.groupone.aviationsys.api.entity.Flightdelay" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Show Flight Delay - Group ONE</title>
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
            <ul id="flightdelay-forms-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
                <li>
                    <input id="PageContent" type="hidden" value="${pageContext.request.contextPath}"/>
                    <a class="active" href="${pageContext.request.contextPath}/flightdelay_show/page/1/10/sort/flightId/0">
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
        <h1>Show Data Tables</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                <li class="breadcrumb-item">Flight Delay Module</li>
                <li class="breadcrumb-item active">Show data</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Flight Tables</h5>
                        <!-- Table with stripped rows -->
                        <table class="table datatable table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Date / Day</th>
                                <th scope="col">Tail Number</th>
                                <th scope="col">Source Airport</th>
                                <th scope="col">Dest Airport</th>
                                <th scope="col">Departure Time</th>
                                <th scope="col">Arrival Time</th>
                                <th scope="col">Diverted</th>
                                <th scope="col">Cancelled</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="flightDelay" items="${flightDelayList}">
                                <tr>
                                    <th scope="row">${flightDelay.flightId}</th>
                                    <td>${flightDelay.year}-${flightDelay.month}-${flightDelay.day}
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 1}" scope="page">
                                            Mon
                                        </c:if>
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 2}" scope="page">
                                            Tue
                                        </c:if>
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 3}" scope="page">
                                            Wed
                                        </c:if>
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 4}" scope="page">
                                            Thurs
                                        </c:if>
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 5}" scope="page">
                                            Fri
                                        </c:if>
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 6}" scope="page">
                                            Sat
                                        </c:if>
                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 7}" scope="page">
                                            Sun
                                        </c:if>
                                    </td>
                                    <td>${flightDelay.tailNumber}</td>
                                    <td>${flightDelay.sourceAirportIATA}</td>
                                    <td>${flightDelay.destAirportIATA}</td>
                                    <td>${flightDelay.departureTime}</td>
                                    <td>${flightDelay.arrivalTime}</td>
                                    <td>${flightDelay.diverted}</td>
                                    <td>${flightDelay.cancelled}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- End Table with stripped rows -->

                        <!-- Centered Pagination -->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li>
                                    <a href="${pageContext.request.contextPath}/flightdelay_show/page/1/${pageSize}/sort/${sortCol}/${ascDesc}"
                                       class="page-link">
                                        First
                                    </a>
                                </li>
                                <li class=
                                    <c:if test="${pageNum<=10}">
                                            "page-item disabled"
                                </c:if>
                                <c:if test="${pageNum>10}">
                                    "page-item"
                                </c:if>
                                >
                                <a class="page-link"
                                        <c:if test="${pageNum<=10}">
                                            aria-disabled="true"
                                        </c:if>
                                        <c:if test="${pageNum>10}">
                                            aria-disabled="false"
                                        </c:if>
                                   href="${pageContext.request.contextPath}/flightdelay_show/page/${pageNumList[0]-1}/${pageSize}/sort/${sortCol}/${ascDesc}"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                                </li>
                                <c:forEach var="page" items="${pageNumList}">
                                    <c:if test="${page == pageNum}">
                                        <li class="page-item active"><a class="page-link" data-pageNo="${page}"
                                                                        href="#">${page}</a></li>
                                    </c:if>
                                    <c:if test="${page != pageNum}">
                                        <li class="page-item"><a class="page-link" data-pageNo="${page}"
                                                                 href="${pageContext.request.contextPath}/flightdelay_show/page/${page}/${pageSize}/sort/${sortCol}/${ascDesc}">${page}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <li class=
                                    <c:if test="${((pageNum - lastPageRange) >=1) && ((pageNum - lastPageRange) <= 9)}">
                                            "page-item disabled"
                                </c:if>
                                <c:if test="${(pageNum - lastPageRange) <1}">
                                    "page-item"
                                </c:if>
                                >
                                <a class="page-link"
                                        <c:if test="${((pageNum - lastPageRange) >=1) && ((pageNum - lastPageRange) <= 9)}">
                                            aria-disabled="true"
                                        </c:if>
                                        <c:if test="${(pageNum - lastPageRange) <1}">
                                            aria-disabled="false"
                                        </c:if>
                                   href="${pageContext.request.contextPath}/flightdelay_show/page/${pageNumList[0]+10}/${pageSize}/sort/${sortCol}/${ascDesc}"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/flightdelay_show/page/${lastPageNum}/${pageSize}/sort/${sortCol}/${ascDesc}"
                                       class="page-link">
                                        Last
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <!-- End Centered Pagination -->

                        <!-- Sorting, Page Resize -->
                        <div class="row">
                            <div style="margin-bottom: 10px;">
                                <button id="showFlightDelayData" type="button" class="btn btn-primary"
                                        data-bs-toggle="modal" data-bs-target="#fullscreenModal">Show Flight Delay Data
                                    Details
                                </button>
                                <button id="saveReport" type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#reportModal">
                                    Export Report
                                </button>
                            </div>
                            <div class="col-md-3">
                                <div class="form-floating mb-3">
                                    <input type="number" value="10" min="10" max="500" maxlength="3" class="form-control"
                                           id="inputPageSize1" placeholder="Page Size">
                                    <label for="inputPageSize1">Page Size</label>
                                </div>
                                <button id="btnResizePage1" type="button" class="btn btn-primary">Resize</button>
                            </div>
                            <div class="col-md-4 offset-1">
                                <input id="currentPageNum" type="hidden" value="${pageNum}"/>
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="selectSortCol"
                                            aria-label="Floating label select example">
                                        <option value="flightId" selected>Flightdelay ID</option>
                                        <option value="tailNumber">Tail Number</option>
                                        <option value="sourceAirportIATA">Source Airport</option>
                                        <option value="destAirportIATA">Destination Airport</option>
                                    </select>
                                    <label for="selectSortCol">Select Sort Column</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="selectAscDesc"
                                            aria-label="Floating label select example">
                                        <option value="0" selected>Ascending</option>
                                        <option value="1">Descending</option>
                                    </select>
                                    <label for="selectAscDesc">Ascending / Descending</label>
                                </div>
                                <button id="sortByCol1" type="button" class="btn btn-primary">
                                    Sort
                                </button>
                            </div>
                        </div>
                        <!-- End Sorting, Page Resize -->

                        <!-- Basic Model -->
                        <div class="modal fade" id="reportModal" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Report Options</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="reportForm">
                                            <div class="row mb-3">
                                                <label>
                                                    Enter Your Report Title:
                                                </label>
                                                <div class="col-md-12">
                                                    <div class="form-floating">
                                                        <input required type="text" class="form-control"
                                                               id="inputReportTitle" placeholder="Report Title">
                                                        <label for="inputReportTitle">Report Title</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <label>
                                                Enter Your Department Name:
                                            </label>
                                            <div class="col-md-12">
                                                <div class="form-floating">
                                                    <input required type="text" class="form-control"
                                                           id="inputDepartmentName" placeholder="Department Name">
                                                    <label for="inputDepartmentName">Department Name</label>
                                                </div>
                                            </div>
                                            <br/>
                                            <label>
                                                Enter only FromDate column if you wish to generate report for specific
                                                date
                                                <br>Else, enter both FromDate & ToDate columns to generate report for
                                                time period
                                            </label>
                                            <div class="col-md-12">
                                                <div class="form-floating">
                                                    <input type="date" class="form-control" id="inputFromDate"
                                                           placeholder="From Date">
                                                    <label for="inputFromDate">From Date</label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="col-md-12">
                                                <div class="form-floating">
                                                    <input type="date" class="form-control" id="inputToDate"
                                                           placeholder="To Date">
                                                    <label for="inputToDate">To Date</label>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="submit" form="reportForm" class="btn btn-primary">Preview Report
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Basic Modal-->

                        <!-- Full Screen Modal -->
                        <div class="modal fade" id="fullscreenModal" tabindex="-1">
                            <div class="modal-dialog modal-fullscreen">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Flight Delay Data</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div style="overflow-x: scroll;" class="modal-body">
                                        <!-- Table with stripped rows -->
                                        <table class="table datatable table-striped">
                                            <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Date / Day</th>
                                                <th scope="col">Tail Number</th>
                                                <th scope="col">Airline IATA</th>
                                                <th scope="col">Source Airport</th>
                                                <th scope="col">Dest Airport</th>
                                                <th scope="col">Scheduled Departure</th>
                                                <th scope="col">Departure Time</th>
                                                <th scope="col">Departure Delay (mins)</th>
                                                <th scope="col">Taxi Out (mins)</th>
                                                <th scope="col">Wheels Off</th>
                                                <th scope="col">Scheduled Time (mins)</th>
                                                <th scope="col">Elapsed Time (mins)</th>
                                                <th scope="col">Air Time (mins)</th>
                                                <th scope="col">Distance (km)</th>
                                                <th scope="col">Wheels On</th>
                                                <th scope="col">Taxi In (mins)</th>
                                                <th scope="col">Scheduled Arrival</th>
                                                <th scope="col">Arrival Time</th>
                                                <th scope="col">Arrival Delay (mins)</th>
                                                <th scope="col">Diverted</th>
                                                <th scope="col">Cancelled</th>
                                                <th scope="col">Cancellation Reason</th>
                                                <th scope="col">Air System Delay</th>
                                                <th scope="col">Security Delay</th>
                                                <th scope="col">Airline Delay</th>
                                                <th scope="col">Late Aircraft Delay</th>
                                                <th scope="col">Weather Delay</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="flightDelay" items="${flightDelayList}">
                                                <tr>
                                                    <th scope="row">${flightDelay.flightId}</th>
                                                    <td>${flightDelay.year}-${flightDelay.month}-${flightDelay.day}
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 1}"
                                                              scope="page">
                                                            Mon
                                                        </c:if>
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 2}"
                                                              scope="page">
                                                            Tue
                                                        </c:if>
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 3}"
                                                              scope="page">
                                                            Wed
                                                        </c:if>
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 4}"
                                                              scope="page">
                                                            Thurs
                                                        </c:if>
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 5}"
                                                              scope="page">
                                                            Fri
                                                        </c:if>
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 6}"
                                                              scope="page">
                                                            Sat
                                                        </c:if>
                                                        <c:if var="flag" test="${flightDelay.dayOfWeek == 7}"
                                                              scope="page">
                                                            Sun
                                                        </c:if>
                                                    </td>
                                                    <td>${flightDelay.tailNumber}</td>
                                                    <td>${flightDelay.airlineIATA}</td>
                                                    <td>${flightDelay.sourceAirportIATA}</td>
                                                    <td>${flightDelay.destAirportIATA}</td>
                                                    <td>${flightDelay.scheduledDeparture}</td>
                                                    <td>${flightDelay.departureTime}</td>
                                                    <td>${flightDelay.departureDelay}</td>
                                                    <td>${flightDelay.taxiOut}</td>
                                                    <td>${flightDelay.wheelsOff}</td>
                                                    <td>${flightDelay.scheduledTime}</td>
                                                    <td>${flightDelay.elapsedTime}</td>
                                                    <td>${flightDelay.airTime}</td>
                                                    <td>${flightDelay.distance}</td>
                                                    <td>${flightDelay.wheelsOn}</td>
                                                    <td>${flightDelay.taxiIn}</td>
                                                    <td>${flightDelay.scheduledArrival}</td>
                                                    <td>${flightDelay.arrivalTime }</td>
                                                    <td>${flightDelay.arrivalDelay}</td>
                                                    <td>${flightDelay.diverted}</td>
                                                    <td>${flightDelay.cancelled}</td>
                                                    <td>${flightDelay.cancellationReason}</td>
                                                    <td>${flightDelay.airSysDelay}</td>
                                                    <td>${flightDelay.securityDelay}</td>
                                                    <td>${flightDelay.airlineDelay}</td>
                                                    <td>${flightDelay.lateAircraftDelay}</td>
                                                    <td>${flightDelay.weatherDelay}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <!-- End Table with stripped rows -->
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Full Screen Modal-->
                    </div>
                </div>

            </div>
        </div>

    </section>

    <section class="section">
        <div class="row">

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Line Chart</h5>

                        <!-- Line Chart -->
                        <canvas id="lineChart" style="max-height: 400px;"></canvas>
                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                new Chart(document.querySelector('#lineChart'), {
                                    type: 'line',
                                    data: {
                                        labels: ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'],
                                        datasets: [{
                                            label: 'Number of delay flights',
                                            data: [
                                                ${flightNumberCount[0]},
                                                ${flightNumberCount[1]},
                                                ${flightNumberCount[2]},
                                                ${flightNumberCount[3]},
                                                ${flightNumberCount[4]},
                                                ${flightNumberCount[5]},
                                                ${flightNumberCount[6]}
                                            ],
                                            fill: false,
                                            borderColor: 'rgb(75, 192, 192)',
                                            tension: 0.1
                                        }]
                                    },
                                    options: {
                                        scales: {
                                            y: {
                                                beginAtZero: true
                                            }
                                        }
                                    }
                                });
                            });
                        </script>
                        <!-- End Line CHart -->

                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Bar Chart</h5>
                        <!-- Bar Chart -->
                        <canvas id="barChart" style="max-height: 400px;"></canvas>
                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                new Chart(document.querySelector('#barChart'), {
                                    type: 'bar',
                                    data: {
                                        labels: ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'],
                                        datasets: [{
                                            label: 'Number of delay flights',
                                            data: [
                                                ${flightNumberCount[0]},
                                                ${flightNumberCount[1]},
                                                ${flightNumberCount[2]},
                                                ${flightNumberCount[3]},
                                                ${flightNumberCount[4]},
                                                ${flightNumberCount[5]},
                                                ${flightNumberCount[6]}
                                            ],
                                            backgroundColor: [
                                                'rgba(255, 99, 132, 0.2)',
                                                'rgba(255, 159, 64, 0.2)',
                                                'rgba(255, 205, 86, 0.2)',
                                                'rgba(75, 192, 192, 0.2)',
                                                'rgba(54, 162, 235, 0.2)',
                                                'rgba(153, 102, 255, 0.2)',
                                                'rgba(201, 203, 207, 0.2)'
                                            ],
                                            borderColor: [
                                                'rgb(255, 99, 132)',
                                                'rgb(255, 159, 64)',
                                                'rgb(255, 205, 86)',
                                                'rgb(75, 192, 192)',
                                                'rgb(54, 162, 235)',
                                                'rgb(153, 102, 255)',
                                                'rgb(201, 203, 207)'
                                            ],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        scales: {
                                            y: {
                                                beginAtZero: true
                                            }
                                        }
                                    }
                                });
                            });
                        </script>
                        <!-- End Bar CHart -->
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pie Chart</h5>

                        <!-- Pie Chart -->
                        <div id="pieChart" style="min-height: 400px;" class="echart"></div>
                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                echarts.init(document.querySelector("#pieChart")).setOption({
                                    title: {
                                        text: 'Cancellation Reason',
                                        left: 'center'
                                    },
                                    tooltip: {
                                        trigger: 'item'
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 'left'
                                    },
                                    series: [{
                                        name: 'Cancellation Reason',
                                        type: 'pie',
                                        radius: '50%',
                                        data: [{
                                            value: ${cancellationReasonCount[0]},
                                            name: 'Airline / Carrier'
                                        },
                                            {
                                                value: ${cancellationReasonCount[1]},
                                                name: 'Weather'
                                            },
                                            {
                                                value: ${cancellationReasonCount[2]},
                                                name: 'National Air System'
                                            },
                                            {
                                                value: ${cancellationReasonCount[3]},
                                                name: 'Security'
                                            }
                                        ],
                                        emphasis: {
                                            itemStyle: {
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            }
                                        }
                                    }]
                                });
                            });
                        </script>
                        <!-- End Pie Chart -->

                    </div>
                </div>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>Group One</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade NiceAdmin Template</a>
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
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>