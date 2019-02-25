<%--
  Created by IntelliJ IDEA.
  User: tch002
  Date: 2019/2/14
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试计划生成</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css" media="all">
    <style>
        .layui-form-label {
            width: 130px;
        }
        .layui-form-checkbox span{
            height: auto;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">测试报告生成</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="testPlan">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试任务名称(必填)</label>
                    <div class="layui-col-md4">
                        <select name="taskTest" lay-filter="taskTest" lay-verify="required|taskTest"></select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统管理单位(必填)</label>
                    <div class="layui-col-md4">
                        <input type="text" name="systemDept"  lay-verify="systemDept" readonly autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">研制单位(必填)</label>
                    <div class="layui-col-md4">
                        <input type="text" name="developDept" lay-verify="developDept" readonly autocomplete="off" placeholder="请输入研制单位" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试类型（必填）</label>
                    <div class="layui-col-md4">
                        <select name="testType" lay-verify="required|testType">
                            <option value="" selected="">请选择测试类型</option>
                            <option value="类型1">类型1</option>
                            <option value="类型2" >类型2</option>
                            <option value="类型3">类型3</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统形式审查</label>
                    <div class="layui-col-md4">
                        <input type="radio" name="systemCheck" value="软件包格式校验" title="软件包格式校验" checked="">
                        <input type="radio" name="systemCheck" value="基础数据项审查" title="基础数据项审查">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">接口规范审查</label>
                    <div class="layui-col-md4">
                        <input type="radio" name="interfaceCheck" value="服务接口命名规则" title="服务接口命名规则" checked="">
                        <input type="radio" name="interfaceCheck" value="交互格式" title="交互格式">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试要点</label>
                    <div class="layui-col-md8" id="mainPoint"></div>
                </div>
                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <div style="text-align: center">
                            <button class="layui-btn" type="button" lay-submit lay-filter="commitPlan" id="submit">
                                生成
                            </button>
                            <%--<button type="button" class="layui-btn layui-btn-primary">预览</button>--%>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<script src="../../assets/layui/layui.js"></script>
<script src="../../assets/common/function.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var postData={};
    layui.use(['form', 'layedit', 'laydate', 'table', 'upload','layer'], function () {
        var $ = layui.jquery;
        var form = layui.form, laydate = layui.laydate, upload = layui.upload,layer=layui.layer;
        laydate.render({
            elem: '#date'
        });
        function getSelectTaskApi(){//获取任务名称select值
            $.ajax({
                url: ctx + "rztask/getRzTaskName",
                data: {},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    var html='<option value="" selected="">请选择测试任务</option>';
                    resp.data.forEach(function(element,index){
                        console.log(element.taskName)
                        html+='<option value="'+element.taskName+'" taskid="'+element.id+'">'+element.taskName+'</option>'
                    })
                    $("select[name='taskTest']").html(html);
                    form.render('select', 'testPlan');
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        getSelectTaskApi();
        function getRzTaskMsg(taskID){//根据测试任务获取管理单位、研制单位
            $.ajax({
                url: ctx + "rztask/getRzTaskMsg",
                data: {
                    id:taskID
                },
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    if(resp.data){
                        $("input[name='systemDept']").val(resp.data.systemDept);
                        $("input[name='developDept']").val(resp.data.developDept);
                    }else{
                        $("input[name='managerDept']").val('');
                        $("input[name='developDept']").val('');
                    }

                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        form.on('select(taskTest)', function(data){
            console.log(data)
            getRzTaskMsg($(data.elem[data.elem.selectedIndex]).attr('taskid'))

        });
        function getMainPoint(){
            $.ajax({
                url: ctx + "rztask/getAllPoint",
                data: {},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    var html='';
                    resp.data.forEach(function(element,index){
                        if(index==0){
                            html+='<input type="radio" name="testPoint" value="'+element.pointName+'" title="'+element.pointName+'" checked>'
                        }else{
                            html+='<input type="radio" name="testPoint" value="'+element.pointName+'" title="'+element.pointName+'" >'
                        }
                    })
                    $("#mainPoint").html(html);
                    form.render();
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        getMainPoint();
        form.on('submit(commitPlan)', function (data) {
            postData['taskName']=data.field.taskTest;
            postData['testType']=data.field.testType;
            postData['systemDept']=data.field.systemDept;
            postData['developDept']=data.field.developDept;
            postData['interfaceCheck']=data.field.interfaceCheck;
            postData['systemCheck']=data.field.systemCheck;
            postData['testPoint']=data.field.testPoint;
            var submiting=false;
            if (!submiting) {
                submiting=true;
                $.ajax({
                    url: ctx + "rzbl/updateRzApplication",
                    data: postData,
                    type: 'post',
                    dataType: 'json',
                    async: false,
                    success: function (resp) {
                        submiting = false;
                        if (resp.code==0) {
                            layer.alert('提交成功');
                        } else {
                            layer.alert(resp.errorMsg);
                        }
                    }, error: function () {
                        submiting = false;
                    }
                })
                return false;
            }
        })
    });
</script>
</body>
</html>
