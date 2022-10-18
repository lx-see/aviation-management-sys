<%@ page import="com.groupone.aviationsys.api.entity.Route"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Manage Route - Group ONE</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!--jquery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

<style type="text/css">
label {
	display: inline-block;
	margin-bottom: 5px;
}

.form-row {
	display: flex;
}

.form-group {
	width: 50%;
}

.form-right {
	margin-left: 20px;
}

.form-all input {
	width: 100%;
}
</style>
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
				<ul id="airport-forms-nav" class="nav-content collapse"
					data-bs-parent="#sidebar-nav">
					<li><a
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
				<ul id="route-forms-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a
						href="${pageContext.request.contextPath}/route_search/1"> <i
							class="bi bi-circle"></i><span>Search Route</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/route_add_form"> <i
							class="bi bi-circle"></i><span>Add New Route</span>
					</a></li>
					<li><a class="active"
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
			<h1>Show AND Manage Route Data</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index">Home</a></li>
					<li class="breadcrumb-item">Route Module</li>
					<li class="breadcrumb-item active">Show AND Manage Route Data</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title"
								style="font-size: 50px; margin-left: 20px; margin-top: 10px">Route
								Detail</h5>

							<!-- Table with stripped rows -->
							<table id="routeManageTable" style="font-size: 15px"
								class="table datatable table-striped">
								<thead>
									<tr>
										<th scope="col">Route <br>ID
										</th>
										<th scope="col">Source <br>Airport ID
										</th>
										<th scope="col">Source <br>Airport
										</th>
										<th scope="col">Destination <br>Airport ID
										</th>
										<th scope="col">Destination <br>Airport
										</th>
										<th scope="col">Codeshare</th>
										<th scope="col">Stops</th>
										<th scope="col">Equipments</th>
										<th scope="col">Airline <br>ID
										</th>
										<th scope="col">Airline <br>IATA_ICAO
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="route" items="${RouteList}">
										<tr>
											<td>${route.routeId}</td>
											<td>${route.sourceAirportId}</td>
											<td>${route. sourceairportiataIcao}</td>
											<td>${route.destAirportId}</td>
											<td>${route.destairportiataIcao}</td>
											<td>${route.codeshare}</td>
											<td>${route.stops}</td>
											<td>${route.equipment}</td>
											<td>${route.airlineId}</td>
											<td>${route.airlineiataIcao}</td>
											<td><i class="ri-delete-bin-5-line text-danger"
												data-bs-toggle="modal" data-bs-target="#confirmdelete"></i>
											</td>
											<td><i class=" ri-edit-box-line" data-bs-toggle="modal"
												data-bs-target="#updateroute"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li><a
										href="${pageContext.request.contextPath}/route_manage/1"
										class="page-link"> First </a></li>

									<li><c:if test="${pageNo != 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/route_manage/${pageNo-1}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>

											</a>
										</c:if></li>
									<table>
										<tr>
											<c:forEach begin="1" end="${totalPage}" var="i">
												<c:choose>
													<c:when test="${pageNo eq i}">
														<td
															style="border: 0.7px solid lightgray; padding-left: 15px; padding-right: 15px">${i}</td>
													</c:when>
													<c:otherwise>
														<c:if test="${i-pageNo<5}">
															<c:if test="${pageNo-i<5}">
																<td
																	style="border: 0.7px solid lightgray; padding-left: 15px; padding-right: 15px">
																	<a
																	href="${pageContext.request.contextPath}/route_manage/${i}">${i}</a>
																</td>
															</c:if>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tr>
									</table>


									<li><c:if test="${pageNo lt totalPage}">
											<a class="page-link"
												href="${pageContext.request.contextPath}/route_manage/${pageNo+1}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a>
										</c:if></li>


									<li><a
										href="${pageContext.request.contextPath}/route_manage/${totalPage}"
										class="page-link"> Last </a></li>

								</ul>
							</nav>
							<a href="${pageContext.request.contextPath}/route_add_form">
								<button id="addRouteData" type="button" class="btn btn-primary"
									data-bs-toggle="modal">Add New Route</button>
							</a>


							<!--Confirm Deletion-->
							<div class="modal fade" id="confirmdelete" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Confirm Delete Existing Route</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form action="${pageContext.request.contextPath}/route_delete">
											<div class="modal-body">
												<div class="alert alert-danger alert-dismissible fade show"
													role="alert">
													<h5>
														<i class="bi bi-patch-exclamation"></i> Please key in the
														Route ID!
													</h5>
													<input type="number" placeholder="Example: 1234"
														class="form-control" name="routeId" required>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Cancel</button>
												<input type="submit" class="btn btn-primary" value="Delete">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!--End Confirm Deletion-->

						<!--Edit Route Details-->
						<div class="modal fade" id="updateroute" tabindex="-1">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Update Existing Route Details</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="${pageContext.request.contextPath}/route_update">
										<div style="font-size: 15px" class="modal-body">
											<!-- General Form Elements -->
											<div class="form-all">
												<!-- Route ID -->
												<div class="row mb-3">
													<label for="rId">Route Id:</label> <input type="number"
														id="rId" placeholder="Example: 12" class="form-control"
														name="routeId" required>

												</div>
												<!-- Source AirportID -->
												<div class="form-row">
													<div class="row mb-3  form-group">
														<label for="saId">Source Airport Id:</label> <input
															id="saId" type="text" placeholder="Example: 6156"
															pattern="[0-9]*" maxlength="5" class="form-control"
															name="sourceAirportId" required>
													</div>

													<!-- Source Airport -->
													<div class="row mb-3 form-group form-right">
														<label for="saIATA/ICAO">Source Airport IATA/ICAO:</label>
														<input type="text" id="saIATA/ICAO"
															oninput="this.value = this.value.toUpperCase()"
															maxlength="4" pattern="[a-zA-Z]*"
															placeholder="Example: EGO" class="form-control"
															name="sourceairportiataIcao" required>
													</div>
												</div>
												<!-- Destination AirportID -->
												<div class="form-row">
													<div class="row mb-3 form-group">
														<label for="daId">Destination Airport Id:</label> <input
															id="daId" type="text" placeholder="Example: 2922"
															pattern="[0-9]*" maxlength="5" class="form-control"
															name="destAirportId" required>

													</div>

													<!-- Destination Airport -->
													<div class="row mb-3 form-group form-right">
														<label for="daIATA/ICAO">Destination Airport
															IATA/ICAO:</label> <input type="text" id="daIATA/ICAO"
															oninput="this.value = this.value.toUpperCase()"
															maxlength="4" pattern="[a-zA-Z]*"
															placeholder="Example: GYD" class="form-control"
															name="destairportiataIcao" required>
													</div>
												</div>

												<!-- Codeshare -->
												<div class="form-row">
													<div class="row mb-3 form-group">
														<label for="codeshare">Codeshare:</label> <select
															id="codeshare" name="codeshare" class="form-control">
															<option value="">null</option>
															<option value="Y">Y</option>
														</select>

													</div>

													<!-- Stops -->
													<div class="row mb-3 form-group form-right">
														<label for="stops">Stops:</label> <select id="stops"
															name="stops" class="form-control">
															<option value="0">0</option>
															<option value="1">1</option>
															<option value="2">2</option>
														</select>
													</div>
												</div>
												<!-- Equipments -->
												<div class="row mb-3">
													<label for="eq">Equipments:</label> <input type="text"
														id="eq" oninput="this.value = this.value.toUpperCase()"
														maxlength="4" placeholder="Example: CR2"
														class="form-control" name="equipment" required>

												</div>

												<!-- AirlineID -->
												<div class="form-row">
													<div class="row mb-3 form-group">
														<label for="alId">Airline Id:</label> <input type="text"
															id="alId" pattern="[0-9]*" placeholder="Example: 410"
															maxlength="6" class="form-control" name="airlineId"
															required>

													</div>

													<!-- Airline IATA_ICAO -->
													<div class="row mb-3 form-group form-right">
														<label for="alIATA/ICAO">Airline IATA/ICAO:</label> <input
															id="alIATA/ICAO" type="text"
															oninput="this.value = this.value.toUpperCase()"
															placeholder="Example: 2B" maxlength="4"
															class="form-control" name="airlineiataIcao" required>

													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-outline-secondary"
													data-bs-dismiss="modal">Cancel</button>
												<input type="reset" class="btn btn-secondary" value="Clear">
												<input type="submit" value="Submit" class="btn btn-primary">

											</div>

										</div>
									</form>
									<!-- End General Form Elements -->
								</div>
							</div>
							<!--End Edit Route Details-->

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