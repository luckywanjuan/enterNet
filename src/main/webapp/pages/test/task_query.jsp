<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/layui/css/layui.css" media="all">
    <style>
        .layui-form-label{
            width: 90px;
        }
        .layui-table-view .layui-table {width:100%}
        .middle_text{
            line-height: 38px;
        }
        .alert_content{
            color: #fff;
        }
    </style>
</head>
<body>

<div class="layui-card-header">测试任务查询</div>
<br>
<div class="layui-fluid">
    <div class="layui-row layui-col-space12">
        <div class="layui-col-md3">
            <label class="layui-form-label">任务名称：</label>
            <div class="layui-col-md6">
                <input type="text" name="task"  lay-verify="required|task" autocomplete="off" placeholder="请输入任务名称" class="layui-input">
            </div>
        </div>
        <div class="layui-col-md3">
            <label class="layui-form-label">系统名称：</label>
            <div class="layui-col-md6">
                <input type="text" name="system"  lay-verify="required|system" autocomplete="off" placeholder="请输入系统名称" class="layui-input">
            </div>
        </div>
        <div class="layui-col-md3">
            <label class="layui-form-label">研制单位：</label>
            <div class="layui-col-md6">
                <input type="text" name="develop"  lay-verify="required|develop" autocomplete="off" placeholder="请输入研制单位" class="layui-input">
            </div>
        </div>
        <%--<div class="layui-col-md3 layui-form">
            <label class="layui-form-label">进度</label>
            <div class="layui-col-md4">
                <select name="businessType" lay-verify="required|businessType">
                    <option value="" selected="">进行中</option>
                    <option value="业务1">完成</option>
                </select>
            </div>
        </div>--%>

        <div class="layui-col-md6">
            <label class="layui-form-label">管理单位：</label>
            <div class="layui-col-md3">
                <input type="text" name="manager"  lay-verify="required|manager" autocomplete="off" placeholder="请输入管理单位" class="layui-input">
            </div>
            <div class="layui-col-md1">&nbsp;</div>
            <button class="layui-btn layui-btn-sm" type="button"  onclick="doSearch()" lay-submit  lay-filter="component-form-demo1"  onclick="doSearch()">
                搜索
            </button>
            <button class="layui-btn layui-btn-sm" type="button"  onclick="newTask('new')" lay-submit  lay-filter="component-form-demo1"  >
                +新建任务
            </button>
        </div>
    </div>
    <table class="layui-hide" id="demo" lay-filter="demo"></table>
</div>
<script type="text/html" id="tableBar">
    <button class="layui-btn layui-btn-xs"  lay-event="taskEdit">编辑</button>
    <button class="layui-btn layui-btn-xs"   lay-event="taskLook">查看</button>
</script>
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
<div id="look" style="display: none;">
    <div class="layui-fluid">
        <div class="layui-card">
            <div  class="layui-card-body">
                <form class="layui-form" lay-filter="ensureModal">
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">测试任务名称:</label>
                        <div class=" layui-col-md3 alert_content" style="margin-top: 5px" name="taskNameLook"></div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">关联系统名称:</label>
                        <div class=" layui-col-md3 alert_content" style="margin-top: 5px" name="systemNameLook"></div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">系统管理单位:</label>
                        <div class=" layui-col-md3 alert_content" style="margin-top: 5px" name="managerDeptLook"></div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">研制单位:</label>
                        <div class=" layui-col-md3 alert_content" style="margin-top: 5px" name="developDeptLook"></div>
                    </div>
                    <div class="layui-form-item layui-layout-admin">
                        <div class="layui-input-block">
                            <div style="text-align: center">
                                <button class="layui-btn" type="button" id="ensureBtn">
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
<script src="${pageContext.request.contextPath}/assets/common/function.js"></script>
<script src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<script>
   var ctx = "${pageContext.request.contextPath}/";
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
            }else{
                title="编辑测试任务"
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
                taskId=tableData.id
            }
            postData['id']=taskId;
            postData['taskName']=data.field.taskName;
            postData['systemName']=data.field.systemName;
            /*postData['businessType']=data.field.businessType;*/
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
                            layer.closeAll();
                            renderTable();
                        } else {
                            layer.alert(resp.errorMsg);
                        }
                    }, error: function () {
                        submiting = false;
                    }
                })
            }
        })
        var tableUrl = ctx + 'rztask/getRzTask';
        function renderTable(){
            table.render({
                elem: '#demo'
                ,height: 420
                ,url: tableUrl //数据接口
                ,title: '测试任务表'
                ,page: true //开启分页
                ,where: {
                    "taskName":$("input[name='task']").val(),
                    "systemName":$("input[name='system']").val(),
                    "developDept":$("input[name='develop']").val(),
                    "managerDept":$("input[name='manager']").val(),
                } //条件搜索
              //  ,totalRow: true //开启合计行
                ,cols: [[ //表头
                    {field: 'zizeng', title: 'ID', width:'10%',type:'numbers'}
                    ,{field: 'taskName', title: '任务名称',width:'15%',}
                    ,{field: 'systemName', title: '系统名称',width:'15%'}
                    ,{field: 'developDept', title: '研制单位', width:'15%',totalRow: true}
                    ,{field: 'managerDept', title: '管理单位', width:'15%',totalRow: true}
                    ,{field: 'createTime', title: '时间', width:'10%'}
                    ,{fixed: 'right', title: '操作',width:'15%', toolbar: '#tableBar'}
                ]]
            });
        }
        renderTable();
        table.on('tool(demo)', function(obj) {
            tableData = obj.data; //获得当前行数据
            layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent==='taskEdit'){
                newTask('edit');
                $('input[name=taskName]').val(tableData.taskName)
                $('select[name=systemName]').val(tableData.systemName)
                $('input[name=managerDept]').val(tableData.managerDept)
                $('input[name=developDept]').val(tableData.developDept)
            }else{
                layer.open({
                    type: 1
                    ,title:'edit'
                    ,area: ['800px', '600px']
                    ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemoedit' //防止重复弹出
                    ,content: $('#look')
                    ,btnAlign: 'c' //按钮居中
                    ,shade:  [0.5,'#000'] //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
                $('div[name=taskNameLook]').html(tableData.taskName);
                $('div[name=systemNameLook]').html(tableData.systemName);
                $('div[name=managerDeptLook]').html(tableData.managerDept);
                $('div[name=developDeptLook]').html(tableData.developDept);
            }
        });
        $('#ensureBtn').on('click',function(){
            layer.closeAll();
        });
        window.doSearch=function(){
            renderTable();
        }
    });

</script>
</body>
</html>