<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-27
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
</head>
<body>
<form method="post" action="/indexs.do" >
    name<input type="text" name="userName" id="userName" /><br>
    password<input type="text" name="userPassword" id="userPassword" /><br>
    employeeId（输入1）<input type="text" name="employeeId" id="employeeId" /><br>
    userState（输入0）<input type="text" name="userState" id="userState" />
    <button type="submit" >提交</button>
</form>
</body>
</html>
