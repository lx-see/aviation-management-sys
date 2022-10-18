<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Manage Airport - Group One</title>
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
					<li><a
						href="${pageContext.request.contextPath}/airport_search"> <i
							class="bi bi-circle"></i><span>Search Airport</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/airport_show/page/1">
							<i class="bi bi-circle"></i><span>Show Airport</span>
					</a></li>
					<li><a class="active"
						href="${pageContext.request.contextPath}/airport_manage/page/1">
							<i class="bi bi-circle"></i><span>Manage Airport</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/airport_login">
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
			<h1>Manage Airport</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index">Home</a></li>
					<li class="breadcrumb-item">Airport Module</li>
					<li class="breadcrumb-item active">Manage Airport</li>
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

							<!-- Table with stripped rows -->
							<table class="table datatable table-striped">
								<thead>
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Airport Name</th>
										<th scope="col">City</th>
										<th scope="col">Country</th>
										<th scope="col">IATA</th>
										<th scope="col">ICAO</th>
										<th scope="col">TimeZone</th>
										<th scope="col">DST</th>
										<th scope="col">Tz_Database</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="airport" items="${airportList}">
										<tr>
											<th scope="row">${airport.airportId}</th>
											<td>${airport.name}</td>
											<td>${airport.city}</td>
											<td>${airport.country}</td>
											<td>${airport.iata}</td>
											<td>${airport.icao}</td>
											<td>${airport.timezone}</td>
											<td>${airport.dst}</td>
											<td>${airport.timezoneTz}</td>
											<td><i class=" ri-edit-box-line" data-bs-toggle="modal"
												data-bs-target="#editAirport"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->

							<p>
								<b>Total pages: ${lastPage}</b>
							</p>
							
							<!-- Centered Pagination -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">

									<c:if test="${pageNo != 1}">
										<li class="page-item"><a class="page-link"
											href="${pageNo - 1}" tabindex="-1">Previous</a></li>
									</c:if>

									<table cellpadding="5" cellspacing="5">
										<tr>
											<c:forEach begin="1" end="${lastPage}" var="i">
												<c:choose>
													<c:when test="${pageNo eq i}">
														<td>${i}</td>
													</c:when>
													<c:otherwise>
														<c:if test="${i - pageNo < 5}">
															<c:if test="${pageNo - i < 5}">
																<td><a href="${i}">${i}</a></td>
															</c:if>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tr>
									</table>

									<c:if test="${pageNo lt lastPage}">
										<li class="page-item"><a class="page-link"
											href="${pageNo + 1}">Next</a></li>
									</c:if>

									<li class="page-item"><a class="page-link" href="${1}">First</a></li>

									<li class="page-item"><a class="page-link" href="${lastPage}">Last</a></li>

								</ul>
							</nav>
							<!-- End Centered Pagination -->

							<a
								href="${pageContext.request.contextPath}/airport_addAirportForm">
								<button id="addAirportRecord" type="button"
									class="btn btn-primary" data-bs-toggle="modal">Add
									Airport</button>
							</a>

							<button id="btnDeleteAirport" type="button"
								class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#deleteAirport">Delete Airport</button>

							<div class="modal fade" id="editAirport" tabindex="-1">
								<div class="modal-dialog modal-xl">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Airport Information</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<!-- General Form Elements -->
											<form
												action="${pageContext.request.contextPath}/airport_updateAirport">
												<!-- Airport ID -->
												<div class="row mb-3">
													<label for="inputAirportId" class="col-sm-2 col-form-label">Airport
														ID</label>
													<div class="col-sm-10">
														<input id="inputAirportId" type="number" name="airportId"
															class="form-control" required>
													</div>
												</div>

												<!-- Airport Name -->
												<div class="row mb-3">
													<label for="inputAirportName"
														class="col-sm-2 col-form-label">Airport Name</label>
													<div class="col-sm-10">
														<input id="inputAirportName" type="text" name="name"
															class="form-control" required>
													</div>
												</div>

												<!-- City -->
												<div class="row mb-3">
													<label for="inputAirportCity"
														class="col-sm-2 col-form-label">City</label>
													<div class="col-sm-10">
														<input id="inputAirportCity" type="text" name="city"
															class="form-control" required>
													</div>
												</div>

												<!-- Country -->
												<div class="row mb-3">
													<label for="inputAirportCountry"
														class="col-sm-2 col-form-label">Country</label>
													<div class="col-sm-10">
														<input id="inputAirportCountry" type="text" name="country"
															class="form-control" required>
													</div>
												</div>

												<!-- IATA_FAA -->
												<div class="row mb-3">
													<label for="inputAirportIATA"
														class="col-sm-2 col-form-label">IATA</label>
													<div class="col-sm-10">
														<input id="inputAirportIATA" type="text" name="iata"
															class="form-control" minlength="3">
													</div>
												</div>

												<!-- ICAO -->
												<div class="row mb-3">
													<label for="inputAirportICAO"
														class="col-sm-2 col-form-label">ICAO</label>
													<div class="col-sm-10">
														<input id="inputAirportICAO" type="text" name="icao"
															class="form-control">
													</div>
												</div>

												<!-- Latitude -->
												<div class="row mb-3">
													<label for="inputAirportLatitude"
														class="col-sm-2 col-form-label">Latitude</label>
													<div class="col-sm-10">
														<input id="inputAirportLatitude" type="number" step="any"
															name="latitude" class="form-control" required>
													</div>
												</div>

												<!-- Longitude -->
												<div class="row mb-3">
													<label for="inputAirportLongitude"
														class="col-sm-2 col-form-label">Longitude</label>
													<div class="col-sm-10">
														<input id="inputAirportLongitude" type="number" step="any"
															name="longitude" class="form-control" required>
													</div>
												</div>

												<!-- Altitude -->
												<div class="row mb-3">
													<label for="inputAirportAltitude"
														class="col-sm-2 col-form-label">Altitude</label>
													<div class="col-sm-10">
														<input id="inputAirportAltitude" type="number"
															name="altitude" min="0" class="form-control" required>
													</div>
												</div>

												<!-- TimeZone -->
												<div class="row mb-3">
													<label for="inputAirportTimeZone"
														class="col-sm-2 col-form-label">TimeZone</label>
													<div class="col-sm-10">
														<input id="inputAirportTimeZone" type="number" step="0.0"
															name="timezone" min="-12" max="14" class="form-control"
															required>
													</div>
												</div>

												<!-- DST -->
												<div class="row mb-3">
													<label for="inputAirportDST"
														class="col-sm-2 col-form-label">DST</label>
													<div class="col-sm-10">
														<input id="inputAirportDST" type="text" name="dst"
															class="form-control" maxlength="1" pattern="[A-Z]"
															required>
													</div>
												</div>

												<!-- Tz_Database -->
												<div class="row mb-3">
													<label for="inputAirportTzDb"
														class="col-sm-2 col-form-label">Tz_Database</label>
													<div class="col-sm-10">
														<input id="inputAirportTzDb" type="text" name="timezoneTz"
															class="form-control" required>
													</div>
												</div>

												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-primary">Save</button>
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- End editAirport-->

							<div class="modal fade" id="deleteAirport" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Delete Airport</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="alert alert-danger alert-dismissible fade show"
												role="alert">
												<i class="bi bi-exclamation-octagon me-1"></i> Confirm
												delete airport?
											</div>

											<form
												action="${pageContext.request.contextPath}/airport_deleteAirport">
												<div class="row mb-3">
													<div class="col-sm-10">
														<input type="number" name="airportId" class="form-control"
															placeholder="Please enter the Airport ID" required>
													</div>
												</div>

												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Cancel</button>
													<button type="submit" class="btn btn-primary">Confirm
														Delete</button>
												</div>
											</form>

										</div>
									</div>
								</div>
							</div>
							<!-- End deleteAirport-->

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