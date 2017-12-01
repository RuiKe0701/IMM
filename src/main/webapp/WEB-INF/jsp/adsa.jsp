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


</body>
</html>
