<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css" media="all">
    <style>
        .layui-form-label{
            width: 95px;
        }
        .layui-table-view .layui-table {width:100%}
        .middle_text{
            line-height: 38px;
        }
    </style>
</head>
<body style="background: #fff">
<div class="layui-card-header">认证结果查询</div>
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
        <button class="layui-btn layui-btn-sm" type="button"  onclick="doSearch()" lay-submit  lay-filter="component-form-demo1"  >
            查询
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
                        <label class="layui-form-label">审批人:</label>
                        <div class="layui-col-md6 middle_text"  id="userName"></div>
                    </div>
                    <div class="layui-form-item layui-row">
                        <label class="layui-form-label">审批日期:</label>
                        <div class="layui-col-md6 middle_text" id="checkDate"></div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">审批意见:</label>
                        <div class=" layui-col-md6 middle_text" id="suggestion">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text  layui-row">
                        <label class="layui-form-label">审核结果:</label>
                        <div class="layui-input-block middle_text" id="agree"></div>
                    </div>
                    <div class="layui-form-item layui-layout-admin">
                        <div class="layui-input-block">
                            <div style="text-align: center">
                                <button class="layui-btn" type="button" id="closeMask">
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
   // var ctx = "http://192.168.0.105:8888/";
    var postData={};
    var table,laypage,laytpl,layer;
    var userInfo=JSON.parse(sessionStorage.getItem('userInfo'));
    var userId=userInfo.data.userId;
    layui.use(['table','laypage','laytpl','layer'], function(){
        laypage = layui.laypage,table = layui.table,laytpl = layui.laytpl,layer=layui.layer;//分页 //表格
        var $ = layui.jquery;
        postData['userId']=userId;
        function calcTabelCellWidth(perc) {
            var winwidth = $(window).width();
            return perc * winwidth;
        }
        getTableList();
       function getTableList(){
           postData['systemName']=$("input[name='systemName']").val();
           postData['developDept']=$("input[name='developDept']").val();
           postData['managerDept']=$("input[name='managerDept']").val();
           postData['page']='';
           postData['limit']='';
           $.ajax({
               url: ctx + "rzbl/queryAllRzApp",
               data:postData ,
               type: 'post',
               dataType: 'json',
               async: false,
               success: function (resp) {
                   if(resp){
                       table.render({
                           elem: '#roletable'
                           ,height: 420
                           ,data:resp.data
                           ,title: '用户表'
                           ,limit: 1
                           ,count: resp.count
                           ,page: true //开启分页
                           //,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                           ,totalRow: true //开启合计行
                           ,even: true //隔行背景
                           ,cols: [[ //表头
                               {field: 'zizeng', title: '序号',type:'numbers', width:calcTabelCellWidth(0.1), sort: true}
                               ,{field: 'systemName', title: '系统名称',width:calcTabelCellWidth(0.1)}
                               ,{field: 'developDept', title: '研制单位', width:calcTabelCellWidth(0.1),totalRow: true}
                               ,{field: 'businessType', title: '业务类型',width:calcTabelCellWidth(0.1)}
                               ,{field: 'createDate', title: '申请时间', width:calcTabelCellWidth(0.1)}
                               ,{field: 'checkDate', title: '审核时间',width:calcTabelCellWidth(0.1),totalRow: true}
                               ,{field: 'result', title: '状态', width:calcTabelCellWidth(0.1)}
                               ,{ fixed: 'right',title: '操作', align:'center',width:300, toolbar: '#databar'}
                           ]]
                       });
                   }
               }, error: function () {
               }
           })
       }
       function getPerReault(id){
           $.ajax({
               url: ctx + "rzbl/getRzApplication",
               data:{
                   id:id
               } ,
               type: 'post',
               dataType: 'json',
               async: false,
               success: function (resp) {
                   $('#userName').html(resp.data.rz.checkUserName)
                   $('#checkDate').html(resp.data.rz.checkDate)
                   $('#suggestion').html(resp.data.rz.suggestion)
                   $('#agree').html(resp.data.rz.result)

                   layer.open({
                       type: 1
                       ,title: '入网结论查看'
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
               }, error: function () {
               }
           })
       }
        table.on('tool(roletable)', function(obj) {
            tableData = obj.data; //获得当前行数据
            layEvent = obj.event; //获得 lay-event 对应的值
            console.log(tableData)
            console.log(layEvent)
            if(layEvent==='enterNet'){
                getPerReault(tableData.id)
            }
        });
       $('#closeMask').on('click',function () {
           layer.closeAll();
       })
        window.doSearch=function() {
            postData['systemName']=$("input[name='systemName']").val();
            postData['developDept']=$("input[name='developDept']").val();
            postData['managerDept']=$("input[name='managerDept']").val();
            table.reload('roletable', {
                where: { //设定异步数据接口的额外参数，任意设
                    userId:userId,
                    systemName: $("#companyName").val(),
                    developDept: $("input[name='developDept']").val(),
                    managerDept: $("input[name='managerDept']").val()
                }
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