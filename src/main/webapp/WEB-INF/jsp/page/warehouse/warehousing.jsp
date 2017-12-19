<%--入库
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-12-07
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath }/select/dist/css/bootstrap-select.css">
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
    <form action="/warehousing/warehousing.do" method="post">
        <div class="mod-search cf" id="report-search">
            <div class="l" id="filter-menu">
                <ul class="ul-inline fix" id="filterItems">
                    <li id="product" style="display: list-item;"><label>入库人</label>
                        <select  name="warehousingBuyer" style="width:115px;height: 32px">
                            <option value="0">请选择</option>
                            <c:forEach items="${emp}" var="e">
                                <option value="${e.employeeId}">${e.employeeName}</option>
                            </c:forEach>
                        </select><br></li>
                    <li id="units" style="display: list-item;"><label>经办人</label>
                        <select  name="warehousingUserId" style="width:115px;height: 32px" >
                            <option value="0">请选择</option>
                            <c:forEach items="${unis}" var="u">
                                <option value="${u.unitsId}" >${u.unitsName}</option>
                            </c:forEach>
                        </select><br>
                    </li>

                    <li id="salesstatus" style="display: list-item;"><label>入库日期</label>
                        <input id="end" name="procurementDate" class="">
                    </li>
                    <div class="btns"><input class="ui-btn mrb ui-btn-search" id="filter-submit" type="submit"value="查询"></div>
                </ul>
            </div>
        </div>
    </form>

    <table class="table table-striped" style="width: 1200px">
        <thead>
        <tr>
            <th></th>
            <th style="display: none">入库编号</th>
            <th>批号</th>
            <th>入库人</th>
            <th>采购单号</th>
            <th>入库日期</th>
            <th>入库备注</th>
            <th>经办人</th>
            <th style="display: none">是否已删除</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <c:forEach var="w" items="${ware}">
                <tr id="${w.warehousingId}">
                <td><input type="checkbox" /></td>
                <td style="display: none">${w.warehousingId}</td>
                <td>${w.warehousingBatchNumber}</td>
                <td>${w.employee.employeeName}</td>
                <td>${w.procurement.procurementId}</td>
                <td><fmt:formatDate type="date" value="${w.warehousingDate}" /></td>
                <td>${w.warehousingRemarks}</td>
                <td>${w.user.userName}</td>
                <td style="display: none">${w.warehousingState}</td>
                <td style="width: 120px;text-align: center">
                    <button type="button" id="${w.warehousingId}" onclick="updatemerchandise(${w.warehousingId})" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myUpdate" ><span class="up">修改</span></button>
                    <button type="button" id="${w.warehousingId}" onclick="deletewarehousing(${w.warehousingId})" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myDelete" ><span  class="up">删除</span></button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--<!--修改-->--%>
<%--<div class="modal fade" id="myUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
    <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                    <%--&times;--%>
                <%--</button>--%>
                <%--<h6 class="modal-title" id="updateTime">--%>
                    <%--修改商品信息--%>
                <%--</h6>--%>
            <%--</div>--%>
            <%--<input type="text" id="updatemerchandiseId" style="display: none" >--%>
            <%--<div class="modal-body" style="width: 300px;height: 480px;" >--%>
                <%--<div class="input-group" style="margin-top: 3px">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品编码</span>--%>
                    <%--<input  id="updatemerchandiseCode" type="text"  class="form-control" style="width:487px;">--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品名称</span>--%>
                    <%--<input  id="updatemerchandiseName" type="text" class="form-control"  style="width:487px;">--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品规格</span>--%>
                    <%--<input  id="updatemerchandiseSpecification" type="text" class="form-control" style="width:487px;">--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品类型</span>--%>
                    <%--<select id="updateproductTypeId" name="productTypeId" class="form-control"  style="width:487px;">--%>
                        <%--<c:forEach items="${prod}" var="p">--%>
                            <%--<option value="${p.productTypeId}">${p.productTypeName}</option>--%>
                        <%--</c:forEach>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品单位</span>--%>
                    <%--<select id="updateunitsId" name="productTypeId" class="form-control"  style="width:487px;">--%>
                        <%--<c:forEach items="${unis}" var="u">--%>
                            <%--<option value="${u.unitsId}" >${u.unitsName}</option>--%>
                        <%--</c:forEach>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品产地</span>--%>
                    <%--<input  id="updatemerchandisePlaceOfOsrigin" type="text" class="form-control"  style="width:487px;">--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">安全库存</span>--%>
                    <%--<input  id="updatemerchandiseSafetyStock" type="text" class="form-control"  style="width:200px;">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品库存</span>--%>
                    <%--<input  id="updatemerchandiseActualQuntity" type="text" class="form-control"  style="width:200px;">--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">商品售价</span>--%>
                    <%--<input  id="updatemerchandiseSalsePrice" type="text" class="form-control" style="width:487px;">--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="input-group">--%>
                    <%--<span class="input-group-addon" style="width: 81px;">销售状态</span>--%>
                    <%--<select id="updatesalesStatusId"  class="form-control"  style="width:487px;">--%>
                        <%--<c:forEach items="${sale}" var="s">--%>
                            <%--<option value="${s.salesStatusId}">${s.salesStatusName}</option>--%>
                        <%--</c:forEach>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="modal-footer">--%>
                <%--<button type="button" id="updates" class="btn btn-primary">--%>
                    <%--提交修改--%>
                <%--</button>--%>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">--%>
                    <%--取消--%>
                <%--</button>--%>
            <%--</div>--%>
        <%--</div><!-- /.modal-content -->--%>
    <%--</div><!-- /.modal -->--%>
