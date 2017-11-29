<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/11/28
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0092)http://vip2-gd.youshang.com/purchase/auto-remedy.jsp?beginDate=2017-11-01&endDate=2017-11-21 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
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

    <style>
        .mod-search {
            position: relative;
        }

        #custom {
            position: absolute;
            top: 0;
            right: 0;
        }

        #manager li {
            margin: 8px 0;
        }

        #manager .ui-label {
            width: 204px;
            display: inline-block;
            line-height: 18px;
            font-size: 14px;
            text-align: center;
        }

        #manager .ui-label-warning:hover {
            background-color: #FFBA5A;
        }

        .no-query {
            border: none;
        }

        .ul-inline li {
            margin-right: 20px;
        }

        #tipsBox p {
            line-height: 24px;
        }
    </style>
</head>

<body class="min-w inventoryList" style="">
<div class="bill-ser-top">
    <ul class="ul-inline cf">
        <li style="display: list-item;" id="filter-storage">
            <label>仓库:</label>
            <!-- <span class="ui-combo-wrap">
              <input type="text" class="input-txt" id="storageAuto" autocomplete="off"  data-ref="date">
              <i class="ui-icon-ellipsis"></i>
            </span> -->
            <span id="storage">

          <span class="ui-combo-wrap" style="width: 118px;"><input type="text" class="input-txt" autocomplete="off"
                                                                   readonly="readonly"
                                                                   style="cursor: default; width: 92px;"><span
                  class="trigger"></span></span></span>
        </li>
        <li>
            <label>商品类别:</label>

            <span class="ui-tree-wrap" style="width:145px"><input type="text" class="input-txt" style="width:119px"
                                                                  id="category" autocomplete="off" placeholder="类别"
                                                                  value=""><span class="trigger"></span></span></li>
        <li style="display: list-item;">
            <label>商品:</label>
            <span class="ui-combo-wrap" id="filter-goods">
          <input id="goodsAuto" type="text" name="" class="input-txt" autocomplete="off" value="" data-ref="date">
          <i class="ui-icon-ellipsis"></i>
        </span>
        </li>
        <li id="chkField">
            <label class="chk checked" style="margin-top:6px; "><input type="checkbox" name="box" value="showZero"
                                                                       id="chkFieldInput" checked="checked">只显示［建议采购量］大于0的商品</label>
        </li>
        <li><a class="mrb ui-btn ui-btn-search" id="search">查询</a></li>
    </ul>
