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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/css/select.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="../../js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>

    <script>
        $(document).ready(function(){
            $("#add").hide();
//             $("#search").toggle(
//                     function(){$("#ta").hide();},
//                     function(){$("#ta").show();}
//             )

            $("#btn-add").click(function(){
                $("#add").show();
            })
        });

    </script>
    <style>
        .matchCon {
            width: 280px;
        }

        .chk-list {
            line-height: 28px;
        }

        #clients{
            width: 160px
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
<div id="add" style="z-index:100;width: 300px;height: 200px;background: black">
    <form method="post" action="" >
        <input type="text" value="名字" />
    </form>
</div>
<div class="wrapper btc" style="z-index:0">


    <div class="bill-ser-botm cf">
        <div class="fr ml10">
            <a class="ui-btn-bill ui-btn-add mrb"
               id="btn-add">新增</a>
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
    <div>
        <table class="tablelist" id="ta">
            <thead>
            <tr id="clients">
                <td></td>
                <td>客户编号<i class="sort"></i></td>
                <td >客户名称</td>
                <td>负责人名称</td>
                <td>负责人职称</td>
                <td >电话</td>
                <td>移动电话</td>
                <td>传真</td>
                <td>客户地址</td>
                <td>送货地址</td>
                <td>操作</td>
            </tr>
            </thead>
            <c:forEach items="${clients}" var="c">
                <c:if test="${c.clientState==0}">
                    <tbody>
                    <tr>
                            <%--用于checked属性选中 checked--%>
                        <td><input name="client.kk" class="k"  runat="server" type="checkbox" value="${c.clientId}" /></td>
                        <td>${c.clientId}</td>
                        <td>${c.clientName}</td>
                        <td>${c.clientPersonInCharge}</td>
                        <td>${c.clientPost}</td>
                        <td>${c.clientPhone}</td>
                        <td>${c.clientMobilePhone}</td>
                        <td>${c.clientFax}</td>
                        <td>${c.clientAddress}</td>
                        <td>${c.clientFactoryAddress}</td>
                        <td style="display:none">${c.clientState}</td>
                        <td><a href="/client/k.do" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
                    </tr>
                    </tbody>
                </c:if>
            </c:forEach>
        </table>
        <button id="su" type="submit">提交</button>
    </div>
</form>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function() {
        $("#btn-disable").click(function () {
            var clientList = new Array();
                $(".tablelist").each(function (index, date) {
                var id = $(date).find(".k").val();
                var object = new Object();
                object.kk = id;
                clientList.push(object);
            });

            var stuattendancelists = JSON.stringify(clientList);
            $.ajax({
                type: "post",
                url: "/client/k.do",
                data: {
                    "stuattendancelists": stuattendancelists
                },
                dataType: "json",
                success: function (data) {
                    if (data == 0) {
                        alert("成功了")
                    }else {
                        alert("错误")
                    }
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        })
    })
</script>
</html>