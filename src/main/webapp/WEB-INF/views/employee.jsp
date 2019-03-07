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
    <title>申通快递.梧桐</title>
    <link rel="stylesheet" href="lib/sto/css/sto.css"/>
    <style type="text/css" rel="stylesheet">
        body {
            height: 90%;
            box-sizing: border-box;
        }

        .ibox_table {
            display: none;
        }

        .bootstrap-table .table {
            table-layout: fixed;
        !important;
        }
    </style>

</head>
<body class="pd-10 bg_white overflow_x_h">

<div class="page_head">
    <span class="page_title">查询</span>
    <div class="layui-btn-group f-r mr-15">
        <button class="layui-btn layui-btn-primary layui-btn-small btnName" id="search"><i class="iconfont icon-search"></i> 查询</button>
        <button class="layui-btn layui-btn-primary layui-btn-small btnName" id="addnew"><i class="iconfont icon-search"></i> 新增</button>
        <button class="layui-btn layui-btn-primary layui-btn-small btnName" id="exportAll" ><i class="iconfont icon-export"></i> 导出列表</button>
        <button class="layui-btn layui-btn-primary layui-btn-small btnName" id="downLoadCenter" ><i class="iconfont icon-download"></i> 下载中心</button>
    </div>
</div>
<div class="main_b mt-40 animated fadeInRight overflow_x_h">
    <div id="ibox" class="ibox mb-10">
        <div class="ibox_title">
            <span>条件查询</span>
            <div class="ibox_tools">
                <a class="collapse-link" href="javascript:void(0)">
                    <i class="iconfont icon-down"></i>
                </a>
            </div>
        </div>
        <div class="ibox_form">
        </div>
        <%--文件导出为Excel的表单，参数均为Excel参数--%>
        <form class="layui-form" id="queryform">
            <input type="hidden" name="queryCount" id="queryCount">
            <input type="hidden" name="userid" id="userid">
			<input type="hidden" name="exceltype" id="exceltype">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label width_90 f-12">编号(工号)</label>
                    <div class="layui-input-inline pos-r">

                        <%--实时联想--%>
                       <input type="text" name="code" id="code" data-provide="typeahead"
                              autocomplete="off" class="layui-input" />
                       <i class="icon_ca_layui"></i>

                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label width_90 f-12">用户名</label>
                    <div class="layui-input-inline pos-r">

                        <%--实时联想--%>
                        <input type="text" name="userName" id="userName" data-provide="typeahead"
                               autocomplete="off" class="layui-input" />
                        <i class="icon_ca_layui"></i>
                    </div>
                </div>
            </div>
        </form>

    </div>
    <input hidden="hidden" name="rn" id="rn">
    <div class="ibox">
        <div class="ibox_table show">
            <table id="table"></table>
        </div>
    </div>
    <script type="text/javascript" src="lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="lib/bootstrapTable/bootstrap-table.js"></script>
    <script type="text/javascript" src="lib/bootstrapTable/bootstrap.min.js"></script>
    <script type="text/javascript" src="lib/bootstrapTable/bootstrap-table-export.js"></script>
    <script type="text/javascript" src="lib/bootstrapTable/tableExport.js"></script>
    <script src="lib/bootstrapTable/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="lib/layerui/layui.js"></script>
    <script type="text/javascript" src="lib/sto/sto.js"></script>
    <script type="text/javascript" src="js/page/employee.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/bootstrap-typeahead.js"></script>
</div>
</body>

</html>