</div>
<div class="wrapper btc">
    <div class="bill-ser-botm">
        <div class="cf">
            <div class="ui-config-box">
                <span id="config" class="ui-config"><a
                        href="http://vip2-gd.youshang.com/purchase/auto-remedy.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                        class="ui-icon-config-new"></a>列设置</span>
            </div>
            <div class="fr">
                <a class="ui-btn-bill ui-btn-add ml10" id="toPo">生成购货订单</a>
                <a href="http://vip2-gd.youshang.com/purchase/auto-remedy.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn-bill ui-btn-hl ml10" id="export" target="_blank">导出</a>
            </div>
        </div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
             style="width: 1250px;">
            <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
            <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
            <div class="ui-jqgrid-view" id="gview_grid" style="width: 1250px;">
                <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                     style="display: none;"><a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                               style="right: 0px;"><span
                        class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span></div>
                <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1250px;">
                    <div class="ui-jqgrid-hbox">
                        <table class="ui-jqgrid-htable" style="width:1290px" role="grid" aria-labelledby="gbox_grid"
                               cellspacing="0" cellpadding="0" border="0">
                            <thead>
                            <tr class="ui-jqgrid-labels" role="rowheader">
                                <th id="grid_cb" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 20px;">
                                    <div id="jqgh_grid_cb"><input role="checkbox" id="cb_grid" class="cbox"
                                                                  type="checkbox"><span class="s-ico"
                                                                                        style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_operating" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px; display: none;">
                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_operating" class="ui-jqgrid-sortable">操作<span class="s-ico"
                                                                                                     style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_invName" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_invName" class="ui-jqgrid-sortable">商品<span class="s-ico"
                                                                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_skuName" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
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
                                <th id="grid_unitName" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_unitName" class="ui-jqgrid-sortable">单位<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_saleNum" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_saleNum" class="ui-jqgrid-sortable">销售在订量<span class="s-ico"
                                                                                                      style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_wdNum" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 120px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_wdNum" class="ui-jqgrid-sortable">
                                        网店订购量<span class="s-ico"
                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_storeNum" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_storeNum" class="ui-jqgrid-sortable">库存余额<span class="s-ico"
                                                                                                      style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_purNum" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 120px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_purNum" class="ui-jqgrid-sortable">采购在订量<span class="s-ico"
                                                                                                     style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_minStore" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_minStore" class="ui-jqgrid-sortable">最低库存<span class="s-ico"
                                                                                                      style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_suggestPurNum" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_suggestPurNum" class="ui-jqgrid-sortable">建议采购量<span
                                            class="s-ico" style="display:none"><span sort="asc"
                                                                                     class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_invId" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_invId" class="ui-jqgrid-sortable">商品id<span class="s-ico"
                                                                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_skuId" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_skuId" class="ui-jqgrid-sortable">属性id<span class="s-ico"
                                                                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_unitId" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_unitId" class="ui-jqgrid-sortable">单位id<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
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
                <div class="ui-jqgrid-bdiv" style="height: 448.266px; width: 1250px;">
                    <div style="position:relative;">
                        <div></div>
                        <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                               aria-multiselectable="true" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                               style="width: 1290px;">
                            <tbody>
                            <tr class="jqgfirstrow" role="row" style="height:auto">
                                <td role="gridcell" style="height:0px;width:20px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:200px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                            </tr>
                            <tr role="row" id="1" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                aria-selected="false">
                                <td role="gridcell" style="text-align:center;width: 20px;" aria-describedby="grid_cb">
                                    <input role="checkbox" type="checkbox" id="jqg_grid_1" class="cbox"
                                           name="jqg_grid_1"></td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">001001000011 乌啦啦益生菌1 袋
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">黄色
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">个1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">202
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">112
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">13
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">77
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">1295291022952547
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">1295291022971924
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">129539731947311
                                </td>
                            </tr>
                            <tr role="row" id="2" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary" aria-selected="false">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_2" class="cbox" name="jqg_grid_2">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">0101004 冰淇淋
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">3
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">2
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">129539731936638
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">0
                                </td>
                            </tr>
                            <tr role="row" id="3" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"
                                aria-selected="false">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_3" class="cbox" name="jqg_grid_3">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">10005 娃哈哈123
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">-6
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">6
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">1294591032962495
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">0
                                </td>
                            </tr>
                            <tr role="row" id="4" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary" aria-selected="false">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_4" class="cbox" name="jqg_grid_4">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">1001 衣服1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">红色/31
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">-1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">2
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">129459100799879
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">129459100799878
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">0
                                </td>
                            </tr>
                            <tr role="row" id="5" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_5" class="cbox" name="jqg_grid_5">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">111212121212 大车胎
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">2
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">10
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">9
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">1295391140926156
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">0
                                </td>
                            </tr>
                            <tr role="row" id="6" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_6" class="cbox" name="jqg_grid_6">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">115 饮料
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">瓶
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">-1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">2
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">12945978597387
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">12945935191088
                                </td>
                            </tr>
                            <tr role="row" id="7" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_7" class="cbox" name="jqg_grid_7">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">1234北川 门锁
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">个1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">2
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">2
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">1294591006920023
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">1294592492040
                                </td>
                            </tr>
                            <tr role="row" id="8" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_8" class="cbox" name="jqg_grid_8">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">3214334 猜的
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">黑色/31/他他他
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">1
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">12952910209159203
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">12952910209159204
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">0
                                </td>
                            </tr>
                            <tr role="row" id="9" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_9" class="cbox" name="jqg_grid_9">
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_operating">
                                    <div class="operating" data-id="undefined"><a class="ui-icon ui-icon-pencil"
                                                                                  title="修改"></a><a
                                            class="ui-icon ui-icon-trash" title="删除"></a></div>
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_invName">4009024756 KIS旗舰版
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_skuName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_unitName">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_saleNum">200
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_wdNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_storeNum">100
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_purNum">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_minStore">0
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis"
                                    aria-describedby="grid_suggestPurNum">100
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_invId">129539730971994
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_skuId">&nbsp;
                                </td>
                                <td role="gridcell" style="text-align:center;display:none;" class="ui-ellipsis"
                                    aria-describedby="grid_unitId">0
                                </td>
                            </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
            <div id="page" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr" style="width: 1113px;">
                <div id="pg_page" class="ui-pager-control" role="group">
                    <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table"
                           style="width:100%;table-layout:fixed;height:100%;" role="row">
                        <tbody>
                        <tr>
                            <td id="page_left" align="left"></td>
                            <td id="page_center" align="center" style="white-space: pre; width: 282px;">
                                <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;"
                                       class="ui-pg-table">
                                    <tbody>
                                    <tr>
                                        <td id="first_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-first"></span></td>
                                        <td id="prev_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-prev"></span></td>
                                        <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                class="ui-separator"></span></td>
                                        <td dir="ltr"><input class="ui-pg-input" type="text" size="2" maxlength="7"
                                                             value="0" role="textbox"> 共 <span id="sp_1_page">1</span> 页
                                        </td>
                                        <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                class="ui-separator"></span></td>
                                        <td id="next_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-next"></span></td>
                                        <td id="last_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-end"></span></td>
                                        <td dir="ltr"><select class="ui-pg-selbox" role="listbox">
                                            <option role="option" value="100" selected="selected">100</option>
                                            <option role="option" value="200">200</option>
                                            <option role="option" value="500">500</option>
                                        </select></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td id="page_right" align="right">
                                <div dir="ltr" style="text-align:right" class="ui-paging-info">1 - 13　共 13 条</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="powerFloat-gray-box dn" id="formulaBox">
    <p style="font-size:13px;color:#4d4d4d;">
        <label><span style="font-size: 14px;color: #4d4d4d;font-weight:bold">建议采购量</span> = 销售在订量 <span id="wdOrderQty"
                                                                                                        class="wdOrderQty"
                                                                                                        style="display: none;">+ 网店订购量</span>
            - 库存余额</label>
        <span style="display: block;margin-top: 8px;margin-left:88px;">
      <span id="purNum"> -
        <label class="chk checked"><input type="checkbox" id="purNumInput" checked="checked">采购在订量 +</label>
      </span>
      <span id="minStore">
        <label class="chk checked"><input type="checkbox" id="minStoreInput" checked="checked">最低库存</label>
      </span>
    </span>
    </p>
</div>
<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 118px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 51px;">
            <div class="list-item" data-value="-1">全部仓库</div>
            <div class="list-item" data-value="129609203891259700">默认仓库</div>
        </div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
</div>
<ul id="tree8402" class="ztree ztreeCombo showRoot" style="top: 143px; left: 524px; width: 250px; display: none;">
    <li id="tree8402_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree8402_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree8402_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree8402_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree8402_1_span"></span></a></li>
</ul>
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