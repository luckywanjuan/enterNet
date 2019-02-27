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
    <title>申请统计</title>
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
        <div class="layui-col-md2 bgf shodow" >
            <div class="layui-row">
                <i class="layui-col-md6 fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="awaitUser"></div>
            </div>
            <div class="title_sta cgrey">未审核数</div>
        </div>
        <div class="layui-col-md2  bgf shodow">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="accessUser"></div>
            </div>
            <div class="title_sta cgrey">已通过数：</div>
        </div>
        <div class="layui-col-md2  bgf shodow">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="unassessUser"></div>
            </div>
            <div class="title_sta cgrey">未通过数：</div>
        </div>
    </div>
    <div class="layui-row">
        <div class="col-md-6">
            <div id="asset_hart" style="height: 480px">

            </div>
        </div>
        <div class="col-md-6">
            <div id="testChart" style="height: 480px">

            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/echarts/echarts.min.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    layui.use(['table'], function () {
        var $ = layui.jquery;
        var asset_chart= echarts.init(document.getElementById('asset_hart'));
        function getUserPassMissionApi(){
            $.ajax({
                url: ctx + "statistics/getUserPassMission",
                data: {userId:userInfo.data.userId},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    if(resp.code==0){
                        $('#awaitUser').html(resp['data']['待审核']);
                        $('#accessUser').html(resp['data']['审核通过']);
                        $('#unassessUser').html(resp['data']['审核不通过']);
                    }
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        getUserPassMissionApi()
    })
</script>
</body>
</html>
