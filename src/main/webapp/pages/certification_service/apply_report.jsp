<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>入网申请填报</title>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../assets/css/common.css" media="all">
    <style>
        .layui-form-label {
            width: 130px;
        }
    </style>
</head>
<body>
<div class="layui-fluid ">
    <div class="layui-card ">
        <div class="layui-card-header">认证申请填报</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统化名称(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="systemName"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">业务类型(必填)</label>
                    <div class="layui-col-md6">
                        <select name="businessType" lay-verify="required|businessType">
                            <option value="" selected="">请选择业务类型</option>
                            <option value="业务1">业务1</option>
                            <option value="业务2" >业务2</option>
                            <option value="业务3">业务3</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统管理单位(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="managerDept" lay-verify="required|managerDept" autocomplete="off" placeholder="请输入系统管理单位" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">研制单位(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="developDept" lay-verify="required|developDept" autocomplete="off" placeholder="请输入研制单位" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">联系人(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="applicationUserName" lay-verify="required|applicationUserName" autocomplete="off" placeholder="请输入联系人" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">手机号(必填)</label>
                    <div class="layui-col-md6">
                        <input type="tel"  placeholder="请输入手机号" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">电子邮箱(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" placeholder="请输入电子邮箱" name="email" lay-verify="required|email" autocomplete="off" class="layui-input">                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">申请日期</label>
                    <div class="layui-col-md6">
                        <input type="text" name="createDate"   id="date" lay-verify="required|createDate" placeholder="请选择申请日期" autocomplete="off" class="layui-input" lay-key="1">                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">电子附件</label>
                    <div class="layui-col-md6 layui-upload">
                        <span id="files"></span>
                        <button class="layui-btn layui-btn-normal " type="button" id="fileUpload">选择文件</button>
                        <%-- <input id="excelFile" type="file" name="excelFile" lay-type="file"  class="layui-upload-file" >--%>
                        <%--<input type="text" name="title"   autocomplete="off" placeholder="请选择电子附件" class="layui-input">--%>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text  layui-row">
                    <label class="layui-form-label">系统描述</label>
                    <div class=" layui-col-md6">
                        <textarea name="remark" placeholder="请输入内容" lay-verify="remark" class="layui-textarea"></textarea>
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
<script src="../../assets/layui/layui.js"></script>
<script src="../../assets/common/function.js"></script>
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
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        //  form.render();
    });
</script>
</body>
</html>

