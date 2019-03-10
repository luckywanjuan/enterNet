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
        <div class="layui-col-md2 bgf shodow" data-src="pages/certification_service/result_query.jsp" data-title="认证结果查询" onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6 fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="awaitUser"></div>
            </div>
            <div class="title_sta cgrey">未审核数</div>
        </div>
        <div class="layui-col-md2  bgf shodow" data-src="pages/certification_service/result_query.jsp" data-title="认证结果查询" onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="accessUser"></div>
            </div>
            <div class="title_sta cgrey">已通过数：</div>
        </div>
        <div class="layui-col-md2  bgf shodow" data-src="pages/certification_service/result_query.jsp" data-title="认证结果查询" onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="unassessUser"></div>
            </div>
            <div class="title_sta cgrey">未通过数：</div>
        </div>
    </div>
    <div class="disflex">
        <div class="itemflex bgf" id="asset_chart" style="width:400px;height: 480px"></div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/echarts/echarts.min.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    layui.use(['table'], function () {
        var $ = layui.jquery;
        var assetChart= echarts.init(document.getElementById('asset_chart'));
        function getUserPassMissionApi(){
            $.ajax({
                url: ctx + "statistics/getUserPassMission",
                data: {userId:userInfo.data.userId},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    if(resp.code==0){
                        $('#awaitUser').html(resp['data']['NOAUDIT']);
                        $('#accessUser').html(resp['data']['PASS']);
                        $('#unassessUser').html(resp['data']['NOPASS']);
                    }
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        getUserPassMissionApi();
        function getRzDateNumApi(){
            $.ajax({
                url: ctx + "statistics/getRzDateNum",
                data: {userId:userInfo.data.userId},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    if(resp.code==0){
                        var xaris=[];
                        var value=[];
                        resp.data.forEach(function(element,index){
                            xaris.push(element.create_date)
                            value.push(element.num)
                        });
                        var optionAsset = {
                            color: ['#188df0'],
                            tooltip : {
                                trigger: 'axis',
                                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            title:{
                                text: '申请统计'
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis : [
                                {
                                    type : 'category',
                                    data : xaris,
                                    axisTick: {
                                        alignWithLabel: true
                                    }
                                }
                            ],
                            yAxis : [
                                {
                                    type : 'value'
                                }
                            ],
                            series : [
                                {
                                    barMaxWidth:35,
                                    name:'申请统计',
                                    type:'bar',
                                    barWidth: '60%',
                                    data:value
                                }
                            ]
                        };
                        assetChart.setOption(optionAsset);
                    }
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        getRzDateNumApi();
        window.linkPage = function (that) {
            var endFlag = true;
            var _that=$(that);
            var url =_that.attr('data-src'), y = url.replace(/(^http(s*):)|(\?[\s\S]*$)/g, "");
            parent.$('#LAY_app_tabsheader').find('li').each(function (item) {
                if ($(this).attr("lay-id") === url) {
                    endFlag = false;
                    parent.$('iframe[src="'+url+'"]').parent().siblings().removeClass('layui-show');
                    parent.$('iframe[src="'+url+'"]').parent().addClass('layui-show');
                    return;
                }
            });
            if (endFlag) {
                parent.$('#LAY_app_body').append(['<div class="layadmin-tabsbody-item layui-show">', '<iframe src="' + url + '" frameborder="0"  class="layadmin-iframe"></iframe>', "</div>"].join(""))
                parent.element.tabAdd('layadmin-layout-tabs', {
                    title: "<span>"+_that.attr('data-title')+"</span>",
                    attr: y,
                    id: url
                })
            }
            parent.element.tabChange('layadmin-layout-tabs', url);
        }
    })
</script>
</body>
</html>
