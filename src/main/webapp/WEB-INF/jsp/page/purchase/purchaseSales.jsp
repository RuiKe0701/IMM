
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>精斗云云进销存</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/select/dist/css/bootstrap-select.css">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/js/plugins/layer/laydate/skins/default/laydate.css" id="LayDateSkin">
    <style>
        th{
            text-align: center;
        }
        td{
            text-align: center;
        }
        li{
            list-style: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#search").click(function () {
                var v=$("#end").val();
                var c=$("#hello").val();
                if(c>v){
                   alert("起始日期不能大于结束日期");
                   return false;
                }

            });
            //全选
            $("#checkAll").click(function () {
                if(this.checked){
                    $("[type='checkbox']").prop("checked", true);
                }else{
                    $("[type='checkbox']").prop("checked", false);
                }
            });
            $("#toPo").click(function () {
                if($("input[type='checkbox']").is(':checked')){
                    var salesInformation=new Array();
                    var salesInformationList=null;
                    $(".eachtr").each(function (index,data) {
                        if($(data).find(".ck").is(':checked')){
                            var merchandiseId=$(data).find(".merchandiseId").html();
                            var merchandiseName=$(data).find(".merchandiseName").html();
                            var unitsId=$(data).find(".unitsId").html();
                            var unitsName=$(data).find(".unitsName").html();
                            var siVolume=$(data).find(".piVolume").val();
                            var salesId=$(data).find(".salesId").html();
                            var salesDate=$(data).find(".salesDate").html();
                            var siActualPrice=$(data).find(".piActualPrice").val();
                            var obj=new Object();
                            obj.merchandiseId=merchandiseId;
                            obj.merchandiseName=merchandiseName;
                            obj.unitsName=unitsName;
                            obj.unitsId=unitsId;
                            obj.siVolume=siVolume;
                            obj.salesId=salesId;
                            obj.salesDate=salesDate;
                            obj.siActualPrice=siActualPrice;
                            salesInformation.push(obj);
                            salesInformationList=JSON.stringify(salesInformation);
                        }

                    });
                    $.ajax({
                        type: "post",
                        url: "/purchases/generateOrders.do",
                        data:{
                            "salesInformationList":salesInformationList
                        },
                        dataType: "json",
                        success:function () {
                            window.location.href="/purchaseOrder/loginPurchase.do";
                        }
                    })
                }else {
                    alert("请选择你要生成订单的列");
                    return false;
                }

            })
        })
    </script>
</head>
<body style="">

<div class="bill-ser-top">
    <form action="/saleInformation/selectAllSaleInformation.do" method="post">
    <div style="height: 30px;"></div>
    <ul class="ul-inline cf">
        <li style="float: left;width: 130px">

            <select  class="selectpicker show-tick form-control" style="width:130px;height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true" id="merchandiseId" name="merchandiseId">
              <option value="0">请选择药品</option>
              <c:forEach items="${merchands}" var="mercha">
                  <option value="${mercha.merchandiseId}">${mercha.merchandiseName}</option>
              </c:forEach>
            </select>
        </li>
        <li style="float: left">
            <label>&nbsp;&nbsp;&nbsp;交货日期:</label>
            <input id="hello"  name="startTime">
            <i>-</i>
            <input id="end" class="" name="endTime">
        </li>
        <li style="float: left">
            <input type="radio" id="check" name="siState" value="1" checked="checked" onclick="this.value=this.checked?1:0"><label> 已采购完订单不显示</label>
            <input type="submit" class="ui-btn ui-btn-search" href="" id="search" value="查询"/>
        </li>
    </ul>
    <br/>
    </form>
</div>
<div class="wrapper btc">
    <div style="height: 50px;"></div>
    <div class="bill-ser-botm">
        <div class="cf">

            <div class="fr" style="position: absolute;top: 70px;right: 60px">
                <button class="btn btn-default" id="toPo">生成购货订单</button>
            </div>
        </div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
             style="width: 1354px;">
            <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>

            <div class="ui-jqgrid-view" id="gview_grid" style="width: 1354px;">
                <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                     style="display: none;">
                    <a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton" style="right: 0px;">
                        <span class="ui-icon ui-icon-circle-triangle-n"></span>
                    </a><span class="ui-jqgrid-title"></span>
                </div>
                <table class="table table-bordered" style="width: 1250px">

                    <thead>
                    <tr>
                        <th style="width: 25px;"><input type="checkbox" id="checkAll"></th>
                        <th style="display: none">销货商品id</th>
                        <th>销货商品名称</th>
                        <th>销货商品单位</th>
                        <th>销货商品数量</th>
                        <th>订单号</th>
                        <th>订单日期</th>
                        <th>待采购数量</th>
                        <th>本次采购数量</th>
                        <th>本次采购价格</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${salesInformations}" var="salesInfo">
                        <tr class="eachtr">
                            <td style="width: 25px;text-align: center"><input class="ck" type="checkbox"></td>
                            <td class="merchandiseId" style="display: none">${salesInfo.merchandise.merchandiseId}</td>
                            <td class="merchandiseName">${salesInfo.merchandise.merchandiseName}</td>
                            <td style="display: none" class="unitsId">${salesInfo.units.unitsId}</td>
                            <td class="unitsName">${salesInfo.units.unitsName}</td>
                            <td class="siVolume">${salesInfo.siVolume}</td>
                            <td class="salesId">${salesInfo.salesId}</td>
                            <td class="salesDate"><fmt:formatDate value="${salesInfo.sales.salesDate}" pattern="yyyy-MM-dd"/> </td>
                            <td>${salesInfo.siVolume}</td>
                            <td><input class="piVolume" type="text" style="border: none;height: 30px;text-align: center"></td>
                            <td><input class="piActualPrice" type="text" style="border: none;height: 30px;text-align: center"></td>
                            <td style="width: 120px;text-align: center"><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" >修改</button><button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#del" >删除</button></td>
                        </tr>
                    </c:forEach>

                    </tbody>


                </table>

                <div>
                    <ul class="pagination" >
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>




<div style="left: 0px; top: 0px; visibility: hidden; position: absolute;" class="">

    <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改采购订单
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon">商品名称</span>
                        <input type="text" class="form-control" placeholder="twitterhandle">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">单位</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">数量</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">订单号</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <br/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">订单日期</span>
                        <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                    </div>
                    <br/>  <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">库存</span>
                    <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                    <br/>  <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">购货日期</span>
                    <input type="text" class="form-control" placeholder="twitterhandle" style="width:487px;">
                </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">
                        保存
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div  class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" >
                        确定删除吗
                    </h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        确定
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


</div>
<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
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