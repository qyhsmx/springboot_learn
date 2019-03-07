<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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

		<div class="ibox_form" id="form">
		    <form class="layui-form pl-20 pb-20 pt-10" action="" id="dataform" method="POST">
		    	<div class="layui-form-item layui-form-pane">
		    		<input type="hidden" id="id" name="id" value="${employee.id}"/>
					<div class="layui-inline">
			            <div class="layui-inline">
	                        <label class="layui-form-label width_90 f-12">编号(工号)</label>
	                        <div class="layui-input-inline pos-r">
	                            <input type="text" name="code" id="code"  
	                            	autocomplete="off" class="layui-input" 
	                            	data-provide="typeahead" lay-verify="required" value="${employee.code}"/>
	                            <i class="icon_ca_layui"></i>
	                        </div>
	                    </div>
			            <div class="layui-inline">
	                        <label class="layui-form-label width_90 f-12">登录名</label>
	                        <div class="layui-input-inline pos-r">
	                            <input type="text" name="userName" id="userName" 
	                            	autocomplete="off" class="layui-input" 
	                            	data-provide="typeahead" lay-verify="required" value="${employee.userName}"/>
	                            <i class="icon_ca_layui"></i>
	                        </div>
	                    </div>
			            <div class="layui-inline">
	                        <label class="layui-form-label width_90 f-12">姓名</label>
	                        <div class="layui-input-inline pos-r">
	                            <input type="text" name="realName" id="realName" 
	                            	autocomplete="off" class="layui-input" lay-verify="required" value="${employee.realName}"/>
	                            <i class="icon_ca_layui"></i>
	                        </div>
	                    </div>
	                    <div class="layui-inline">
	                        <label class="layui-form-label width_90 f-12">所属公司</label>
	                        <div class="layui-input-inline pos-r">
	                            <input type="text" name="companyid" id="companyid" data-provide="typeahead"
	                            	autocomplete="off" class="layui-input" lay-verify="required" value="${employee.companyid}"/>
	                            <i class="icon_ca_layui"></i>
	                        </div>
	                    </div> 	                    
	                 </div>
	             </div>
	             <button class="layui-btn" id="submit"  lay-filter="submit" lay-submit="" style="display: none;">立即提交</button>
		    </form>
		</div>
    <script type="text/javascript" src="/lib/jquery/jquery.js"></script>
    <script type="text/javascript" src="/lib/bootstrapTable/bootstrap-table.js"></script>
    <script type="text/javascript" src="/lib/bootstrapTable/bootstrap.min.js"></script>
    <script type="text/javascript" src="/lib/bootstrapTable/bootstrap-table-export.js"></script>
    <script type="text/javascript" src="/lib/bootstrapTable/tableExport.js"></script>
    <script src="/lib/bootstrapTable/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="/lib/layerui/layui.js"></script>
    <script type="text/javascript" src="/lib/sto/sto.js"></script>
    <script type="text/javascript" src="/js/page/employeeAdd.js?version=${timestamp }"></script>
</body>
</html>