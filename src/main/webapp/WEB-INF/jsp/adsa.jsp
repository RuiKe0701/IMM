<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-30
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>


</head>
<body>
<div>

        <div class="ta">
        <LABEL>姓名：<input type="text" class="s" name="user.userName" /></LABEL>
        <label>密码：<input type="text" class="ss" name="user.userPassword" /></label>
    </div>
        <div class="ta">
            <LABEL>姓名：<input type="text" class="s" name="user.userName" /></LABEL>
            <label>密码：<input type="text" class="ss" name="user.userPassword" /></label>
        </div>
        <div class="ta">
            <LABEL>姓名：<input type="text" class="s" name="user.userName" /></LABEL>
            <label>密码：<input type="text" class="ss" name="user.userPassword" /></label>
        </div>

        <%--<button onclick="submit()">提交</button>--%>
    <button id="tijiao">提交</button>
</div>


<c:if test="${pages!=null}">
<c:forEach var="a" items="${pages}">
    <tr>
    <td>${a.userName}</td>
    </tr>
</c:forEach>
</c:if>
<div style="width: 300px;height: 400px;float:right">
    <div >
        <td >共${pagesList.totalPage}页,共${pagesList.totalRecord}条数据</td>
    </div>
    <td ><a href="/user/page.do?currentPage=1">首页</a></td>
    <td><a href="/user/page.do?currentPage=${pagesList.currentPage-1}">上一页</a></td>
    <td>当前第${pagesList.currentPage}页</td>
    <td><a href="/user/page.do?currentPage=${pagesList.currentPage+1}">下一页</a></td>
    <td><a href="/user/page.do?currentPage=${pagesList.totalPage}">尾页</a></td>
</div>
</body>
<script type="text/javascript">
    function tijiao() {
        $("#tijiao").click(function () {
            var userList=new Array();
            $(".ta").each(function (index,data) {
                var uname =$(data).find(".s").val();
                var upassword =$(data).find(".ss").val()
                var object = new Object();
                object.userName = uname;
                object.userPassword=upassword;
                userList.push(object);
            });
            var stuattendancelists=JSON.stringify(userList);
        $.ajax({
                type: "post",
                url: "/user/doinsetadt.do",
                data:{
                    "stuattendancelists": stuattendancelists,
                },
                  dataType: "json",
                 success: function (data) {
                    if(data==1){
                        alert("成功了")
                    }
                 },
                  error: function () {
                     alert("系统异常，请稍后重试！");
            }
        })
        })
    }
    $(function () {
        tijiao();
    })

</script>
</html>
