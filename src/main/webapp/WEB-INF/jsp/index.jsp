<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-28
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>精斗云云进销存</title>
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/app.9aa0d8c4086204eafa2caf53d7294fcb.css" rel="stylesheet" type="text/css">
    <%-- 跳转--%>
    <script type="text/javascript" charset="utf-8" async="" src="${pageContext.request.contextPath }/js/Client.js"></script>

    <script type="text/javascript" charset="utf-8" async="" src="${pageContext.request.contextPath }/js/contains.js"></script>
    <script type="text/javascript" charset="utf-8" async="" src="${pageContext.request.contextPath }/js/taskMgr.js"></script>
    <script type="text/javascript" charset="utf-8" async="" src="${pageContext.request.contextPath }/js/views.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath }/js/shopping.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <script type="text/javascript">
    </script>
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
</head>
<body>

<script type="text/javascript">

    var SYSTEM = {
        dist: "dist"
    };
    var WDURL = WDURL; // header里面的数据
    var SCHEME = SCHEME;
    var tab;
    var listMenus;  // 缓存所有menu信息
    var cacheView; // 缓存视图（只针对新功能，原来用jsp写的那些跳过）
    var BizQQWPA = BizQQWPA; // 不写这一句在headerBar中用BizQQWPA时，webpack编译过不去
    var CONFIG = {
        DEFAULT_PAGE: true,
        SERVICE_URL: 'http://online.youshang.com/onlinegd/'
    };
    var cacheList = {}; //缓存列表查询
    var cachePurView = {}; //缓存以销定购的商品信息
</script>

