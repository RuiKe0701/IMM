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
<form method="post" action="/aa.do" >
    批号<input type="text" name="warehousingBatchNumber" id="warehousingBatchNumber" /><br>
    入库人<input type="text" name="warehousingBuyer" id="warehousingBuyer" /><br>
    采购单号<input type="text" name="procurementId" id="procurementId" /><br>
    入库日期<input type="text" name="warehousingDate" id="warehousingDate" />
    入库备注<input type="text" name="warehousingRemarks" id="warehousingRemarks" />
    经办人<input type="text" name="warehousingUserId" id="warehousingUserId" />
    是否已删除<input type="text" name="warehousingState" id="warehousingState" />
    <button type="submit" >提交</button>
</form>
</body>
</html>
