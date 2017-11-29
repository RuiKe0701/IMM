<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/11/28
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0094)http://vip2-gd.youshang.com/scm/invPo.do?action=initPo&beginDate=2017-11-01&endDate=2017-11-21 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/plugins/layer/laydate/skins/default/laydate.css"
          id="LayDateSkin">
    <link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <script type="text/javascript">
        var _vds = _vds || [];
        window._vds = _vds;
        (function () {
            _vds.push(['setAccountId', '9bc3c61326fa7ba9']);
            (function () {
                var vds = document.createElement('script');
                vds.type = 'text/javascript';
                vds.async = true;
                vds.src = 'https://dn-growing.qbox.me/vds.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(vds, s);
            })();
        })();
    </script>

    <script type="text/javascript">
        var DOMAIN = document.domain;
        var WDURL = "";
        var SCHEME = "blue";
        try {
            var host = window.location.host;
            var domainDot = host.indexOf('.');
            var domain = host.substring(domainDot + 1, host.length);
            document.domain = domain;
        } catch (e) {
        }
        //ctrl+F5 增加版本号来清空iframe的缓存的
        $(document).keydown(function (event) {
            /* Act on the event */
            if (event.keyCode === 116 && event.ctrlKey) {
                var defaultPage = Public.getDefaultPage();
                var href = defaultPage.location.href.split('?')[0] + '?';
                var params = Public.urlParam();
                params['version'] = Date.parse((new Date()));
                for (i in params) {
                    if (i && typeof i != 'function') {
                        href += i + '=' + params[i] + '&';
                    }
                }
                defaultPage.location.href = href;
                event.preventDefault();
            }
        });
    </script>
    <link href="${pageContext.request.contextPath }/css/bills.css" rel="stylesheet" type="text/css">
    <style>
        /*#barCodeInsert{margin-left: 10px;font-weight: 100;font-size: 12px;color: #fff;background-color: #B1B1B1;padding: 0 5px;border-radius: 2px;line-height: 19px;height: 20px;display: inline-block;}*/
        /*#barCodeInsert.active{background-color: #23B317;}*/
        #editBills {
            background: url(${pageContext.request.contextPath }/img/edit.png);
            display: inline-block;
            width: 13px;
            height: 12px;
        }

        #check_history {
            background: green;
            border-radius: 10px 10px;
            width: 80px;
            text-align: center;
        }

        #check_history a {
            color: #fff;
        }

        .wrapper_con {
            overflow-y: auto;
            overflow-x: hidden;
        }
    </style>
</head>