<title>äºè¿éå­</title>
<link href="${pageContext.request.contextPath }/css/app.9aa0d8c4086204eafa2caf53d7294fcb.css" rel="stylesheet">
<div id="container" class="cf">
    <div class="layoutCls">
        <div class="left-menu left ">
            <div style="height: 0px;">
                <div class="main-menu">
                    <div class="top top-close"><span class="logo"></span> <span class="version-type">恒辉医药 </span></div>
                    <div class="top top-open" style="display:none"><span class="logo-open"></span> <span
                            class="version-type">恒辉医药</span></div>
                    <ul class="bottom">
                        <li class="menu-item item-purchase"><a
                                href="javascript:void(0);" class="main-nav cf"> <span
                                class="menu-pic purchase left"></span> <span class="text">购货</span> </a> <span
                                class="arrow" style="top: 95.4922px; left: 121px; display: none;"></span>
                            <div class="sub-nav-wrap group-nav cf" style="display: none; top: 61.9922px; left: 129px;">
                                <div class="nav-item"><h3>采购单据</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="purchase"><a href="javascript:void(0);"> <span class="hasList">购货订单<span
                                                class="hide"></span></span> <i href="javascript:void(0);">查询</i> </a></li>
                                        <li class="" id="purchase2">
                                            <a href="javascript:void(0);"> <span class="hasList">购货单<span class="hide"></span></span>
                                                <i  href="javascript:void(0);">查询</i> </a></li>
                                        <li class="" id="purchase3"><a href="javascript:void(0);"> <span>以销定购看板<span class="hide"></span></span> <i href="javascript:void(0);">查询</i></a></li>
                                        <li class="" id="purchase4"><a href="javascript:void(0);"> <span>智能补货<span class="newMenuIcon"></span></span><i href="javascript:void(0);">查询</i> </a></li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>采购报表</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="purchase5"><a href="#"> <span>采购明细表<span class="hide"></span></span>
                                            <i href="javascript:void(0);">查询</i></a></li>
                                        <li class="" id="purchase6"><a href="#"> <span>采购汇总表<span class="hide"></span></span>
                                            <i href="javascript:void(0);">查询</i></a></li>

                                        <li class="" id="purchase7"><a href="#"> <span>采购付款一览表<span class="hide"></span></span>
                                            <i href="javascript:void(0);">查询</i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item item-sales odd" data-subid="sales"><a
                                href="#" class="main-nav cf"> <span class="menu-pic sales left"></span>
                            <span class="text">销货</span> </a> <span class="arrow"
                                                                    style="top: 162.971px; left: 121px; display: none;"></span>
                            <div class="sub-nav-wrap group-nav cf" style="display: none; top: 128.971px; left: 129px;">
                                <div class="nav-item"><h3>销售单据</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="purchase8"><a href="#"
                                                                       rel="pageTab" tabtxt="销货订单" tabid="sales-salesOrder"
                                                                       data-right="SO_ADD"> <span class="hasList">销货订单<span
                                                class="hide"></span></span> <i tabtxt="销货订单记录"
                                                                               tabid="sales-salesOrderList"
                                                                               rel="pageTab"
                                                                               href="/scm/invSo.do?action=initSoList"
                                                                               data-right="SO_QUERY">查询</i> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/scm/invSa.do?action=initSale"
                                                        rel="pageTab" tabtxt="销货单" tabid="sales-sales"
                                                        data-right="SA_ADD"> <span class="hasList">销货单<span
                                                class="hide"></span></span> <i tabtxt="销货单记录" tabid="sales-salesList"
                                                                               rel="pageTab"
                                                                               href="/scm/invSa.do?action=initSaleList"
                                                                               data-right="SA_QUERY">查询</i> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/invSa.do?action=initSale&amp;transType=150602"
                                                rel="pageTab" tabtxt="销货退货单" tabid="sales-salesBack"
                                                data-right="SABACK_ADD"> <span class="hasList">销货退货单<span
                                                class="hide"></span></span> <i tabtxt="销货退货单记录"
                                                                               tabid="sales-salesBackList" rel="pageTab"
                                                                               href="/scm/invSa.do?action=initSaleList&amp;transType=150602"
                                                                               data-right="SABACK_QUERY">查询</i> </a>
                                        </li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/sales/originalSales-list.jsp"
                                                        rel="pageTab" tabtxt="原始单据" tabid="sales-salesOriginal"
                                                        data-right="SA_QUERY"> <span>原始单据<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/sales/salesBilling.jsp"
                                                        rel="pageTab" tabtxt="销售开票" tabid="sales-salesBill"
                                                        data-right="SABILLING_ADD"> <span class="hasList">销售开票<span
                                                class="newMenuIcon"></span></span> <i tabtxt="销售开票记录"
                                                                                      tabid="sales-salesBillList"
                                                                                      rel="pageTab"
                                                                                      href="/sales/salesBilling-list.jsp"
                                                                                      data-right="SABILLING_QUERY">查询</i>
                                        </a></li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>销售报表</h3>
                                    <ul class="sub-nav">
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/sales-order-tracking.jsp"
                                                rel="pageTab" tabtxt="销售订单跟踪表" tabid="sales-salesOrderTracking"
                                                data-right="SALESORDER_QUERY"> <span>销售订单跟踪表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/sales-detail.jsp"
                                                        rel="pageTab" tabtxt="销售明细表" tabid="sales-salesDetail"
                                                        data-right="SAREPORTDETAIL_QUERY"> <span>销售明细表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="销售汇总表（按商品）" tabid="sales-salesSummary"
                                                        data-right="SAREPORTINV_QUERY"> <span>销售汇总表（按商品）<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/sales-summary-customer-new.jsp"
                                                rel="pageTab" tabtxt="销售汇总表（按客户）" tabid="sales-salesSummaryCustomer"
                                                data-right="SAREPORTBU_QUERY"> <span>销售汇总表（按客户）<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/sales-summary-sales.jsp"
                                                rel="pageTab" tabtxt="销售汇总表（按销售人员）" tabid="sales-salesSummarySales"
                                                data-right="SAREPORSALER_QUERY"> <span>销售汇总表（按销售人员）<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/sale-receipt-detail.jsp"
                                                rel="pageTab" tabtxt="销售收款一览表" tabid="sales-saleAndReceiptDetail"
                                                data-right="SALERECEIPTDETAIL_QUERY"> <span>销售收款一览表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/contact-debt-new.jsp"
                                                        rel="pageTab" tabtxt="往来单位欠款表" tabid="sales-contactDebt"
                                                        data-right="ContactDebtReport_QUERY"> <span>往来单位欠款表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/sale-profit-detail.jsp"
                                                        rel="pageTab" tabtxt="销售利润表" tabid="sales-salePrifitDetail"
                                                        data-right="SALESPROFIT_QUERY"> <span>销售利润表<span
                                                class="newMenuIcon"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/sale-rank-detail.jsp"
                                                        rel="pageTab" tabtxt="销售排行表" tabid="sales-saleRankDetail"
                                                        data-right="APPREPORTSALE_QUERY"> <span>销售排行表<span
                                                class="newMenuIcon"></span></span> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item item-storage" data-subid="storage"><a
                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#" rel=""
                                tabtxt="仓库" tabid="storage" class="main-nav cf"> <span
                                class="menu-pic storage left"></span> <span class="text">仓库</span> </a> <span
                                class="arrow" style="top: 229.451px; left: 121px; display: none;"></span>
                            <div class="sub-nav-wrap group-nav cf" style="display: none; top: 72.9505px; left: 129px;">
                                <div class="nav-item"><h3>仓库单据</h3>
                                    <ul class="sub-nav">
                                        <li class=""><a href="http://vip2-gd.youshang.com/scm/invTf.do?action=initTf"
                                                        rel="pageTab" tabtxt="调拨单" tabid="storage-transfers"
                                                        data-right="TF_ADD"> <span class="hasList">调拨单<span
                                                class="hide"></span></span> <i tabtxt="调拨单记录"
                                                                               tabid="storage-transfersList"
                                                                               rel="pageTab"
                                                                               href="/scm/invTf.do?action=initTfList"
                                                                               data-right="TF_QUERY">查询</i> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/storage/inventory.jsp"
                                                        rel="pageTab" tabtxt="盘点" tabid="storage-inventory"
                                                        data-right="PD_GENPD"> <span>盘点<span class="hide"></span></span>
                                        </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/storage/inventory-list.jsp"
                                                        rel="pageTab" tabtxt="盘点记录" tabid="storage-inventoryList"
                                                        data-right=""> <span>盘点记录<span class="hide"></span></span> </a>
                                        </li>
                                        <li class="hide"><a href="http://vip2-gd.youshang.com/storage/inventorySN.jsp"
                                                            rel="pageTab" tabtxt="序列号盘点" tabid="storage-inventorySN"
                                                            data-right="PD_GENPD"> <span>序列号盘点<span class="hide"></span></span>
                                        </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/invOi.do?action=initOi&amp;type=in"
                                                rel="pageTab" tabtxt="其他入库单" tabid="storage-otherWarehouse"
                                                data-right="IO_ADD"> <span class="hasList">其他入库单<span
                                                class="hide"></span></span> <i tabtxt="其他入库单记录"
                                                                               tabid="storage-otherWarehouseList"
                                                                               rel="pageTab"
                                                                               href="/scm/invOi.do?action=initOiList&amp;type=in"
                                                                               data-right="IO_QUERY">查询</i> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/invOi.do?action=initOi&amp;type=out"
                                                rel="pageTab" tabtxt="其他出库单" tabid="storage-otherOutbound"
                                                data-right="OO_ADD"> <span class="hasList">其他出库单<span
                                                class="hide"></span></span> <i tabtxt="其他出库单记录"
                                                                               tabid="storage-otherOutboundList"
                                                                               rel="pageTab"
                                                                               href="/scm/invOi.do?action=initOiList&amp;type=out"
                                                                               data-right="OO_QUERY">查询</i> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/invOi.do?action=initOi&amp;type=cbtz"
                                                rel="pageTab" tabtxt="成本调整单" tabid="storage-adjustment"
                                                data-right="CADJ_ADD"> <span class="hasList">成本调整单<span
                                                class="hide"></span></span> <i tabtxt="成本调整单记录"
                                                                               tabid="storage-adjustmentList"
                                                                               rel="pageTab"
                                                                               href="/scm/invOi.do?action=initOiList&amp;type=cbtz"
                                                                               data-right="CADJ_QUERY">查询</i> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/invOi.do?action=initOi&amp;type=zz"
                                                rel="pageTab" tabtxt="组装单" tabid="storage-assemble"
                                                data-right="ZZD_ADD"> <span class="hasList">组装单<span
                                                class="hide"></span></span> <i tabtxt="组装单记录"
                                                                               tabid="storage-assembleList"
                                                                               rel="pageTab"
                                                                               href="/scm/invOi.do?action=initOiList&amp;type=zz"
                                                                               data-right="ZZD_QUERY">查询</i> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/invOi.do?action=initOi&amp;type=cx"
                                                rel="pageTab" tabtxt="拆卸单" tabid="storage-disassemble"
                                                data-right="CXD_ADD"> <span class="hasList">拆卸单<span
                                                class="hide"></span></span> <i tabtxt="拆卸单记录"
                                                                               tabid="storage-disassembleList"
                                                                               rel="pageTab"
                                                                               href="/scm/invOi.do?action=initOiList&amp;type=cx"
                                                                               data-right="CXD_QUERY">查询</i> </a></li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>仓库报表</h3>
                                    <ul class="sub-nav">
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/goods-balance.jsp"
                                                        rel="pageTab" tabtxt="商品库存余额表" tabid="storage-initialBalance"
                                                        data-right="InvBalanceReport_QUERY"> <span>商品库存余额表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/goods-flow-detail.jsp"
                                                        rel="pageTab" tabtxt="商品收发明细表" tabid="storage-goodsFlowDetail"
                                                        data-right="DeliverDetailReport_QUERY"> <span>商品收发明细表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/goods-flow-summary.jsp"
                                                        rel="pageTab" tabtxt="商品收发汇总表" tabid="storage-goodsFlowSummary"
                                                        data-right="DeliverSummaryReport_QUERY"> <span>商品收发汇总表<span
                                                class="hide"></span></span> </a></li>
                                        <li class="hide"><a href="http://vip2-gd.youshang.com/report/serNum-tracer.jsp"
                                                            rel="pageTab" tabtxt="序列号跟踪表" tabid="storage-serNumTracer"
                                                            data-right="INVSERNUMDETAIL_QUERY"> <span>序列号跟踪表<span
                                                class="hide"></span></span> </a></li>
                                        <li class="hide"><a href="http://vip2-gd.youshang.com/report/serNum-status.jsp"
                                                            rel="pageTab" tabtxt="序列号状态表" tabid="storage-serNumStatus"
                                                            data-right="INVSERNUM_QUERY"> <span>序列号状态表<span
                                                class="hide"></span></span> </a></li>
                                        <li class="hide"><a href="http://vip2-gd.youshang.com/report/batch-list.jsp"
                                                            rel="pageTab" tabtxt="批次保质期清单" tabid="storage-batchList"
                                                            data-right="WARRANTY_QUERY"> <span>批次保质期清单<span
                                                class="hide"></span></span> </a></li>
                                        <li class="hide"><a href="http://vip2-gd.youshang.com/report/batch-tracer.jsp"
                                                            rel="pageTab" tabtxt="批次跟踪表" tabid="storage-batchTracer"
                                                            data-right="BATCHTRACER_QUERY"> <span>批次跟踪表<span
                                                class="hide"></span></span> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item item-money odd" data-subid="money"><a
                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#" rel=""
                                tabtxt="资金" tabid="money" class="main-nav cf"> <span class="menu-pic money left"></span>
                            <span class="text">资金</span> </a> <span class="arrow"
                                                                    style="top: 296.93px; left: 121px; display: none;"></span>
                            <div class="sub-nav-wrap group-nav cf" style="display: none; top: 155.93px; left: 129px;">
                                <div class="nav-item"><h3>资金单据</h3>
                                    <ul class="sub-nav">
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/receipt.do?action=initReceipt"
                                                rel="pageTab" tabtxt="收款单" tabid="money-receipt"
                                                data-right="RECEIPT_ADD"> <span class="hasList">收款单<span
                                                class="hide"></span></span> <i tabtxt="收款单记录" tabid="money-receiptList"
                                                                               rel="pageTab"
                                                                               href="/scm/receipt.do?action=initReceiptList"
                                                                               data-right="RECEIPT_QUERY">查询</i> </a>
                                        </li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/scm/payment.do?action=initPay"
                                                        rel="pageTab" tabtxt="付款单" tabid="money-payment"
                                                        data-right="PAYMENT_ADD"> <span class="hasList">付款单<span
                                                class="hide"></span></span> <i tabtxt="付款单记录" tabid="money-paymentList"
                                                                               rel="pageTab"
                                                                               href="/scm/payment.do?action=initPayList"
                                                                               data-right="PAYMENT_QUERY">查询</i> </a>
                                        </li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/verifica.do?action=initVerifica"
                                                rel="pageTab" tabtxt="核销单" tabid="money-verification"
                                                data-right="VERIFICA_ADD"> <span class="hasList">核销单<span
                                                class="hide"></span></span> <i tabtxt="核销单记录"
                                                                               tabid="money-verificationList"
                                                                               rel="pageTab"
                                                                               href="/money/verification-list.jsp"
                                                                               data-right="VERIFICA_QUERY">查询</i> </a>
                                        </li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/scm/ori.do?action=initInc"
                                                        rel="pageTab" tabtxt="其他收入单" tabid="money-otherIncome"
                                                        data-right="QTSR_ADD"> <span class="hasList">其他收入单<span
                                                class="hide"></span></span> <i tabtxt="其他收入单记录"
                                                                               tabid="money-otherIncomeList"
                                                                               rel="pageTab"
                                                                               href="/scm/ori.do?action=initIncList"
                                                                               data-right="QTSR_QUERY">查询</i> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/scm/ori.do?action=initExp"
                                                        rel="pageTab" tabtxt="其他支出单" tabid="money-otherExpense"
                                                        data-right="QTZC_ADD"> <span class="hasList">其他支出单<span
                                                class="hide"></span></span> <i tabtxt="其他支出单记录"
                                                                               tabid="money-otherExpenseList"
                                                                               rel="pageTab"
                                                                               href="/scm/ori.do?action=initExpList"
                                                                               data-right="QTZC_QUERY">查询</i> </a></li>
                                        <li class=""><a href="../funds/expense-list-1.html"
                                                        rel="pageTab" tabtxt="采购销售费用清单" tabid="money-expenseList"
                                                        data-right="FEEBILL_QUERY"> <span>采购销售费用清单<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/scm/fundTf.do?action=initFundTf"
                                                rel="pageTab" tabtxt="资金转账单" tabid="money-accountTransfer"
                                                data-right="ZJZZ_ADD"> <span class="hasList">资金转账单<span
                                                class="hide"></span></span> <i tabtxt="资金转账单记录"
                                                                               tabid="money-accountTransferList"
                                                                               rel="pageTab"
                                                                               href="/scm/fundTf.do?action=initFundTfList"
                                                                               data-right="ZJZZ_QUERY">查询</i> </a></li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>资金报表</h3>
                                    <ul class="sub-nav">
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/cash-bank-journal-new.jsp"
                                                rel="pageTab" tabtxt="现金银行报表" tabid="money-cashBankJournal"
                                                data-right="SettAcctReport_QUERY"> <span>现金银行报表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/account-pay-detail-new.jsp"
                                                rel="pageTab" tabtxt="应付账款明细表" tabid="money-accountPayDetail"
                                                data-right="PAYMENTDETAIL_QUERY"> <span>应付账款明细表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/account-proceeds-detail-new.jsp"
                                                rel="pageTab" tabtxt="应收账款明细表" tabid="money-accountProceedsDetail"
                                                data-right="RECEIPTDETAIL_QUERY"> <span>应收账款明细表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/customers-reconciliation-new.jsp"
                                                rel="pageTab" tabtxt="客户对账单" tabid="money-customersReconciliation"
                                                data-right="CUSTOMERBALANCE_QUERY"> <span>客户对账单<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/suppliers-reconciliation-new.jsp"
                                                rel="pageTab" tabtxt="供应商对账单" tabid="money-suppliersReconciliation"
                                                data-right="SUPPLIERBALANCE_QUERY"> <span>供应商对账单<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/report/other-income-expense-detail.jsp"
                                                rel="pageTab" tabtxt="其他收支明细表" tabid="money-otherIncomeExpenseDetail"
                                                data-right="ORIDETAIL_QUERY"> <span>其他收支明细表<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/report/profit-detail.jsp"
                                                        rel="pageTab" tabtxt="利润表" tabid="money-profit" data-right="">
                                            <span>利润表<span class="hide"></span></span> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item item-information" data-subid="information"><a
                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#" rel=""
                                tabtxt="资料" tabid="information" class="main-nav cf"> <span
                                class="menu-pic information left"></span> <span class="text">资料</span> </a> <span
                                class="arrow" style="top: 363.409px; left: 121px; display: none;"></span>
                            <div class="sub-nav-wrap group-nav cf" style="display: none; top: 52.9088px; left: 129px;">
                                <div class="nav-item"><h3>基础资料</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="customer">
                                            <a href="javascript:void(0);">
                                                <span>1客户管理<span class="hide"></span></span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="供应商管理" tabid="information-vendorList"
                                                        data-right="PUR_QUERY"> <span>2供应商管理<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="商品管理" tabid="information-goodsList"
                                                        data-right="INVENTORY_QUERY"> <span>商品管理<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="仓库管理" tabid="information-storageList"
                                                        data-right="INVLOCTION_QUERY"> <span>仓库管理<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="职员管理" tabid="information-staffList"
                                                        data-right=""> <span>职员管理<span class="hide"></span></span> </a>
                                        </li>
                                        <li class=""><a
                                                href=""
                                                rel="pageTab" tabtxt="账户管理" tabid="information-settlementaccount"
                                                data-right="SettAcct_QUERY"> <span>账户管理<span class="hide"></span></span>
                                        </a></li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="商品品牌" tabid="information-brand"
                                                        data-right="BRAND_QUERY"> <span>商品品牌<span
                                                class="hide"></span></span> </a></li>
                                        <li class="hide"><a href=""
                                                            rel="pageTab" tabtxt="门店管理" tabid="information-storeList"
                                                            data-right="STORE_QUERY"> <span>门店管理<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href=""
                                                        rel="pageTab" tabtxt="发货地址管理"
                                                        tabid="information-shippingAddress"
                                                        data-right="DELIVERYADDR_QUERY"> <span>发货地址管理<span
                                                class="hide"></span></span> </a></li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>辅助资料</h3>
                                    <ul class="sub-nav">
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/category-list.jsp?typeNumber=customertype"
                                                rel="pageTab" tabtxt="客户类别" tabid="information-customerCategoryList"
                                                data-right="BUTYPE_QUERY"> <span>客户类别<span class="hide"></span></span>
                                        </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/category-list.jsp?typeNumber=supplytype"
                                                rel="pageTab" tabtxt="供应商类别" tabid="information-vendorCategoryList"
                                                data-right="SUPPLYTYPE_QUERY"> <span>供应商类别<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/category-list.jsp?typeNumber=trade"
                                                rel="pageTab" tabtxt="商品类别" tabid="information-goodsCategoryList"
                                                data-right="TRADETYPE_QUERY"> <span>商品类别<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/category-list.jsp?typeNumber=paccttype"
                                                rel="pageTab" tabtxt="支出类别" tabid="information-payCategoryList"
                                                data-right="PACCTTYPE_QUERY"> <span>支出类别<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/category-list.jsp?typeNumber=raccttype"
                                                rel="pageTab" tabtxt="收入类别" tabid="information-recCategoryList"
                                                data-right="RACCTTYPE_QUERY"> <span>收入类别<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/unit-list-new.jsp"
                                                        rel="pageTab" tabtxt="计量单位" tabid="information-unitList"
                                                        data-right="UNIT_QUERY"> <span>计量单位<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/settlement-category-list.jsp"
                                                rel="pageTab" tabtxt="结算方式" tabid="information-settlementCL"
                                                data-right="Assist_QUERY"> <span>结算方式<span class="hide"></span></span>
                                        </a></li>
                                        <li class="hide"><a
                                                href="http://vip2-gd.youshang.com/settings/assistingProp.jsp"
                                                rel="pageTab" tabtxt="辅助属性" tabid="information-assistingProp"
                                                data-right="FZSX_QUERY"> <span>辅助属性<span class="hide"></span></span>
                                        </a></li>
                                        <li class="hide"><a
                                                href="http://vip2-gd.youshang.com/settings/assistingPropGuide.jsp"
                                                rel="pageTab" tabtxt="辅助属性向导" tabid="information-assistingPropGuide"
                                                data-right=""> <span>辅助属性向导<span class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/customerInvNumber.jsp"
                                                rel="pageTab" tabtxt="客户物料编码" tabid="information-customerInvNumber"
                                                data-right="CUSTOMERINVNUMBER_QUERY"> <span>客户物料编码<span
                                                class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/coderule-list.jsp"
                                                        rel="pageTab" tabtxt="单据编码规则" tabid="information-coderuleList"
                                                        data-right="DOCNO_QUERY"> <span>单据编码规则<span
                                                class="newMenuIcon"></span></span> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item item-cloudPos odd" data-subid="cloudPos"><a
                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#" rel=""
                                tabtxt="云POS" tabid="cloudPos" class="main-nav cf"> <span
                                class="menu-pic cloudPos left"></span> <span class="text">云POS</span> </a> <span
                                class="arrow" style="display: none;"></span>
                            <div class="sub-nav-wrap group-nav cf" style="display: none;">
                                <div class="nav-item"><h3></h3>
                                    <ul class="sub-nav">
                                        <li class=""><a href="http://vip2-gd.youshang.com/cloud-pos/sale-setting.jsp"
                                                        rel="pageTab" tabtxt="零售设置" tabid="cloudPos-retail"
                                                        data-right=""> <span>零售设置<span class="hide"></span></span> </a>
                                        </li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/cloud-pos/permission-setting.jsp"
                                                rel="pageTab" tabtxt="POS权限设置" tabid="cloudPos-cashier" data-right="">
                                            <span>POS权限设置<span class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/cloud-pos/account-manage.jsp"
                                                        rel="pageTab" tabtxt="账户管理" tabid="cloudPos-account"
                                                        data-right=""> <span>账户管理<span class="hide"></span></span> </a>
                                        </li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/cloud-pos/vip-manage.jsp"
                                                        rel="pageTab" tabtxt="会员管理" tabid="cloudPos-vip" data-right="">
                                            <span>会员管理<span class="hide"></span></span> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item item-setting" data-subid="setting"><a
                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#" rel=""
                                tabtxt="设置" tabid="setting" class="main-nav cf"> <span
                                class="menu-pic setting left"></span> <span class="text">设置</span> </a> <span
                                class="arrow"></span>
                            <div class="sub-nav-wrap group-nav cf">
                                <div class="nav-item"><h3></h3>
                                    <ul class="sub-nav">
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/system-parameter.jsp"
                                                        rel="pageTab" tabtxt="系统参数" tabid="setting-parameter"
                                                        data-right=""> <span>系统参数<span class="hide"></span></span> </a>
                                        </li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/authority.jsp"
                                                        rel="pageTab" tabtxt="权限设置" tabid="setting-authority"
                                                        data-right=""> <span>权限设置<span
                                                class="newMenuIcon"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/operation-log-new.jsp"
                                                rel="pageTab" tabtxt="操作日志" tabid="setting-operationLog"
                                                data-right="OPERATE_QUERY"> <span>操作日志<span class="hide"></span></span>
                                        </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/print-templates.jsp"
                                                        rel="pageTab" tabtxt="套打模板" tabid="setting-printTemplates"
                                                        data-right=""> <span>套打模板<span class="hide"></span></span> </a>
                                        </li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/backup.jsp"
                                                        rel="pageTab" tabtxt="备份与恢复" tabid="setting-backup"
                                                        data-right=""> <span>备份与恢复<span class="hide"></span></span> </a>
                                        </li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/settings/accounts-unaccounts.jsp"
                                                rel="pageTab" tabtxt="结账/反结账" tabid="setting-accounts" data-right="">
                                            <span>结账/反结账<span class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                rel="pageTab" tabtxt="重算成本" tabid="setting-recalculation" data-right="">
                                            <span>重算成本<span class="hide"></span></span> </a></li>
                                        <li class=""><a
                                                href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                rel="pageTab" tabtxt="重新初始化" tabid="setting-reInitial" data-right="">
                                            <span>重新初始化<span class="hide"></span></span> </a></li>
                                        <li class=""><a href="http://vip2-gd.youshang.com/settings/addedServiceList.jsp"
                                                        rel="pageTab" tabtxt="增值服务" tabid="setting-addedServiceList"
                                                        data-right=""> <span>增值服务<span class="hide"></span></span> </a>
                                        </li>
                                        <li class="hide"><a
                                                href="http://vip2-gd.youshang.com/settings/assistingPropGuide.jsp"
                                                rel="pageTab" tabtxt="辅助属性向导" tabid="setting-assistingPropGuide"
                                                data-right=""> <span>辅助属性向导<span class="hide"></span></span> </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="fold-mark menu-open" style="left: 111px;"></div>
                    <div class="copy-right "></div>
                </div>
            </div>
        </div>
        <div class="default-main" style="left: 129px;">
            <div>
                <div class="main-hd cf ">
                    <div class="companyName left"> 瑞科科技</div>
                    <div class="right">
                        <ul class="advanced-menu cf left">
                            <li>
                                <div class="top-search-wrap cf special">
                                    <div class="left"><span class="left-line"></span> <input type="text" value="搜库存"
                                                                                             class="search-type"
                                                                                             disabled=""> <span
                                            class="triangle-bottom"></span></div>
                                    <div class="left"><input type="text" placeholder="请输入商品编码或名称" id="headerBar-goods"
                                                             class="search-dtl" autocomplete="off"> <span
                                            class="right-line"></span> <span class="icon icon-search"></span></div>
                                </div>
                            </li>
                            <li id="userName" class="default-userName cf" style="position: relative;"><span
                                    class="user left"></span>
                                <a href="#" class="special left" id="user_name">${userName}<%-- 显示登录的员工名字--%></a> <span
                                        class="triangle-bottom left"></span>

                                <div class="drop-down-wrap" style="width: 200px; left: -48px;display: none"
                                     id="user_info">
                                    <div class="drop-down"><span class="triangle-border"></span><span
                                            class="triangle-bg"></span>
                                        <ul>
                                            <li class="newdisabled" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">瑞科科技</a></li>
                                            <li class="newdisabled" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">zqk</a></li>
                                            <li class="" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">操作日志</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li>|</li>
                        </ul>
                        <ul class="advanced-menu cf left ">
                            <li style="position: relative;"><a
                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                    class="icon-music "></a>
                                <div class="drop-down-wrap" style="width: 200px; left: -81px;">
                                    <div class="drop-down"><span class="triangle-border"></span><span
                                            class="triangle-bg"></span>
                                        <ul>
                                            <li class="" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">
                                                <div class="headerBar-robot">
                                                    <div class="headerBar-label">QQ咨询</div>
                                                    <div>4008300755</div>
                                                </div>
                                            </a></li>
                                            <li class="" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">
                                                <div class="headerBar-question">
                                                    <div class="headerBar-label">在线提问</div>
                                                    <div>每一个提问均有回复</div>
                                                </div>
                                            </a></li>
                                            <li class="" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">
                                                <div class="headerBar-label">电话</div>
                                                <div>400-830-0780</div>
                                            </a></li>
                                            <li class="" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">
                                                <div class="headerBar-label">服务时间</div>
                                                <div>周一至周五</div>
                                                <div>8:30-12:00、13:00-20:00</div>
                                                <div>周六</div>
                                                <div>9:00-12:00、13:30-17:30</div>
                                                <div>周日及其他法定假日除外</div>
                                            </a></li>
                                            <li class="" style="text-align: left"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">
                                                <div class="headerBar-label">客服邮箱</div>
                                                <div>cs@youshang.com</div>
                                            </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="news-wrap"><a
                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                    class="icon-bell" data-tab="1"></a>
                            </li>
                            <li style="position: relative;"><a
                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                    class="icon-question-sign"></a>
                                <div class="drop-down-wrap" style="width: 100px; left: -31px;">
                                    <div class="drop-down"><span class="triangle-border"></span><span
                                            class="triangle-bg"></span>
                                        <ul>
                                            <li class="" style="text-align: center"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">新手导航</a></li>
                                            <li class="" style="text-align: center"><a
                                                    href="http://www.youshang.com/zxjxchelp/jxcv3/czjq/"
                                                    target="_blank">在线帮助</a></li>
                                            <li class="" style="text-align: center"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">辅助属性向导</a></li>
                                            <li class="" style="text-align: center"><a
                                                    href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                    target="">旧版</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class=""><a href="http://service.youshang.com/myservice/list_service.do"
                                            class=" icon-circle-arrow-left"></a></li>
                            <li class=""><a href="/retreat.do"  <%-- 退出按钮 --%>
                                            class=" icon-off"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="main-bd" style="">
                    <div class="page-tab l-tab" style="height: 668px;" ligeruiid="Tab1000">
                        <div class="l-tab-links" style="width: 1450px;">
                            <ul style="left: 0px; " id="iframs">
                                <li tabid="index" class="">
                                    <a style="padding: 0px 10px;">首页</a>
                                    <div class="l-tab-links-item-left"></div>
                                    <div class="l-tab-links-item-right"></div>
                                </li>

                                <li id="tabManage"></li>
                            </ul>

                            <div class="l-tab-switch"></div>
                        </div>
                        <div class="l-tab-content" style="height: 632px;">
                            <div id="ons" class="l-tab-content-item" tabid="index" style="height: 632px;display: block;">
                                <div class="home cf">
                                    <div class="home-main-item left">
                                        <div class="home-main">
                                            <div class="home-goodsMsg">
                                                <div class="home-goodsMsg-wrap"><span class="icon-left pre"></span>
                                                    <ul class="goodsMsg-dtl cf" style="width: 1143px;">
                                                        <li style="margin-left: 0px; background-color: rgb(252, 133, 86); border: 1px solid rgb(244, 114, 56); width: 220px; display: list-item;"
                                                            class="panel hide" data-color="#fc8556" data-id="" right="">
                                                            <span class="name"
                                                                  style="background-color: #f79b67">库存预警</span>
                                                            <div class="number" data-number="0">0</div>
                                                        </li>
                                                        <li style="margin-left: 20px; background-color: rgb(248, 187, 57); border: 1px solid rgb(233, 169, 16); width: 220px; display: list-item;"
                                                            class="panel hide" data-color="#f8bb39"
                                                            data-id="sales/salesOrderList" right="SO_QUERY"><span
                                                                class="name"
                                                                style="background-color: #f9c650">未发货销货订单</span>
                                                            <div class="number" data-number="0">0</div>
                                                        </li>
                                                        <li style="margin-left: 20px; background-color: rgb(71, 192, 86); border: 1px solid rgb(46, 177, 60); width: 220px; display: list-item;"
                                                            class="panel hide" data-color="#47c056"
                                                            data-id="purchase/purchaseList" right="PU_QUERY"><span
                                                                class="name"
                                                                style="background-color: #62ca6c">今日购货笔数</span>
                                                            <div class="number" data-number="0">0</div>
                                                        </li>
                                                        <li style="margin-left: 20px; background-color: rgb(91, 143, 212); border: 1px solid rgb(71, 121, 200); width: 220px; display: list-item;"
                                                            class="panel hide" data-color="#5b8fd4"
                                                            data-id="sales/salesList" right="SA_QUERY"><span
                                                                class="name"
                                                                style="background-color: #779cdb">今日销货笔数</span>
                                                            <div class="number" data-number="0">0</div>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="home-charts panel">
                                                <div class="header cf">
                                                    <div class="title left">
                                                        <div class="tab">
                                                            <ul>
                                                                <li id="0" class="cur">销货</li>
                                                                <li id="1">购货</li>
                                                                <li id="2">仓库</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="search-time left" style="position: relative;"><span
                                                            id="time">近七天</span> <span class="icon-bottom"></span>
                                                        <div class="drop-down-wrap"
                                                             style="width: 100px; left: -19px; display: none;">
                                                            <div class="drop-down"><span class="triangle-border"></span><span
                                                                    class="triangle-bg"></span>
                                                                <ul>
                                                                    <li class="" style="text-align: center"><a
                                                                            href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                                            target="">近七天</a></li>
                                                                    <li class="" style="text-align: center"><a
                                                                            href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                                            target="">近七周</a></li>
                                                                    <li class="" style="text-align: center"><a
                                                                            href="http://vip2-gd.youshang.com/default-new.jsp?dbid=7958971933164#"
                                                                            target="">近七月</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="home-myCharts" style="height: 400.021px;">
                                                    <div class="home-sales" _echarts_instance_="ec_1511231370564"
                                                         style="display: block; -webkit-tap-highlight-color: transparent; user-select: none; position: relative; background: transparent;">
                                                        <div style="position: relative; overflow: hidden; width: 1120px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
                                                            <canvas width="1344" height="480" data-zr-dom-id="zr_0"
                                                                    style="position: absolute; left: 0px; top: 0px; width: 1120px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
                                                        </div>
                                                        <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1), top 0.4s cubic-bezier(0.23, 1, 0.32, 1); background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;; line-height: 21px; padding: 5px; left: 462.238px; top: 269px;">
                                                            销售笔数 : 0<br>销售总额 : 0
                                                        </div>
                                                    </div>
                                                    <div class="home-purchase cf" style="display: none;">
                                                        <div class="purchaseBarwrap">
                                                            <div style="text-align: center; font-weight: bold; margin: 35px 0 14px 0;">
                                                                购货金额排名
                                                            </div>
                                                            <div class="purchaseBarLeft"></div>
                                                            <div class="purchaseBarRight"></div>
                                                        </div>
                                                    </div>
                                                    <div class="home-stock" style="display: none;"></div>
                                                    <div class="home-nothing" style="display: none;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="home-auxiliary-item left">
                                        <div class="home-notice panel">
                                            <div><!-- <div style="" -->
                                                <ul class="home-noticeWrap"> <!--  -->
                                                    <li class="islink "
                                                        data-link="/service/service.jsp?newsId=20000000261">1.
                                                        云进销存4迭代更新功能&gt;&gt;
                                                    </li>
                                                    <li class="islink "
                                                        data-link="/service/service.jsp?newsId=20000000257">2. 精斗云APP
                                                        4.1全面支持辅助属性管理&gt;&gt;
                                                    </li>
                                                    <li class="islink "
                                                        data-link="/service/service.jsp?newsId=20000000238">3.
                                                        云进销存视频教程已上线，欢迎大家学习！！
                                                    </li>
                                                    <li class="hide">zqk,欢迎使用</li>
                                                </ul>
                                                <span class="home-sticky"></span></div>
                                        </div>
                                        <div class="home-common panel"><span
                                                class="home-common-set icon icon-set"></span>
                                            <div class="home-title">
                                                <div class="tab">
                                                    <ul>
                                                        <li id="0" class="cur">常用功能</li>
                                                        <li id="1">关键数据</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="home-content">
                                                <div class="home-quick-links" style="display: block;">
                                                    <div>
                                                        <ul class="home-link-items cf">
                                                            <li class="item" data-id="purchase/purchase"><a title="购货单">
                                                                <div class="icon-shopping-cart icon-2x"
                                                                     style="color: #98d637;"></div>
                                                                <div class="text">购货单</div>
                                                            </a></li>
                                                            <li class="item" data-id="sales/sales"><a title="销货单">
                                                                <div class="icon-medkit icon-2x"
                                                                     style="color: #ffbf25;"></div>
                                                                <div class="text">销货单</div>
                                                            </a></li>
                                                            <hr/>
                                                            <li class="item" data-id="storage/transfers"><a title="调拨单">
                                                                <div class="icon-exchange icon-2x"
                                                                     style="color: #fe854e;"></div>
                                                                <div class="text">调拨单</div>
                                                            </a></li>
                                                            <li class="item" data-id="money/receipt"><a title="收款单">
                                                                <div class="icon-move icon-2x"
                                                                     style="color: #598ad7;"></div>
                                                                <div class="text">收款单</div>
                                                            </a></li>
                                                            <hr/>
                                                            <li class="item" data-id="storage/inventory"><a title="盘点">
                                                                <div class=" icon-desktop icon-2x"
                                                                     style="color: #98d637;"></div>
                                                                <div class="text">盘点</div>
                                                            </a></li>
                                                            <li class="item" data-id="purchase/purchaseView"><a
                                                                    title="以销定购">
                                                                <div class="icon-medkit icon-2x"
                                                                     style="color: #fe854e;"></div>
                                                                <div class="text">以销定购</div>
                                                            </a></li>
                                                            <hr/>
                                                            <li class="item" data-id="setting/accounts"><a
                                                                    title="结账反结账">
                                                                <div class=" icon-github-alt icon-2x"
                                                                     style="color: #ffbf25;"></div>
                                                                <div class="text">结账反结账</div>
                                                            </a></li>
                                                            <li class="item" data-id="setting/addedServiceList"><a
                                                                    title="增值服务">
                                                                <div class=" icon-eye-open icon-2x"
                                                                     style="color: #598ad7;"></div>
                                                                <div class="text">增值服务</div>
                                                            </a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="home-key-data" style="display: none;">
                                                    <div>
                                                        <ul class="home-keyData">
                                                            <li data-id="storage/initialBalance">
                                                                <div class="item cf"><span class="left">库存总量：</span>
                                                                    <span class="right"></span></div>
                                                                <div class="item cf"><span class="left">库存成本：</span>
                                                                    <span class="right"></span></div>
                                                            </li>
                                                            <li data-id="money/cashBankJournal">
                                                                <div class="item cf"><span class="left">现金：</span> <span
                                                                        class="right"></span></div>
                                                                <div class="item cf"><span class="left">银行存款：</span>
                                                                    <span class="right"></span></div>
                                                            </li>
                                                            <li data-id="sales/contactDebt">
                                                                <div class="item cf"><span class="left">客户欠款：</span>
                                                                    <span class="right"></span></div>
                                                                <div class="item cf"><span class="left">供应商欠款：</span>
                                                                    <span class="right"></span></div>
                                                            </li>
                                                            <li data-id="sales/salesSummary">
                                                                <div class="item cf"><span class="left">销售收入(本月)：</span>
                                                                    <span class="right"></span></div>
                                                                <div class="item cf"><span class="left">销售毛利(本月)：</span>
                                                                    <span class="right"></span></div>
                                                            </li>
                                                            <li data-id="purchase/puSummary">
                                                                <div class="item cf"><span class="left">采购金额(本月)：</span>
                                                                    <span class="right"></span></div>
                                                                <div class="item cf"><span class="left">商品种类(本月)：</span>
                                                                    <span class="right">0</span></div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="l-tab-content-item" tabid="purchase-purchaseOrder"
                                 style="height: 632px; display: none;" id="showiframe">
                                <iframe frameborder="0" name="purchase-purchaseOrder" id="iff" src="" style="height: 800px"></iframe>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/vendor.0a7be9f.dll.js"></script>
