<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Manage Flight Delay - Group ONE</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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

<style>
  .deleteFlightDelay:hover{
    color: blue;
  }

  .editFlightDelay:hover{
    color: blue;
  }
</style>

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
          <a href="${pageContext.request.contextPath}/flightdelay_show/page/1/10/sort/flightId/0">
            <i class="bi bi-circle"></i><span>Show Data</span>
          </a>
        </li>
        <li>
          <a class="active" href="${pageContext.request.contextPath}/flightdelay_manage/page/1/10/sort/flightId/0">
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
      <h1>Manage Data Tables</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index">Home</a></li>
          <li class="breadcrumb-item">Flight Delay Module</li>
          <li class="breadcrumb-item active">Manage Data</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Flight Delay Data</h5>

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
                  <td>
                    <i data-flight-id="${flightDelay.flightId}" class="deleteFlightDelay ri-delete-bin-5-line" data-bs-toggle="modal" data-bs-target="#basicModal"></i>
                  </td>
                  <td>
                    <i data-flight-id="${flightDelay.flightId}" class="editFlightDelay ri-edit-box-line" data-bs-toggle="modal" data-bs-target="#EditRecordModel"></i>
                  </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              <!-- End Table with stripped rows -->

              <!-- Centered Pagination -->
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                  <li>
                    <a href="${pageContext.request.contextPath}/flightdelay_manage/page/1/${pageSize}/sort/${sortCol}/${ascDesc}" class="page-link">
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
                     href="${pageContext.request.contextPath}/flightdelay_manage/page/${pageNumList[0]-1}/${pageSize}/sort/${sortCol}/${ascDesc}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                  </li>
                  <c:forEach var="page" items="${pageNumList}">
                    <c:if test="${page == pageNum}">
                      <li class="page-item active"><a class="page-link" data-pageNo="${page}" href="#">${page}</a></li>
                    </c:if>
                    <c:if test="${page != pageNum}">
                      <li class="page-item"><a class="page-link" data-pageNo="${page}" href="${pageContext.request.contextPath}/flightdelay_manage/page/${page}/${pageSize}/sort/${sortCol}/${ascDesc}">${page}</a></li>
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
                     href="${pageContext.request.contextPath}/flightdelay_manage/page/${pageNumList[0]+10}/${pageSize}/sort/${sortCol}/${ascDesc}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                  </li>
                  <li>
                    <a href="${pageContext.request.contextPath}/flightdelay_manage/page/${lastPageNum}/${pageSize}/sort/${sortCol}/${ascDesc}" class="page-link">
                      Last
                    </a>
                  </li>
                </ul>
              </nav>
              <!-- End Centered Pagination -->

              <!-- Sorting, Page Resize -->
              <div class="row">
                <div style="margin-bottom: 10px;">
                  <button id="btnAddFlightDelayRecord" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ExtralargeModal">Add Record</button>
                  <button id="btnSaveFlightDelayRecord" type="button" class="btn btn-primary">Save Changes</button>
                </div>
                <div class="col-md-3">
                  <div class="form-floating mb-3">
                    <input type="number" value="10" min="10" max="500" maxlength="3" class="form-control" id="inputPageSize2" placeholder="Page Size">
                    <label for="inputPageSize2">Page Size</label>
                  </div>
                  <button id="btnResizePage2" type="button" class="btn btn-primary">Resize</button>
                </div>
                <div class="col-md-4 offset-1">
                  <input id="currentPageNum" type="hidden" value="${pageNum}"/>
                  <div class="form-floating mb-3">
                    <select class="form-select" id="selectSortCol" aria-label="Floating label select example">
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
                    <select class="form-select" id="selectAscDesc" aria-label="Floating label select example">
                      <option value="0" selected>Ascending</option>
                      <option value="1">Descending</option>
                    </select>
                    <label for="selectAscDesc">Ascending / Descending</label>
                  </div>
                  <button id="sortByCol2" type="button" class="btn btn-primary">
                    Sort
                  </button>
                </div>
              </div>
              <!-- End Sorting, Page Resize -->

              <!-- Form insert record -->
              <div class="modal fade" id="ExtralargeModal" tabindex="-1">
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Add Record</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <!-- General Form Elements -->
                      <form id="formAddRecord" method="post">
                        <div class="row mb-3">

                          <!-- Date / Day -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required id="inputDateDay" type="date" class="form-control" placeholder="Date / Day">
                                <label for="inputDateDay">Date / Day</label>
                              </div>
                            </div>
                          </div>

                          <!-- Tail Number -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="6" maxlength="6" id="inputTailNum" type="text" class="form-control" placeholder="Tail Number (E.g. N11191)">
                                <label for="inputTailNum">Tail Number (E.g. N11191)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">

                          <!-- Source Airport IATA-->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="3" maxlength="3" pattern="^[a-zA-Z]+$" id="inputSrcAirport" type="text" class="form-control" placeholder="Source Airport (E.g. LGA)">
                                <label for="inputSrcAirport">Source Airport (E.g. LGA)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Destination Airport IATA -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="3" maxlength="3" pattern="^[a-zA-Z]+$" id="inputDestAirport" type="text" class="form-control" placeholder="Destination Airport (E.g. LGA)">
                                <label for="inputDestAirport">Destination Airport (E.g. LGA)</label>
                              </div>
                            </div>
                          </div>
                        </div>                        

                        <div class="row mb-3">
                          <!-- Scheduled Departure -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required id="inputScheduledDeparture" type="time" class="form-control" placeholder="Scheduled Departure">
                                <label for="inputScheduledDeparture">Scheduled Departure</label>
                              </div>
                            </div>
                          </div>

                          <!-- Wheels Off -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputWheelsOff" type="time" class="form-control" placeholder="Wheels Off">
                                <label for="inputWheelsOff">Wheels Off</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Departure Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputDepartureDelay" type="number" class="form-control" placeholder="Departure Delay (mins)">
                                <label for="inputDepartureDelay">Departure Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Taxi Out (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputTaxiOut" type="number" class="form-control" placeholder="Taxi Out (mins)">
                                <label for="inputTaxiOut">Taxi Out (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Scheduled Time (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input min="0" required id="inputScheduledTime" type="number" class="form-control" placeholder="Scheduled Time (mins)">
                                <label for="inputScheduledTime">Scheduled Time (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Air Time (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputAirTime" type="number" class="form-control" placeholder="Air Time (mins)">
                                <label for="inputAirTime">Air Time (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Distance (km) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required min="0" id="inputDistance" type="number" class="form-control" placeholder="Distance (km)">
                                <label for="inputDistance">Distance (km)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Taxi In (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputTaxiIn" type="number" class="form-control" placeholder="Taxi In (mins)">
                                <label for="inputTaxiIn">Taxi In (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Scheduled Arrival -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required id="inputScheduledArrival" type="time" class="form-control" placeholder="Scheduled Arrival">
                                <label for="inputScheduledArrival">Scheduled Arrival</label>
                              </div>
                            </div>
                          </div>

                          <!-- Wheels On -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputWheelsOn" type="time" class="form-control" placeholder="Wheels On">
                                <label for="inputWheelsOn">Wheels On</label>
                              </div>
                            </div>
                          </div>
                        </div>    

                        <div class="row mb-3">
                          <label for="flightStatus" class="form-label">Flight Status</label>
                          <!-- Diverted -->
                          <div id="flightStatus" class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="checkDiverted">
                              <label class="form-check-label" for="checkDiverted">
                                Diverted
                              </label>
                            </div>
                          </div>

                          <!-- Cancelled -->
                          <div class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="checkCancelled">
                              <label class="form-check-label" for="checkCancelled">
                                Cancelled
                              </label>
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="cancellationReason" class="form-label">Cancellation Reason</label>
                          <!-- Cancellation Reason -->
                          <div id="cancellationReason" class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='A' id="checkCancellationReason1">
                              <label class="form-check-label" for="checkCancellationReason1">
                                Airline / Carrier
                              </label>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='B' id="checkCancellationReason2">
                                <label class="form-check-label" for="checkCancellationReason2">
                                  Weather
                                </label>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='C' id="checkCancellationReason3">
                                <label class="form-check-label" for="checkCancellationReason3">
                                  National Air Sys
                                </label>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='D' id="checkCancellationReason4">
                              <label class="form-check-label" for="checkCancellationReason4">
                                Security
                              </label>
                            </div>
                          </div>
                        </div>
                        
                        <div class="row mb-3">
                          <!-- Airline IATA code -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="2" maxlength="2" id="inputAirlineIATA" type="text" class="form-control" placeholder="Airline IATA">
                                <label for="inputAirlineIATA">Airline IATA</label>
                              </div>
                            </div>
                          </div>

                          <!-- Air System Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputAirSysDelay" type="number" class="form-control" placeholder="Air System Delay (mins)">
                                <label for="inputAirSysDelay">Air System Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Security Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputSecurityDelay" type="number" class="form-control" placeholder="Security Delay (mins)">
                                <label for="inputSecurityDelay">Security Delay (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Airline Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputAirlineDelay" type="number" class="form-control" placeholder="Airline Delay (mins)">
                                <label for="inputAirlineDelay">Airline Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Late Aircraft Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputLateAircraftDelay" type="number" class="form-control" placeholder="Late Aircraft Delay (mins)">
                                <label for="inputLateAircraftDelay">Late Aircraft Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Weather Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputWeatherDelay" type="number" class="form-control" placeholder="Weather Delay (mins)">
                                <label for="inputWeatherDelay">Weather Delay (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>
                      </form><!-- End General Form Elements -->
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button id="btnAddRecord" type="submit" form="formAddRecord" class="btn btn-primary">Add Record</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Extra Large Modal-->

              <!-- Form update record -->
              <div class="modal fade" id="EditRecordModel" tabindex="-1">
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Edit Record</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <!-- General Form Elements -->
                      <form id="formEditRecord" method="post">
                        <div class="row mb-3">

                          <!-- Date / Day -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required id="inputNewDateDay" type="date" class="form-control" placeholder="Date / Day">
                                <label for="inputNewDateDay">Date / Day</label>
                              </div>
                            </div>
                          </div>

                          <!-- Tail Number -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="6" maxlength="6" id="inputNewTailNum" type="text" class="form-control" placeholder="Tail Number">
                                <label for="inputNewTailNum">Tail Number</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">

                          <!-- Source Airport IATA-->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="3" maxlength="3" pattern="^[a-zA-Z]+$" id="inputNewSrcAirport" type="text" class="form-control" placeholder="Source Airport">
                                <label for="inputNewSrcAirport">Source Airport</label>
                              </div>
                            </div>
                          </div>

                          <!-- Destination Airport IATA -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required minlength="3" maxlength="3" pattern="^[a-zA-Z]+$" id="inputNewDestAirport" type="text" class="form-control" placeholder="Destination Airport">
                                <label for="inputNewDestAirport">Destination Airport</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Scheduled Departure -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required id="inputNewScheduledDeparture" type="time" class="form-control" placeholder="Scheduled Departure">
                                <label for="inputNewScheduledDeparture">Scheduled Departure</label>
                              </div>
                            </div>
                          </div>

                          <!-- Wheels Off -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewWheelsOff" type="time" class="form-control" placeholder="Wheels Off">
                                <label for="inputNewWheelsOff">Wheels Off</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Departure Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewDepartureDelay" type="number" class="form-control" placeholder="Departure Delay (mins)">
                                <label for="inputNewDepartureDelay">Departure Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Taxi Out (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewTaxiOut" type="number" class="form-control" placeholder="Taxi Out (mins)">
                                <label for="inputNewTaxiOut">Taxi Out (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Scheduled Time (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required min="0" id="inputNewScheduledTime" type="number" class="form-control" placeholder="Scheduled Time (mins)">
                                <label for="inputNewScheduledTime">Scheduled Time (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Air Time (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewAirTime" type="number" class="form-control" placeholder="Air Time (mins)">
                                <label for="inputNewAirTime">Air Time (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Distance (km) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required min="0" id="inputNewDistance" type="number" class="form-control" placeholder="Distance (km)">
                                <label for="inputNewDistance">Distance (km)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Taxi In (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewTaxiIn" type="number" class="form-control" placeholder="Taxi In (mins)">
                                <label for="inputNewTaxiIn">Taxi In (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Scheduled Arrival -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input required id="inputNewScheduledArrival" type="time" class="form-control" placeholder="Scheduled Arrival">
                                <label for="inputNewScheduledArrival">Scheduled Arrival</label>
                              </div>
                            </div>
                          </div>

                          <!-- Wheels On -->
                          <div class="col-md-6">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewWheelsOn" type="time" class="form-control" placeholder="Wheels On">
                                <label for="inputNewWheelsOn">Wheels On</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <label for="flightStatus2" class="form-label">Flight Status</label>
                          <!-- Diverted -->
                          <div id="flightStatus2" class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="checkNewDiverted">
                              <label class="form-check-label" for="checkNewDiverted">
                                Diverted
                              </label>
                            </div>
                          </div>

                          <!-- Cancelled -->
                          <div class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="checkNewCancelled">
                              <label class="form-check-label" for="checkNewCancelled">
                                Cancelled
                              </label>
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label for="cancellationReason2" class="form-label">Cancellation Reason</label>
                          <!-- Cancellation Reason -->
                          <div id="cancellationReason2" class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='A' id="checkNewCancellationReason1">
                              <label class="form-check-label" for="checkNewCancellationReason1">
                                Airline / Carrier
                              </label>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='B' id="checkNewCancellationReason2">
                              <label class="form-check-label" for="checkNewCancellationReason2">
                                Weather
                              </label>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='C' id="checkNewCancellationReason3">
                              <label class="form-check-label" for="checkNewCancellationReason3">
                                National Air Sys
                              </label>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="cancellationReasonRadios" value='D' id="checkNewCancellationReason4">
                              <label class="form-check-label" for="checkNewCancellationReason4">
                                Security
                              </label>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Airline IATA code -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input maxlength="2" id="inputNewAirlineIATA" type="text" class="form-control" placeholder="Airline IATA">
                                <label for="inputNewAirlineIATA">Airline IATA</label>
                              </div>
                            </div>
                          </div>

                          <!-- Air System Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewAirSysDelay" type="number" class="form-control" placeholder="Air System Delay (mins)">
                                <label for="inputNewAirSysDelay">Air System Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Security Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewSecurityDelay" type="number" class="form-control" placeholder="Security Delay (mins)">
                                <label for="inputNewSecurityDelay">Security Delay (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="row mb-3">
                          <!-- Airline Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewAirlineDelay" type="number" class="form-control" placeholder="Airline Delay (mins)">
                                <label for="inputNewAirlineDelay">Airline Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Late Aircraft Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewLateAircraftDelay" type="number" class="form-control" placeholder="Late Aircraft Delay (mins)">
                                <label for="inputNewLateAircraftDelay">Late Aircraft Delay (mins)</label>
                              </div>
                            </div>
                          </div>

                          <!-- Weather Delay (mins) -->
                          <div class="col-md-4">
                            <div class="col-md-12">
                              <div class="form-floating">
                                <input id="inputNewWeatherDelay" type="number" class="form-control" placeholder="Weather Delay (mins)">
                                <label for="inputNewWeatherDelay">Weather Delay (mins)</label>
                              </div>
                            </div>
                          </div>
                        </div>
                      </form><!-- End General Form Elements -->
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button id="btnEditRecord" type="submit" form="formEditRecord" class="btn btn-primary">Edit Record</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Extra Large Modal-->

              <!-- Basic Modal -->
              <div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Confirmation Delete</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-octagon me-1"></i>
                          Comfirm delete this record?
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                      <button id="btnConfirmDelete" type="button" class="btn btn-primary" data-bs-dismiss="modal">Confirm Delete</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End Basic Modal-->

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

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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