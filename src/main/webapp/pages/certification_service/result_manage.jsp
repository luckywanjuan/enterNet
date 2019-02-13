<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css" media="all">
    <style>
        .layui-form-label{
            width: 95px;
        }
    </style>
</head>
<body style="background: #fff">
<div class="layui-card-header">认证申请管理</div>
<br>
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
<div class="layui-row">
    <div class="layui-col-md12">
        <table class="layui-table" id="resultManageTable" lay-filter="resultManageTable"></table>
    </div>
    <script type="text/html" id="databar">
        <a class="layui-btn layui-btn-xs" lay-event="enterNet">入网结论修改</a>
        <a class="layui-btn layui-btn-xs uploadFile" lay-event="testReport" >测试报告上传</a>
    </script>
</div>
<script src="../../assets/layui/layui.js"></script>
<script>
    var ctx = "${pageContext.request.contextPath}/";
    var ctx = "http://192.168.0.105:8888/";
    var postData={};
    var table,laypage,laytpl,upload;
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    var userId=userInfo.data.userId;
    layui.use(['table','laypage','upload','laytpl'], function(){
        laypage = layui.laypage,table = layui.table,laytpl = layui.laytpl,upload = layui.upload;//分页 //表格
        var $ = layui.jquery;
        postData['userId']=userId;
        getTableList();
        function getTableList(){
            postData['systemName']=$("input[name='systemName']").val();
            postData['developDept']=$("input[name='developDept']").val();
            postData['managerDept']=$("input[name='managerDept']").val();
            postData['isCheck']=1;
            table.render({
                id: 'resultManageTable',
                elem: '#resultManageTable',
                page: true, //开启分页
                url: ctx + "rzbl/queryAllCheckRzApp",
                where: postData,
                cols: [[ //表头
                    {field: 'applicationUserName', title: '系统名称',width:90}
                    ,{field: 'managerDept', title: '系统管理单位',width:110}
                    ,{field: 'developDept', title: '研制单位', width:90,totalRow: true}
                    ,{field: 'businessType', title: '业务类型',width:90}
                    ,{field: 'businessType', title: '审核时间',width:90}
                    ,{field: 'createDate', title: '申请时间', width:90}
                    ,{ title: '操作', align:'center',width:180, toolbar: '#databar'}
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
        table.on('tool(resultManageTable)', function(obj) {
            tableData = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
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
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
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

    });
</script>
</body>
</html>