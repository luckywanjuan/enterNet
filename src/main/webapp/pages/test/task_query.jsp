<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css" media="all">
    <style>
        .layui-form-label{
            width: 90px;
        }
        .layui-table-view .layui-table {width:100%}
        .middle_text{
            line-height: 38px;
        }
    </style>
</head>
<body style="background: #fff">
<div class="layui-card-header">测试任务查询</div>
<br>
<div class="layui-row layui-col-space12">
    <div class="layui-col-md3">
        <label class="layui-form-label">任务名称：</label>
        <div class="layui-col-md6">
            <input type="text" name="systemName"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入任务名称" class="layui-input">
        </div>
    </div>
    <div class="layui-col-md3">
        <label class="layui-form-label">系统名称：</label>
        <div class="layui-col-md6">
            <input type="text" name="developDept"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入系统名称" class="layui-input">
        </div>
    </div>
    <div class="layui-col-md3">
        <label class="layui-form-label">研制单位：</label>
        <div class="layui-col-md6">
            <input type="text" name="developDept"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入研制单位" class="layui-input">
        </div>
    </div>
    <div class="layui-col-md3 layui-form">
        <label class="layui-form-label">进度</label>
        <div class="layui-col-md4">
            <select name="businessType" lay-verify="required|businessType">
                <option value="" selected="">进行中</option>
                <option value="业务1">完成</option>
            </select>
        </div>
    </div>

    <div class="layui-col-md6">
        <label class="layui-form-label">管理单位：</label>
        <div class="layui-col-md3">
            <input type="text" name="managerDept"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入管理单位" class="layui-input">
        </div>
        <div class="layui-col-md1">&nbsp;</div>
        <button class="layui-btn layui-btn-sm" type="button"  onclick="doSearch()" lay-submit  lay-filter="component-form-demo1"  >
            搜索
        </button>
        <button class="layui-btn layui-btn-sm" type="button"  onclick="newTask('new')" lay-submit  lay-filter="component-form-demo1"  >
            +新建任务
        </button>
    </div>
</div>
<div class="layui-row">
    <div class="layui-col-md12">
        <table class="layui-table" id="roletable" lay-filter="roletable"></table>
    </div>
    <script type="text/html" id="databar">
        <button class="layui-btn layui-btn-warm layui-btn-mini"  lay-event="enterNet">入网结论查看</button>
        <button class="layui-btn layui-btn-mini"    lay-event="testReport">测试报告查看</button>
        <button class="layui-btn layui-btn-danger layui-btn-mini"   lay-event="testReportLoad">测试报告下载</button>
    </script>
</div>
<div id="modalContent" style="display: none;">
    <div class="layui-fluid">
        <div class="layui-card">
            <div  class="layui-card-body">
                <form class="layui-form" lay-filter="ensureModal">
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">测试任务名称:</label>
                        <div class=" layui-col-md3">
                            <input type="text" name="taskName" lay-verify="required|taskName"  class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">关联系统名称:</label>
                        <div class=" layui-col-md3">
                            <select name="systemName" lay-verify="required|systemName">
                                <option value="系统名称1" selected="">系统名称1</option>
                                <option value="系统名称2">系统名称2</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">业务类型:</label>
                        <div class=" layui-col-md3">
                            <select name="businessType" lay-verify="required|businessType">
                                <option value="业务类型1" selected="">业务类型1</option>
                                <option value="业务类型2">业务类型2</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">系统管理单位:</label>
                        <div class=" layui-col-md3">
                            <input type="text" name="managerDept" lay-verify="required|managerDept"  class="layui-input" >
                        </div>

                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">研制单位:</label>
                        <div class=" layui-col-md3">
                            <input type="text" name="developDept" lay-verify="required|developDept"  class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">测试计划：</label>
                        <div class="layui-col-md6 layui-upload">
                            <span id="files"></span>
                            <button class="layui-btn layui-btn-normal upload-file" type="button"   id="fileUpload0">选择文件</button>
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">测试报告：</label>
                        <div class="layui-col-md6 layui-upload">
                            <button class="layui-btn layui-btn-normal upload-file" type="button"  id="fileUpload1">选择文件</button>
                        </div>
                    </div>
                    <div class="layui-form-item layui-layout-admin">
                        <div class="layui-input-block">
                            <div style="text-align: center">
                                <button class="layui-btn" type="button" lay-submit lay-filter="newReport" id="submit">
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
<script src="../../assets/common/function.js"></script>
<script src="../../assets/layui/layui.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    // var ctx = "http://192.168.0.105:8888/";
    var postData={},urlPath={'plan':[],'report':[]};
    var table,laypage,laytpl,layer,upload;
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    var userId=userInfo.data.userId;
    layui.use(['form','table','laypage','laytpl', 'upload','layer'], function(){
        form = layui.form, laypage = layui.laypage,table = layui.table,laytpl = layui.laytpl,layer=layui.layer,upload = layui.upload;//分页 //表格
        var $ = layui.jquery;
        postData['userId']=userId;
        uuid=guid();
        upload.render({
                elem: '#fileUpload0',
                data: {
                    applicationId: uuid
                },
                url:ctx + "rzbl/fileUpload"
                ,accept:'file'
                , before: function (obj) {
                    fileNameArr=[];
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {//异步
                        fileNameArr.push(file.name);
                        // $('#files').html(fileNameArr[0])
                    });
                }
                , done: function (res,index,upload) {
                    //如果上传失败
                    var item=this.item;
                    urlPath.plan=[];
                    if (res.code == 0) {
                        urlPath.plan.push(res.data)
                    }
                    //上传成功
                }
                , error: function () {
                    //演示失败状态，并实现重传
                }
            });
        upload.render({
            elem: '#fileUpload1',
            data: {
                applicationId: uuid
            }
            ,accept:'file',
            url:ctx + "rzbl/fileUpload"
            , before: function (obj) {
                fileNameArr=[];
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {//异步
                    fileNameArr.push(file.name);
                    // $('#files').html(fileNameArr[0])
                });
            }
            , done: function (res,index,upload) {
                //如果上传失败
                urlPath.report=[];
                if (res.code == 0) {
                    urlPath.report.push(res.data)
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
            }
        });
        window.newTask=function(title){
            if(title=='new'){
                title="新建测试任务"
            }
            layer.open({
                type: 1
                ,title: title
                ,area: ['800px', '600px']
                ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                ,id: 'layerDemo'+title //防止重复弹出
                ,content: $('#modalContent')
                ,btnAlign: 'c' //按钮居中
                ,shade:  [0.5,'#000'] //不显示遮罩
                ,yes: function(){
                    layer.closeAll();
                }
            });
        }
        form.on('submit(newReport)', function (data) {
            var taskId='';
            if($('.layui-layer-title').html()=='编辑测试任务'){
                taskId=''
            }
            postData['id']=taskId;
            postData['taskName']=data.field.taskName;
            postData['systemName']=data.field.systemName;
            postData['businessType']=data.field.businessType;
            postData['managerDept']=data.field.managerDept;
            postData['developDept']=data.field.developDept;
            if(urlPath['plan'][0]){
                postData['testPlan']=urlPath['plan'][0];
            }else{
                postData['testPlan']='';
            }
            if(urlPath['report'][0]){
                postData['TestReport']=urlPath['report'][0];
            }else{
                postData['TestReport']='';
            }
          console.log(data)
            var submiting=false;
            if (!submiting) {
                submiting=true;
                $.ajax({
                    url: ctx + "rztask/saveRzTask",
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