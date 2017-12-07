<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-12-06
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://vip2-gd.youshang.com/settings/unit-list-new.jsp -->
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
        body {
            overflow-y: auto;
        }

        .wrapper {
            margin-bottom: 4px
        }

        .grid-wrap p {
            margin: 5px 0;
        }

        #tree {
            background-color: #fff;
            width: 225px;
            border: solid #ddd 1px;
            margin-left: 5px;
            height: 100%;
        }

        h3 {
            background: #EEEEEE;
            border: 1px solid #ddd;
            padding: 5px 10px;
        }

        .grid-wrap {
            position: relative;
        }

        .grid-wrap h3 {
            border-bottom: none;
        }

        .grid-wrap .ui-btn {
            margin-left: 10px;
        }

        #tree h3 {
            border-style: none;
            border-bottom: solid 1px #D8D8D8;
        }

        .quickSearchField {
            padding: 10px;
            background-color: #f5f5f5;
            border-bottom: solid 1px #D8D8D8;
        }

        #searchCategory input {
            width: 165px;
        }

        .innerTree {
            overflow-y: auto;
        }

        #hideTree {
            cursor: pointer;
            color: #fff;
            padding: 0 4px;
            background-color: #B9B9B9;
            border-radius: 3px;
            position: absolute;
            top: 5px;
            right: 5px;
        }

        #hideTree:hover {
            background-color: #AAAAAA;
        }

        #clear {
            display: none;
        }

        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
        }
    </style>
</head>
<body style="">
<div class="wrapper">
    <div class="mod-toolbar-top cf">
        <div class="fl">
            <strong class="tit">计量单位</strong>
        </div>
    </div>
    <div class="cf">
        <div class="">
            <div class="grid-wrap">
                <h3>单计量单位<a href="http://vip2-gd.youshang.com/settings/unit-list-new.jsp#" class="ui-btn ui-btn-add"
                            id="btn-add">新增</a></h3>
                <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                     style="width: 1371px;">
                    <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                    <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...
                    </div>
                    <div class="ui-jqgrid-view" id="gview_grid" style="width: 1371px;">
                        <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                             style="display: none;"><a role="link"
                                                       class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                       style="right: 0px;"><span
                                class="ui-icon ui-icon-circle-triangle-n"></span></a><span
                                class="ui-jqgrid-title"></span></div>
                        <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1371px;">
                            <div class="ui-jqgrid-hbox">
                                <table class="ui-jqgrid-htable" style="width:270px" role="grid"
                                       aria-labelledby="gbox_grid" cellspacing="0" cellpadding="0" border="0">
                                    <thead>
                                    <tr class="ui-jqgrid-labels" role="rowheader">
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
                                        <th id="grid_name" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_name" class="ui-jqgrid-sortable">名称<span class="s-ico"
                                                                                                        style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_rate" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 150px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_rate" class="ui-jqgrid-sortable">换算关系<span class="s-ico"
                                                                                                          style="display:none"><span
                                                    sort="asc"
                                                    class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                    sort="desc"
                                                    class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                            </div>
                                        </th>
                                        <th id="grid_rate" role="columnheader"
                                            class="ui-state-default ui-th-column ui-th-ltr"
                                            style="width: 150px; display: none;"><span
                                                class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                style="cursor: col-resize;">&nbsp;</span>
                                            <div id="jqgh_grid_rate" class="ui-jqgrid-sortable">是否默认单位<span
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
                        <div class="ui-jqgrid-bdiv" style="height: 250px; width: 1371px;">
                            <div style="position:relative;">
                                <div></div>
                                <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                                       aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                                       style="width: 270px;">
                                    <tbody>
                                    <tr class="jqgfirstrow" role="row" style="height:auto">
                                        <td role="gridcell" style="height:0px;width:60px;"></td>
                                        <td role="gridcell" style="height:0px;width:200px;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                        <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
                </div>
                <div id="unitGroupWap">
                    <h3>多计量单位<a href="http://vip2-gd.youshang.com/settings/unit-list-new.jsp#" class="ui-btn ui-btn-add"
                                id="btn-add-group">新增</a></h3>
                    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_gridGroup" dir="ltr"
                         style="width: 1371px;">
                        <div class="ui-widget-overlay jqgrid-overlay" id="lui_gridGroup"></div>
                        <div class="loading ui-state-default ui-state-active" id="load_gridGroup"
                             style="display: none;">读取中...
                        </div>
                        <div class="ui-jqgrid-view" id="gview_gridGroup" style="width: 1371px;">
                            <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                                 style="display: none;"><a role="link"
                                                           class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                           style="right: 0px;"><span
                                    class="ui-icon ui-icon-circle-triangle-n"></span></a><span
                                    class="ui-jqgrid-title"></span></div>
                            <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1371px;">
                                <div class="ui-jqgrid-hbox">
                                    <table class="ui-jqgrid-htable" style="width:270px" role="grid"
                                           aria-labelledby="gbox_gridGroup" cellspacing="0" cellpadding="0" border="0">
                                        <thead>
                                        <tr class="ui-jqgrid-labels" role="rowheader">
                                            <th id="gridGroup_operate" role="columnheader"
                                                class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;">
                                                <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                      style="cursor: col-resize;">&nbsp;</span>
                                                <div id="jqgh_gridGroup_operate" class="ui-jqgrid-sortable">操作<span
                                                        class="s-ico" style="display:none"><span sort="asc"
                                                                                                 class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                        sort="desc"
                                                        class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                </div>
                                            </th>
                                            <th id="gridGroup_name" role="columnheader"
                                                class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;">
                                                <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                      style="cursor: col-resize;">&nbsp;</span>
                                                <div id="jqgh_gridGroup_name" class="ui-jqgrid-sortable">名称<span
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
                            <div class="ui-jqgrid-bdiv" style="height: 250px; width: 1371px;">
                                <div style="position:relative;">
                                    <div></div>
                                    <table id="gridGroup" tabindex="0" cellspacing="0" cellpadding="0" border="0"
                                           role="grid" aria-multiselectable="false" aria-labelledby="gbox_gridGroup"
                                           class="ui-jqgrid-btable" style="width: 270px;">
                                        <tbody>
                                        <tr class="jqgfirstrow" role="row" style="height:auto">
                                            <td role="gridcell" style="height:0px;width:60px;"></td>
                                            <td role="gridcell" style="height:0px;width:200px;"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="ui-jqgrid-resize-mark" id="rs_mgridGroup">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="../../js/judgment/unitListNew.js"></script>

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
