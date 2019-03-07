var formSub = false;
layui.use(['layer', 'form', 'layedit', 'laydate', 'test', 'autocomplete', 'element'], function () {
    var form = layui.form()
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate
        , test = layui.test
        , autocomplete = layui.autocomplete
        , element = layui.element();
    test.restVal();
    test.selectMove();
    test.formToggle({
        ifTableResize: true
    });
    
    $('#companyid').typeahead({
        source: function (query, process) {
            $.post('employee/queryCompany', {chars: query}, function (data) {
                for (i in data) {
                	data[i].name = data[i].others.companyid + " - "
                        + data[i].others.companycode + " - " + data[i].others.companyname
                }
                process(data);
            });

        },
        afterSelect: function (item) {
        	$("#companyid").val($.trim(item.others.companyid));
        }
    }); 
    
	//开启校验
	form.verify();
	//监听提交
	  form.on('submit(submit)', function(data){
		  if(!formSub) {
			  formSub = true;
              var grid = layer.load(0.3, {shade: [0.3, '#fff']});
			  $.ajax({
					url:"employee/saveorUpdateEmployee",
					dataType: "json",
					type: "POST",
					data: $("#dataform").serialize(),
					success:function(json) {
                        layer.close(grid);
						if(json.status == true){
							layer.msg(json.msg,{time:2000},function() {
	                    		window.parent.layer.closeAll();
	                    		window.parent.$("#search").click();
	                    	});
						} else {
                            formSub = false;
							layer.msg(json.msg);
						}
					}
				}); 
		  } else {
			  layer.msg("表单正在提交,请稍后再试!");
		  }
	    return false;
	  });
});

function tableHeight() {
    return $(window).height() - $('#ibox').outerHeight() - $('.page_head').outerHeight() - 95;
}

function setTableHeight() {
    $('#table').bootstrapTable('resetView', {
        height: tableHeight()
    });
    $(window).resize(function () {
        $('#table').bootstrapTable('resetView', {
            height: tableHeight() - 67
        })
    })
}

function setTableHeightTwo() {
    $('#table').bootstrapTable('resetView', {
        height: tableHeight() + 10
    });
}
