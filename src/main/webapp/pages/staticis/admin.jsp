<%--
  Created by IntelliJ IDEA.
  User: mpb_yuqing_25
  Date: 2019/2/26
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审核统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/static.css">
</head>
<body >
<div class="layui-fluid">
    <div class="layui-row" style="padding: 15px">
        <div class="layui-col-md3 bgf shodow" >
            <div class="layui-row">
                <i class="fa fa-camera-retro fa-2x"></i>
            </div>
            <span></span>
            <div></div>
        </div>
        <div class="layui-col-md3">
            为审核次数：
        </div>
        <div class="layui-col-md3">
            测试数量：
        </div>
    </div>
    <div class="layui-row">
        <div class="col-md-6">
            <div id="assetChart" style="height: 480px">

            </div>
        </div>
        <div class="col-md-6">
            <div id="testChart" style="height: 480px">

            </div>
        </div>
    </div>
</div>
<scrtip>
    var ctx = "${pageContext.request.contextPath}/";
</scrtip>
</body>
</html>