<body style="">
<div class="wrapper">

    <div class="mod-toolbar-top mr0 cf dn" id="toolTop"></div>
    <form action="" method="post">
    <div class="bills cf">
        <div class="con-header">
            <dl class="cf">
                <dd class="mr40" style="width: 260px">
                    <label><span class="red">*</span>供应商:</label>
                    <div class="input-group" style="width: 180px;float: right">
                        <%--<select style="width:150px;height: 33px" value="">--%>
                            <%--<c:forEach items="suppliers" var="supp">--%>
                                <%--<option value="${supp.supplierId}">${supp.supplierName}</option>--%>
                            <%--</c:forEach>--%>
                        <%--</select>--%>
                        <!-- /btn-group -->
                    </div>
                <dd class="mr20">
                   <label>采购日期:</label>
                    <input id="end" class="">
                </dd>
                <dd id="identifier" style="float:right">
                    <label>单据编号:</label>
                    <input id="number" value="请输入单据编号"/>
                    <i id="editBills"></i>
                    <span class="ui-combo-wrap" id="numberAuto" style="display: none;">
              <i class="trigger"></i>
            </span>
                </dd>
            </dl>
            <hr class="hrcls">
        </div>
        <div class="wrapper_con">
            <span id="config" class="ui-config"><a
                    href="http://vip2-gd.youshang.com/scm/invPo.do?action=initPo&amp;beginDate=2017-11-01&amp;endDate=2017-11-21#"
                    class="ui-icon-config-new"></a></span>
            <div class="grid-wrap">
                <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                     style="width: 1307px;">
                    <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                    <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...
                    </div>
                    <div class="ui-jqgrid-view" id="gview_grid" style="width: 1550px;">
                        <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                             style="display: none;"><a role="link"
                                                       class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                       style="right: 0px;"><span
                                class="ui-icon ui-icon-circle-triangle-n"></span></a><span
                                class="ui-jqgrid-title"></span></div>
                        <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1307px;">
                            <div class="ui-jqgrid-hbox">
                                <table class="ui-jqgrid-htable" style="width:1392px" role="grid"
                                       aria-labelledby="gbox_grid" cellspacing="0" cellpadding="0" border="0">
                                    <thead>
                                    <tr class="ui-jqgrid-labels" role="rowheader">
                                        <th id="grid_rn" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 25px;">
                                            <div id="jqgh_grid_rn"><span class="s-ico" style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_operating" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 0px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_operating" class="ui-jqgrid-sortable"><span class="s-ico"
                                                                                                           style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_goodId" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 1px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_goodId" class="ui-jqgrid-sortable"><span class="s-ico"
                                                                                                        style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_goods" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 300px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_goods" class="ui-jqgrid-sortable"><span
                                                    class="red">*</span>商品<label> -- 扫描枪录入</label><span
                                                    id="barCodeInsert" class="close"><span
                                                    class="ui-icon-circle"></span></span><span class="s-ico"
                                                                                               style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_barCode" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 120px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_barCode" class="ui-jqgrid-sortable">商品条码<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_skuId" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 150px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_skuId" class="ui-jqgrid-sortable">属性ID<span class="s-ico"
                                                                                                           style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_skuName" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 100px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_skuName" class="ui-jqgrid-sortable">属性<span class="s-ico"
                                                                                                           style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_mainUnit" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_mainUnit" class="ui-jqgrid-sortable">单位<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_unitId" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 150px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_unitId" class="ui-jqgrid-sortable">单位Id<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_inventory" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 20px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_inventory" class="ui-jqgrid-sortable"><span class="s-ico"
                                                                                                           style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_locationName" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_locationName" class="ui-jqgrid-sortable"><span
                                                    class="red">*</span>仓库
                                                <small id="batchStorage">批量</small>
                                                <span class="s-ico" style="display:none"><span sort="asc"
                                                                                               class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_qty" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_qty" class="ui-jqgrid-sortable"><span
                                                    class="red">*</span>数量<span class="s-ico" style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_price" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_price" class="ui-jqgrid-sortable">购货单价<span class="s-ico"
                                                                                                           style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_discountRate" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 126px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_discountRate" class="ui-jqgrid-sortable">折扣率(%)
                                                <small id="batch_discountRate">批量</small>
                                                <span class="s-ico" style="display:none"><span sort="asc"
                                                                                               class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_goodsDiscountRate" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 126px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_goodsDiscountRate" class="ui-jqgrid-sortable">商品折扣(折)
                                                <small id="batch_goodsDiscountRate">批量</small>
                                                <span class="s-ico" style="display:none"><span sort="asc"
                                                                                               class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_deduction" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 126px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_deduction" class="ui-jqgrid-sortable">折扣额
                                                <small id="batch_deduction">批量</small>
                                                <span class="s-ico" style="display:none"><span sort="asc"
                                                                                               class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_prices" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 150px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_prices" class="ui-jqgrid-sortable">销售价格数组<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_amount" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_amount" class="ui-jqgrid-sortable">购货金额<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_description" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_description" class="ui-jqgrid-sortable"
                                                 style="text-align:left">备注<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    ort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>

                                        <th id="grid_srcOrderNo" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_srcOrderNo" class="ui-jqgrid-sortable">关联销货订单号<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <div class="ui-jqgrid-bdiv" style="height: 100%; width: 1307px;">
                            <div style="position:relative;">
                                <div></div>
                                <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-btable"
                                       style="width: 1392px;">
                                    <tbody>
                                    <tr class="jqgfirstrow" style="height:auto">
                                        <td role="gridcell" style="height:0px;width:25px;"></td>
                                        <td role="gridcell" style="height:0px;width:0px;"></td>
                                        <td role="gridcell" style="height:0px;width:1px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:300px;"></td>
                                        <td role="gridcell" style="height:0px;width:120px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:80px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:20px;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;"></td>
                                        <td role="gridcell" style="height:0px;width:80px;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;"></td>
                                        <td role="gridcell" style="height:0px;width:126px;"></td>
                                        <td role="gridcell" style="height:0px;width:126px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:126px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:120px;"></td>
                                    </tr>
                                    <tr role="row" id="2" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr" style="position:relative">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 28px;" title="1" aria-describedby="grid_rn">
                                            1
                                        </td>
                                        <td role="gridcell" style="text-align:left;" aria-describedby="grid_operating">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group" style="width: 300px;">
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-white dropdown-toggle"
                                                                    data-toggle="dropdown">
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                            </ul>
                                                        </div>
                                                        <!-- /btn-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td role="gridcell" style="" class="goods" aria-describedby="grid_goods">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="" aria-describedby="grid_mainUnit">
                                            <input type="text" class="textbox"
                                                   style="width: 69px;height:35px;border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:center;"
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" aria-describedby="grid_locationName">
                                            <input type="text" class="textbox"
                                                   style="width: 85px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;"
                                            aria-describedby="grid_discountRate">
                                            <input type="text" class="textbox"
                                                   style="width: 70px;height:35px; border: none;text-align:center">&nbsp;
                                        </td>

                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_deduction">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>


                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_amount">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                    </tr>


                                    <tr role="row" id="3" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                        style="position:relative">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 28px;" title="1" aria-describedby="grid_rn">
                                            2
                                        </td>
                                        <td role="gridcell" style="text-align:left;" aria-describedby="grid_operating">
                                            <!--<input type="text"  id="baidu" class="textbox" style="width: 290px; border: none;text-align:center">-->
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group" style="width: 300px;">
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-white dropdown-toggle"
                                                                    data-toggle="dropdown">
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                            </ul>
                                                        </div>
                                                        <!-- /btn-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td role="gridcell" style="" class="goods" aria-describedby="grid_goods">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="" aria-describedby="grid_mainUnit">
                                            <input type="text" class="textbox"
                                                   style="width: 69px;height:35px;border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="text-align:center;"
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" aria-describedby="grid_locationName">
                                            <input type="text" class="textbox"
                                                   style="width: 85px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>


                                        <td role="gridcell" style="text-align:right;"
                                            aria-describedby="grid_discountRate">
                                            <input type="text" class="textbox"
                                                   style="width: 70px;height:35px; border: none;text-align:center">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_deduction">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_amount">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr role="row" id="5" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                        style="position:relative">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 28px;" title="1" aria-describedby="grid_rn">
                                            3
                                        </td>
                                        <td role="gridcell" style="text-align:left;" aria-describedby="grid_operating">
                                            <!--<input type="text"  id="baidu" class="textbox" style="width: 290px; border: none;text-align:center">-->
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group" style="width: 300px;">
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-white dropdown-toggle"
                                                                    data-toggle="dropdown">
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                            </ul>
                                                        </div>
                                                        <!-- /btn-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td role="gridcell" style="" class="goods" aria-describedby="grid_goods">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="" aria-describedby="grid_mainUnit">
                                            <input type="text" class="textbox"
                                                   style="width: 69px;height:35px;border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="text-align:center;"
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" aria-describedby="grid_locationName">
                                            <input type="text" class="textbox"
                                                   style="width: 85px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>


                                        <td role="gridcell" style="text-align:right;"
                                            aria-describedby="grid_discountRate">
                                            <input type="text" class="textbox"
                                                   style="width: 70px;height:35px; border: none;text-align:center">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_deduction">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_amount">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr role="row" id="4" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                        style="position:relative">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 28px;" title="1" aria-describedby="grid_rn">
                                            4
                                        </td>
                                        <td role="gridcell" style="text-align:left;" aria-describedby="grid_operating">
                                            <!--<input type="text"  id="baidu" class="textbox" style="width: 290px; border: none;text-align:center">-->
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group" style="width: 300px;">
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-white dropdown-toggle"
                                                                    data-toggle="dropdown">
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                            </ul>
                                                        </div>
                                                        <!-- /btn-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td role="gridcell" style="" class="goods" aria-describedby="grid_goods">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="" aria-describedby="grid_mainUnit">
                                            <input type="text" class="textbox"
                                                   style="width: 69px;height:35px;border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="text-align:center;"
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" aria-describedby="grid_locationName">
                                            <input type="text" class="textbox"
                                                   style="width: 85px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>


                                        <td role="gridcell" style="text-align:right;"
                                            aria-describedby="grid_discountRate">
                                            <input type="text" class="textbox"
                                                   style="width: 70px;height:35px; border: none;text-align:center">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_deduction">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_amount">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr role="row" id="3" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                        style="position:relative">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 28px;" title="1" aria-describedby="grid_rn">
                                            5
                                        </td>
                                        <td role="gridcell" style="text-align:left;" aria-describedby="grid_operating">
                                            <!--<input type="text"  id="baidu" class="textbox" style="width: 290px; border: none;text-align:center">-->
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group" style="width: 300px;">
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-white dropdown-toggle"
                                                                    data-toggle="dropdown">
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                            </ul>
                                                        </div>
                                                        <!-- /btn-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td role="gridcell" style="" class="goods" aria-describedby="grid_goods">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="" aria-describedby="grid_mainUnit">
                                            <input type="text" class="textbox"
                                                   style="width: 69px;height:35px;border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="text-align:center;"
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" aria-describedby="grid_locationName">
                                            <input type="text" class="textbox"
                                                   style="width: 85px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>


                                        <td role="gridcell" style="text-align:right;"
                                            aria-describedby="grid_discountRate">
                                            <input type="text" class="textbox"
                                                   style="width: 70px;height:35px; border: none;text-align:center">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_deduction">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_amount">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr role="row" id="6" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                        style="position:relative">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 28px;" title="1" aria-describedby="grid_rn">
                                            6
                                        </td>
                                        <td role="gridcell" style="text-align:left;" aria-describedby="grid_operating">
                                            <!--<input type="text"  id="baidu" class="textbox" style="width: 290px; border: none;text-align:center">-->
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group" style="width: 300px;">
                                                        <input type="text" class="form-control">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-white dropdown-toggle"
                                                                    data-toggle="dropdown">
                                                                <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                            </ul>
                                                        </div>
                                                        <!-- /btn-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td role="gridcell" style="" class="goods" aria-describedby="grid_goods">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="" aria-describedby="grid_mainUnit">
                                            <input type="text" class="textbox"
                                                   style="width: 69px;height:35px;border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="text-align:center;"
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" aria-describedby="grid_locationName">
                                            <input type="text" class="textbox"
                                                   style="width: 85px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>


                                        <td role="gridcell" style="text-align:right;"
                                            aria-describedby="grid_discountRate">
                                            <input type="text" class="textbox"
                                                   style="width: 70px;height:35px; border: none;text-align:center">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_deduction">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;" aria-describedby="grid_amount">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            <input type="text" class="textbox"
                                                   style="width: 110px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>

                                        <td role="gridcell" style="" aria-describedby="grid_srcOrderNo">
                                            <input type="text" class="textbox"
                                                   style="width: 80px;height:35px; border: none;text-align:center">
                                            &nbsp;
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ui-jqgrid-sdiv" style="width: 1307px;">
                            <div class="ui-jqgrid-hbox">
                                <table role="grid" style="width:1392px" class="ui-jqgrid-ftable" cellspacing="0"
                                       cellpadding="0" border="0">
                                    <tbody>
                                    <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                        <td role="gridcell" style="text-align:center;width: 25px;"
                                            aria-describedby="grid_rn" class="ui-state-default jqgrid-rownum">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:left;width: 0px;"
                                            aria-describedby="grid_operating">&nbsp;
                                        </td>
                                        <td role="gridcell" style="display:none;width: 1px;"
                                            aria-describedby="grid_goodId">&nbsp;
                                        </td>
                                        <td role="gridcell" style="width: 300px;" class="goods"
                                            aria-describedby="grid_goods">合计：
                                        </td>
                                        <td role="gridcell" style="display:none;width: 120px;"
                                            aria-describedby="grid_barCode">&nbsp;
                                        </td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_skuId">&nbsp;
                                        </td>
                                        <td role="gridcell" style="display:none;width: 100px;"
                                            class="ui-ellipsis skuInfo" aria-describedby="grid_skuName">&nbsp;
                                        </td>
                                        <td role="gridcell" style="width: 80px;" aria-describedby="grid_mainUnit">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_unitId">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:center;width: 20px;"
                                            aria-describedby="grid_inventory">&nbsp;
                                        </td>
                                        <td role="gridcell" style="width: 100px;" aria-describedby="grid_locationName">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;width: 80px;"
                                            aria-describedby="grid_qty">0
                                        </td>
                                        <td role="gridcell" style="text-align:right;width: 100px;"
                                            aria-describedby="grid_price">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;width: 126px;"
                                            aria-describedby="grid_discountRate">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;display:none;width: 126px;"
                                            aria-describedby="grid_goodsDiscountRate">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;width: 126px;"
                                            aria-describedby="grid_deduction">0.00
                                        </td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_prices">&nbsp;
                                        </td>
                                        <td role="gridcell" style="text-align:right;width: 100px;"
                                            aria-describedby="grid_amount">0.00
                                        </td>
                                        <td role="gridcell" style="width: 150px;" aria-describedby="grid_description">
                                            &nbsp;
                                        </td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_srcOrderEntryId">&nbsp;
                                        </td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_srcOrderId">&nbsp;
                                        </td>
                                        <td role="gridcell" style="width: 120px;" aria-describedby="grid_srcOrderNo">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
                </div>
            </div>
        </div>
        <div class="con-footer cf">
            <div class="mb10">
                <textarea type="text" id="note" class="ui-input ui-input-ph" style="height: 100px">暂无备注信息</textarea>
            </div>
            <div class="cf fr">

                <input type="submit" id="operaLog" class="btn btn-info " style="width: 120px">
            </div>
        </div>

        <div id="initCombo" class="dn"></div>
        <div id="storageBox" class="shadow target_box dn"></div>

        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath }/js/content.min.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath }/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="${pageContext.request.contextPath }/js/plugins/layer/laydate/laydate.js"></script>
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
</html>