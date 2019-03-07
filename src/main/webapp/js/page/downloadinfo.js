$(function () {
    //根据窗口调整表格高度
    setTableHeight();
    //查询
    $("#search").click(function (e) {

        var start = $("#downTimeStart").val();
        var end = $("#downTimeEnd").val();

        if ($.trim(start) == '' || $.trim(end) == '') {
            layer.msg("请选择操作时间!");
            return;
        }

        start = new Date(Date.parse(start.replace(/-/g, "/")));
        end = new Date(Date.parse(end.replace(/-/g, "/")));
        start = start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate();
        end = end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate();

        if (DateDiff(end, start) >= 3) {
            layer.msg("日期范围不能超过3天");
            return;
        }

        $("#queryOrderCount").val(0);
        $('#table').bootstrapTable('refresh', {url: 'DownLoadInfoQuery/query'});
        $("#qCount").val(1);
    });
    $('body').on('click', '.bootstrap-table .fixed-table-container .pagination li a', function (e) {
        e.preventDefault();
    });
});
setInterval('$("#search").click()', 10000);

function DateDiff(sDate1, sDate2) {  // sDate1和sDate2是"2002-12-18"格式
    var aDate, oDate1, oDate2, iDays;
    aDate = sDate1.split("-");
    oDate1 = new Date(aDate[0], aDate[1] - 1, aDate[2]);
    aDate = sDate2.split("-");
    oDate2 = new Date(aDate[0], aDate[1] - 1, aDate[2]);
    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24);
    if ((oDate1 - oDate2) < 0) {
        return -iDays;
    }
    return iDays;
}

//查全部
$('#table').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",
    url: 'DownLoadInfoQuery/query',
    height: tableHeight(),
    striped: true,
    clickToSelect: true,
    pagination: true,//是否分页
    dataField: "rows",
    queryParamsType: "pageSize",//对应查询数据中   queryParams 方法的 参数
    // 对象属性{"sortName":"price","sortOrder":"desc","pageSize":10,"pageNumber":1}
    sidePagination: 'server',//指定服务器端分页
    pageNumber: 1, //初始化加载第一页，默认第一页
    pageList: [15, 20, 30],
    pageSize: 15,
    sortable: true, //是否启用排
    sortName: "downTime",
    /*操作按钮在水平方向的位置*/
    paginationHAlign: "left",
    sortOrder: "desc", //排序方式
    /*分页条在水平方向的位置*/
    paginationDetailHAlign: "right",
    /*分页详细信息在水平方向的位置*/
    paginationPreText: "上一页",
    /*指定上一页的内容*/
    paginationNextText: "下一页",
    columns: [{
        title: '导出时间',
        align: 'center',
        width: 150,
        sortable: true,
        field: 'downTime'
    }, {
        title: '模块名称',
        align: 'center',
        width: 150,
        field: 'moduleType'
    }, {
        title: '导出类型',
        align: 'center',
        width: 150,
        field: 'exceltype',
        formatter: function (value, row, index) {
            var info;
            if (row.exceltype == '1') {
                info = '导出用户列表';
            }else{
            	info = '导出用户明细';
            }
            return info;
        }
    }, {
        title: '结果',
        align: 'center',
        width: 200,
        field: 'finishOrNot',
        formatter: function (value, row, index) {
            var info;
            if (row.finishOrNot == '1') {
                //info =  '<a href="javascript:void(0)" class="sucess" ><span>已完成</span></a> ';
                info = '<img style="vertical-align:middle;" src="img/y.png">已完成';
                return info;
            } else if (row.finishOrNot == '0') {
                //info =  '<a href="javascript:void(0)" class="doing" ><span>等待中</span></a> ';
                info = '<img style="vertical-align:middle;" src="img/export-doing.gif">等待中';
                return info;
            }
        }
    }, {
        title: '操作',
        align: 'center',
        width: 150,
        formatter: function (value, row, index) {
            var info;
            if (row.finishDownLoad == '0' && row.finishOrNot == '1') {//没有下载&&后台已完成导出
                info = '<a href="javascript:void(0)" onclick="downLoadExcel(\'' + row.infoId + '\',\'' + row.serviceIp + '\',\'' + row.downUrl + '\')" class="btn-link-sto f-b"><i class="iconfont icon-download"></i><span>请下载</span></a> | <a href="javascript:void(0)" onclick="delLoadExcel(\'' + row.infoId + '\')" class="btn-link-sto f-b"><img src="img/n.png"></img><span>删除</span></a>';
            } else if (row.finishDownLoad == '1' && row.finishOrNot == '1') {
                info = '<a href="javascript:void(0)" onclick="downLoadExcel(\'' + row.infoId + '\',\'' + row.serviceIp + '\',\'' + row.downUrl + '\')" class="btn-link-sto f-b"><img style="vertical-align:middle;" src="img/y.png"><span>已下载</span></a> | <a href="javascript:void(0)" onclick="delLoadExcel(\'' + row.infoId + '\')" class="btn-link-sto f-b"><img src="img/n.png"></img><span>删除</span></a>';
            } else {
                info = '<a href="javascript:void(0)" onclick="delLoadExcel(\'' + row.infoId + '\')" class="btn-link-sto f-b"><img src="img/n.png"></img><span>删除</span></a>';
            }
            return info;
        }
    }],
    queryParams: function queryParams(params) {
        return {
            //每页多少条数据
            pSize: params.pageSize,
            //请求第几页
            cPage: params.pageNumber,
            sortName: this.sortName,
            sortOrder: this.sortOrder,
            queryOrderCount: $("#queryOrderCount").val(),
            downTimeStart: $("#downTimeStart").val(),
            downTimeEnd: $("#downTimeEnd").val(),
            moduleType: $("#moduleType option:selected").val()
        }
    },
    onLoadSuccess: function (data) {
        if (data.status == "success") {

        } else {
            layer.msg(data.status);
        }
    },
    onClickRow: function (row, $element) {
        $($element).addClass("selected").siblings().removeClass("selected");
    }
});

