<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>精斗云云进销存</title>
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/plugins/layer/laydate/skins/default/laydate.css"
          id="LayDateSkin">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/select/dist/css/bootstrap-select.css">
    <link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/bills.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function () {
            var i=7;
            $("#btnline").click(function () {

                $("#addtr").append("<tr><td>"+i+"</td><td><select><option>请选择</option></select></td><td></td><td></td><td></td><td></td><td></td></tr>");
                i=i+1;
            })
            $(".selectpicker").change(function () {
                var id=$(this).val();
                var name=$(this);
                $.ajax({
                    url:"/purchases/ajaxMerchand.do",
                    data:{"merchandiseId":id},
                    dataType:"JSON",
                    success:function (date) {
                        name.parent().parent('td').next("td").find("input").val(date.units.unitsName);
                    }
                });
            })
        })
    </script>
    <style>
        td{text-align: center}
        th{text-align: center}
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
<form action="/purchases/saveSupplierorProcureMent.do" method="post">

    <div class="wrapper">
        <div class="mod-toolbar-top mr0 cf dn" id="toolTop"></div>
        <div class="bills cf">
            <div class="con-header">
                <dl class="cf">
                    <dd class="mr40" style="width: 240px">
                        <input type="text" name="procurementEmployeeId" style="display:none;" value="${user.userId}"/>
                        <label><span class="red">*</span>客户:</label>
                        <div class="input-group" style="width: 200px;float: right">
                            <select  class="selectpicker show-tick form-control" style="width:30px;height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true" name="supplierId">
                                <c:forEach items="${clientss}" var="cl">
                                    <option value="${cl.clientId}">${cl.clientName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </dd>

                    <dd class="mr40" style="width: 240px">
                        <label><span class="red">*</span>销售人员:</label>
                        <div class="input-group" style="width: 150px;float: right">
                            <select  class="selectpicker show-tick form-control" style="width:30px;height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true" name="supplierId">
                                <c:forEach items="${employeess}" var="em">
                                    <option value="${em.employeeId}">${em.employeeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </dd>

                    <dd class="mr20 tc">
                        <label>单据日期:</label>
                        <input id="hello" class="">
                    </dd>
                    <dd class="mr20 tc">
                        <label>交货日期:</label>
                        <input id="end" class="">
                    </dd>
                    <dd id="identifier" style="float:right">
                        <label>单据编号:</label>
                        <span id="number">XHDD20171121001</span>
                        <i id="editBills"></i>
                        <i class="trigger"></i>
                        </span>
                    </dd>
                </dl>
                <hr class="hrcls">
            </div>

            <div class="wrapper_con">

                <span id="config" class="ui-config"><a href="#" class="ui-icon-config-new"></a></span>
                <div class="grid-wrap">
                    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                         style="width: 1200px;">
                        <div class="ui-jqgrid-view" id="gview_grid" style="width: 1200px;">


                            <table class="table table-bordered" >
                                <caption><button id="btnline" type="button" class="btn btn-primary ">添加行</button></caption>
                                <thead>
                                <tr style="text-align: center">
                                    <th width="30px" style="text-align: center"></th>
                                    <th style="width: 300px;text-align: center">选择商品</th>
                                    <th style="width: 160px">单位</th>
                                    <th style="width: 100px">数量</th>
                                    <th style="width: 160px">购货单价</th>
                                    <th style="width: 160px">购货金额</th>
                                    <th>备注</th>
                                </tr>
                                </thead>
                                <tbody id="addtr">
                                <c:forEach begin="1" end="6" varStatus="status">
                                    <tr>
                                        <td style="width: 30px;">${status.index}</td>
                                        <td>
                                            <div style="width: 150px">
                                                <select  class="selectpicker show-tick form-control"  style="width:30px;height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true"  name="merchandiseId">
                                                    <option>请选择</option>
                                                    <c:forEach items="${merchandisess}" var="mer">
                                                        <option  class="aaa" value="${mer.merchandiseId}">${mer.merchandiseName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>

                                        <td >
                                            <input type="text"  disabled="disabled" style="border: 0px;height: 30px;font-size: 16px;background-color: white;text-align: center">
                                            <input type="text" class="unitsId" style="display: none">
                                        </td>
                                        <td><input type="text"  onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" class="piVolume" name="piVolume" style="border: 0px;height: 30px;font-size: 16px;text-align: center"></td>
                                        <td><input type="text"  onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" class="piActualPrice" name="piActualPrice" style="border: 0px;height: 30px;font-size: 16px;text-align: center"></td>
                                        <td style="font-size: 16px;"><input  onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" class="piTotalPrice" type="text" name="piTotalPrice"disabled="disabled" style="border: 0px;height: 30px;font-size: 16px;background-color: white;text-align: center"></td>
                                        <td><input type="text" class="piRemarks" name="piRemarks" style="border: 0px;height: 30px;font-size: 16px;"/></td>
                                    </tr>
                                </c:forEach>


                                </tbody>
                            </table>

                            <div class="ui-jqgrid-sdiv" style="width: 1307px;">
                                <div class="ui-jqgrid-hbox">
                                    <table role="grid" style="width:1392px" class="ui-jqgrid-ftable" cellspacing="0"
                                           cellpadding="0" border="0">
                                        <tbody>
                                        <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                            <td role="gridcell" style="text-align:center;width: 25px;"
                                                aria-describedby="grid_rn" class="ui-state-default jqgrid-rownum">
                                                &nbsp;</td>
                                            <td role="gridcell" style="text-align:left;width: 0px;"
                                                aria-describedby="grid_operating">&nbsp;</td>
                                            <td role="gridcell" style="display:none;width: 1px;"
                                                aria-describedby="grid_goodId">&nbsp;</td>
                                            <td role="gridcell" style="width: 300px;" class="goods"
                                                aria-describedby="grid_goods">合计：
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
                                            <td role="gridcell" style="text-align:center;width: 20px;"
                                                aria-describedby="grid_inventory">&nbsp;</td>
                                            <td role="gridcell" style="width: 100px;" aria-describedby="grid_locationName">
                                                &nbsp;</td>
                                            <td role="gridcell" style="text-align:right;width: 80px;"
                                                aria-describedby="grid_qty">0
                                            </td>
                                            <td role="gridcell" style="text-align:right;width: 100px;"
                                                aria-describedby="grid_price">&nbsp;</td>
                                            <td role="gridcell" style="text-align:right;width: 126px;"
                                                aria-describedby="grid_discountRate">&nbsp;</td>
                                            <td role="gridcell" style="text-align:right;display:none;width: 126px;"
                                                aria-describedby="grid_goodsDiscountRate">&nbsp;</td>
                                            <td role="gridcell" style="text-align:right;width: 126px;"
                                                aria-describedby="grid_deduction">0.00
                                            </td>
                                            <td role="gridcell" style="display:none;width: 150px;"
                                                aria-describedby="grid_prices">&nbsp;</td>
                                            <td role="gridcell" style="text-align:right;width: 100px;"
                                                aria-describedby="grid_amount">0.00
                                            </td>
                                            <td role="gridcell" style="width: 150px;" aria-describedby="grid_description">
                                                &nbsp;</td>
                                            <td role="gridcell" style="display:none;width: 150px;"
                                                aria-describedby="grid_srcOrderEntryId">&nbsp;</td>
                                            <td role="gridcell" style="display:none;width: 150px;"
                                                aria-describedby="grid_srcOrderId">&nbsp;</td>
                                            <td role="gridcell" style="width: 120px;" aria-describedby="grid_srcOrderNo">
                                                &nbsp;</td>
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

            </div>
            <div id="mark"></div>
        </div>

        <div class="con-footer cf">
            <div class="mb10">
                <textarea type="text" id="note" class="ui-input ui-input-ph">暂无备注信息</textarea>
            </div>
            <div class="cf fr">
                <input type="submit" id="operaLog" class="ui-btn"/>
            </div>
        </div>
        <div id="initCombo" class="dn"></div>
        <div id="storageBox" class="shadow target_box dn"></div>
    </div>
    </div>
</form>
<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath }/js/content.min.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath }/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="${pageContext.request.contextPath }/js/plugins/layer/laydate/laydate.js"></script>
<script src="${pageContext.request.contextPath }/select/js/bootstrap-select.js"></script>
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