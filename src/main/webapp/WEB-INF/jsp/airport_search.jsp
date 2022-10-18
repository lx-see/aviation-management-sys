<%@ page import="com.groupone.aviationsys.api.entity.Airport"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Search Airport - Group One</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">

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
			<a href="${pageContext.request.contextPath}/index"
				class="logo d-flex align-items-center"> <img
				src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
				<span class="d-none d-lg-block">Group One</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/index"> <i
					class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- Airline Module -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="ri-flight-takeoff-fill"></i><span>Airline Module</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse"
					data-bs-parent="#sidebar-nav">
					<li><a href="${pageContext.request.contextPath}/airline_view">
							<i class="bi bi-circle"></i><span>Show & Manage Data</span>
					</a></li>
				</ul></li>
			<!-- End Airline Module -->

			<!-- Airport Module -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#airport-forms-nav" data-bs-toggle="collapse"
				href="#"> <i class="ri-plane-fill"></i><span>Airport
						Module</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="airport-forms-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a class="active"
						href="${pageContext.request.contextPath}/airport_search"> <i
							class="bi bi-circle"></i><span>Search Airport</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/airport_show/page/1">
							<i class="bi bi-circle"></i><span>Show Airport</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/airport_manage/page/1">
							<i class="bi bi-circle"></i><span>Manage Airport</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/airport_login">
							<i class="bi bi-circle"></i><span>Verify Airport Entry</span>
					</a></li>
				</ul></li>
			<!-- End Airport Module -->

			<!-- Route Module -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#route-forms-nav" data-bs-toggle="collapse" href="#">
					<i class="ri-flight-takeoff-fill"></i><span>Route Module</span><i
					class="bi bi-chevron-down ms-auto"> </i>
			</a>
				<ul id="route-forms-nav" class="nav-content collapse"
					data-bs-parent="#sidebar-nav">
					<li><a
						href="${pageContext.request.contextPath}/route_search/1"> <i
							class="bi bi-circle"></i><span>Search Route</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/route_add_form"> <i
							class="bi bi-circle"></i><span>Add New Route</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/route_manage/1"> <i
							class="bi bi-circle"></i><span>Manage Route</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/route_chat">
							<i class="bi bi-circle"></i><span>Chat System</span>
					</a></li>
				</ul></li>
			<!-- End Route Module -->

			<!-- Flightdelay Module -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#flightdelay-forms-nav" data-bs-toggle="collapse"
				href="#"> <i class="ri-flight-takeoff-fill"></i><span>Flight
						Delay Module</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="flightdelay-forms-nav" class="nav-content collapse"
					data-bs-parent="#sidebar-nav">
					<li><input id="PageContent" type="hidden"
						value="${pageContext.request.contextPath}" /> <a
						href="${pageContext.request.contextPath}/flightdelay_show/page/1/10/sort/flightId/0">
							<i class="bi bi-circle"></i><span>Show Data</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/flightdelay_manage/page/1/10/sort/flightId/0">
							<i class="bi bi-circle"></i><span>Manage Data</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/flightdelay_search">
							<i class="bi bi-circle"></i><span>Advanced Search</span>
					</a></li>
				</ul></li>
			<!-- End Flightdelay Module -->

		</ul>
	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Search Airport</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index">Home</a></li>
					<li class="breadcrumb-item">Airport Module</li>
					<li class="breadcrumb-item">Search Airport</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Airport Information</h5>

							<form action="airport_searchAirport">
								<div class="row mb-3">
									<label for="inputAirportId" class="col-sm-2 col-form-label">Airport
										ID</label>
									<div class="col-sm-10">
										<input id="inputAirportId" type="number" name="airportId"
											class="form-control" required>
									</div>
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">Search</button>
								</div>

							</form>
							<!-- End General Form Elements -->

							<!-- Table with stripped rows -->
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Airport Name</th>
										<th scope="col">City</th>
										<th scope="col">Country</th>
										<th scope="col">IATA_FAA</th>
										<th scope="col">ICAO</th>
										<th scope="col">Latitude</th>
										<th scope="col">Longitude</th>
										<th scope="col">Altitude</th>
										<th scope="col">TimeZone</th>
										<th scope="col">DST</th>
										<th scope="col">Tz_Database</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:if test="${not empty selectedAirport.airportId}">
											<th scope="row">${selectedAirport.airportId}</th>
											<td>${selectedAirport.name}</td>
											<td>${selectedAirport.city}</td>
											<td>${selectedAirport.country}</td>
											<td>${selectedAirport.iata}</td>
											<td>${selectedAirport.icao}</td>
											<td>${selectedAirport.latitude}</td>
											<td>${selectedAirport.longitude}</td>
											<td>${selectedAirport.altitude}</td>
											<td>${selectedAirport.timezone}</td>
											<td>${selectedAirport.dst}</td>
											<td>${selectedAirport.timezoneTz}</td>
										</c:if>
										<c:if test="${empty selectedAirport.airportId}">
											<td colspan="12">
												<center>No record found</center>
											</td>
										</c:if>
									</tr>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->

						</div>

					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>Group One</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade
				NiceAdmin Template</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/quill/quill.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/chart.js/chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/echarts/echarts.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>