<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>用户信息查询</title>
        <link rel="stylesheet" href="/lib/sto/css/sto.css" />
        <link rel="stylesheet" href="/lib/layerui/css/layui.css">
        <style type="text/css" rel="stylesheet">
            body{
                height: 100%;
                box-sizing: border-box;
            }

        </style>
    </head>
    <body>
    <div class="container">
        <div class="row">
            <h2>用户列表</h2>
        </div>

        <div class="row">

                <table class="layui-table" id="table">
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>签名</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pageinfo.users}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>${user.mail}</td>
                                <td>${user.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>

        </div>
        <div class="row">
            <div class="col-lg-4">
                    总共有${pageinfo.pageModel.totalCount}页，当前在第${pageinfo.pageModel.nowPage}页
            </div>
            <div class="col-lg-offset-4">
                <nav aria-label="pageSelect">
                    <ul class="pager">
                       <c:choose>
                           <c:when test="${pageinfo.pageModel.nowPage==1}">
                               <li>
                                  上一页
                               </li>
                           </c:when>
                           <c:otherwise>
                               <li>
                                   <a href="/page?pageNum=${pageinfo.pageModel.nowPage-1}">上一页</a>
                               </li>
                           </c:otherwise>
                       </c:choose>
                       <c:choose>
                           <c:when test="${pageinfo.pageModel.nowPage==pageinfo.pageModel.lastPage}">
                               <li>
                                  下一页
                               </li>
                           </c:when>
                           <c:otherwise>
                               <li>
                                   <a href="/page?pageNum=${pageinfo.pageModel.nowPage+1}">下一页</a>
                               </li>
                           </c:otherwise>
                       </c:choose>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    </body>
<script type="text/javascript" src="lib/jquery/jquery.js"></script>
<script type="text/javascript" src="lib/bootstrapTable/bootstrap-table.js"></script>
<script type="text/javascript" src="lib/bootstrapTable/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/bootstrapTable/bootstrap-table-export.js"></script>
<script type="text/javascript" src="lib/bootstrapTable/tableExport.js"></script>
<script src="lib/bootstrapTable/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="lib/layerui/layui.js"></script>
<script type="text/javascript" src="lib/sto/sto.js"></script>
<script type="text/javascript" src="js/page/employee.js"></script>
</html>