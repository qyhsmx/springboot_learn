<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
	    <base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>运单状态查询</title>
		<link rel="stylesheet" href="lib/sto/css/sto.css" />
		<style type="text/css" rel="stylesheet">
			body{
				height: 100%;
				box-sizing: border-box;
			}
			
		</style>

	</head>
	<body class="pd-10 bg_white overflow_x_h">
 
		<div class="page_head">
			<div class="layui-btn-group f-r mr-15">
				<button class="layui-btn layui-btn-primary layui-btn-small btnName" id="search" style="margin:5px;"><i class="iconfont icon-search"></i> 查询</button>
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
					<form class="layui-form" id="queryform" method="post">
						<input type="hidden" id="queryOrderCount" name="queryOrderCount"/>
						<div class="layui-form-item layui-form-pane">
							<div class="layui-inline">
								<label class="layui-form-label width_90 f-12">操作时间</label>
								<div class="layui-input-inline pos-r">
									<input type="text" name="start" style="width:160px;" id="downTimeStart" lay-verify="downTime" value="${downTimeStart }"
										autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this,format:'YYYY-MM-DD hh:mm:ss'})">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label width_90 f-12">至</label>
								<div class="layui-input-inline pos-r">
									<input type="text" name="start" style="width:160px;" id="downTimeEnd" lay-verify="downTimeEnd" value="${downTimeEnd }"
										autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this,format:'YYYY-MM-DD hh:mm:ss'})">
								</div>
							</div>
							<!-- <div class="layui-inline">
								<label class="layui-form-label width_90 f-12">模块名称</label>
								<div class="layui-input-inline pos-r" style="width:160px;">
									<select id="moduleType" name="moduleType" style="width:160px;">
										<option value="全部">全部</option>
										<option value="货量统计">货量统计</option>
										<option value="货量统计同环比">货量统计同环比</option>
										<option value="货量多维统计">货量多维统计</option>
									</select>
								</div>
							</div> -->
						</div>
					</form>
				</div>
			</div>
			<div class="ibox">
				<div class="ibox_table">
					<table id="table"></table>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="lib/jquery/jquery.js"></script>
		<script type="text/javascript" src="lib/bootstrapTable/bootstrap-table.js" ></script>
		<script type="text/javascript" src="lib/bootstrapTable/bootstrap.min.js" ></script>
		<script type="text/javascript" src="lib/bootstrapTable/bootstrap-table-export.js" ></script>
		<script type="text/javascript" src="lib/bootstrapTable/tableExport.js" ></script>
		<script src="lib/bootstrapTable/bootstrap-table-zh-CN.min.js"></script>
		<script type="text/javascript" src="lib/layerui/layui.js" ></script>
		<script type="text/javascript" src="lib/sto/sto.js"></script>
		<script type="text/javascript" src="js/page/downloadinfo.js?version=${timestamp }"></script>
	</body>
</html>