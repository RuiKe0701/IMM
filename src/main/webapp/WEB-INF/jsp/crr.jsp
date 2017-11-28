<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-27
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
　<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
测试
<p>
    测试成功
    查询
    <c:forEach var="scc" items="${ware}">
        ${scc.user.userName}
    </c:forEach>
    <hr>
    修改
    ${warehousingRemark}
    <hr>
    新增
</p>
</body>
</html>
