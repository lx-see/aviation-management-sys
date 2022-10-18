<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>View Airline - Group ONE</title>
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
    <link href="${pageContext.request.contextPath}/assets/vendor/layui-master/src/css/layui.css" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">


    <script type="text/html" id="indexTp1">
        {{d.LAY_TABLE_INDEX+1}}
    </script>
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
            <ul id="forms-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
                <li>
                    <a class="active" href="${pageContext.request.contextPath}/airline_view">
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
        <div class="layui-card-header"><h1>Airline List</h1></div>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                <li class="breadcrumb-item">Airline Module</li>
                <li class="breadcrumb-item active">Manage Airline</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <table class="layui-hide" id="main-table" lay-filter="main-table"></table>
    <script type="text/html" id="toolbarDemo">
        <span class="layui-inline" lay-event="add"><i class="layui-icon">&#xe654;</i></span>
        <span class="layui-inline" style="width:240px;">
			<input class="layui-input" name="param" id="param" placeholder="base on name find"/>
		</span>
        <span class="layui-btn layui-btn-sm layui-bg-red" lay-event="querySearch">
				<i class="layui-icon">&#xe615;</i>Search 
			</span>
    </script>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit"> Update </a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete"> Delete </a>
    </script>
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
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/vendor/layui-master/src/layui.js"></script>
<script>
    layui.use(['table', 'form'], function () {
        var $ = layui.$;
        var table = layui.table;

        //server side pagination
        table.render({
            elem: '#main-table',
            height: 475,
            url: '/airlineQueryPage',
            method: 'POST',
            page: true,
            id: 'table-load',
            toolbar: '#toolbarDemo',
            limits: [10, 15, 20],

            cols: [
                [
                    {field: 'airlineId', title: 'ID', template: '#indexTp1', width: 50, align: 'center'},
                    {field: 'name', title: "airlineName", align: 'center', width: 250},
                    {field: 'alias', title: "Alias", align: 'center', width: 50},
                    {field: 'iata', title: "IATA", align: 'center', width: 50},
                    {field: 'icao', title: "ICAO", align: 'center', width: 65},
                    {field: 'callSign', title: "callSign", align: 'center', width: 85},
                    {field: 'country', title: "country", align: 'center', width: 125},
                    {field: 'active', title: "airlineAlias", align: 'center', width: 50},
                    {title: "update/ delete", toolbar: '#barDemo', align: 'center', width: 160}
                ]

            ]
        });

        table.on('toolbar(main-table)', function (obj) {
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 2,
                        title: 'Adding Airline',
                        content: '/airline_update',
                        shade: [0.8, '#393d49'],
                        area: ['600px', '400px'],
                        btn: ['Comfirm', 'Cancel'],
                        yes: function (index, layero) {
                            var iframeWindow = window['layui-layer-iframe' + index];
                            var submit = layero.find('iframe').contents().find("#LAY-front-submit");

                            iframeWindow.layui.form.on('submit(LAY-front-submit)', function (data) {
                                var field = data.field;
                                $.ajax({
                                    url: '/airlineAdd1',
                                    data: field,
                                    async: false,
                                    cache: false,
                                    success: function (str) {
                                        if (str.code === 0) {
                                            table.reload('table-load');
                                        }
                                        layer.msg(str.msg, {icon: str.icon, anim: str.anim});

                                    }
                                });
                                layer.close(index);  //close button

                            });

                            submit.trigger('click');

                        },
                        success: function (layero, index) {

                        }
                    });
                    break;
                case 'querySearch':
                    var param = $('#param').val();
                    table.reload('table-load', {
                        where: {
                            param: param
                        }
                    });
                    $('#param').val(param);
                    break;
            }
        });

        table.on('tool(main-table)', function (obj) {
            var data = obj.data;
            switch (obj.event) {
                case 'edit':
                    layer.open({
                        type: 2,
                        title: 'Edditing Airline',
                        content: '/airlineQueryById?airlineId=' + data.airlineId,
                        shade: [0.8, '#393d49'],
                        area: ['600px', '500px'],
                        btn: ['confirm', 'cancel'],
                        yes: function (index, layero) {
                            var iframeWindow = window['layui-layer-iframe' + index];
                            var submit = layero.find('iframe').contents().find("#LAY-front-submit");

                            iframeWindow.layui.form.on('submit(LAY-front-submit)', function (data) {
                                var field = data.field;
                                $.ajax({
                                    url: '/airlineEdit',
                                    data: field,
                                    async: false,
                                    cache: false,
                                    success: function (str) {
                                        if (str.code === 0) {
                                            table.reload('table-load');
                                        }
                                        layer.msg(str.msg, {icon: str.icon, anim: str.anim});
                                    }
                                });
                                layer.close(index);


                            });
                            submit.trigger('click');


                        },

                        success: function (layero, index) {

                        }
                    });

                    break;
                case 'delete':
                    layer.confirm('Comfirm Delete?', function (index) {
                        $.ajax({
                            url: '/airlineDelById?airlineId=' + data.airlineId,
                            data: null,
                            async: false,
                            cache: false,
                            success: function (str) {
                                table.reload('table-load'); //refresh after deleted
                                layer.msg(str.msg, {icon: str.icon, anim: str.anim});

                            }
                        });
                    })
                    break;
            }

        });

    });

    //filtering
    //	function queryData(page, pageSize,active, orderBy){
    //		var query = {};
    //	query.page = page;
    //query.pageSize = pageSize == '' ? 2:pageSize;
    //query.active = active == undefined ? '':active;
    //query.orderBy = orderBy == undefined ?'':orderBy;
    //return query;

    //		}

</script>
</body>

</html>