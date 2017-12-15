<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-12-06
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>


    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/css/select.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
    <script src="${pageContext.request.contextPath }/js/material/customer-list-1.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/select/dist/css/bootstrap-select.css">
    <link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/bills.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath }/js/content.min.js?v=1.0.0"></script>
    <script src="${pageContext.request.contextPath }/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins/layer/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath }/select/js/bootstrap-select.js"></script>

    <style>
        .matchCon {
            width: 280px;
        }
        .chk-list {
            line-height: 28px;
        }
        .up{
            position: relative;
            top: -5px;
        }

        .reminder{
            color: red;
        }
    </style>
    <script>
        $(function () {
            document.getElementById("btn-enable").setAttribute("disabled",true);
        })
    </script>

    <script type="text/javascript">

    </script>
</head>
<body style="">
<div id="bills cf">
    <div class="con-header">
        <dl class="cf">
            <dd class="mr40" style="width: 240px">
                <input type="text" name="EmployeeId" style="display:none;" value="${user.userId}"/>
                <label><span class="red">*</span>客户:</label>
                <div class="input-group" style="width: 180px;float: right">
                    <select class="selectpicker show-tick form-control"
                            style="width:30px;height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px"
                            data-live-search="true"   id="clientId" name="clientId">
                        <c:forEach items="${clientss}" var="cl">
                            <option value="${cl.clientId}">${cl.clientName}</option>
                        </c:forEach>
                    </select>
                </div>
            </dd>
            <dd class="mr40" style="width: 240px">
                <label><span class="red">*</span>销售人员:</label>
                <div class="input-group" style="width: 170px;float: right">
                    <select class="selectpicker show-tick form-control"
                            style="width:30px;height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px"
                            data-live-search="true" id="employeeId" name="supplierId">
                        <c:forEach items="${employeess}" var="em">
                            <option value="${em.employeeId}">${em.employeeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </dd>

            <dd class="mr20 tc">
                <label>单据日期:</label>
                <input id="end" name="salesDate" class="">
            </dd>
            <dd class="mr20 tc">
                <label>单据日期2:</label>
                <input id="hello" name="salesDate2" class="">
            </dd>
            <button type="submit" class="btn btn-info">查找</button>
        </dl>
        <hr class="hrcls">

    </div>

</div>
<div class="wrapper btc" style="z-index:0">


    <div class="grid-title flex">销售明细表 </div>
    <div class="bill-ser-botm cf">
        <div class="fr ml10">
            <button type="button" id="addClient" class="btn btn-info" data-toggle="modal" data-target="#myModal" ><span class="">新增</span></button>
            <a class="btn btn-info"name="jin" id="btn-disable"><span class="">终止合作</span></a>
            <a class="btn btn-info" id="btn-enable"><span class="">启用合作</span></a>
        </div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
             style="width: 1371px;">
            <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
            <div class="ui-jqgrid-view" id="gview_grid" style="width: 1371px;">
                <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                     style="display: none;"><a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                               style="right: 0px;"><span
                        class="ui-icon ui-icon-circle-triangle-n"></span></a></div>

            </div>
            <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>

        </div>

    </div>
    <%--展示信息--%>
    <div style="position: relative;left: 50px">
        <table class="table table-striped" style="width: 1200px">
            <thead>
            <tr>
                <th></th>
                <th>客户名称</th>
                <th>负责人</th>
                <th>职位</th>
                <th>电话</th>
                <th>移动电话</th>
                <th>传真</th>
                <th>客户地址</th>
                <th>送货地址</th>
                <th>合作关系</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="tbod">
            <c:forEach items="${clients}" var="c">
                <c:if test="${c.clientState==0}">
                    <tr id="${c.clientId}"  class="clients">
                        <td><input name="client.kk" class="k"  runat="server" type="checkbox" value="${c.clientId}" /></td>
                        <td id="clientId" style="display: none">${c.clientId}</td>
                        <td id="clientName">${c.clientName}</td>
                        <td id="clientPersonInCharge">${c.clientPersonInCharge}</td>
                        <td id="clientPost">${c.clientPost}</td>
                        <td id="clientPhone">${c.clientPhone}</td>
                        <td id="clientMobilePhone">${c.clientMobilePhone}</td>
                        <td id="clientFax">${c.clientFax}</td>
                        <td id="clientAddress">${c.clientAddress}</td>
                        <td id="clientFactoryAddress">${c.clientFactoryAddress}</td>
                        <c:if test="${c.clientState==0}">
                            <td  id="clientState">合作中</td>
                        </c:if>
                        <c:if test="${c.clientState==1}">
                            <td  id="clientState">已终止</td>
                        </c:if>
                        <td  >
                            <button type="button" onclick="gainclient(${c.clientId})"id="${c.clientId}" data-target="#update" name="updateClient"   class="btn btn-info btn-sm" data-toggle="modal"  ><span class="up">修改</span></button>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- 新增 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModabel">
                    新增用户信息
                </h4>
            </div>
            <div class="modal-body" style="width: 300px;height: 500px" >
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">客户名称</span>
                    <input  id="addname" type="text" placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                </div>
                <span  class="reminder" id="Divname">&nbsp;</span>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">负责人名称</span>
                    <input  id="addpersonInCharge"placeholder="请输入50字以内信息" type="text" class="form-control"  style="width:487px;">
                </div>
                <span  class="reminder" id="DivpersonInCharge">&nbsp;</span>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">负责人职称</span>
                    <input  id="addpost" type="text"placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                </div>
                <span  class="reminder" id="Divpost">&nbsp;</span>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">客户地址</span>
                    <input  id="addaddress" type="text" placeholder="请输入100字以内信息"class="form-control"  style="width:487px;">
                </div>
                <span   class="reminder" id="Divaddress">&nbsp;</span>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">送货地址</span>
                    <input  id="addfactoryAddress" type="text"placeholder="请输入100字以内信息" class="form-control"  style="width:487px;">
                </div>
                <span  class="reminder" id="DivfactoryAddress">&nbsp;</span> <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">移动电话</span>
                    <input  id="addmobilePhone" value="暂无" type="text" class="form-control" placeholder="请输入正确号码" style="width:487px;">
                </div>
                <span  class="reminder" id="DivmobilePhone">&nbsp;</span> <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">电话</span>
                    <input  id="addphone" value="暂无" type="text" class="form-control" placeholder="请输入正确号码" style="width:487px;">
                </div>
                <span  class="reminder" id="Divphone">&nbsp;</span> <br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">传真</span>
                    <input  id="addfax" value="暂无" type="text" class="form-control" placeholder="请输入正确号码"  style="width:487px;">
                </div>
                <span class="reminder" id="Divfax">&nbsp;</span> <br>
                <div class="input-group" style="display: none">
                    <span class="input-group-addon" style="width: 81px;">是否已删除</span>
                    <input  id="addstate" type="text" value="0" class="form-control"  style="width:487px;">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeAdd" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="insert" class="btn btn-primary">
                    提交新增
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 修改 -->
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="updateTime">
                    修改用户信息
                </h4>
            </div>
            <div class="modal-body" style="width: 300px;height: 500px" >
                <input id="updateid" style="display: none"-/>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">客户名称</span>
                    <input  id="updatename" type="text" placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                </div>
                <span class="reminder" id="remindername">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">负责人名称</span>
                    <input  id="updatepersonInCharge"placeholder="请输入50字以内信息" type="text" class="form-control"  style="width:487px;">
                </div>
                <span class="reminder" id="reminderpersonInCharge">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">负责人职称</span>
                    <input  id="updatepost" type="text"placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                </div>
                <span class="reminder" id="reminderpost">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">客户地址</span>
                    <input  id="updateaddress" type="text" placeholder="请输入100字以内信息"class="form-control"  style="width:487px;">
                </div>
                <span class="reminder" id="reminderaddress">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">送货地址</span>
                    <input  id="updatefactoryAddress" type="text"placeholder="请输入100字以内信息" class="form-control"  style="width:487px;">
                </div>
                <span class="reminder" id="reminderfactoryAddress">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">移动电话</span>
                    <input  id="updatemobilePhone"  type="text" class="form-control" placeholder="请输入正确号码" style="width:487px;">
                </div>
                <span class="reminder" id="remindermobilePhone">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">电话</span>
                    <input  id="updatephone"  type="text" class="form-control" placeholder="请输入正确号码" style="width:487px;">
                </div>
                <span class="reminder" id="reminderphone">&nbsp;</span><br>
                <div class="input-group">
                    <span class="input-group-addon" style="width: 81px;">传真</span>
                    <input  id="updatefax"  type="text" class="form-control" placeholder="请输入正确号码"  style="width:487px;">
                </div>
                <span class="reminder" id="reminderfax">&nbsp;</span><br>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeUpdate" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="updates" class="btn btn-primary">
                    提交修改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 删除-->
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
</body>

<script type="text/javascript">
    $(function () {
        //修改客户是否合作
        $("#btn-enable").click(function () {
            var clientList = new Array();
            $(".clients").each(function (index, date) {
                var checkbox = $(date).find(".k");
                if(checkbox.is(':checked')){
                    //选中了
                    var id = $(date).find(".k").val();
                    var object = new Object();
                    object.kk = id;
                    clientList.push(object);
                    var cooperativeClients = JSON.stringify(clientList);
                    $.ajax({
                        type: "post",
                        url: "/client/cooperativeClient.do",
                        data: {
                            "cooperativeClients": cooperativeClients
                        },
                        dataType: "json",
                        success: function (data) {
                            if(data!=0){
                                if(data!=0){
                                    for(i in data){
                                        $("#"+data[i].clientId).remove();
                                    }
                                }
                            }
                        },
                        error: function () {
                            alert("系统异常，请稍后重试！");
                        }
                    })
                }
            });
        })
    })
</script>
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
            ti
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
</html>