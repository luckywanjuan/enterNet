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
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">测试任务名称(必填)</label>
                    <div class="layui-col-md4">
                        <select name="businessType" lay-verify="required|businessType">
                            <option value="" selected="">请选择测试任务</option>
                            <option value="业务1">任务1</option>
                            <option value="业务2" >任务2</option>
                            <option value="业务3">任务3</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统管理单位(必填)</label>
                    <div class="layui-col-md4">
                        <input type="text" name="managerDept"  lay-verify="required|managerDept" autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">研制单位(必填)</label>
                    <div class="layui-col-md4">
                        <input type="text" name="developDept" lay-verify="required|developDept" autocomplete="off" placeholder="请输入研制单位" class="layui-input">
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
                            <button type="button" class="layui-btn layui-btn-primary">在线编辑</button>
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
    layui.use(['form', 'layedit', 'laydate', 'table', 'upload','layer'], function () {
        var $ = layui.jquery;
        var form = layui.form, laydate = layui.laydate, upload = layui.upload,layer=layui.layer;
        laydate.render({
            elem: '#date'
        });
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
        form.on('submit(commitReport)', function (data) {
            fileNames="",filesPath="";
            if(null!=fileNameArr&&fileNameArr.length>0){
                fileNameArr.forEach(function (item, index){
                    fileNames+=item+",";
                    filesPath+="upload/"+uuid+"/"+item+","
                });
                if(null!=fileNames&&fileNames!=""&&fileNames.length>=1){
                    fileNames=fileNames.substr(0,fileNames.length-1);
                }
                if(null!=filesPath&&filesPath!=""&&filesPath.length>=1){
                    filesPath=filesPath.substr(0,filesPath.length-1);
                }
            }
            postData['userId']=userId;
            postData['systemName']=data.field.systemName;
            postData['businessType']=data.field.businessType;
            postData['managerDept']=data.field.managerDept;
            postData['developDept']=data.field.developDept;
            postData['applicationUserName']=data.field.applicationUserName;
            postData['phone']=data.field.phone;
            postData['email']=data.field.email;
            postData['createDate']=data.field.createDate;
            postData['email']=data.field.email;
            if(urlPath[0]){
                postData['attachment']=urlPath[0];
            }else{
                postData['attachment']='';
            }
            postData['remark']=data.field.remark;
            postData['email']=data.field.email;
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
