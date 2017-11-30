<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/30
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/print.css" rel="stylesheet" type="text/css">

    <link href="../../css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="../../js/vds.js"></script>
    <script src="../../js/jquery-1.10.2.min.js"></script>
    <script src="../../js/json3.min.js"></script>
    <script src="../../js/vue.js"></script>
    <script src="../../js/common.js"></script>
    <script src="../../js/grid.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/jquery.dialog.js"></script>
    <script type="text/javascript">
        var _vds = _vds || [];
        window._vds = _vds;
        (function () {
            _vds.push(['setAccountId', '9bc3c61326fa7ba9']);
            (function () {
                var vds = document.createElement('script');
                vds.type = 'text/javascript';
                vds.async = true;
                vds.src = 'js/vds.js';
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

    <link href="../../css/bills.css" rel="stylesheet" type="text/css">
    <style>
        /*#barCodeInsert{margin-left: 10px;font-weight: 100;font-size: 12px;color: #fff;background-color: #B1B1B1;padding: 0 5px;border-radius: 2px;line-height: 19px;height: 20px;display: inline-block;}*/
        /*#barCodeInsert.active{background-color: #23B317;}*/
        .qtyInsert {
            margin-left: 8px;
            font-weight: 100;
            font-size: 12px;
            color: #fff;
            background-color: #B1B1B1;
            padding: 0 5px;
            border-radius: 2px;
            line-height: 19px;
            height: 20px;
            display: inline-block;
        }

        .qtyInsertAfter {
            margin-right: 8px;
            font-weight: 100;
            font-size: 12px;
            color: #fff;
            background-color: #23B317;
            padding: 0 5px;
            border-radius: 2px;
            line-height: 19px;
            height: 20px;
            display: inline-block;
        }
    </style>
</head>

<body style="">
<div class="wrapper">
    <!-- <span id="config" class="ui-icon ui-state-default ui-icon-config"></span> -->
    <div class="mod-toolbar-top mr0 cf dn" id="toolTop"></div>
    <div class="bills cf">
        <div class="con-header">
            <dl class="cf">
                <dd>
                    <label>单据日期：</label>
                    <input type="text" id="date" class="ui-input ui-datepicker-input"
                           value= <jsp:useBean id="now" class="java.util.Date" scope="page"/>
                           <fmt:formatDate value="${now}" pattern="yyyy年MM月dd日" />>
                </dd>

                <!-- <dd style="margin-left: 100px;" class="linkToCheck"><span>&nbsp;&nbsp;历史单据 </span><a id="linkToCheck" href="">查询</a></dd> -->
                <!-- <dd id="identifier" style="float:right; margin-right: 10px;">
                  <label>单据编号：</label>
                  <span id="number">DB20171121001</span></dd> -->
                <dd id="identifier" style="float:right">
                    <label>单据编号:</label>
                    <span id="number">DB20171121001</span>
                    <i id="editBills"></i>
                    <span class="ui-combo-wrap" id="numberAuto" style="display: none;">
            <i class="trigger"></i>
          </span>
                </dd>
            </dl>
            <hr class="hrcls">
        </div>

        <div class="wrapper_con">
            <!-- <div class="cf mb10">
              <div class="fl">
                <span  id="config" class="ui-config"><a href="#" class="ui-icon-config-new"></a>列设置</span>
                <span><label>扫描枪录入</label><span id="barCodeInsert" class="close"><span class="ui-icon-circle"></span></span></span>
              </div>
              <div class="fr">
                <span class="circle-link-order linkToCheck"><a href="#" class="icon-link-order"></a>历史单据</span>
              </div>
            </div> -->
            <span id="config" class="ui-config"><a
                    href="http://vip2-gd.youshang.com/scm/invTf.do?action=initTf&amp;beginDate=2017-11-01&amp;endDate=2017-11-21#"
                    class="ui-icon-config-new"></a></span>
            <div class="grid-wrap">
                <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                     style="width: 1307px;">
                    <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                    <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...
                    </div>
                    <div class="ui-jqgrid-view" id="gview_grid" style="width: 1307px;">
                        <div style="position:fixed;top:0px;width:1px;height:1px;" tabindex="0">
                            <div tabindex="-1" style="width:1px;height:1px;" id="grid_kn"></div>
                        </div>
                        <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                             style="display: none;"><a role="link"
                                                       class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                       style="right: 0px;"><span
                                class="ui-icon ui-icon-circle-triangle-n"></span></a><span
                                class="ui-jqgrid-title"></span></div>
                        <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1307px;">
                            <div class="ui-jqgrid-hbox">
                                <table class="ui-jqgrid-htable" style="width:918px" role="grid"
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
                                        <th id="grid_goods" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 318px;"><span
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
                                        <th id="grid_batch" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_batch" class="ui-jqgrid-sortable">批次<span class="s-ico"
                                                                                                         style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_prodDate" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_prodDate" class="ui-jqgrid-sortable">生产日期<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_safeDays" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_safeDays" class="ui-jqgrid-sortable">保质期(天)<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_validDate" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_validDate" class="ui-jqgrid-sortable">有效期至<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_producer" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_producer" class="ui-jqgrid-sortable">产地<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_registrationNo" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_registrationNo" class="ui-jqgrid-sortable">注册证号<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_proLicense" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 90px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_proLicense" class="ui-jqgrid-sortable">生产许可证<span
                                                    class="s-ico" style="display:none"><span sort="asc"
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
                                        <th id="grid_outLocationName" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_outLocationName" class="ui-jqgrid-sortable"><span
                                                    class="red">*</span>调出仓库
                                                <small id="batch-storageA">批量</small>
                                                <span class="s-ico" style="display:none"><span sort="asc"
                                                                                               class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_inLocationName" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_inLocationName" class="ui-jqgrid-sortable"><span
                                                    class="red">*</span>调入仓库
                                                <small id="batch-storageB">批量</small>
                                                <span class="s-ico" style="display:none"><span sort="asc"
                                                                                               class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_description" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_description" class="ui-jqgrid-sortable">备注<span
                                                    class="s-ico" style="display:none"><span sort="asc"
                                                                                             class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_isSerNum" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 150px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_isSerNum" class="ui-jqgrid-sortable">是否有序列号<span
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
                                <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                                       aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                                       style="width: 918px;">
                                    <tbody>
                                    <tr class="jqgfirstrow" role="row" style="height:auto">
                                        <td role="gridcell" style="height:0px;width:25px;"></td>
                                        <td role="gridcell" style="height:0px;width:0px;"></td>
                                        <td role="gridcell" style="height:0px;width:318px;"></td>
                                        <td role="gridcell" style="height:0px;width:120px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:80px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:90px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:80px;"></td>
                                        <td role="gridcell" style="height:0px;width:20px;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;"></td>
                                        <td role="gridcell" style="height:0px;width:100px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                    </tr>
                                    <tr role="row" id="1" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;width: 25px;" title="1" aria-describedby="grid_rn">
                                            1
                                        </td>
                                        <td role="gridcell" style="text-align:left;" title=""
                                            aria-describedby="grid_operating">
                                            <div class="eperatingCell" style="height: 44px;">
                                                <div class="operating" data-id="1"><span class="ui-icon ui-icon-plusAdd"
                                                                                         title="新增行"></span><span
                                                        class="ui-icon ui-icon-trashDel" title="删除行"></span></div>
                                            </div>
                                        </td>
                                        <td role="gridcell" style="" class="goods" title=""
                                            aria-describedby="grid_goods">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_barCode">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_skuId">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" class="ui-ellipsis skuInfo" title=""
                                            aria-describedby="grid_skuName">&nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_mainUnit">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_unitId">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            class="ui-ellipsis batch" aria-describedby="grid_batch">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" aria-describedby="grid_prodDate">
                                            &nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_safeDays">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_validDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_producer">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_registrationNo">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_proLicense">&nbsp;</td>
                                        <td role="gridcell" style="text-align:right;" class="right" title=""
                                            aria-describedby="grid_qty">&nbsp;</td>
                                        <td role="gridcell" style="text-align:center;" title=""
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_outLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_inLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_isSerNum">&nbsp;</td>
                                    </tr>
                                    <tr role="row" id="2" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;" title="2" aria-describedby="grid_rn">2
                                        </td>
                                        <td role="gridcell" style="text-align:left;" title=""
                                            aria-describedby="grid_operating">
                                            <div class="eperatingCell" style="height: 44px;">
                                                <div class="operating" data-id="2"><span class="ui-icon ui-icon-plusAdd"
                                                                                         title="新增行"></span><span
                                                        class="ui-icon ui-icon-trashDel" title="删除行"></span></div>
                                            </div>
                                        </td>
                                        <td role="gridcell" style="" class="goods" title=""
                                            aria-describedby="grid_goods">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_barCode">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_skuId">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" class="ui-ellipsis skuInfo" title=""
                                            aria-describedby="grid_skuName">&nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_mainUnit">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_unitId">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            class="ui-ellipsis batch" aria-describedby="grid_batch">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" aria-describedby="grid_prodDate">
                                            &nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_safeDays">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_validDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_producer">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_registrationNo">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_proLicense">&nbsp;</td>
                                        <td role="gridcell" style="text-align:right;" class="right" title=""
                                            aria-describedby="grid_qty">&nbsp;</td>
                                        <td role="gridcell" style="text-align:center;" title=""
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_outLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_inLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_isSerNum">&nbsp;</td>
                                    </tr>
                                    <tr role="row" id="3" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;" title="3" aria-describedby="grid_rn">3
                                        </td>
                                        <td role="gridcell" style="text-align:left;" title=""
                                            aria-describedby="grid_operating">
                                            <div class="eperatingCell" style="height: 44px;">
                                                <div class="operating" data-id="3"><span class="ui-icon ui-icon-plusAdd"
                                                                                         title="新增行"></span><span
                                                        class="ui-icon ui-icon-trashDel" title="删除行"></span></div>
                                            </div>
                                        </td>
                                        <td role="gridcell" style="" class="goods" title=""
                                            aria-describedby="grid_goods">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_barCode">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_skuId">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" class="ui-ellipsis skuInfo" title=""
                                            aria-describedby="grid_skuName">&nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_mainUnit" class=""
                                            tabindex="-1">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_unitId">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            class="ui-ellipsis batch" aria-describedby="grid_batch">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" aria-describedby="grid_prodDate">
                                            &nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_safeDays">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_validDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_producer">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_registrationNo">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_proLicense">&nbsp;</td>
                                        <td role="gridcell" style="text-align:right;"
                                            class="right edit-cell ui-state-highlight" title=""
                                            aria-describedby="grid_qty" tabindex="-1">&nbsp;</td>
                                        <td role="gridcell" style="text-align:center;" title=""
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_outLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_inLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_isSerNum">&nbsp;</td>
                                    </tr>
                                    <tr role="row" id="4" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;" title="4" aria-describedby="grid_rn">4
                                        </td>
                                        <td role="gridcell" style="text-align:left;" title=""
                                            aria-describedby="grid_operating">
                                            <div class="eperatingCell" style="height: 44px;">
                                                <div class="operating" data-id="4"><span class="ui-icon ui-icon-plusAdd"
                                                                                         title="新增行"></span><span
                                                        class="ui-icon ui-icon-trashDel" title="删除行"></span></div>
                                            </div>
                                        </td>
                                        <td role="gridcell" style="" class="goods" title=""
                                            aria-describedby="grid_goods">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_barCode">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_skuId">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" class="ui-ellipsis skuInfo" title=""
                                            aria-describedby="grid_skuName">&nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_mainUnit">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_unitId">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            class="ui-ellipsis batch" aria-describedby="grid_batch">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" aria-describedby="grid_prodDate">
                                            &nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_safeDays">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_validDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_producer">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_registrationNo">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_proLicense">&nbsp;</td>
                                        <td role="gridcell" style="text-align:right;" class="right" title=""
                                            aria-describedby="grid_qty">&nbsp;</td>
                                        <td role="gridcell" style="text-align:center;" title=""
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_outLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_inLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_description"
                                            class="" tabindex="-1">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_isSerNum">&nbsp;</td>
                                    </tr>
                                    <tr role="row" id="5" tabindex="-1"
                                        class="ui-widget-content jqgrow ui-row-ltr selected-row">
                                        <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                            style="text-align:center;" title="5" aria-describedby="grid_rn">5
                                        </td>
                                        <td role="gridcell" style="text-align:left;" title=""
                                            aria-describedby="grid_operating">
                                            <div class="eperatingCell" style="height: 44px;">
                                                <div class="operating" data-id="5"><span class="ui-icon ui-icon-plusAdd"
                                                                                         title="新增行"></span><span
                                                        class="ui-icon ui-icon-trashDel" title="删除行"></span></div>
                                            </div>
                                        </td>
                                        <td role="gridcell" style="" class="goods" title=""
                                            aria-describedby="grid_goods">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_barCode">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_skuId">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" class="ui-ellipsis skuInfo" title=""
                                            aria-describedby="grid_skuName">&nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_mainUnit">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_unitId">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            class="ui-ellipsis batch" aria-describedby="grid_batch">&nbsp;</td>
                                        <td role="gridcell" style="display:none;" aria-describedby="grid_prodDate">
                                            &nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_safeDays">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_validDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_producer">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_registrationNo">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;"
                                            aria-describedby="grid_proLicense">&nbsp;</td>
                                        <td role="gridcell" style="text-align:right;" class="right" title=""
                                            aria-describedby="grid_qty" tabindex="-1">&nbsp;</td>
                                        <td role="gridcell" style="text-align:center;" title=""
                                            aria-describedby="grid_inventory"><a
                                                class="ui-icon-cart btn_query_inventory" style="display:none"></a></td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_outLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_inLocationName">
                                            &nbsp;</td>
                                        <td role="gridcell" style="" title="" aria-describedby="grid_description">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;" title=""
                                            aria-describedby="grid_isSerNum">&nbsp;</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ui-jqgrid-sdiv" style="width: 1307px;">
                            <div class="ui-jqgrid-hbox">
                                <table role="grid" style="width:918px" class="ui-jqgrid-ftable" cellspacing="0"
                                       cellpadding="0" border="0">
                                    <tbody>
                                    <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                        <td role="gridcell" style="text-align:center;width: 25px;"
                                            aria-describedby="grid_rn" class="ui-state-default jqgrid-rownum">
                                            &nbsp;</td>
                                        <td role="gridcell" style="text-align:left;width: 0px;"
                                            aria-describedby="grid_operating">&nbsp;</td>
                                        <td role="gridcell" style="width: 318px;" class="goods"
                                            aria-describedby="grid_goods" title="合计：">合计：
                                        </td>
                                        <td role="gridcell" style="display:none;width: 120px;"
                                            aria-describedby="grid_barCode">&nbsp;</td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_skuId">&nbsp;</td>
                                        <td role="gridcell" style="display:none;width: 100px;"
                                            class="ui-ellipsis skuInfo" aria-describedby="grid_skuName">&nbsp;</td>
                                        <td role="gridcell" style="width: 80px;" aria-describedby="grid_mainUnit">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_unitId">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;width: 90px;"
                                            class="ui-ellipsis batch" aria-describedby="grid_batch">&nbsp;</td>
                                        <td role="gridcell" style="display:none;width: 90px;"
                                            aria-describedby="grid_prodDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;width: 90px;"
                                            aria-describedby="grid_safeDays">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;width: 90px;"
                                            aria-describedby="grid_validDate">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;width: 90px;"
                                            aria-describedby="grid_producer">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;width: 90px;"
                                            aria-describedby="grid_registrationNo">&nbsp;</td>
                                        <td role="gridcell" style="text-align:left;display:none;width: 90px;"
                                            aria-describedby="grid_proLicense">&nbsp;</td>
                                        <td role="gridcell" style="text-align:right;width: 80px;" class="right"
                                            aria-describedby="grid_qty" title="">&nbsp;</td>
                                        <td role="gridcell" style="text-align:center;width: 20px;"
                                            aria-describedby="grid_inventory">&nbsp;</td>
                                        <td role="gridcell" style="width: 100px;"
                                            aria-describedby="grid_outLocationName">&nbsp;</td>
                                        <td role="gridcell" style="width: 100px;"
                                            aria-describedby="grid_inLocationName">&nbsp;</td>
                                        <td role="gridcell" style="width: 150px;" aria-describedby="grid_description">
                                            &nbsp;</td>
                                        <td role="gridcell" style="display:none;width: 150px;"
                                            aria-describedby="grid_isSerNum">&nbsp;</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
                </div>
                <div id="page"></div>
            </div>
            <div class="cf" id="bottomField">
                <div class="fr" id="toolBottom"><span id="groupBtn"><a id="savaAndAdd" class="ui-btn ui-btn-sp mrb">保存并新增</a><a
                        id="save" class="ui-btn">保存</a></span></div>
            </div>
            <div id="mark"></div>
        </div>
        <div class="con-footer cf">
            <div class="mb10">
                <textarea type="text" id="note" class="ui-input ui-input-ph">暂无备注信息</textarea>
            </div>
            <!-- <ul class="c999 cf">
              <li>
                <label>制单人:</label>
                <span id="userName"></span>
              </li>
              <li>
                <label>审核人:</label>
                <span id="checkName"></span>
              </li>
              <li>
                <label>录单时间:</label>
                <span id="createTime"></span>
              </li>
              <li>
                <label>最后修改时间:</label>
                <span id="modifyTime"></span>
              </li>
            </ul> -->
            <div class="cf fr">
                <a href="http://vip2-gd.youshang.com/scm/invTf.do?action=initTf&amp;beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="linkToCheck ui-btn-bill ui-btn-add mr20">历史单据</a>
                <a href="http://vip2-gd.youshang.com/scm/invTf.do?action=initTf&amp;beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   id="operaLog" class="ui-btn">操作日志</a>
            </div>
        </div>

        <div id="initCombo" class="dn">
            <input type="text" class="textbox goodsAuto" name="goods" autocomplete="off">
            <input type="text" class="textbox storageAuto" name="storage" autocomplete="off">
            <input type="text" class="textbox inStorage" name="storageB" autocomplete="off">

            <input type="text" class="textbox batchAuto" name="batch" autocomplete="off">
            <input type="text" class="textbox dateAuto" name="date" autocomplete="off">
            <input type="text" class="textbox skuAuto" name="price" autocomplete="off">
            <input type="text" class="textbox unitAuto customelement" name="mainUnit" autocomplete="off"
                   id="3_mainUnit"></div>
        <div id="storageBox" class="shadow target_box dn">
            <ul>
                <li data-id="129609203891259700" data-name="默认仓库">CK001 默认仓库</li>
            </ul>
        </div>
        <div id="allstorageBox" class="shadow target_box dn">
        </div>
        <ul id="operaLogBox" class="shadow opera-log-box dn"
            style="position: absolute; left: 1153.39px; top: 478.6px; z-index: 999; display: none;">
            <li>
                <span class="fl" style="margin-right: 50px;"><label>制单人：</label><span id="userName"
                                                                                      style="margin-left: 12px;">郭旭</span></span>
            </li>
            <li>
                <span class="fl" style="display: none;"><label>制单时间：</label><span id="createTime"></span></span>
            </li>
            <li>
                <span class="fl" style="display: none;"><label>审核人：</label><span id="checkName"
                                                                                 style="margin-left: 12px;"></span></span>
            </li>
            <li>
                <span class="fl" style="display: none;"><label>审核时间：</label><span id="checkTime"></span></span>
            </li>
            <li>
                <span class="fl" style="display: none;"><label>最后修改人：</label><span id="modifyName"
                                                                                   style="margin-left: 12px;"></span></span>
            </li>
            <li>
                <span class="fl" style="display: none;"><label>最后修改时间：</label><span id="modifyTime"></span></span>
            </li>
        </ul>
    </div>
</div>
<script src="../../js/transfers.js"></script>

<div class="pika-single is-hidden is-bound" style=""></div>
<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000; border: 0px;">
        <div class="droplist"
             style="position: relative; height: 300px; overflow: auto; width: 861px; border: 1px solid rgb(204, 204, 204);"></div>
        <div class="extra-list-ctn"
             style="width: 856px; border-top: none; border-right: 1px solid rgb(204, 204, 204); border-bottom: 1px solid rgb(204, 204, 204); border-left: 1px solid rgb(204, 204, 204); border-image: initial;">
            <a href="javascript:void(0);" class="quick-add-link quickAddGoods"><i class="ui-icon-add"></i>新增商品</a></div>
    </div>
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 2px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 28px;">
            <div class="tips">没有匹配的选项</div>
        </div>
        <div class="extra-list-ctn"><a href="javascript:void(0);" id="quickAddSku" class="quick-add-link quickAddSku"><i
                class="ui-icon-add"></i>新增辅助属性</a></div>
    </div>
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 2px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 26px;">
            <div class="list-item" data-value="129609203891259700">默认仓库</div>
        </div>
    </div>
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 2px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 26px;">
            <div class="list-item" data-value="129609203891259700">默认仓库</div>
        </div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div style="left: 0px; top: 0px; visibility: hidden; position: absolute;" class="">
    <table class="ui_border">
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
                                    <div class="ui_title" unselectable="on" style="cursor: move;"></div>
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
                                <div class="ui_content" style="padding: 10px;"></div>
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
</body>
</html>