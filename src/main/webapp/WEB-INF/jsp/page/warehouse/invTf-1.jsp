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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/select/dist/css/bootstrap-select.css">
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
    <form action="/inventory/inventorys.do" method="post">
        <div class="mod-search cf" id="report-search">
            <div class="l" id="filter-menu">
                <ul class="ul-inline fix" id="filterItems">
                    <li id="merchandiseForName" style="display: list-item;"><label>日期</label>
                        <input type="date" id="     " name="about" placeholder="请输入查询关键字">
                    </li>
                    <li id="product" style="display: list-item;"><label>商品类型</label>
                        <select  name="productTypeId" style="width:115px;height: 32px" id="type">
                            <option value="0">请选择</option>
                            <c:forEach items="${p}" var="p">
                                <option value="${p.productTypeId}">${p.productTypeName}</option>
                            </c:forEach>
                        </select><br></li>
                    <li id="units" style="display: list-item;"><label>单位</label>
                        <select  name="unitsId" style="width:115px;height: 32px" >
                            <option value="0">请选择</option>
                            <c:forEach items="${u}" var="u">
                                <option value="${u.unitsId}" >${u.unitsName}</option>
                            </c:forEach>
                        </select><br>
                    </li>
                    <li id="salesstatus" style="display: list-item;"><label>销售状态</label>
                        <select  name="salesStatusId" style="width:115px;height: 32px" >
                            <option value="0">请选择</option>
                            <c:forEach items="${s}" var="s">
                                <option value="${s.salesStatusId}" >${s.salesStatusName}</option>
                            </c:forEach>
                        </select><br>
                    </li>
                    <div class="btns"><input class="ui-btn mrb ui-btn-search" id="filter-submit" type="submit"value="查询"></div>
                </ul>
            </div>
        </div>
    </form>
    <%--四个按钮--%>
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <tr>
            <td style="width: 120px; height: 50px; text-align: center">
                <button class="btn btn-info btn-sm" style="font-size: 15px; width: 120px; height: 40px; text-align: center">保存盘点结果</button>
                <button class="btn btn-warning btn-sm" style="font-size: 15px; width: 120px; height: 40px; text-align: center">导出系统库存</button>
                <button class="btn btn-info btn-sm" style="font-size: 15px; width: 120px; height: 40px; text-align: center">导入盘点库存</button>
                <button class="btn btn-warning btn-sm"  style="font-size: 15px; width: 120px; height: 40px; text-align: center">保存盘点结果</button>
            </td>
        </tr>
    </div>
    <table class="table table-striped" style="width: 1380px">
        <thead>
            <tr>
                <th style="display: none">商品id</th>
                <th>商品编码</th>
                <th>商品名称</th>
                <th>商品规格</th>
                <th>商品类型</th>
                <th>商品单位</th>
                <th>商品产地</th>
                <th>安全存量</th>
                <th>销售状态</th>
                <th>商品库存</th>
                <th>盘点库存</th>
                <th>库存盈亏</th>
            </tr>
        </thead>
        <tbody id="tbody">
            <c:forEach items="${m}" var="m">
                <tr>
                    <td style="display: none">${m.merchandiseId}</td>
                    <td>${m.merchandiseCode}</td>
                    <td>${m.merchandiseName}</td>
                    <td>${m.merchandiseSpecification}</td>
                    <td>${m.productType.productTypeName}</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${m.units.unitsName}</td>
                    <td>${m.merchandisePlaceOfOrigin}</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${m.merchandiseSafetyStock}</td>
                    <td>&nbsp;&nbsp;&nbsp;${m.salesStatus.salesStatusName}</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${m.merchandiseActualQuntity}</td>
                    <td style="display: none">${m.merchandiseState}</td>
                    <td></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath }/select/js/bootstrap-select.js"></script>
</body>
</html>
