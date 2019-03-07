$(function () {
    table();
    setTableHeight();

    //查询
    $("#search").click(function (e) {

        $('#table').bootstrapTable('refresh', {url: 'employee/queryData'});

    });

	/*$.ajax({
		url: "employee/queryData",
		type:"post",
		dataType:"json",
		success: function (data)
		{

			console.log(data);

			var code = $("select[name=code]");

			var options = "";

			for (var i = 0; i < data.rows.length; i++) {

				var val = data.rows[i].code;

				options+="<option value='"+val+"'>"+val+"</option>";
			}
			code.append(options);
		}
	})*/






    $("#add").click(function (e) {
    	layer.open({
    		type : 2,
    		offset : 'auto',
    		area : [ '800', '800' ],
    		content : 'employee/addnew',
    		end: function () {
    			$('#table').bootstrapTable('refresh', {url: 'employee/queryData'});
            }
    	});
    });

    //清除
    $("#clear").click(function (e) {
        $("#distributionType").empty();

        $("#valueAddedService").empty();

        $("#coverageArea").empty();
    });

    $('body').on('click', '.bootstrap-table .fixed-table-container .pagination li a', function (e) {
        e.preventDefault();
    });
});

$("#downLoadCenter").click(function() {
	layer.open({
		type : 2,
		title : '导出列表明细',
		area : [ '1000px', '550px' ],
		content : 'DownLoadInfoQuery/execute'
	});
})

//新增配置
$("#addnew").click(function() {
	var index =layer.open({
		type : 2,
		area : [ '800px', '800px' ],
		title : '新增信息',
		content : 'employee/addnew',
		btn : [ '保存', '取消' ],
		yes: function(index,layero){
    		//子界面表单提交,控制逻辑在子界面
			var submit = $(window.frames["layui-layer-iframe" + index].document).find("#submit");
			submit.click();
		},
		end: function () {
			$('#table').bootstrapTable('refresh', {url: 'employee/queryData'});
        }
	})
});  

function isContains(str, substr) {
    return str.indexOf(substr) >= 0;
}

$("#exportAll").click(function() {

	var qCount = $("#queryCount").val();

	if (Number(qCount) == 0 || qCount == null || qCount == '') {

		layer.msg("请先查询再导出!");

		return;
	}

	$("#exceltype").val("downUserList");

	downExcelFun();

});

function downExcelFun() {

	// 弹窗提示
	layer.load(0.3, {
		shade : [ 0.3, '#fff' ]
	});
	$.ajax({
		url : "employee/downloadexl",
		type : "POST",
		data : $('#queryform').serialize(),
		dataType : "json",
		success : function(data) {
			layer.closeAll();
			layer.msg(data.msg);
		}
	});
}

//查全部
function table() {
    $('#table').bootstrapTable({
        method: 'post',
        url: 'employee/queryData',
        contentType: "application/x-www-form-urlencoded",
        height: tableHeight(),
        striped: true,
        clickToSelect: true,
        pagination: true,//是否分页
        singleSelect: true,
        dataField: "rows",
        queryParamsType: "limit",
		//对应查询数据中   queryParams 方法的 参数
		// 对象属性{"sortName":"price","sortOrder":"desc","pageSize":10,"pageNumber":1}
        sidePagination: 'server',//指定服务器端分页
        pageNumber: 1, //初始化加载第一页，默认第一页
        pageList: [5, 10, 15],
        pageSize: 5,
        /*操作按钮在水平方向的位置*/
        paginationHAlign: "left",
        /*分页条在水平方向的位置*/
        paginationDetailHAlign: "right",
        /*分页详细信息在水平方向的位置*/
        paginationPreText: "上一页",
        /*指定上一页的内容*/
        paginationNextText: "下一页",
        uniqueId: 'id',
        columns: [
			{
				checkbox : true,
				fixed : 'left',
				align : 'center',
				valign : 'middle',
				width : 80
			},
			{
				title : '编号(工号)',
				field : 'code',
				align : 'center',
				valign : 'middle',
				width : 120
			},
			{
				title : '登录名',
				field : 'userName',
				align : 'center',
				valign : 'middle',
				width : 80
			},
			{
				title : '姓名',
				field : 'realName',
				align : 'center',
				valign : 'middle',
				width : 80
			},
			{
				title : '呢称',
				field : 'nickName',
				align : 'center',
				valign : 'middle',
				width : 80
			},
			{
				title : '岗位(职位)',
				field : 'duty',
				align : 'center',
				valign : 'middle',
				width : 80
			},
			{
				title : '职称、职位',
				field : 'title',
				align : 'center',
				valign : 'middle',
				width : 80
			},
			{
				title : '操作',
				align : 'center',
				width : 80,
				field : 'operation',
				formatter : function(value, row,
						index) {
					var info = '<a href="javascript:void(0)" onclick="detail(\''+ row.id+ '\')" class="btn-link-sto f-b"><span>详情</span></a>&nbsp;&nbsp;&nbsp;&nbsp;'+
								'<a href="javascript:void(0)" onclick="modifyemployee(\''+ row.id+ '\')" class="btn-link-sto f-b"><span>修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;'+
								'<a href="javascript:void(0)" onclick="deleteemployee(\''+ row.id+ '\')" class="btn-link-sto f-b"><span>删除</span></a>';
					return info;
				}
			},           
        ],
        queryParams: function (params) {
            return {
                //每页多少条数据
                pageSize: params.limit,

                //请求第几页
                offset: params.offset,

                //携带的查询条件
                code: $("#code").val(),

                userName: $("#userName").val()
            }
        },

        onLoadSuccess: function (data) {

            if (data.status != "true") {

				console.log(data);

            } else {

                $("#queryCount").val(data.total);

            }
        },
        onClickRow: function (row, $element) {
            $($element).addClass("selected").siblings().removeClass("selected");
        }
    });
}

