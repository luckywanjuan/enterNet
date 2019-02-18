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
        .layui-table-view .layui-table {width:100%}
    </style>
</head>
<body style="background: #fff">
<div class="layui-fluid ">
    <div class="layui-card ">
        <div class="layui-card-header">入网认证审批</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统化名称</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly autocomplete="off" value="系统化名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">业务类型</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly autocomplete="off" value="业务类型一" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">系统管理单位</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly autocomplete="off" value="系统管理单位" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">研制单位</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly autocomplete="off" value="研制单位" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">联系人</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly autocomplete="off" value="联系人" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly autocomplete="off" value="手机号" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">电子邮箱(必填)</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" value="电子邮箱"  placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">申请日期</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title" readonly value="申请日期" autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row">
                    <label class="layui-form-label">电子附件</label>
                    <div class="layui-col-md6">
                        <input type="text" name="title" lay-verify="title"  readonly value="电子附件"  autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text  layui-row">
                    <label class="layui-form-label">系统描述</label>
                    <div class=" layui-col-md6">
                        <textarea name="text" placeholder="请输入内容" readonly value="系统描述"  lay-verify="systemIntro" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <div style="text-align: center">
                            <button class="layui-btn" data-method="offset" data-type="auto" id="assest" type="button">
                                审核
                            </button>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <br>
            </form>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-col-md12">
            <table class="layui-table" id="assetTable" lay-filter="assetTable"></table>
        </div>
        <script type="text/html" id="databar">
           <a class="layui-btn  layui-btn-mini" href="" download lay-event="fujian">附件下载</a>
            <a class="layui-btn  layui-btn-mini" data-method="offset" data-type="auto" lay-event="shenhe">审核</a>
        </script>
    </div>
</div>
<div id="modalContent" style="display: none;">
    <div class="layui-fluid">
        <div class="layui-card">
            <div  class="layui-card-body">
                <form class="layui-form" lay-filter="ensureModal">
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">审批人</label>
                        <div class="layui-col-md6">
                            <input type="text" name="userName" lay-verify="" readonly autocomplete="off"  class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">审批日期</label>
                        <div class="layui-col-md6">
                            <input type="text" name="checkDate"   id="date" lay-verify="required|date" placeholder="请选择审批日期" autocomplete="off" class="layui-input" lay-key="1">                    </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">审批意见</label>
                        <div class=" layui-col-md6">
                            <textarea name="suggestion" placeholder="请输入审批意见"  lay-verify="systemIntro" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">审核结果</label>
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
    //var ctx = "http://192.168.0.105:8888/";
    var form,table,laypage,laytpl,layer;
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    var userId=userInfo.data.userId;
    var postData={};
    layui.use(['form', 'layedit', 'laydate', 'table', 'layer'],function () {
        var $ = layui.jquery;
        laypage = layui.laypage,form = layui.form,table = layui.table,laydate = layui.laydate, layer = layui.layer;
        laydate.render({
            elem: '#date'
        });
        $("input[name='userName']").val(userInfo.userName)
        var active={
            offset : function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type: 1
                    ,title: '认证申请审核'
                    ,area: ['800px', '600px']
                    ,offset: 'auto' //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,content: $('#modalContent')
                    ,btnAlign: 'c' //按钮居中
                    ,shade:  [0.5,'#000'] //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
        };
        var tableUrl = ctx + 'rzbl/queryAllCheckRzApp?isCheck='+0;
        function renderTable(){
            table.render({
                id: 'assetTable',
                elem: '#assetTable',
                page: true, //开启分页
                url: tableUrl,
                cols: [[ //表头
                    {field: 'applicationUserName', title: '系统名称',width:90}
                    ,{field: 'managerDept', title: '系统管理单位',width:110}
                    ,{field: 'developDept', title: '研制单位', width:90,totalRow: true}
                    ,{field: 'businessType', title: '业务类型',width:90}
                    ,{field: 'applicationUserName', title: '联系人',width:90}
                    ,{field: 'phone', title: '手机号',width:90}
                    ,{field: 'email', title: '电子邮箱',width:90}
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
        table.on('tool(assetTable)', function(obj) {
            tableData = obj.data ;//获得当前行数据
            layEvent = obj.event; //获得 lay-event 对应的值
            var othis = $(this);
            if(layEvent==='fujian'){
                var attachment=tableData.attachment;
                var indexx =attachment.indexOf("upload");
                if(null!=attachment&&''!=attachment&&indexx!=-1){
                    var subStr=attachment.substr(indexx,attachment.length);
                    var pathUrl=ctx+subStr.replace(/\\/g,'/');
                    othis.attr('href',pathUrl)
                }
            }else if(layEvent==='shenhe'){
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
                renderTable();
            }
        });
        form.on('submit(assetForm)', function (data) {
            console.log(data)
            postData['applicationId']=tableData.id
            postData['checkUserName']= $("input[name='userName']").val();
            postData['checkDate']= data.field.checkDate;
            postData['suggestion']= data.field.suggestion;
            postData['result']= data.field.agree;
            postData['userId']= userId;
            $.ajax({
                url: ctx + "rzbl/updateCheckRzApplication",
                data: postData,
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (resp) {
                    layer.alert('提交成功');
                    layer.closeAll();
                    table.reload('assetTable',{});
                }, error: function () {
                }
            })
        })
       $('#assest').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('.canclebtn').on('click',function () {
            layer.closeAll();
        });
    })
</script>
</body>
</html>