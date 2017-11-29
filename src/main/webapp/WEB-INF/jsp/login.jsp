<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-28
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <link href="${pageContext.request.contextPath }/iconfont/style.css" type="text/css" rel="stylesheet">
    <style>
        body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
        .wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
        .main_content{background:url(../../img/main_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
        .form-group{position:relative;}
        .login_btn{display:block; background:#3872f6; color:#fff; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
        .login_input{width:100%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
        .icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#3872f6;}
        .font16{font-size:16px;}
        .mg-t20{margin-top:20px;}
        @media (min-width:200px){.pd-xs-20{padding:20px;}}
        @media (min-width:768px){.pd-sm-50{padding:50px;}}
        #grad {
            background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
            background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
        }
    </style>

   <%-- <script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#bu").click(function(){
                var user=$("#userName").val();

                alert(user);
                if(user.length==0 || user.value()==null){
                  $("#hint").val("用户名不能为空");
                }
            })
        })
    </script>--%>
</head>

<body style="background:url(${pageContext.request.contextPath }/img/bg.jpg) no-repeat;">

<div class="container wrap1" style="height:450px;">
    <h2 class="mg-b20 text-center">某某公司登录页面</h2>
    <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
        <p class="text-center font16">用户登录</p>
        <form action="/user/login.do" method="post">
            <div class="form-group mg-t20">
                <i class="icon-user icon_font"></i>
                <input type="name" name="userName" class="login_input" id="userName" placeholder="请输入用户名" />
            </div>
            <div class="form-group mg-t20">
                <i class="icon-lock icon_font"></i>
                <input type="password" class="login_input" name="userPassword" id="userPassword" placeholder="请输入密码" />
            </div>
            <div class="checkbox mg-b25">
                <label>
                   <b id="hint">${hint}</b>
                </label>
            </div>
            <button type="submit" id="bu" class="login_btn">登 录</button>
        </form>
    </div><!--row end-->
</div><!--container end-->
<div style="text-align:center;">
</div>
</body>
</html>