layui.use(['layer', 'form', 'layedit', 'laydate', 'test', 'autocomplete', 'element'], function () {
    var form = layui.form()
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate
        , test = layui.test
        , autocomplete = layui.autocomplete
        , element = layui.element;
    test.restVal();
    test.selectMove();
    test.formToggle({
        ifTableResize: true
    });

	/**
	 * 条件搜索
	 */


	$("#code").typeahead({
		source: function (query,process) {

			$.post("employee/queryByCodeAndUsername",{code:query},function (data) {

				console.log(data);
				for(i in data){
					data[i] = data[i].code+'';
				}
				//处理后台数据
				process(data);
			});

		},
		afterSelect: function (item) {
			//选择完成后把选择的值放入输入框
			$("#code").val(item);
		}
	});
	$("#userName").typeahead({
		source: function (query,process) {

			$.post("employee/queryByCodeAndUsername",{userName:query},function (data) {

				console.log(data);
				for(i in data){
					data[i] = data[i].userName+'';
				}
				//处理后台数据
				process(data);
			});

		},
		afterSelect: function (item) {
			//选择完成后把选择的值放入输入框
			$("#userName").val(item);
		}
	});


});


function modifyemployee(id){
	var index =layer.open({
		type : 2,
		area : [ '750px', '300px' ],
		title : '新增信息',
		content : 'employee/modifyemployee?id=' + id ,
		btn : [ '保存', '取消' ],
		yes: function(index,layero){
    		//子界面表单提交,控制逻辑在子界面
			var submit = $(window.frames["layui-layer-iframe" + index].document).find("#submit");
			submit.click();
		},
		end: function () {
			$('#table').bootstrapTable('refresh', {url: 'employee/queryData'});
        }
	});
}

function deleteemployee(id) {
	
	layer.load(0.3, {shade : [ 0.3, '#fff' ]});
	layer.open({
		type : 1,
		offset : 'auto',
		area : [ '260', '150' ],
		content : '&nbsp;&nbsp;&nbsp;确认删除该用户',
		btn : [ '确定', '取消' ],
		yes : function(index, layero) {
			$.ajax({
				url : "employee/deleteEmployee",
				type : "POST",
				data : {
					id : id
				},
				dataType : "json",
				beforeSend : function() {
				},
				success : function(data) {
					layer.closeAll();
					layer.msg(data.msg,{time: 1000},function(){
						$('#table').bootstrapTable('refresh', {url : 'employee/queryData'});
					})
				},
				complete : function(XMLHttpRequest, textStatus) {
				},
				error : function() {
					alert("请求出错");
				}
			});
		},
		btn2 : function(index, layero) {
			layer.closeAll();
		},
		cancel : function() {
			layer.closeAll();
		}
	});
}

function detail(id) {
	layer.open({
		type : 2,
		offset : 'auto',
		area : [ '800', '500' ],
		content : 'employee/detail?id=' + id
	});
}

function tableHeight() {
    return $(window).height() - $('#ibox').outerHeight() - $('.page_head').outerHeight() - 65;
}

function setTableHeight() {
    $('#table').bootstrapTable('resetView', {
        height: tableHeight()
    });
    $(window).resize(function () {
        $('#table').bootstrapTable('resetView', {
            height: tableHeight() - 37
        })
    })
}

function setTableHeightTwo() {
    $('#table').bootstrapTable('resetView', {
        height: tableHeight() + 10
    });
}