<%--</div>--%>
<!--删除-->
    <div  class="modal fade" id="myDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="as"></h4>
                </div>
                <div class="modal-footer">
                    <button type="button" id="deletes" class="btn btn-danger" data-dismiss="modal">
                        确定
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        取消
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
</div>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath }/select/js/bootstrap-select.js"></script>
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
//    //获取要修改的信息
//    function updatemerchandise(val){
//        $.ajax({
//            type: "post",
//            url: "/merchandise/merchandiseId.do?merchandiseId="+val,
//            dataType: "json",
//            success: function (item) {
//                if(item!=0){
//                        $("#updatemerchandiseId").val(item.merchandiseId)
//                        $("#updatemerchandiseCode").val(item.merchandiseCode)
//                        $("#updatemerchandiseName").val(item.merchandiseName)
//                        $("#updatemerchandiseSpecification").val(item.merchandiseSpecification)
//                        $("#updateproductTypeId").val(item.productTypeId);
//                        $("#updateunitsId").val(item.unitsId)
//                        $("#updatemerchandisePlaceOfOsrigin").val(item.merchandisePlaceOfOrigin)
//                        $("#updatemerchandiseSafetyStock").val(item.merchandiseSafetyStock)
//                        $("#updatemerchandiseActualQuntity").val(item.merchandiseActualQuntity)
//                        $("#updatemerchandiseSalsePrice").val(item.merchandiseSalsePrice)
//                        $("#updatesalesStatusId").val(item.salesStatusId)
//                }
//            },
//            error: function () {
//                alert("系统异常，请稍后重试！");
//            }
//        })
//        //修改商品信息
//        $("#updates").click(function () {
//            var merchandise = new Array();
//            var object=new Object();
//            object.merchandiseId=$("#updatemerchandiseId").val();
//            object.merchandiseCode=$("#updatemerchandiseCode").val()
//            object.merchandiseName=$("#updatemerchandiseName").val()
//            object.merchandiseSpecification=$("#updatemerchandiseSpecification").val()
//            object.productTypeId=$("#updateproductTypeId").val();
//            object.unitsId=$("#updateunitsId").val();
//            object.merchandisePlaceOfOsrigin=$("#updatemerchandisePlaceOfOsrigin").val();
//            object.merchandiseSafetyStock=$("#updatemerchandiseSafetyStock").val();
//            object.merchandiseActualQuntity=$("#updatemerchandiseActualQuntity").val();
//            object.merchandiseSalsePrice=$("#updatemerchandiseSalsePrice").val();
//            object.salesStatusId=$("#updatesalesStatusId").val();
//            merchandise.push(object);
//            var merchandiseList=JSON.stringify(merchandise);
//            $.ajax({
//                type: "post",
//                url: "/merchandise/updateMerchandise.do",
//                data: {
//                    "merchandises": merchandiseList
//                },
//                dataType: "json",
//                success: function (data) {
//                    if(data!=0){
//                        alert("商品信息修改成功")
//                        window.location.reload();
//                    }else {
//                        alert("商品信息修改失败")
//                    }
//                },
//                error: function () {
//                    alert("系统异常，请稍后重试！");
//                }
//            })
//        })
//    }
    //获取删除的信息
    function deletewarehousing(val) {
        $.ajax({
            type: "post",
            url: "/warehousing/warehousingId.do?warehousingId="+val,
            dataType: "json",
            success: function (item) {
                if(item!=0){
                    $("#as").html("是否删除采购单号为：【"+item.warehousingName+"】的数据？");
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
        //删除商品信息
        $("#deletes").click(function () {
            var merchandiseId=val;
            $.ajax({
                type: "post",
                url: "/warehousing/deleteWarehousing.do?warehousingId="+warehousingId,
                dataType: "json",
                success: function (data) {
                    if(data!=0){
                       $.each(data,function (i,time) {
                           $("#"+time.warehousingId).remove();
                       })
                        alert("入库记录删除成功")
                        window.location.reload();
                    }else {
                        alert("入库记录删除失败")
                    }
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        })
    }
</script>
</html>
