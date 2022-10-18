<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>Update Airline - Group ONE</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body" style="padding:15px;">
            <form class="layui-form layui-form-pane" action="">
                <input type="hidden" name="airlineId" value="${obj.airlineId} ">
                <div class="layui-form-item">
                    <label class="layui-form-label">Airline Name</label>
                    <input type="text" name="name" lay-verify="required" value="${obj.name}"
                           placeholder="Pls key in the Airline Name" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div class="layui-form-item">
                    <label class="layui-form-label">alias</label>
                    <input type="text" name="alias" lay-verify="alias" value="${obj.alias}"
                           placeholder="Pls key in the alias" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div class="layui-form-item">
                    <label class="layui-form-label">IATA</label>
                    <input type="text" name="iata" lay-verify="iata" value="${obj.iata}"
                           placeholder="Pls key in the IATA" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div class="layui-form-item">
                    <label class="layui-form-label">ICAO</label>
                    <input type="text" name="icao" lay-verify="required" value="${obj.icao}"
                           placeholder="Pls key in the ICAO" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div class="layui-form-item">
                    <label class="layui-form-label">callSign</label>
                    <input type="text" name="callSign" lay-verify="callSign" value="${obj.callSign}"
                           placeholder="Pls key in the CallSign" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div class="layui-form-item">
                    <label class="layui-form-label">Country</label>
                    <input type="text" name="country" lay-verify="required" value="${obj.country}"
                           placeholder="Pls key in the country" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div class="layui-form-item">
                    <label class="layui-form-label">Active</label>
                    <input type="text" name="active" lay-verify="required" value="${obj.active}"
                           placeholder="Pls key in the status" autocomplete="off" class="layui-input">
                </div>
                </br>
                <div>
                    <input type="hidden" lay-submit lay-filter="LAY-front-submit" id="LAY-front-submit" value="comfirm">

                </div>

            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/vendor/layui-master/src/layui.js"></script>
<script>
    layui.use(['form'], function () {
        var $ = layui.$;


    });
</script>


</body>
</html>