<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-12-06
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0056)http://vip2-gd.youshang.com/settings/shippingAddress.jsp -->
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

</head>
<body style="">
<div class="wrapper">
    <div class="mod-toolbar-top cf">
        <div class="fl"><strong class="tit">发货地址</strong></div>
        <div class="fr"><a href="http://vip2-gd.youshang.com/settings/shippingAddress.jsp#"
                           class="ui-btn ui-btn-sp mrb ui-btn-add" id="btn-add">新增</a><a class="ui-btn"
                                                                                         id="btn-refresh">刷新</a></div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
             style="width: 1354px;">
            <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
            <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
            <div class="ui-jqgrid-view" id="gview_grid" style="width: 1354px;">
                <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                     style="display: none;"><a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                               style="right: 0px;"><span
                        class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span></div>
                <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1354px;">
                    <div class="ui-jqgrid-hbox">
                        <table class="ui-jqgrid-htable" style="width:1030px" role="grid" aria-labelledby="gbox_grid"
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
                                <th id="grid_shortName" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_shortName" class="ui-jqgrid-sortable">地址简称<span class="s-ico"
                                                                                                       style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_linkman" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_linkman" class="ui-jqgrid-sortable">联系人<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_phone" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 100px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_phone" class="ui-jqgrid-sortable">联系电话<span class="s-ico"
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
                                    <div id="jqgh_grid_mobile" class="ui-jqgrid-sortable">手机号码<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_province" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_province" class="ui-jqgrid-sortable">省<span class="s-ico"
                                                                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_city" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 60px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                               style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_city" class="ui-jqgrid-sortable">市<span class="s-ico"
                                                                                               style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_area" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 60px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                               style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_area" class="ui-jqgrid-sortable">区<span class="s-ico"
                                                                                               style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_address" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_address" class="ui-jqgrid-sortable">详细地址<span class="s-ico"
                                                                                                     style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_postalcode" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_postalcode" class="ui-jqgrid-sortable">邮政编码<span class="s-ico"
                                                                                                        style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_isDefault" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_isDefault" class="ui-jqgrid-sortable">默认地址<span class="s-ico"
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
                <div class="ui-jqgrid-bdiv" style="height: 502px; width: 1354px;">
                    <div style="position:relative;">
                        <div></div>
                        <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                               aria-multiselectable="true" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                               style="width: 1030px;">
                            <tbody>
                            <tr class="jqgfirstrow" role="row" style="height:auto">
                                <td role="gridcell" style="height:0px;width:20px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:100px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                                <td role="gridcell" style="height:0px;width:80px;"></td>
                                <td role="gridcell" style="height:0px;width:80px;"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
            <div id="page" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr" style="width: 1354px;">
                <div id="pg_page" class="ui-pager-control" role="group">
                    <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table"
                           style="width:100%;table-layout:fixed;height:100%;" role="row">
                        <tbody>
                        <tr>
                            <td id="page_left" align="left">
                                <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table navtable"
                                       style="float:left;table-layout:auto;">
                                    <tbody>
                                    <tr>
                                        <td class="ui-pg-button ui-corner-all" title="">
                                            <div class="ui-pg-div"><span class="ui-icon-config">列设置</span></div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td id="page_center" align="center" style="white-space:pre;">
                                <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;"
                                       class="ui-pg-table">
                                    <tbody>
                                    <tr></tr>
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
<script src="../../js/judgment/shippingAddress.js"></script>

<div class="ui-widget ui-widget-content ui-corner-all ui-jqdialog" id="alertmod_grid" dir="ltr" tabindex="-1"
     role="dialog" aria-labelledby="alerthd_grid" aria-hidden="true"
     style="width: 200px; height: auto; z-index: 950; overflow: hidden; left: 595px; top: 291px;">
    <div class="ui-jqdialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" id="alerthd_grid"
         style="cursor: move;"><span class="ui-jqdialog-title" style="float: left;">注意</span><a
            href="javascript:void(0)" class="ui-jqdialog-titlebar-close ui-corner-all" style="right: 0.3em;"><span
            class="ui-icon ui-icon-closethick"></span></a></div>
    <div class="ui-jqdialog-content ui-widget-content" id="alertcnt_grid">
        <div>请选择记录</div>
        <span tabindex="0"><span tabindex="-1" id="jqg_alrt"></span></span></div>
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