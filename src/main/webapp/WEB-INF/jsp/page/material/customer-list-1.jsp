<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-29
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://vip2-gd.youshang.com/settings/customer-list.jsp -->
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
        .matchCon {
            width: 280px;
        }

        .chk-list {
            line-height: 28px;
        }
    </style>

</head>
<body style="">
<div class="bill-ser-top">
    <ul class="ul-inline cf">
        <li>

            <span class="ui-tree-wrap" style="width:208px"><input type="text" class="input-txt" style="width:182px"
                                                                  id="catorage" autocomplete="off" placeholder="类别"
                                                                  value=""><span class="trigger"></span></span></li>
        <li>
            <input type="text" id="matchCon" class="ui-input ui-input-ph matchCon" value="输入客户编号/ 名称/ 联系人/ 电话查询">
        </li>
        <li class="chk-list" id="chk-ischecked" style="display: list-item;">
            <span class="chk over"><input type="checkbox" value="ischecked" name="ischecked">显示禁用客户</span>
        </li>
        <li><a class="ui-btn mrb ui-btn-search" id="search">查询</a></li>
    </ul>

</div>
<div class="wrapper btc">
    <div class="ui-config-box">
	        <span id="config" class="ui-config">
	        	<a href="http://vip2-gd.youshang.com/settings/customer-list.jsp#" class="ui-icon-config-new"></a>
	        	列设置
	        	</span>
    </div>

    <div class="bill-ser-botm cf">
        <div class="fr ml10">
            <a href="http://vip2-gd.youshang.com/settings/customer-list.jsp#" class="ui-btn-bill ui-btn-add mrb"
               id="btn-add">新增</a>
            <a class="ui-btn-bill mrb" id="btn-disable">禁用</a>
            <a class="ui-btn-bill mrb" id="btn-enable">启用</a>
            <!--<a href="#" class="ui-btn mrb" id="btn-print">打印</a>-->
            <a href="http://vip2-gd.youshang.com/settings/customer-list.jsp#" class="ui-btn-bill mrb"
               id="btn-import">导入</a>
            <a href="http://vip2-gd.youshang.com/settings/customer-list.jsp#" class="ui-btn-bill mrb"
               id="btn-export">导出</a>
            <a href="http://vip2-gd.youshang.com/settings/customer-list.jsp#" class="ui-btn-bill"
               id="btn-batchDel">删除</a>
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
                        class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span></div>
                <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1371px;">
                    <div class="ui-jqgrid-hbox">
                        <table class="ui-jqgrid-htable" style="width:1875px" role="grid" aria-labelledby="gbox_grid"
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
                                <th id="grid_operate" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_operate" class="ui-jqgrid-sortable">操作<span class="s-ico"
                                                                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_customerType" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_customerType" class="ui-jqgrid-sortable">客户类别<span class="s-ico"
                                                                                                          style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_cLevel" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 100px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_cLevel" class="ui-jqgrid-sortable">客户等级<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_number" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 100px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_number" class="ui-jqgrid-sortable">客户编号<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_name" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 220px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_name" class="ui-jqgrid-sortable">客户名称<span class="s-ico"
                                                                                                  style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_employeeId" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 220px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_employeeId" class="ui-jqgrid-sortable">销售人员ID<span class="s-ico"
                                                                                                          style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_employeeName" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 220px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_employeeName" class="ui-jqgrid-sortable">销售人员<span class="s-ico"
                                                                                                          style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_contacter" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_contacter" class="ui-jqgrid-sortable">联系人<span class="s-ico"
                                                                                                      style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_mobile" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 100px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_mobile" class="ui-jqgrid-sortable">手机<span class="s-ico"
                                                                                                  style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_telephone" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_telephone" class="ui-jqgrid-sortable">座机<span class="s-ico"
                                                                                                     style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_linkIm" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 120px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_linkIm" class="ui-jqgrid-sortable">QQ/微信/Email<span class="s-ico"
                                                                                                           style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_difMoney" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_difMoney" class="ui-jqgrid-sortable">应收款余额<span class="s-ico"
                                                                                                       style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_deliveryAddress" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_deliveryAddress" class="ui-jqgrid-sortable">送货地址<span
                                            class="s-ico" style="display:none"><span sort="asc"
                                                                                     class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_authUser" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_authUser" class="ui-jqgrid-sortable">已授权用户<span class="s-ico"
                                                                                                       style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_delete" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 80px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                               style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_delete" class="ui-jqgrid-sortable">状态<span class="s-ico"
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
                <div class="ui-jqgrid-bdiv" style="height: 467px; width: 1371px;">
                    <div style="position:relative;">
                        <div></div>
                        <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                               aria-multiselectable="true" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                               style="width: 1875px;">
                            <tbody>
                            <tr class="jqgfirstrow" role="row" style="height:auto">
                                <td role="gridcell" style="height:0px;width:20px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:220px;"></td>
                                <td role="gridcell" style="height:0px;width:220px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:220px;"></td>
                                <td role="gridcell" style="height:0px;width:80px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:120px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:200px;"></td>
                                <td role="gridcell" style="height:0px;width:200px;"></td>
                                <td role="gridcell" style="height:0px;width:80px;"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
            <div id="page" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr" style="width: 1371px;">
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
                                                             value="0" role="textbox"> 共 <span id="sp_1_page">0</span> 页
                                        </td>
                                        <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                class="ui-separator"></span></td>
                                        <td id="next_page" class="ui-pg-button ui-corner-all"><span
                                                class="ui-icon ui-icon-seek-next"></span></td>
                                        <td id="last_page" class="ui-pg-button ui-corner-all"><span
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
<script src="../../js/judgment/customerList.js"></script>

<ul id="tree5498" class="ztree ztreeCombo showRoot" style="max-height: 200px; top: 143px; left: 524px; width: 250px;">
    <li id="tree5498_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree5498_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree5498_1_a" class="level0" treenode_a="" onclick="" target="_blank" style="" title="请选择客户类别"><span
            id="tree5498_1_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span
            id="tree5498_1_span">请选择客户类别</span></a></li>
</ul>
<div style="position: absolute; left: -9999em; top: 202px; visibility: visible; width: auto; z-index: 1976;">
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

</body>
</html>