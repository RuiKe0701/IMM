<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-12-05
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report.css">
    <style>
        .ui-icon-ellipsis {
            right: 5px;
        }

        #grid tr {
            cursor: pointer;
        }

        .no-query {
            background: url("/css/img/no_query.png") no-repeat scroll 100px 60px #fff;
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
                <li id="filter-billDate"><label>开票日期:</label><input type="text" value=""
                                                                    class="ui-input ui-datepicker-input"
                                                                    name="filter-billFromDate" id="filter-billFromDate"
                                                                    maxlength="10"><span class="todate"> 至 </span><input
                        type="text" value="" class="ui-input ui-datepicker-input" name="filter-billToDate"
                        id="filter-billToDate" maxlength="10"></li>
                <li id="date" style="display: list-item;"><label>单据日期:</label><input type="text" value=""
                                                                                     class="ui-input ui-datepicker-input"
                                                                                     name="filter-fromDate"
                                                                                     id="filter-fromDate"
                                                                                     maxlength="10"><span
                        class="todate"> 至 </span><input type="text" value="" class="ui-input ui-datepicker-input"
                                                        name="filter-toDate" id="filter-toDate" maxlength="10"></li>
                <li id="billsNo"><label>单据编号:</label><input type="text" class="ui-input ui-input-ph" id="billsNoAuto">
                </li>
                <li id="sale-rank-filter"><span id="sale-rank-catorage"></span></li>
                <li id="customer" style="display: list-item;"><label>客户:</label><span class="mod-choose-input"
                                                                                      id="filter-customer"><input
                        type="text" class="ui-input" id="customerAuto" autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="supplier"><label>供应商:</label><span class="mod-choose-input" id="filter-supplier"><input
                        type="text" class="ui-input" id="supplierAuto"><span class="ui-icon-ellipsis"></span></span>
                </li>
                <li id="goods" style="display: list-item;"><label>商品:</label><span class="mod-choose-input"
                                                                                   id="filter-goods"><input type="text"
                                                                                                            class="ui-input"
                                                                                                            id="goodsAuto"
                                                                                                            autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="sales" style="display: list-item;"><label>销售人员:</label><span class="mod-choose-input"
                                                                                     id="filter-saler"><input
                        type="text" class="ui-input" id="salerAuto" autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="remarks"><label>备注(分录):</label><input type="text" value="请输入备注查询" class="ui-input ui-input-ph"
                                                              name="remarkCon" id="remarkCon"></li>
                <li id="billNum" style="display: list-item;"><label>单据编号:</label><input type="text" value="请输入单号查询"
                                                                                        style="width:115px;"
                                                                                        class="ui-input ui-input-ph"
                                                                                        name="matchCon" id="matchCon">
                </li>
                <li id="bill_no"><label>发票号:</label><input type="text" class="ui-input ui-input-ph" id="billNoAuto">
                </li>
                <li id="bill_title"><label>发票抬头:</label><input type="text" class="ui-input ui-input-ph"
                                                               id="billTitleAuto"></li>
                <li id="filter" style="display: list-item;"><label>客户类别</label><span class="ui-tree-wrap"
                                                                                     style="width:198px"><input
                        type="text" class="input-txt" style="width:172px" id="catorage" autocomplete="off"
                        placeholder="类别" value=""><span class="trigger"></span></span></li>
                <li id="goodsfilter" style="display: list-item;"><label>商品类别</label><span class="ui-tree-wrap"
                                                                                          style="width:145px"><input
                        type="text" class="input-txt" style="width:119px" id="filterCat" autocomplete="off"
                        placeholder="类别" value=""><span class="trigger"></span></span></li>
                <li class="chk-list" id="chk-stock"><span class="chk"><input type="checkbox" value="profit"
                                                                             name="showSto">零库存商品</span></li>
                <li id="deliveryDate"><label>预计交货日:</label><input type="text" value=""
                                                                  class="ui-input ui-datepicker-input"
                                                                  name="filter-fromDeliveryDate"
                                                                  id="filter-fromDeliveryDate" maxlength="10"><span
                        class="todate"> 至 </span><input type="text" value="" class="ui-input ui-datepicker-input"
                                                        name="filter-toDeliveryDate" id="filter-toDeliveryDate"
                                                        maxlength="10"></li>
                <li id="storage" style="display: list-item;"><label>仓库:</label><span class="mod-choose-input"
                                                                                     id="filter-storage"><input
                        type="text" class="ui-input" id="storageAuto" autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="account"><label>结算账户:</label><span class="mod-choose-input" id="filter-settlementAccount"><input
                        type="text" class="ui-input" id="settlementAccountAuto"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="buName"><label>往来单位:</label><span class="mod-choose-input" id="filter-buName"><input type="text"
                                                                                                             class="ui-input"
                                                                                                             id="buName"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="payerAndPayee"><label>收/付款人:</label><span class="mod-choose-input"
                                                                  id="filter-payerAndPayee"><input type="text"
                                                                                                   class="ui-input"
                                                                                                   id="payerAndPayee"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="saleCustomer"><label>销货单位/购货单位:</label><span class="ui-combo-wrap" id="customerSale"><input
                        type="text" name="" class="input-txt" autocomplete="off" value="" data-ref="date"><i
                        class="ui-icon-ellipsis"></i></span></li>
                <li id="serial"><label>序列号:</label><span class="mod-choose-input"><input type="text" class="ui-input"
                                                                                         id="serNumAuto"
                                                                                         autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li class="chk-list" id="profit-wrap"><span class="chk"><input type="checkbox" value="warehouse"
                                                                               name="warehouse" id="warehouse">在库</span><span
                        class="chk"><input type="checkbox" value="outbound" name="outbound"
                                           id="outbound">已出库</span><span class="chk"><input type="checkbox"
                                                                                            value="isCheck"
                                                                                            name="isCheck" id="isCheck">查询未审核单据</span>
                </li>
                <li id="status-wrap"><label>状态:</label><span class="chk"><input type="checkbox" value="0" name="status"><i>未入库</i></span><span
                        class="chk"><input type="checkbox" value="1" name="status"><i>部分入库</i></span><span
                        class="chk"><input type="checkbox" value="2" name="status"><i>已入库</i></span></li>
                <li id="match"><span class="chk" title="是否显示商品明细"><input type="checkbox" name="match">是否显示商品明细</span>
                </li>
                <li id="chk-realQty"><span class="chk" title="显示可用库存"><input type="checkbox"
                                                                             name="showRealQty">显示可用库存</span></li>
                <li class="chk-list" id="chk-blank"><span class="chk"><input type="checkbox" value="profit"
                                                                             name="showBlank"><i>不显示无欠款客户/不显示无欠款供应商/不显示已收款商品明细</i></span>
                </li>
                <li class="chk-list" id="chk-wrap" style="display: list-item;"><span class="chk"><input type="checkbox"
                                                                                                        value="profit"
                                                                                                        name="profit"><i>计算毛利</i></span><span
                        class="chk" style="display: none;"><input type="checkbox" value="showSku" name="showSku"><i>显示辅助属性</i></span>
                </li>
                <li id="classes"><label class="radio"><input type="radio" name="classes" value="150601">销货</label><label
                        class="radio"><input type="radio" name="classes" value="150602">退货</label></li>
                <li id="billType"><label class="radio"><input type="radio" name="billType" value="0">已全部开票</label><label
                        class="radio checked"><input type="radio" name="billType" value="1" checked="">未全部开票</label>
                </li>
                <li class="chk-list" id="chk-ischecked"><span class="chk"><input type="checkbox" value="ischecked"
                                                                                 name="ischecked">无发生额不显示</span></li>
                <li id="othertype1">
                    <div id="incomeExpenseType"></div>
                </li>
                <li id="othertype2">
                    <div id="incomeName" class="dn"></div>
                </li>
                <li id="othertype3">
                    <div id="expenseName" class="dn"></div>
                </li>
                <div class="btns"><a class="ui-btn mrb ui-btn-search" id="filter-submit">查询</a></div>
            </ul>
            <a href="http://vip2-gd.youshang.com/report/sales-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
               id="conditions-trigger" class="ui-btn conditions-trigger" tabindex="-1">&nbsp;更多条件<b></b></a></div>
    </div>
    <!-- no data -->
    <div class="no-query"></div>
    <!-- grid begin -->
    <div class="ui-print" style="display: none;">
        <!-- 列配置 -->
        <div class="cf box-flex">
            <div class="flex">
                <span id="config" class="ui-config"><a
                        href="http://vip2-gd.youshang.com/report/sales-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                        class="ui-icon-config-new"></a>列设置</span>
            </div>
            <div class="grid-title flex">商品销售明细表</div>
            <div class="fr">
                <a href="http://vip2-gd.youshang.com/report/sales-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-export btn-sm mrb fl" id="btn-export">导出</a>
                <a href="http://vip2-gd.youshang.com/report/sales-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-print btn-sm fl" id="btn-print">打印</a>
            </div>
        </div>
        <div class="grid-wrap" id="grid-wrap" style="height: 591px;">
            <!-- <div class="grid-title">商品销售明细表</div> -->
            <div class="grid-subtitle">日期: 2017-11-01 至 2017-11-21</div>
            <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                 style="width: 1334px;">
                <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
                <div class="ui-jqgrid-view" id="gview_grid" style="width: 1334px;">
                    <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                         style="display: none;"><a role="link"
                                                   class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                   style="right: 0px;"><span
                            class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span>
                    </div>
                    <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1334px;">
                        <div class="ui-jqgrid-hbox">
                            <table class="ui-jqgrid-htable" style="width:1480px" role="grid" aria-labelledby="gbox_grid"
                                   cellspacing="0" cellpadding="0" border="0">
                                <thead>
                                <tr class="ui-jqgrid-labels" role="rowheader">
                                    <th id="grid_date" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_date" class="ui-jqgrid-sortable">销售日期<span class="s-ico"
                                                                                                      style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_billId" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 150px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_billId" class="ui-jqgrid-sortable">销售ID<span class="s-ico"
                                                                                                        style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_billNo" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 110px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_billNo" class="ui-jqgrid-sortable">销售单据号<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_transType" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_transType" class="ui-jqgrid-sortable">业务类别<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_salesName" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_salesName" class="ui-jqgrid-sortable">销售人员<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_buName" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_buName" class="ui-jqgrid-sortable">客户<span class="s-ico"
                                                                                                      style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_assistName" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_assistName" class="ui-jqgrid-sortable">商品类别<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_invNo" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_invNo" class="ui-jqgrid-sortable">商品编号<span class="s-ico"
                                                                                                       style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_invName" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_invName" class="ui-jqgrid-sortable">商品名称<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_spec" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_spec" class="ui-jqgrid-sortable">规格型号<span class="s-ico"
                                                                                                      style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_unit" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 50px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_unit" class="ui-jqgrid-sortable">单位<span class="s-ico"
                                                                                                    style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_location" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_location" class="ui-jqgrid-sortable">仓库<span class="s-ico"
                                                                                                        style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_qty" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_qty" class="ui-jqgrid-sortable">数量<span class="s-ico"
                                                                                                   style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_unitPrice" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_unitPrice" class="ui-jqgrid-sortable">单价<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_amount" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_amount" class="ui-jqgrid-sortable">销售收入<span class="s-ico"
                                                                                                        style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_tax" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 100px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_tax" class="ui-jqgrid-sortable">税额<span class="s-ico"
                                                                                                   style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_taxAmount" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 100px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_taxAmount" class="ui-jqgrid-sortable">价税合计<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_unitCost" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 80px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_unitCost" class="ui-jqgrid-sortable">单位成本<span class="s-ico"
                                                                                                          style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_cost" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 80px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_cost" class="ui-jqgrid-sortable">销售成本<span class="s-ico"
                                                                                                      style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_saleProfit" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 80px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_saleProfit" class="ui-jqgrid-sortable">销售毛利<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_salepPofitRate" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 80px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_salepPofitRate" class="ui-jqgrid-sortable">毛利率<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_description" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_description" class="ui-jqgrid-sortable">备注<span class="s-ico"
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
                    <div class="ui-jqgrid-bdiv" style="height: 434px; width: 1334px;">
                        <div style="position:relative;">
                            <div></div>
                            <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                                   aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                                   style="width: 1480px;">
                                <tbody>
                                <tr class="jqgfirstrow" role="row" style="height:auto">
                                    <td role="gridcell" style="height:0px;width:80px;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:110px;"></td>
                                    <td role="gridcell" style="height:0px;width:60px;"></td>
                                    <td role="gridcell" style="height:0px;width:80px;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;"></td>
                                    <td role="gridcell" style="height:0px;width:80px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:200px;"></td>
                                    <td role="gridcell" style="height:0px;width:60px;"></td>
                                    <td role="gridcell" style="height:0px;width:50px;"></td>
                                    <td role="gridcell" style="height:0px;width:60px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:100px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:80px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:80px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:80px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:80px;display:none;"></td>
                                    <td role="gridcell" style="height:0px;width:150px;"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-sdiv" style="width: 1334px;">
                        <div class="ui-jqgrid-hbox">
                            <table role="grid" style="width:1480px" class="ui-jqgrid-ftable" cellspacing="0"
                                   cellpadding="0" border="0">
                                <tbody>
                                <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_date">合计:
                                    </td>
                                    <td role="gridcell"
                                        style="display: none; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_billId">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_billNo">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 60px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_transType">&nbsp;</td>
                                    <td role="gridcell" style="width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_salesName">&nbsp;</td>
                                    <td role="gridcell" style="width: 150px; border-right-color: rgb(255, 255, 255);"
                                        class="ui-ellipsis" aria-describedby="grid_buName">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_assistName">&nbsp;</td>
                                    <td role="gridcell" style="width: 100px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_invNo">&nbsp;</td>
                                    <td role="gridcell" style="width: 200px; border-right-color: rgb(255, 255, 255);"
                                        class="ui-ellipsis" aria-describedby="grid_invName">&nbsp;</td>
                                    <td role="gridcell" style="width: 60px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_spec">&nbsp;</td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 50px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_unit">&nbsp;</td>
                                    <td role="gridcell" style="width: 60px;" class="ui-ellipsis"
                                        aria-describedby="grid_location">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;width: 100px;"
                                        aria-describedby="grid_qty">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;width: 100px;"
                                        aria-describedby="grid_unitPrice">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;width: 100px;"
                                        aria-describedby="grid_amount">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;display:none;width: 100px;"
                                        aria-describedby="grid_tax">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;display:none;width: 100px;"
                                        aria-describedby="grid_taxAmount">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;display:none;width: 80px;"
                                        aria-describedby="grid_unitCost">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;display:none;width: 80px;"
                                        aria-describedby="grid_cost">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;display:none;width: 80px;"
                                        aria-describedby="grid_saleProfit">&nbsp;</td>
                                    <td role="gridcell" style="text-align:right;display:none;width: 80px;"
                                        aria-describedby="grid_salepPofitRate">&nbsp;</td>
                                    <td role="gridcell" style="text-align:left;width: 150px;"
                                        aria-describedby="grid_description">&nbsp;</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
                <div id="page" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr"
                     style="width: 1334px;">
                    <div id="pg_page" class="ui-pager-control" role="group">
                        <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table"
                               style="width:100%;table-layout:fixed;height:100%;" role="row">
                            <tbody>
                            <tr>
                                <td id="page_left" align="left"></td>
                                <td id="page_center" align="center" style="white-space: pre; width: 288px;">
                                    <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;"
                                           class="ui-pg-table">
                                        <tbody>
                                        <tr>
                                            <td id="first_page" class="ui-pg-button ui-corner-all ui-state-disabled">
                                                <span class="ui-icon ui-icon-seek-first"></span></td>
                                            <td id="prev_page" class="ui-pg-button ui-corner-all ui-state-disabled">
                                                <span class="ui-icon ui-icon-seek-prev"></span></td>
                                            <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                    class="ui-separator"></span></td>
                                            <td dir="ltr"><input class="ui-pg-input" type="text" size="2" maxlength="7"
                                                                 value="0" role="textbox"> 共 <span
                                                    id="sp_1_page">0</span> 页
                                            </td>
                                            <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                    class="ui-separator"></span></td>
                                            <td id="next_page" class="ui-pg-button ui-corner-all"><span
                                                    class="ui-icon ui-icon-seek-next"></span></td>
                                            <td id="last_page" class="ui-pg-button ui-corner-all"><span
                                                    class="ui-icon ui-icon-seek-end"></span></td>
                                            <td dir="ltr"><select class="ui-pg-selbox" role="listbox">
                                                <option role="option" value="500" selected="selected">500</option>
                                                <option role="option" value="1000">1000</option>
                                                <option role="option" value="2000">2000</option>
                                            </select></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td id="page_right" align="right">
                                    <div dir="ltr" style="text-align:right" class="ui-paging-info">无数据显示</div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- grid end -->
</div>

<script src="${pageContext.request.contextPath }/js/judgment/salesDetail.js"></script>

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
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div class="pika-single is-hidden is-bound" style=""></div>
<ul id="tree9440" class="ztree ztreeCombo showRoot" style="max-height: 200px; top: 143px; left: 524px; width: 250px;">
    <li id="tree9440_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree9440_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree9440_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree9440_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree9440_1_span"></span></a></li>
</ul>
<ul id="tree6180" class="ztree ztreeCombo showRoot" style="top: 143px; left: 524px; width: 250px;">
    <li id="tree6180_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree6180_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree6180_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree6180_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree6180_1_span"></span></a></li>
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
</body>
</html>
