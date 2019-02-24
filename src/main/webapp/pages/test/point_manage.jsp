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
        <div class="layui-card-header">要点库管理</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试任务类型（必填）</label>
                    <div class="layui-col-md4">
                        <select name="businessType" lay-verify="required|businessType">
                            <option value="" selected="">请选择测试类型</option>
                            <option value="类型1">类型1</option>
                            <option value="类型2" >类型2</option>
                            <option value="类型3">类型3</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试要点</label>
                    <div class="layui-col-md8" id="addPoint"></div>
                </div>
                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <div style="text-align: center">
                            <button class="layui-btn" type="button" lay-submit lay-filter="commitReport" id="submit">
                                确认
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<div id="modalContent" style="display: none;">
    <div class="layui-fluid">
        <div class="layui-card">
            <div  class="layui-card-body">
                <form class="layui-form" lay-filter="ensureModal">
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">要点名称:</label>
                        <div class=" layui-col-md3">
                            <input type="text" name="pointName" lay-verify="required|pointName"  class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">要点内容:</label>
                        <div class=" layui-col-md3">
                            <input type="text" name="Point" lay-verify="required|Point"  class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item layui-layout-admin">
                        <div class="layui-input-block">
                            <div style="text-align: center">
                                <button class="layui-btn" type="button" lay-submit lay-filter="newReport" id="newReport">
                                    确定
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../../assets/layui/layui.js"></script>
<script src="../../assets/common/function.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var pointData={};
    layui.use(['form', 'layedit', 'laydate', 'table', 'upload','layer'], function () {
        var $ = layui.jquery;
        var form = layui.form, laydate = layui.laydate, upload = layui.upload,layer=layui.layer;
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
                        html+='<button class="layui-btn" type="button" onclick="newPoints('+JSON.stringify(element).replace(/\"/g,"'")+')">'+element.pointName+'</button>';
                    });
                    html+='<button class="layui-btn" type="button"  onclick="newPoints(\'new\')">新增要点</button>';
                    $("#addPoint").html(html);
                    // form.render('select', 'testPlan');
                }, error: function () {
                    console.log('接口错误')
                }
            })
        }
        getMainPoint();
        var title='';
        window.newPoints=function(item){
            if(item=='new'){
                title="新建要点";
                pointData['id']='';
            }else{
                title="编辑要点";
                pointData['id']=item;
            }
            layer.open({
                type: 1
                ,title: title
                ,area: ['800px', '480px']
                ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                ,id: 'layerDemo'+title //防止重复弹出
                ,content: $('#modalContent')
                ,btnAlign: 'c' //按钮居中
                ,shade:  [0.5,'#000'] //不显示遮罩
                ,yes: function(){
                    layer.closeAll();
                }
            });
        };
        form.on('submit(newReport)', function (data) {
            pointData['pointName']=data.field.pointName;
            pointData['Point']=data.field.Point;
            var submiting=false;
            if (!submiting) {
                submiting=true;
                $.ajax({
                    url: ctx + "rztask/savePoint",
                    data: pointData,
                    type: 'post',
                    dataType: 'json',
                    async: false,
                    success: function (resp) {
                        submiting = false;
                        if (resp.code==0) {
                            layer.alert('提交成功',function () {
                                layer.closeAll();
                                getMainPoint();
                            });
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
