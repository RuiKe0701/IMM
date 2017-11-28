<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-27
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<form method="post" action="/updatess.do" >
   id <input type="text" name="warehousingId" id="warehousingId" /><br>
    备注<input type="text" name="warehousingRemarks" id="warehousingRemarks" />
    <button type="submit" >提交</button>
</form>
</body>
</html>
