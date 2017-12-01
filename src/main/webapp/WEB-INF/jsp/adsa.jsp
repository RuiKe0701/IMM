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
</head>
<body>
<c:forEach var="a" items="${pages}">
    <tr>
    <td>${a.userName}</td>
    </tr>
</c:forEach>
<div style="width: 300px;height: 400px;float:right">
    <div >
        <td >共${pagesList.totalPage}页,共${pagesList.totalRecord}条数据</td>
    </div>
    <td ><a href="#">首页</a></td>
    <td ><a href="#">上一页</a></td>
    <td >当前第${pagesList.currentPage}页</td>
    <td ><a href="#">下一页</a></td>
    <td><a href="#">尾页</a></td>
</div>
</body>
</html>