<script type="text/javascript" src="js/vendor.501f514.dll.js"></script>
<script type="text/javascript">// window.onload =function(){
//   // // alert(222)
//   // console.log(document.querySelector('default-main')[0])
//   // document.querySelector('default-main')[0].left = 0
// }</script>
<script type="text/javascript" src="js/app.ea26dd00a5823b52da4f.js"></script>
<script type="text/javascript">
    if ($('html').length > 0 && $('html')[0].className == 'ie8') {
        var sUserAgent = navigator.userAgent;
        var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;
        var href = isWinXP ? 'http://downloads.youshang.com/ys/yunwei/chrome37.exe' : 'http://downloads.youshang.com/ys/yunwei/chrome55.exe'; // xp系统用低版本的

        $('#container').hide();

        var content = [
            '<div id="ie8Tips" class="ie8-tips-wrap">',
            '<div class="ie8-tips-left"></div>',
            '<div class="ie8-tips-right">',
            '<p>您当前使用的浏览器内核版本过低，为避免存在安全隐患，建议您将浏览器升级到IE9及以上版本；同时，为了让您获得更佳的浏览体验，推荐您使用谷歌浏览器</p>',
            '<a class="google-download" href="' + href + '" target="_blank"></a>',
            '</div></div>'
        ];
        $('body').append(content.join(''));
    }
    (function () {
        var _vds = _vds || [];
        window._vds = _vds;
        _vds.push(['setAccountId', '9bc3c61326fa7ba9']);
        // console.log(window.SYSTEM.DBID)
        // _vds.push(['setCS1', 'user_id', window.SYSTEM.userInfo.filter(function(i){return i.userName==window.SYSTEM.userName})[0].userId]);
        _vds.push(['setCS1', 'dbid', window.SYSTEM.DBID]);
        _vds.push(['setCS2', 'user_name', window.SYSTEM.userName]);
        _vds.push(['setCS3', 'company_name', window.SYSTEM.companyName]);
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
<div class="l-menu" style="display: none; top: 0px; left: 0px; width: 100px;" ligeruiid="Menu1001">
    <div class="l-menu-yline"></div>
    <div class="l-menu-over">
        <div class="l-menu-over-l"></div>
        <div class="l-menu-over-r"></div>
    </div>
    <div class="l-menu-inner">
        <div class="l-menu-item" ligeruimenutemid="1" menuitemid="close">
            <div class="l-menu-item-text">关闭当前页</div>
        </div>
        <div class="l-menu-item" ligeruimenutemid="2" menuitemid="closeother">
            <div class="l-menu-item-text">关闭其他</div>
        </div>
        <div class="l-menu-item" ligeruimenutemid="3" menuitemid="closeall">
            <div class="l-menu-item-text">关闭所有</div>
        </div>
        <div class="l-menu-item" ligeruimenutemid="4" menuitemid="reload">
            <div class="l-menu-item-text">刷新</div>
        </div>
    </div>
</div>
<div class="l-menu-shadow" style="left: auto; top: auto; width: 3px; height: 3px; display: none;"></div>
<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
</div>
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