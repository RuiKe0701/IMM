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
    <link href="${pageContext.request.contextPath }/css/app.9aa0d8c4086204eafa2caf53d7294fcb.css" rel="stylesheet"
          type="text/css">
    <script type="text/javascript" charset="utf-8" async=""
            src="${pageContext.request.contextPath }/js/contains.js"></script>
    <script type="text/javascript" charset="utf-8" async=""
            src="${pageContext.request.contextPath }/js/taskMgr.js"></script>
    <script type="text/javascript" charset="utf-8" async=""
            src="${pageContext.request.contextPath }/js/views.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath }/js/shopping.js"></script>
    <script src="${pageContext.request.contextPath }/js/guoxu.js"></script>
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
                                                class="hide"></span></span> <i href="javascript:void(0);">查询</i> </a>
                                        </li>
                                        <li class="" id="purchase2">
                                            <a href="javascript:void(0);"> <span class="hasList">购货单<span
                                                    class="hide"></span></span>
                                                <i href="javascript:void(0);">查询</i> </a></li>
                                        <li class="" id="purchase3"><a href="javascript:void(0);"> <span>以销定购看板<span
                                                class="hide"></span></span> <i href="javascript:void(0);">查询</i></a>
                                        </li>
                                        <li class="" id="purchase4"><a href="javascript:void(0);"> <span>智能补货<span
                                                class="newMenuIcon"></span></span><i href="javascript:void(0);">查询</i>
                                        </a></li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>采购报表</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="purchase5"><a href="#"> <span>采购明细表<span
                                                class="hide"></span></span>
                                            <i href="javascript:void(0);">查询</i></a></li>
                                        <li class="" id="purchase6"><a href="#"> <span>采购汇总表<span
                                                class="hide"></span></span>
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
                                        <li class="" id="sales">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销货订单
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="salesForAbout">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销货单
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Original-document">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">原始单据
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                                <div class="nav-item"><h3>销售报表</h3>
                                    <ul class="sub-nav">


                                        <li class="" id="Sales-details">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售明细表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Sales-summary-commodity">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售汇总表（按商品）
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Sales-summary-client">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售汇总表（按客户）
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Sales-summary-salesperson">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售汇总表（按销售人员）
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Sales-receipt-list">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售收款一览表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="sales-profit">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售利润表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Sales-ranking">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">销售排行表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
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
                                        <li class="" id="Requisition">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">调拨单
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Count-records">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">盘点记录
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>仓库报表</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="Goods-inventory-balance">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">商品库存余额表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Goods-receipt-details">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">商品收发明细表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Send-and-receive-goods-summary">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">商品收发汇总表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
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
                                        <li class="" id="Purchase-sales-expense-list">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">采购销售费用清单
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>资金报表</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="Accounts-payabl-details">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">应付账款明细表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Accounts-receivable-details">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">应收账款明细表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Customer-statement">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">客户对账单
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Supplier-statement">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">供应商对账单
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Income-Statement">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">利润表
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
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
                                        <li class="" id="Customer-management">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">客户管理
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Supplier-management">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">供应商管理
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Commodity-management">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">职员管理
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="product-brand">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">商品品牌
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Shipping-address-management">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">发货地址管理
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="nav-item"><h3>辅助资料</h3>
                                    <ul class="sub-nav">
                                        <li class="" id="client-categories">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">客户类别
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Supplier-category">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">供应商类别
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Product-category">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">商品类别
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Expenditure-category">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">支出类别
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Income-category">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">收入类别
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="unit-of-measurement">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">计量单位
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>
                                        <li class="" id="Document-coding-rules">
                                            <a href="javascript:void(0);">
                                                <span class="hasList">单据编码规则
                                                 <span class="hide"></span>
                                                </span>
                                                <i href="javascript:void(0);">查询</i>
                                            </a>
                                        </li>



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
                            <div id="ons" class="l-tab-content-item" tabid="index"
                                 style="height: 632px;display: block;">
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
                                <iframe frameborder="0" name="purchase-purchaseOrder" id="iff" src=""
                                        style="height: 800px"></iframe>
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
<script type="text/javascript" src="js/app.ea26dd00a5823b52da4f.js"></script>
<script type="text/javascript"></script>
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