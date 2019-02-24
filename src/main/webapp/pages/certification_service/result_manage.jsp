<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../assets/css/common.css" media="all">
    <style>
        .layui-form-label{
            width: 95px;
        }
        .layui-table-view .layui-table {width:100%}
    </style>
</head>
<body style="background: #fff">
<div class="layui-card-header">认证申请管理</div>
<br>
<div class="layui-fluid ">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md3">
            <label class="layui-form-label">系统化名称：</label>
            <div class="layui-col-md6">
                <input type="text" name="systemName"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入系统化名称" class="layui-input">
            </div>
        </div>
        <div class="layui-col-md3">
            <label class="layui-form-label">研制单位：</label>
            <div class="layui-col-md6">
                <input type="text" name="developDept"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入研制单位" class="layui-input">
            </div>
        </div>
        <div class="layui-col-md6">
            <label class="layui-form-label">管理单位：</label>
            <div class="layui-col-md3">
                <input type="text" name="managerDept"  lay-verify="required|systemName" autocomplete="off" placeholder="请输入管理单位" class="layui-input">
            </div>
            <div class="layui-col-md2">&nbsp;</div>
            <button class="layui-btn layui-btn-sm" type="button" onclick="doSearch()"  lay-submit  >
                查询
            </button>
        </div>
    </div>
    <table class="layui-hide" id="resultManageTable" lay-filter="resultManageTable"></table>
</div>
<script type="text/html" id="databar">
    <a class="layui-btn layui-btn-xs" lay-event="enterNet">入网结论修改</a>
    <a class="layui-btn layui-btn-xs uploadFile" lay-event="testReport" >测试报告上传</a>
</script>
<div id="modalContent" style="display: none;">
    <div class="layui-fluid">
        <div class="layui-card">
            <div  class="layui-card-body">
                <form class="layui-form" lay-filter="editModal">
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">审批人:</label>
                        <div class="layui-col-md6 middle_text" >
                            <input  id="userName" name="userName"  class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">审批日期:</label>
                        <div class="layui-col-md6 middle_text" >
                            <input type="text" name="createDate"  id="createDate" lay-verify="createDate" placeholder="请选择申请日期" autocomplete="off" class="layui-input" lay-key="1">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">审批意见:</label>
                        <div class=" layui-col-md6 middle_text" >
                            <textarea name="suggestion" id="suggestion" placeholder="请输入审批意见"  lay-verify="systemIntro" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">审核结果:</label>
                        <div class="layui-input-block">
                            <input type="radio" name="agree" value="通过" title="通过" checked="">
                            <input type="radio" name="agree" value="不通过" title="不通过">
                        </div>
                    </div>
                    <div class="layui-form-item layui-layout-admin">
                        <div class="layui-input-block">
                            <div style="text-align: center">
                                <button type="reset" class="layui-btn layui-btn-primary canclebtn" >取消</button>
                                <button class="layui-btn" type="button" lay-submit  lay-filter="assetForm"  id="submit">
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
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var postData={},assetData={};
    var form,table,laypage,laytpl,laydate,upload;
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    var userId=userInfo.data.userId;
    layui.use(['form','table','laypage','upload','laydate', 'laytpl'], function(){
        form= layui.form,laypage = layui.laypage,laydate = layui.laydate,table = layui.table,laytpl = layui.laytpl,upload = layui.upload;//分页 //表格
        var $ = layui.jquery;
        postData['userId']=userId;
        laydate.render({
            elem: '#createDate'
        });
        getTableList();
        function getTableList(){
            postData['systemName']=$("input[name='systemName']").val();
            postData['developDept']=$("input[name='developDept']").val();
            postData['managerDept']=$("input[name='managerDept']").val();
            postData['isCheck']=1;
            table.render({
                elem: '#resultManageTable',
                page: true, //开启分页
                url: ctx + "rzbl/queryAllCheckRzApp",
                where: postData,
                cols: [[ //表头
                    {field: 'applicationUserName', title: '系统名称',width:'15%'}
                    ,{field: 'managerDept', title: '系统管理单位',width:'15%'}
                    ,{field: 'developDept', title: '研制单位', width:'10%',totalRow: true}
                    ,{field: 'businessType', title: '业务类型',width:'10%'}
                    ,{field: 'checkDate', title: '审核时间',width:'10%'}
                    ,{field: 'createDate', title: '申请时间', width:'10%'}
                    ,{field: 'result', title: '状态', width:'10%'}
                    ,{fixed: 'right', title: '操作', align:'center',width:'20%', toolbar: '#databar'}
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
        function guid() {
            function S4() {
                return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
            }
            return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
        }
        uuid=guid();
        function getPerReault(id){
            layer.open({
                type: 1
                ,title: '入网结论修改'
                ,area: ['800px', '600px']
                ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                ,id: 'layerDemo1'//防止重复弹出
                ,content: $('#modalContent')
                ,btnAlign: 'c' //按钮居中
                ,shade:  [0.5,'#000'] //不显示遮罩
                ,yes: function(){
                    layer.closeAll();
                }
            });
            $.ajax({
                url: ctx + "rzbl/getRzApplication",
                data:{
                    id:id
                } ,
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    var perItem=resp.data.rz;
                    form.val('editModal', {
                        "userName":perItem.checkUserName // "name": "value"
                        ,"suggestion": perItem.suggestion
                        ,"agree": perItem.result //单选选中状态
                    })
                    laydate.render({
                        elem: '#createDate',
                        value:perItem.checkDate
                    });
                }, error: function () {
                }
            })
        }
        form.on('submit(assetForm)', function (data) {
            assetData['applicationId']=tableData.id;
            assetData['checkUserName']= $("input[name='userName']").val();
            assetData['checkDate']= data.field.createDate;
            assetData['suggestion']= data.field.suggestion;
            assetData['result']= data.field.agree;
            assetData['userId']= userId;
            $.ajax({
                url: ctx + "rzbl/updateCheckRzApplication",
                data: assetData,
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    layer.alert('提交成功');
                    layer.closeAll();
                    table.reload('resultManageTable',{});
                }, error: function () {
                }
            })
        })
        table.on('tool(resultManageTable)', function(obj) {
            tableData = obj.data; //获得当前行数据
            layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent==='testReport'){
                upload.render({
                    elem: '.uploadFile'
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
                // document.location.href = ctx + "actions/sysm/doExport.action";
            }else if(layEvent==='enterNet'){
                getPerReault(tableData.id)
            }
        });
        window.uploadFile=function(that){
            console.log(that);
           /* upload.render({
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
            });*/
        }
        window.doSearch=function() {
            console.log('aaa');
            postData['systemName']=$("input[name='systemName']").val();
            postData['developDept']=$("input[name='developDept']").val();
            postData['managerDept']=$("input[name='managerDept']").val();
            table.reload('resultManageTable', {
                where: postData
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            })
            // getTableList();
        }
        $('.canclebtn').on('click',function () {
            layer.closeAll();
        });

    });
</script>
</body>
</html>