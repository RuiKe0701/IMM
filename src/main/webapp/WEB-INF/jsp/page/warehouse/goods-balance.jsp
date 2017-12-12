<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-12-07
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>恒辉商品库存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/print.css" rel="stylesheet" type="text/css">
    <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <link type="text/css" rel="stylesheet" href="../../js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet" href="../../js/plugins/layer/laydate/skins/default/laydate.css"
          id="LayDateSkin">
    <link href="../../css/ui.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../../css/report.css">
    <script src="${pageContext.request.contextPath }/js/warehousing/warehouse.js"></script>

    <style>
        .ui-icon-ellipsis {
            right: 5px;
        }

        #grid tr {
            cursor: pointer;
        }

        .no-query {
            background-position: center;
            border: 1px solid #ddd;
            border-top: none;
            height: 402px;
            margin-right: 0;
        }

        .box-flex {
            overflow: hidden;
            zoom: 1;
        }

        .box-flex .flex {
            float: left;
            width: 33.3%;
        }

        .grid-title {
            font-size: 24px;
            text-align: center;
            clear: none;
        }
    </style>
</head>
<body style="">
<div class="wrapper">
    <!-- header -->
    <div class="mod-search cf" id="report-search">
        <div class="l" id="filter-menu">
            <ul class="ul-inline fix" id="filterItems">
                <li id="billNum" style="display: list-item;"><label>商品关键字</label>
                    <input type="text" value="" style="width:115px;">
                </li>
                <li id="product" style="display: list-item;"><label>商品类型</label>
                    <select name="productTypeId" style="width:115px;height: 32px">
                        <option value="0">请选择</option>
                        <c:forEach items="${prod}" var="p">
                            <option value="${p.productTypeId}">${p.productTypeName}</option>
                        </c:forEach>
                    </select><br></li>
                <li id="units" style="display: list-item;"><label>单位</label>
                    <select name="unitsId" style="width:115px;height: 32px">
                        <option value="0">请选择</option>
                        <c:forEach items="${unis}" var="u">
                            <option value="${u.unitsId}" >${u.unitsName}</option>
                        </c:forEach>
                    </select><br>
                </li>
                <div class="btns"><a class="ui-btn mrb ui-btn-search" id="filter-submit">查询</a></div>
            </ul>
        </div>
    </div>
    <!-- no data -->
    <%--<div class="no-query"></div>--%>

    <table class="table table-striped" style="width: 1200px">
        <thead>
        <tr>
            <th></th>
            <th style="display: none">商品id</th>
            <th>商品编码</th>
            <th>商品名称</th>
            <th>商品规格</th>
            <th>商品类型</th>
            <th>商品单位</th>
            <th>商品产地</th>
            <th>商品库存</th>
            <th>商品售价（无税）</th>
            <th>销售状态</th>
            <th style="display: none">是否已删除</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="m" items="${merc}">
            <tr>
                <td><input type="checkbox" /></td>
                <td style="display: none">${m.merchandiseId}</td>
                <td>${m.merchandiseCode}</td>
                <td>${m.merchandiseName}</td>
                <td>${m.merchandiseSpecification}</td>
                <td>${m.productType.productTypeName}</td>
                <td>${m.units.unitsName}</td>
                <td>${m.merchandisePlaceOfOrigin}</td>
                <td>${m.merchandiseActualQuntity}</td>
                <td>${m.merchandiseSalsePrice}</td>
                <td>${m.salesStatus.salesStatusName}</td>
                <td style="display: none">${m.merchandiseState}</td>
                <td style="width: 120px;text-align: center">
                    <button type="button" id="updatemerchandise" onclick="updatemerchandise(${m.merchandiseId})" class="btn btn-info btn-sm" data-toggle="modal" data-target="#Update" ><span class="up">修改</span></button>
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myDelete" ><span  class="up">删除</span></button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!--新增-->
<!--修改-->
<div class="modal fade" id="Update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="updateTime">
                    修改商品信息
                </h4>
            </div>
            <input type="text" id="updatemerchandiseId" style="display: none" >
            <div class="modal-body" style="width: 300px;height: 500px" >
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品编码</span>
                    <input  id="updatemerchandiseCode" type="text"  class="form-control" style="width:487px;">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品名称</span>
                    <input  id="updatemerchandiseName" type="text" class="form-control"  style="width:487px;">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品规格</span>
                    <input  id="updatemerchandiseSpecification" type="text" class="form-control" style="width:487px;">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品类型</span>
                    <select id="updateproductTypeId" name="productTypeId" class="form-control"  style="width:487px;">

                        <c:forEach items="${prod}" var="p">
                            <option value="${p.productTypeId}">${p.productTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品单位</span>
                    <select id="updateunitsId" name="productTypeId" class="form-control"  style="width:487px;">

                        <c:forEach items="${unis}" var="u">
                            <option value="${u.unitsId}" >${u.unitsName}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品产地</span>
                    <input  id="updatemerchandisePlaceOfOsrigin" type="text" class="form-control"  style="width:487px;">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品库存</span>
                    <input  id="updatemerchandiseActualQuntity" type="text" class="form-control"  style="width:487px;">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">商品售价</span>
                    <input  id="updatemerchandiseSalsePrice" type="text" class="form-control" style="width:487px;">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">销售状态</span>
                    <input  id="updatesalesStatusId" type="text" class="form-control"   style="width:487px;">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="updates" class="btn btn-primary">
                    提交新增
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--删除-->
<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 175px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 26px;">
            <div class="list-item" data-value="129609203891259700">CK001 默认仓库</div>
        </div>
    </div>
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div class="pika-single is-hidden is-bound" style=""></div>
<ul id="tree9043" class="ztree ztreeCombo showRoot" style="max-height: 200px; top: 143px; left: 524px; width: 250px;">
    <li id="tree9043_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree9043_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree9043_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree9043_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree9043_1_span"></span></a></li>
</ul>
<div style="position: absolute; left: -9999em; top: 208px; visibility: visible; width: auto; z-index: 1976;">
    <table class="ui_border ui_state_visible ui_state_focus">
        <tbody>
        <tr>
            <td class="ui_lt"></td>
            <td class="ui_t"></td>
            <td class="ui_rt"></td>
        </tr>
        <tr>
            <td class="ui_l"></td>
            <td class="ui_c">
                <div class="ui_inner">
                    <table class="ui_dialog">
                        <tbody>
                        <tr>
                            <td colspan="2">
                                <div class="ui_title_bar">
                                    <div class="ui_title" unselectable="on" style="cursor: move;">视窗</div>
                                    <div class="ui_title_buttons"><a class="ui_min" href="javascript:void(0);"
                                                                     title="最小化" style="display: none;"><b
                                            class="ui_min_b"></b></a><a class="ui_max" href="javascript:void(0);"
                                                                        title="最大化" style="display: none;"><b
                                            class="ui_max_b"></b></a><a class="ui_res" href="javascript:void(0);"
                                                                        title="还原"><b class="ui_res_b"></b><b
                                            class="ui_res_t"></b></a><a class="ui_close" href="javascript:void(0);"
                                                                        title="关闭(esc键)" style="display: inline-block;">×</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="ui_icon" style="display: none;"></td>
                            <td class="ui_main" style="width: auto; height: auto;">
                                <div class="ui_content" style="padding: 10px;">
                                    <div class="ui_loading"><span>loading...</span></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="ui_buttons" style="display: none;"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </td>
            <td class="ui_r"></td>
        </tr>
        <tr>
            <td class="ui_lb"></td>
            <td class="ui_b"></td>
            <td class="ui_rb" style="cursor: auto;"></td>
        </tr>
        </tbody>
    </table>
</div>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/bootstrap.min.js?v=3.3.6"></script>
<script>
    laydate({elem: "#hello", event: "focus"});
    var start = {
        elem: "#start",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
            end.start = datas
        }
    };
    var end = {
        elem: "#end",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas
        }
    };
    laydate(start);
    laydate(end);
