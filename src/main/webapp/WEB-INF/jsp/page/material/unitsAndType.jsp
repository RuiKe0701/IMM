<%--单位和商品类型管理
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-12-07
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
    万丈高楼平地起
    <c:forEach items="${units}" var="u">
        <tr id="units">
            <td>${u.unitsId}</td>
            <td>${u.unitsName}</td>
            <br>
        </tr>
    </c:forEach>
</body>
</html>
