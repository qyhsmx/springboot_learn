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
		<title>申通快递.梧桐</title>
		<link rel="stylesheet" href="lib/sto/css/sto.css" />
		<link rel="stylesheet" href="lib/jtree/themes/default/style.css"  />
		<style type="text/css" rel="stylesheet">
			body{
				height: 100%;
				box-sizing: border-box;
			}
			.info{
				padding-left: 20px;
				padding-top: 10px;
				padding-bottom: 10px;
				font-size: 14px;
				color: red;
			}
			.fontColor{
				color: #0080FF;
			}
			.cloumnPad1{
				padding-left: 25px
			}
			.cloumnPad2{
				padding-left: 35px
			}
			.cl:after,
			.clearfix:after {
			  content: "\20";
			  display: block;
			  height: 0;
			  clear: both;
			  visibility: hidden;
			}
			.cl,
			.clearfix {
			  zoom: 1;
			}
			.ml{
				margin-left: 10px
			}
			 ul li {
			  float: left;
			  margin-right:25px;
			}
			.mb{
				margin-bottom:10px;
			}
		</style>

	</head>
<body>
 		<div>
 			<div id= "sxz" class="databox">
 				<p class="fontColor">员工信息</p>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>编号(工号)：</span><span>${detail.code}</span></li>
 					<li style="width:220px"><span>登录名，用户名：</span><span>${detail.userName}</span></li>
 					<li style="width:220px"><span>姓名：</span><span></span>${detail.realName}</li>
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>快速查询：</span><span>${detail.quickQuery}</span></li>
 					<li style="width:220px"><span>简拼：</span><span>${detail.simpleSpelling}</span></li>
 					<li style="width:220px"><span>岗位(职位)：</span><span>${detail.duty}</span></li>
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>性别：</span><span>${detail.gender}</span></li>
 					<li style="width:220px"><span>所属公司代码：</span><span>${detail.companyid}</span></li>
 					<li style="width:220px"><span>身份证号码：</span><span>${detail.idcard}</span></li>
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>呢称（身份证姓名）：</span><span></span></li>
 					<li style="width:220px"><span>职称、职位：</span><span></span></li>
 					<li style="width:220px"><span>出生日期：</span><span></span></li>
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>公司主键：</span><span></span></li>
 					<li style="width:220px"><span>公司编号：</span><span></span></li>
 					<li style="width:220px"><span>公司名称：</span><span></span></li>
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>部门主键：</span><span></span></li>
 					<li style="width:220px"><span>部门编号：</span><span></span></li>
 					<li style="width:220px"><span>部门名称：</span><span></span></li>
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>分支机构主键：</span><span></span></li>
 					<li style="width:220px"><span>分支机构名称：</span><span></span></li>
 					<li style="width:220px"><span>子部门主键：</span><span></span></li>
 					<!-- <li style="width:160px"><span>子部门名称：</span><span></span></li> -->
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>性别：</span><span></span></li>
 					<li style="width:220px"><span>个性签名：</span><span></span></li>
 					<li style="width:220px"><span>身份证号码：</span><span></span></li>
 					<!-- <li style="width:160px"><span>出生日期：</span><span></span></li> -->
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>工作组主键：</span><span></span></li>
 					<li style="width:220px"><span>工作组名称：</span><span></span></li>
 					<li style="width:220px"><span>省主键：</span><span></span></li>
 					<!-- <li style="width:160px"><span>省：</span><span></span></li> -->
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>市主键：</span><span></span></li>
 					<li style="width:220px"><span>市：</span><span></span></li>
 					<li style="width:220px"><span>县区主键：</span><span></span></li>
 					<!-- <li style="width:160px"><span>县：</span><span></span></li> -->
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>家庭住址：</span><span></span></li>
 					<li style="width:220px"><span>描述：</span><span></span></li>
 					<li style="width:220px"><span>是否超级管理员：</span><span></span></li>
 					<!-- <li style="width:160px"><span>工作行业：</span><span></span></li> -->
 				</ul>
 				<ul class="clearfix mb">
 					<li style="width:220px"><span>安全级别：</span><span></span></li>
 					<li style="width:220px"><span>语言：</span><span></span></li>
 					<li style="width:220px"><span>系统样式选择：</span><span></span></li>
 					<!-- <li style="width:160px"><span>积分：</span><span></span></li> -->
 				</ul>			
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
		<script type="text/javascript" src="lib/jtree/jstree.js"></script>
		<script type="text/javascript">
		layui.use(['layer', 'form', 'layedit', 'laydate', 'test', 'autocomplete', 'element'], function () {
		    var form = layui.form()
		        , layer = layui.layer
		        , layedit = layui.layedit
		        , laydate = layui.laydate
		        , test = layui.test
		        , autocomplete = layui.autocomplete
		        , element = layui.element()
		    test.restVal();
		    test.selectMove();
		    test.formToggle({
		        ifTableResize: true
		    });
		});

		</script>
</body>
</html>