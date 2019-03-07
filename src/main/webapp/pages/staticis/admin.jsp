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
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/static.css">
    <style>
        .layui-table-view .layui-table {width:100%}
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row" style="padding: 15px">
        <div class="layui-col-md2 bgf shodow" data-src="pages/certification_service/application_assest.jsp" data-title="认证申请审批" onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6 fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="alreadly"></div>
            </div>
            <div class="title_sta cgrey">在办数量</div>
        </div>
        <div class="layui-col-md2  bgf shodow" data-src="pages/certification_service/result_manage.jsp" data-title="认证结果管理"   onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="noAsset"></div>
            </div>
            <div class="title_sta cgrey">已入网数量：</div>
        </div>
        <div class="layui-col-md2  bgf shodow" data-src="pages/test/task_query.jsp"  data-title="测试任务查询"  onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="testTask"></div>
            </div>
            <div class="title_sta cgrey">测试任务：</div>
        </div>
        <div class="layui-col-md2  bgf shodow" data-src="pages/certification_service/result_manage.jsp"  data-title="认证结果管理"  onclick="linkPage(this)">
            <div class="layui-row">
                <i class="layui-col-md6  fa fa-copy  fa-2x cgrey"></i>
                <div class="layui-col-md6 cblue f18 fontw tr" id="noAccess"></div>
            </div>
            <div class="title_sta cgrey">未通过数量：</div>
        </div>
    </div>
    <div class="disflex">
        <div class="itemflex bgf" id="asset_chart" style="padding: 10px">
            <h5 style="font-size:18px;font-weight:bold;padding-left: 15px;">属性统计</h5>
            <div class="layui-tab"  lay-filter="tab">
                <ul class="layui-tab-title">
                    <li class="layui-this" dataTag="xtgldw">系统管理单位</li>
                    <li dataTag="yzdw">研制单位</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <table class="layui-hide" id="manages" lay-filter="manageTable"></table>
                    </div>
                    <div class="layui-tab-item">
                        <table class="layui-hide" id="delevope" lay-filter="delevopeTable"></table>
                    </div>
                </div>
            </div>

        </div>
        <div class="itemflex bgf" id="test_chart" style="width:400px;height: 480px;padding: 10px"></div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/common/function.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var userInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    layui.use(['table','element'], function () {
        var $ = layui.jquery,table=layui.table,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块;
        //var assetChart = echarts.init(document.getElementById('asset_chart'));
        var testChart = echarts.init(document.getElementById('test_chart'));
       /* function getRzDateNumApi(type) {
            $.ajax({
                url: ctx + "statistics/getRzTotalMsg",
                data: {
                    userId: userInfo.data.userId,
                    state: 'xtgldw'
                },
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    if (resp.code == 0) {

                    }
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }*/
      /*  var firstTime=[0,0]
        element.on('tab(tab)', function(data){
            var that=$(this);
            if(that.attr('dataTag')=='yzdw'&&firstTime[1]==0){
                getTableList(that.attr('dataTag'));
                firstTime[1]++;
            }
        });*/
        getManageTableList('xtgldw');
        getYzdwTableList('yzdw');
        function getManageTableList(state){
            table.render({
                elem: '#manages',
                page: false, //开启分页
                url: ctx + "statistics/getRzTotalMsg?userId="+userInfo.data.userId+'&state='+state,
                cols: [[ //表头
                    {field: 'num', title: '入网数量',width:'25%'}
                    ,{field: 'manager_dept', title: '系统管理单位',width:'35%'}
                    ,{field: 'create_date', title: '创建时间', width:'40%',totalRow: true}
                ]],
                height: 380,
                loading: true,
                done:function(res){
                    // ityzl_CLOSE_LOAD_LAYER(ient);
                },
                //skin: 'line', //行边框风格
                even: true //开启隔行背景
            });
        }
        function getYzdwTableList(state){
            table.render({
                elem: '#delevope',
                page: false, //开启分页
                url: ctx + "statistics/getRzTotalMsg?userId="+userInfo.data.userId+'&state='+state,
                cols: [[ //表头
                    {field: 'num', title: '入网数量',width:'25%'}
                    ,{field: 'develop_dept', title: '研制单位',width:'35%'}
                    ,{field: 'create_date', title: '创建时间', width:'40%',totalRow: true}
                ]],
                height: 380,
                loading: true,
                done:function(res){
                    console.log(res)
                    // ityzl_CLOSE_LOAD_LAYER(ient);
                },
                //skin: 'line', //行边框风格
                even: true //开启隔行背景
            });
        }
        function getUserPassMissionApi() {
            $.ajax({
                url: ctx + "statistics/getUserPassMission",
                data: {userId: userInfo.data.userId},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    if (resp.code == 0) {
                        $('#alreadly').html(resp['data']['PASS'])
                        $('#noAsset').html(resp['data']['NOAUDIT'])
                        $('#testTask').html(resp['data']['TASK'])
                        $('#noAccess').html(resp['data']['NOPASS'])
                    }
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }

        getUserPassMissionApi();

        function getRzTaskNumApi() {//管理员测试任务柱状图
            $.ajax({
                url: ctx + "statistics/getRzTaskNum",
                data: {userId: userInfo.data.userId},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    var xaris = [];
                    var value = [];
                    resp.data.forEach(function (element, index) {
                        xaris.push(format(element.create_time))
                        value.push(element.num)
                    })
                    var optionTest = {
                        color: ['#188df0'],
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        title: {
                            text: '测试任务统计'
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: xaris,
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                barMaxWidth: 68,
                                name: '测试任务',
                                type: 'bar',
                                barWidth: '60%',
                                data: value
                            }
                        ]
                    };
                    testChart.setOption(optionTest);
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }

        getRzTaskNumApi();
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
