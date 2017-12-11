<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-12-06
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://vip2-gd.youshang.com/settings/customer-list.jsp -->
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>


    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/css/select.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <script src="${pageContext.request.contextPath }/js/material/customer-list-1.js"></script>
    <style>
        .matchCon {
            width: 280px;
        }
        .chk-list {
            line-height: 28px;
        }
        .up{
            position: relative;
            top: -5px;
        }
    </style>
</head>
<body style="">
<div class="bill-ser-top">
    <ul class="ul-inline cf">
        <li>
            <input type="text" id="matchCon" class="ui-input ui-input-ph matchCon" placeholder ="输入客户编号/ 名称/ 联系人/ 电话查询">
        </li>
        <li><a class="ui-btn mrb ui-btn-search" id="search">查询</a></li>
        <li class="chk-list" id="chk-ischecked" style="display: list-item;">
            <div>
                <input style="width:20px;height: 30px" name="" type="checkbox" value="" checked="" />
                <!--<span style="font-size: 20px;position: absolute;right:970px;top: 20px">显示失联客户</span>-->
            </div>
        </li>
    </ul>
</div>
<div class="wrapper btc" style="z-index:0">


    <div class="bill-ser-botm cf">
        <div class="fr ml10">
            <button type="button"  class="ui-btn-bill ui-btn-add mrb" data-toggle="modal" data-target="#myModal" ><span class="">新增</span></button>
            <a class="ui-btn-bill mrb" id="btn-disable">禁用</a>
            <a class="ui-btn-bill mrb" id="btn-enable">启用</a>
        </div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
             style="width: 1371px;">
            <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
            <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
            <div class="ui-jqgrid-view" id="gview_grid" style="width: 1371px;">
                <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                     style="display: none;"><a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                               style="right: 0px;"><span
                        class="ui-icon ui-icon-circle-triangle-n"></span></a></div>

            </div>
            <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>

        </div>

    </div>
    <%--/client/k.do--%>
<form method="post" action="/client/k.do" >
    <div style="position: relative;left: 50px">
        <table class="table table-striped" style="width: 1200px">
            <thead>
            <tr>
                <th></th>
                <th style="display: none">商品id</th>
                <th>商品名称</th>
                <th>属性</th>
                <th>单位</th>
                <th>数量</th>
                <th>订单号</th>
                <th>订单日期</th>
                <th>库存</th>
                <th>购货日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <c:forEach items="${clients}" var="c">
            <c:if test="${c.clientState==0}">
            <tbody>
            <tr id="${c.clientId}"  class="clients">
                <td ><input name="client.kk" class="k"  runat="server" type="checkbox" value="${c.clientId}" /></td>
                <td >${c.clientId}</td>
                <td >${c.clientName}</td>
                <td >${c.clientPersonInCharge}</td>
                <td >${c.clientPost}</td>
                <td>${c.clientPhone}</td>
                <td >${c.clientMobilePhone}</td>
                <td >${c.clientFax}</td>
                <td >${c.clientAddress}</td>
                <td >${c.clientFactoryAddress}</td>
                <td  style="display:none">${c.clientState}</td>
                <td style="width: 120px;text-align: center">
                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#update" ><span class="up">修改</span></button>
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#del" ><span  class="up">删除</span></button></td>
            </tr>
            </tbody>
            </c:if>
            </c:forEach>
        </table>
    </div>
</form>
</div>
<!-- 新增 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModabel">
                    新增用户信息
                </h4>
            </div>
            <div class="modal-body" style="width: 300px;height: 500px" >
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">客户名称</span>
                        <input  id="addname" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">负责人名称</span>
                        <input  id="addpersonInCharge" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">负责人职称</span>
                        <input  id="addpost" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                     </div>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">电话</span>
                    <input  id="addphone" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">移动电话</span>
                    <input  id="addmobilePhone" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">传真</span>
                    <input  id="addfax" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">客户地址</span>
                    <input  id="addaddress" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">送货地址</span>
                    <input  id="addfactoryAddress" type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                <div class="input-group" style="display: none">
                    <span class="input-group-addon" style="width: 81px;">是否已删除</span>
                    <input  id="addstate" type="text" value="0" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="insert" class="btn btn-primary">
                    提交新增
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
    <!-- 修改 -->
    <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改用户信息
                    </h4>
                </div>
                <div class="modal-body" style="width: 300px;height: 500px" >
                    <div class="input-group">
                        <span class="input-group-addon">商品名称</span>
                        <input  type="text" class="form-control" placeholder="twitterhandle">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">单位</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">数量</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">订单号</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
  <div  class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" >
                        确定删除吗
                    </h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        确定
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
</div>
</body>
<!-- 新增-->
<script type="text/javascript">
    $(document).ready(function () {
        $("#insert").click(function () {
            var clients = new Array();
           var object =new Object();
            object.clientName= $("#addname").val();
            object.clientPersonInCharge= $("#addpersonInCharge").val();
            object.clientPost= $("#addpost").val();
            object.clientPhone= $("#addphone").val();
            object.clientMobilePhone= $("#addmobilePhone").val();
            object.clientFax= $("#addfax").val();
            object.clientAddress= $("#addaddress").val();
            object.clientFactoryAddress= $("#addfactoryAddress").val();
            object.clientState= $("#addstate").val();
            clients.push(object);
            var clientList = JSON.stringify(clients);
            $.ajax({
                type: "post",
                url: "/client/addClient.do",
                data: {
                    "clientList": clientList
                },
                dataType: "json",
                success: function (data) {
                    alert("成功了")
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
            })
        })
</script>
</html>