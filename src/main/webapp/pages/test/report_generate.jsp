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
    <title>测试报告生成</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css" media="all">
    <style>
        .layui-form-label {
            width: 130px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">测试报告生成</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="reportFrom">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试任务名称(必填)</label>
                    <div class="layui-col-md4">
                        <select name="businessType"  lay-filter="businessType"  lay-verify="required|businessType"></select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统管理单位(必填)</label>
                    <div class="layui-col-md4">
                        <input type="text" name="managerDept" readonly lay-verify="managerDept" autocomplete="off" placeholder="请输入系统管理单位" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">研制单位(必填)</label>
                    <div class="layui-col-md4">
                        <input type="text" name="developDept" readonly lay-verify="developDept" autocomplete="off" placeholder="请输入研制单位" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试数据上传</label>
                    <div class="layui-col-md4 layui-upload">
                        <span id="files"></span>
                        <button class="layui-btn layui-btn-normal " type="button" id="fileUpload">选择文件</button>
                    </div>
                </div>
                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <div style="text-align: center">
                            <button class="layui-btn" type="button" lay-submit lay-filter="commitReport" id="submit">
                                生成
                            </button>
                            <%--<button type="button" class="layui-btn layui-btn-primary">在线编辑</button>--%>
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
    var postData={},urlPath=[];
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
                    $("select[name='businessType']").html(html);
                    form.render('select', 'reportFrom');
                }, error: function () {
                   console.log('接口错误')
                }
            })
        }
        getSelectTaskApi();
        uuid=guid();
        upload.render({
            elem: '#fileUpload',
            url:ctx + "rzbl/fileUpload",
            data: {
                applicationId: uuid
            }
            ,accept:'file'
            , before: function (obj) {
                fileNameArr=[];
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {//异步
                    fileNameArr.push(file.name);
                    // $('#files').html(fileNameArr[0])
                });
            }
            , done: function (res) {
                //如果上传失败
                urlPath=[];
                if (res.code == 0) {
                    urlPath.push(res.data)
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
            }
        });
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
                        $("input[name='managerDept']").val(resp.data.managerDept);
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
        form.on('select(businessType)', function(data){
            console.log('select(businessType)')
            getRzTaskMsg($(data.elem[data.elem.selectedIndex]).attr('taskid'))

        });
        form.on('submit(commitReport)', function (data) {
            fileNames="",filesPath="";

            postData['businessType']=data.field.businessType;
            postData['managerDept']=data.field.managerDept;
            postData['developDept']=data.field.developDept;
            if(urlPath[0]){
                postData['attachment']=urlPath[0];
            }else{
                postData['attachment']='';
            }
            var submiting=false;
            if (!submiting) {
                submiting=true;
                $.ajax({
                    url: ctx + "rztask/saveRzReport",
                    data: postData,
                    type: 'post',
                    dataType: 'json',
                    async: false,
                    success: function (resp) {
                        submiting = false;
                        if (resp.code==0) {
                            layer.alert('提交成功',function (index) {
                                layer.close(index);
                                $("button[type=reset]").trigger("click");
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