</script>
<script>
    laydate({elem: "#end", event: "focus"});
    var start = {
        elem: "#start",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
            end.start = datas
        }
    };
    var end = {
        elem: "#end",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas
        }
    };
    laydate(start);
    laydate(end);
</script>
</body>
<script>
    //获取要修改的信息
    function updatemerchandise(val){
        $.ajax({
            type: "post",
            url: "/merchandise/merchandiseId.do?merchandiseId="+val,
            dataType: "json",
            success: function (item) {
                if(item!=0){
                        $("#updatemerchandiseId").val(item.merchandiseId)
                        $("#updatemerchandiseCode").val(item.merchandiseCode)
                        $("#updatemerchandiseName").val(item.merchandiseName)
                        $("#updatemerchandiseSpecification").val(item.merchandiseSpecification)
                        $("#updateproductTypeId").val(item.productTypeId);
                        $("#updateunitsId").val(item.unitsId)
                        $("#updatemerchandisePlaceOfOsrigin").val(item.merchandisePlaceOfOrigin)
                        $("#updatemerchandiseActualQuntity").val(item.merchandiseActualQuntity)
                        $("#updatemerchandiseSalsePrice").val(item.merchandiseSalsePrice)
                        $("#updatesalesStatusId").val(item.salesStatus.salesStatusName)
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }

</script>
<script type="text/javascript">

</script>
</html>
