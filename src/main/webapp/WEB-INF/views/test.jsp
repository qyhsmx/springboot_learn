<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>测试bootstrap table</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/bootstrap-typeahead.js"></script>

</head>
<body>
<input  id="local_data" autocomplete="off" data-provide="typeahead" type="text"
        class="input-sm form-control" placeholder="请输入(本地Array数据)" >

</body>
<script>

    $(function () {
        parseLocalArrayData();
    })

    var localArrayData = ['beijing', 'shanghai', 'guangzhou', 'sz', 'hangzhou', 'ningbo'];

    function parseLocalArrayData() {
        $("#local_data").typeahead({
            source: function (query,process) {

                $.post("typeahead",{code:query},function (data) {
                    console.log(data);
                    process(data);
                });

            },//数据源
            items: 8,//最多显示个数
            updater: function (item) {
                return item;//这里一定要return，否则选中不显示，外加调用display的时候null reference错误。
            },
            displayText: function (item) {
                return "选：" + item;//返回字符串
            },
            afterSelect: function (item) {
                //选择项之后的事件 ，item是当前选中的。
            },
            delay: 500//延迟时间
        });
        $("#look_up_array").click(function () {
            $("#local_data").typeahead("lookup", '选');
        });
        $("#get_value_array").click(function () {
            var val = $("#local_data").typeahead("getActive");
            console.log(val);
        });
    }

</script>
</html>