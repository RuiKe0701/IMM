<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-12-05
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script type="text/javascript" src="${pageContext.request.contextPath }/images/login.js"></script>
    <link href="${pageContext.request.contextPath }/css/login2.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>

    <script type="text/javascript">
        //验证名字
        function checkFname() {
            var $fname = $("#u");
            var $divID = $("#DivFname");
            $divID.html("");
            if ($fname.val() == "") {
                $divID.html("名字不能为空");
                return false;
            }
            return true;
        }
        //验证密码
        function checkFpwd() {
            var $fname = $("#p");
            var $divID = $("#Divpwd");
            $divID.html("");
            if ($fname.val() == "") {
                $divID.html("密码不能为空");
                return false;
            }
            return true;
        }
        $(function () {
            //绑定失去焦点事件
            $("#u").blur(checkFname);
            //绑定失去焦点事件
            $("#p").blur(checkFpwd);
            //提交表单,调用验证函数
            $("#login").submit(function () {
                var flag = true;
                if (!checkFname()) flag = false;
                if (!checkFpwd()) flag = false;
                return flag;
            });
        });
    </script>
</head>
<body>
<h1></h1>
<div class="login" style="margin-top:50px;">
    <div  class="header">
        <div class="switch" id="switch">
            <a style="position: relative;left: 70px" class="switch_btn_focus" id="switch_qlogin" tabindex="7">快速登录</a>
        </div>
    </div>
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
        <!--登录-->
        <div class="web_login" id="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form  id="login"  action="/user/login.do" name="loginform" accept-charset="utf-8" class="loginForm" method="post">
                        <input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
                        <b id="hint">${hint}</b>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips"   >帐号：</label>
                            <div class="inputOuter" id="uArea">
                                <input id="u"  onkeyup="value=value.replace(/[^\a-\z\A-\Z]/g,'')"   value="a" type="name" name="userName" class="inputstyle"  />
                                <span id="DivFname"></span>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips">密码：</label>
                            <div class="inputOuter" id="pArea">
                                <input onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" value="1"  type="password" class="inputstyle" name="userPassword" id="p"  />
                                <span id="Divpwd"></span>
                            </div>
                        </div>
                        <div style="padding-left:50px;margin-top:20px;">
                            <button type="submit"  onclick="javascript:$('#login').submit()" style="width:150px;" class="button_blue">提交</button></div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>

</div>
</body></html>