function delLoadExcel(id) {
    layer.open({
        type: 1
        , offset: "auto" //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
        , id: 'LAY_demo' //防止重复弹出
        , content: '<div style="padding: 20px 100px;">确认删除?</div>'
        , btn: ['确认', '取消']
        , btnAlign: 'c' //按钮居中
        , shade: 0.3 //不显示遮罩
        , yes: function () {
            $.ajax({
                data: "id=" + id,
                url: "DownLoadInfoQuery/delLoadExcel",
                dataType: "json",
                type: 'POST',
                success: function (json) {
                    layer.msg(json.msg);
                    layer.closeAll();
                    $('#table').bootstrapTable('refresh', {url: 'DownLoadInfoQuery/query'});
                }
            });
            layer.closeAll();
        }
        , btn2: function (index, layero) {
            layer.closeAll();
        }
    });
}

//下载excel
function myOpen(url) {
    var oA = document.createElement('a');
    oA.href = url;
    document.body.appendChild(oA);
    oA.click();
}

function downLoadExcel(id, serviceIp, downUrl) {
    $.ajax({
        url: "DownLoadInfoQuery/updateFinishDownLoad",
        dataType: "json",
        data: "id=" + id,
        type: 'POST',
        async: true,
        success: function (json) {
            if (json.success == "true") {
                //弹窗提示
                downUrl = serviceIp + downUrl.substring(downUrl.indexOf("/downExcel"), downUrl.length);
                console.log(downUrl);
                myOpen(downUrl);
            } else {
                layer.msg(json.msg);
            }
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
        , element = layui.element()
    test.restVal();
    test.selectMove();
    test.formToggle({
        ifTableResize: true
    });
});

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