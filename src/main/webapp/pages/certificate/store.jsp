<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>证书库管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" media="all">
    <style>
        .layui-form-label {
            width: 130px;
        }
    </style>
</head>
<body>
<div class="layui-fluid ">
    <div class="layui-card ">
        <div class="layui-card-header">入网证书管理</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">证书名称(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="zshName"  lay-verify="required|zshName" autocomplete="off" placeholder="请输入证书名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">证书类型(必填)</label>
                    <div class="layui-col-md6">
                        <select name="zshType" lay-verify="required|zshType">
                            <option value="" selected="">请选择证书类型</option>
                            <option value="类型1">类型1</option>
                            <option value="类型2" >类型2</option>
                            <option value="类型3">类型3</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">证书申请人(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="zshApplyer" lay-verify="required|zshApplyer" autocomplete="off" placeholder="请输入证书申请人" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">电子邮箱(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" placeholder="请输入电子邮箱" name="email" lay-verify="required|email" autocomplete="off" class="layui-input">                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">证书提交日期</label>
                    <div class="layui-col-md6">
                        <input type="text" name="createDate"   id="date" lay-verify="required|createDate" placeholder="请选择证书提交日期" autocomplete="off" class="layui-input" lay-key="1">                    </div>
                </div>
                <div class="layui-form-item layui-form-text  layui-row">
                    <label class="layui-form-label">证书描述</label>
                    <div class=" layui-col-md6">
                        <textarea name="remark" placeholder="请输入描述内容" lay-verify="remark" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <div style="text-align: center">
                            <button class="layui-btn" type="button" lay-submit lay-filter="component-form-demo1" id="submit">
                                立即提交
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <br>
            </form>
        </div>
    </div>
</div>
<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>常规使用：普通图片上传</legend>
</fieldset>
<div class="layui-upload">
    <button type="button" class="layui-btn" id="test1">上传图片</button>
    <div class="layui-upload-list">
        <img class="layui-upload-img" id="demo1">
        <p id="demoText"></p>
    </div>
</div>--%>
<script src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/assets/common/function.js"></script>
<script>
    var uuid="";
    var initFlag=true;
    var ctx = "${pageContext.request.contextPath}/";
    //var ctx = "http://192.168.0.105:8888/";
    var fileNames="";
    var filesPath="",urlPath=[];
    var fileNameArr=new Array();
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    var userId=userInfo.data.userId;
    var postData={};
    layui.use(['form', 'layedit', 'laydate', 'table', 'upload','layer'], function () {
        var $ = layui.jquery;
        var form = layui.form, laydate = layui.laydate, upload = layui.upload,layer=layui.layer;
        laydate.render({
            elem: '#date'
        });
        uuid=guid();
        upload.render({
            elem: '#fileUpload'
            //, url: uploadUrl,
            , url:ctx + "rzbl/fileUpload",
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
        form.on('submit(component-form-demo1)', function (data) {
            postData['userId']=userId;
            postData['zshName']=data.field.zshName;
            postData['zshType']=data.field.zshType;
            postData['zshApplyer']=data.field.zshApplyer;
            postData['email']=data.field.email;
            postData['createDate']=data.field.createDate;
            postData['remark']=data.field.remark;
            sessionStorage.setItem('zshApply',JSON.stringify(postData));
            layer.alert('提交成功',function(index){
                layer.close(index);
                $("button[type=reset]").trigger("click");
            });

        })
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        //  form.render();
    });
</script>
</body>
</html>

