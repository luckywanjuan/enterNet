<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>入网管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/admin.css">
    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layer.css?v=3.1.1" media="all">
    <style>
        body{
            background-image: url(assets/images/8.jpg);
            transition: background .3s;
            background-size: 100% 100%;
            background-attachment: fixed;
            background-position: center;
        }
    </style>
</head>

<body class="layui-layout-body" layadmin-themealias="default">
<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect="">
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <%--<li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="http://www.layui.com/admin/" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" lay-action="template/search.html?keywords=">
                </li>
                <span class="layui-nav-bar"></span>--%>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
                <%--<li class="layui-nav-item" lay-unselect="">
                    <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
                        <i class="layui-icon layui-icon-notice"></i>

                        <!-- 如果有新消息，则显示小圆点 -->
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect="">
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>--%>
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;">
                        <cite id="userName"></cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child" id="logout">
                        <%--<dd><a lay-href="set/user/info.html">基本资料</a></dd>
                        <dd><a lay-href="set/user/password.html">修改密码</a></dd>
                        <hr>--%>
                        <dd style="text-align: center;"><a>退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" style="width: 56px">
                  <%--  <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>--%>
                </li>
                <%--<li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect="">
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <span class="layui-nav-bar"></span>--%>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo">
                    <span>入网认证系统</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="主页" lay-direction="2">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>入网认证办理服务</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="statics_user" class="layui-this user">
                                <a lay-href="pages/staticis/user.jsp">申请数据统计</a>
                            </dd>
                            <dd data-name="statics_admin" class="layui-this admin">
                                <a lay-href="pages/staticis/admin.jsp">审批数据统计</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="renzheng" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="组件" lay-direction="2">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>认证管理管理</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="pages/certification_service/apply_report.jsp" class="user">
                                <a lay-href="pages/certification_service/apply_report.jsp">认证申请填报</a>
                            </dd>
                            <dd data-name="pages/certification_service/result_query.jsp" class="user">
                                <a lay-href="pages/certification_service/result_query.jsp">认证结果查询</a>
                            </dd>
                            <dd data-name="application_assest" class="admin">
                                <a lay-href="pages/certification_service/application_assest.jsp">认证申请审批</a>
                            </dd>
                            <dd data-name="result_manage" class="admin">
                                <a lay-href="pages/certification_service/result_manage.jsp">认证结果管理</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="component" class="layui-nav-item admin">
                        <a href="javascript:;" lay-tips="组件" lay-direction="2">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>测试过程管理</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="button">
                                <a lay-href="pages/test/report_generate.jsp" >测试报告生成</a>
                            </dd>
                            <dd data-name="nav">
                                <a lay-href="pages/test/plan_generate.jsp">测试计划生成</a>
                            </dd>
                            <dd data-name="tabs">
                                <a lay-href="pages/test/task_query.jsp">测试任务查询</a>
                            </dd>
                            <dd data-name="progress">
                                <a lay-href="pages/test/point_manage.jsp">要点库管理</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="component" class="layui-nav-item admin">
                        <a href="javascript:;" lay-tips="入网认证证书管理" lay-direction="3">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>入网认证证书管理</cite>
                            <span class="layui-nav-more"></span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="zhengshu">
                                <a lay-href="pages/certificate/store.jsp" >入网证书库管理</a>
                            </dd>
                            <dd data-name="nav">
                                <a lay-href="">入网证书生成</a>
                            </dd>
                        </dl>
                    </li>
                    <span class="layui-nav-bar" style="top: 382px; height: 0px; opacity: 0;"></span></ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect="">
                        <a href="javascript:;"><span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                    <span class="layui-nav-bar"></span></ul>
            </div>
            <div class="layui-tab" lay-unauto="" lay-allowclose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body" >
            <div class="layadmin-tabsbody-item layui-show" id="adminMain">
                <iframe src="pages/staticis/admin.jsp"  frameborder="0" class="layadmin-iframe"></iframe>
            </div>
            <div class="layadmin-tabsbody-item layui-show user" id="userMain">
                <iframe src="pages/staticis/user.jsp"  frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<script>
    var num=[0,0,0];
    var ctx = "${pageContext.request.contextPath}/";
    sessionStorage.setItem('num',JSON.stringify(num))
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    layui.config({
        base: 'assets/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
    var element;
    layui.use(['element'],function(){
        element=layui.element
        var $ = layui.jquery;
        $('#userName').html(userInfo.userName);
        if(userInfo.data.role==0){//管理员
            $('#userMain').remove();
            $('.user').hide();
            $('.admin').show();
            $('#adminMain').show();
            $('#LAY_app_tabsheader').html('<li lay-id="pages/staticis/admin.jsp" lay-attr="pages/staticis/admin.jsp" class="layui-this admin"><span>首页</span><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></li>')
        }else{
            $('.admin').hide();
            $('.user').show();
            $('#adminMain').remove();
            $('#userMain').show();
            $('#LAY_app_tabsheader').html('<li lay-id="pages/staticis/user.jsp" lay-attr="pages/staticis/user.jsp" class="layui-this user"><span>首页</span><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></li>')
        }
        $('#logout').on('click',function () {
            window.location='${pageContext.request.contextPath}/pages/login/login.jsp';
            sessionStorage.removeItem('userInfo');
        })
    })


</script>

<!-- 百度统计 -->
<%--<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>--%>




<%--<style id="LAY_layadmin_theme">
    .layui-side-menu,.layadmin-pagetabs .layui-tab-title li:after,.layadmin-pagetabs .layui-tab-title li.layui-this:after,.layui-layer-admin .layui-layer-title,.layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child{background-color:#20222A !important;}.layui-nav-tree .layui-this,.layui-nav-tree .layui-this>a,.layui-nav-tree .layui-nav-child dd.layui-this,.layui-nav-tree .layui-nav-child dd.layui-this a{background-color:#009688 !important;}.layui-layout-admin .layui-logo{background-color:#20222A !important;}
</style>--%>
</body>
</html>