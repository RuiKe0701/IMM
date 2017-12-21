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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

    <title>精斗云云进销存</title>
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />

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
    <script src="${pageContext.request.contextPath }/js/material/staff-list-4.js"></script>

    <style>
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
        li{
            list-style-type:none;
        }
    </style>
    <script>
        $(function () {
            var i=$("#control").val();
            if(i==0){
                document.getElementById("btn-enable").setAttribute("disabled",true);
                //控制按钮恢复可点击
                $("#addClient").attr("disabled",false);
                $("#btn-disable").attr("disabled",false);
            }
            if(i==1){
                document.getElementById("btn-disable").setAttribute("disabled",true);
                document.getElementById("addClient").setAttribute("disabled",true);
                //控制按钮恢复可点击
                $("#btn-enable").attr("disabled",false);
            }
        })
    </script>
</head>
<div style="">
    <input style="display: none" id="control" value="${i}" />
    <div class="bill-ser-top">
        <ul class="ul-inline cf">
            <li class="chk-list" id="chk-ischecked" style="display: list-item;position: relative;left: 60px;">
                <div >

                    <button type="button" id="cooperation" name="0" class="btn btn-info" data-toggle="modal" >
                        <span class="">在职</span></button>
                    <button type="button" id="termination" name="1" class="btn btn-info" data-toggle="modal">
                        <span class="">离职</span>
                    </button>
                </div>
            </li>
        </ul>
    </div>
    <div class="wrapper btc" style="z-index:0;height: 600px" >
        <div class="bill-ser-botm cf">
            <div class="fr ml10">
                <button type="button" id="addClient" class="btn btn-info" data-toggle="modal" data-target="#myModal" ><span class="">新增</span></button>
                <a class="btn btn-info"name="jin" id="btn-disable"><span class="">离职员工</span></a>
                <a class="btn btn-info" id="btn-enable"><span class="">在职员工</span></a>
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
            <c:if test="${i==0}">
                <form id="form" action="/employee/cooperative.do" method="post" >
                    <input style="display: none" name="currentPage"  value="1" />
                    <li style="position: relative;left: 15%;top:-94px">
                        <button type="submit" class="btn btn-info">查找</button>
                        <input name="employeeName" placeholder ="名称/ 联系人/ 电话查询" class="input-medium search-query" type="text" />
                    </li>
                    <table class="table table-striped" style="width: 1200px">
                        <thead>
                        <tr>
                            <th></th>
                            <th>员工名称</th>
                            <th>职位名称</th>
                            <th>身份证号</th>
                            <th>移动电话</th>
                            <th>电子邮箱</th>
                            <th>联络地址</th>
                            <th>劳务关系</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody >
                        <c:forEach items="${cooperative}" var="s">
                            <tr id="${s.employeeId}"  class="clients">
                                <td><input class="employeeId"  runat="server" type="checkbox" value="${s.employeeId}" /></td>
                                <td id="employeeId" style="display: none">${s.employeeId}</td>
                                <td id="employeeName">${s.employeeName}</td>
                                <td id="positionId">${s.position.positionName}</td>
                                <td id="employeeIdNumber">${s.employeeIdNumber}</td>
                                <td id="employeeMobilePhone">${s.employeeMobilePhone}</td>
                                <td id="employeeEmail">${s.employeeEmail}</td>
                                <td id="employeeAddress">${s.employeeAddress}</td>
                                <c:if test="${s.employeeState==0}">
                                    <td  id="employeeState">在职</td>
                                </c:if>
                                <c:if test="${s.employeeState==1}">
                                    <td  id="employeeState">离职</td>
                                </c:if>
                                <td>
                                    <button type="button" onclick="gainclient(${s.employeeId})"id="${s.employeeId}" data-target="#update" name="updateClient"   class="btn btn-info btn-sm" data-toggle="modal"  ><span class="up">修改</span></button>
                                </td>
                            </tr>
                        </c:forEach>
                        <div class="ads" id="dsa" style="position: absolute;left: 75%;top:150%">
                            <ul class="pagination" >
                                <li><a href="/employee/cooperative.do?currentPage=1">首页</a></li>
                                <c:if test="${pages.currentPage >1}">
                                    <li><a href="/employee/cooperative.do?currentPage=${pages.currentPage-1}">&laquo;</a></li>
                                </c:if>
                                <c:if test="${pages.currentPage ==1}">
                                    <li style="display: none"><a href="/employee/cooperative.do?currentPage=${pages.currentPage-1}">&laquo;${pages.currentPage-1}</a></li>
                                </c:if>
                                <c:forEach var="a" items="${pages.pageBar}">
                                    <li><a href="/employee/cooperative.do?currentPage=${a}">${a}</a></li>
                                </c:forEach>
                                <c:if test="${pages.currentPage<pages.totalPage}">
                                    <li><a href="/employee/cooperative.do?currentPage=${pages.currentPage+1}">&raquo;</a></li>
                                </c:if>
                                <c:if test="${pages.currentPage==pages.totalPage}">
                                    <li style="display: none"><a href="/employee/cooperative.do?currentPage=${pages.currentPage+1}">&raquo;${pages.currentPage+1}</a></li>
                                </c:if>
                                <li><a href="/employee/cooperative.do?currentPage=${pages.totalPage}">末页</a></li>
                                <br>
                                <li><a >共有${pages.totalRecord}条数据</a></li>
                                <li><a>共有${pages.totalPage}页</a></li>
                            </ul>
                        </div>
                        </tbody>
                    </table>
                </form>
            </c:if>
            <c:if test="${i==1}">
                <form id="form" action="/employee/noncooperation.do" method="post" >
                    <input style="display: none" name="currentPage"  value="1" />
                    <li style="position: relative;left: 15%;top:-94px">
                        <button type="submit" class="btn btn-info">查找</button>
                        <input name="employeeName" placeholder ="名称/ 联系人/ 电话查询" class="input-medium search-query" type="text" />
                    </li>
                    <table class="table table-striped" style="width: 1200px">
                        <thead>
                        <tr>
                            <th></th>
                            <th>员工名称</th>
                            <th>职位名称</th>
                            <th>身份证号</th>
                            <th>移动电话</th>
                            <th>电子邮箱</th>
                            <th>联络地址</th>
                            <th>劳务关系</th>
                        </tr>
                        </thead>
                        <tbody >
                        <c:forEach items="${noncooperation}" var="n">
                            <tr id="${n.employeeId}"  class="clients">
                                <td><input class="employeeId"  runat="server" type="checkbox" value="${n.employeeId}" /></td>
                                <td id="employeeId" style="display: none">${n.employeeId}</td>
                                <td id="employeeName">${n.employeeName}</td>
                                <td id="positionId">${n.position.positionName}</td>
                                <td id="employeeIdNumber">${n.employeeIdNumber}</td>
                                <td id="employeeMobilePhone">${n.employeeMobilePhone}</td>
                                <td id="employeeEmail">${n.employeeEmail}</td>
                                <td id="employeeAddress">${n.employeeAddress}</td>
                                <c:if test="${n.employeeState==0}">
                                    <td  id="employeeState">在职</td>
                                </c:if>
                                <c:if test="${n.employeeState==1}">
                                    <td  id="employeeState">离职</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <div  style="position: absolute;left: 75%;top: 150%">
                            <ul class="pagination" >
                                <li><a href="/employee/noncooperation.do?currentPage=1">首页</a></li>
                                <c:if test="${pp.currentPage >1}">
                                    <li><a href="/employee/noncooperation.do?currentPage=${pp.currentPage-1}">&laquo;</a></li>
                                </c:if>
                                <c:if test="${pp.currentPage ==1}">
                                    <li style="display: none"><a href="/employee/noncooperation.do?currentPage=${pp.currentPage-1}">&laquo;${pp.currentPage-1}</a></li>
                                </c:if>
                                <c:forEach var="a" items="${pp.pageBar}">
                                    <li><a href="/employee/noncooperation.do?currentPage=${a}">${a}</a></li>
                                </c:forEach>
                                <c:if test="${pp.currentPage<pp.totalPage}">
                                    <li><a href="/employee/noncooperation.do?currentPage=${pp.currentPage+1}">&raquo;</a></li>
                                </c:if>
                                <c:if test="${pp.currentPage==pp.totalPage}">
                                    <li style="display: none"><a href="/employee/noncooperation.do?currentPage=${pp.currentPage+1}">&raquo;${pp.currentPage+1}</a></li>
                                </c:if>
                                <li><a href="/employee/noncooperation.do?currentPage=${pp.totalPage}">末页</a></li>
                                <br>
                                <li><a >共有${pp.totalRecord}条数据</a></li>
                                <li><a>共有${pp.totalPage}页</a></li>
                            </ul>
                        </div>
                        </tbody>
                    </table>
                </form>
            </c:if>
        </div>

    </div>
    <%-- 分页--%>


    <!-- 新增 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form class="modal-content" id="addemployee">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModabel">
                        新增员工信息
                    </h4>
                </div>
                <div class="modal-body" style="width: 300px;height: 500px" >
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">员工名称</span>
                        <input  id="addname" name="employeeName" type="text" placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                    </div>
                    <span  class="reminder" id="Divname">&nbsp;</span>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">职位名称</span>
                        <select id="addpersonInCharge" name="positionId" class="form-control"   style="width:300px;opacity:1;">
                            <c:forEach  var="p" items="${positions}">
                                <option value="${p.positionId}" >${p.positionName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <span  class="reminder" id="DivpersonInCharge">&nbsp;</span>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">身份证号</span>
                        <input name="employeeIdNumber"  id="addpost" type="text"placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                    </div>
                    <span  class="reminder" id="Divpost">&nbsp;</span>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">移动电话</span>
                        <input name="employeeMobilePhone"  id="addaddress" type="text" placeholder="请输入100字以内信息"class="form-control"  style="width:487px;">
                    </div>
                    <span   class="reminder" id="Divaddress">&nbsp;</span>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">电子邮箱</span>
                        <input name="employeeEmail"  id="addfactoryAddress" type="text"placeholder="请输入100字以内信息" class="form-control"  style="width:487px;">
                    </div>
                    <span  class="reminder" id="DivfactoryAddress">&nbsp;</span> <br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">联络地址</span>
                        <input name="employeeAddress"  id="addmobilePhone" value="暂无" type="text" class="form-control" placeholder="请输入正确号码" style="width:487px;">
                    </div>
                    <span  class="reminder" id="DivmobilePhone">&nbsp;</span> <br>
                    <div class="input-group" style="display: none">
                        <span class="input-group-addon" style="width: 81px;">是否已删除</span>
                        <input name="employeeState" id="addstate" type="text" value="0" class="form-control"  style="width:487px;">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeAdd" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="insert" class="btn btn-primary">
                        提交新增
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 修改 -->
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="updateemployee">
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
                    <input id="updateid" name="employeeId" style="display: none"/>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">员工名称</span>
                        <input  name="employeeName" id="updatename" type="text" placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                    </div>
                    <span class="reminder" id="remindername">&nbsp;</span><br>
                    <div class="input-group" style="border: 10px; bordercolor:#000000">
                        <span class="input-group-addon" style="width: 81px;">职位信息</span>
                            <select id="updatepersonInCharge" name="positionId" class="form-control"   style="width:300px;opacity:1;">
                                <c:forEach  var="p" items="${positions}">
                                <option value="${p.positionId}" >${p.positionName}</option>
                                </c:forEach>
                            </select>
                   </div>
                    <span class="reminder" id="reminderpersonInCharge">&nbsp;</span><br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">身份证号</span>
                        <input name="employeeIdNumber"  id="updatepost" type="text"placeholder="请输入50字以内信息" class="form-control" style="width:487px;">
                    </div>
                    <span class="reminder" id="reminderpost">&nbsp;</span><br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">移动电话</span>
                        <input name="employeeMobilePhone"   id="updateaddress" type="text" placeholder="请输入100字以内信息"class="form-control"  style="width:487px;">
                    </div>
                    <span class="reminder" id="reminderaddress">&nbsp;</span><br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">电子邮箱</span>
                        <input name="employeeEmail"  id="updatefactoryAddress" type="text"placeholder="请输入100字以内信息" class="form-control"  style="width:487px;">
                    </div>
                    <span class="reminder" id="reminderfactoryAddress">&nbsp;</span><br>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 81px;">联络地址</span>
                        <input name="employeeAddress"  id="updatemobilePhone"  type="text" class="form-control" placeholder="请输入正确号码" style="width:487px;">
                    </div>
                    <span class="reminder" id="remindermobilePhone">&nbsp;</span><br>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeUpdate" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="updates" class="btn btn-primary">
                        提交修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
</body>

</html>