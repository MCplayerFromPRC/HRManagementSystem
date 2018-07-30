<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/7/25
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath%>"/>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        #regform{
            display: none;
        }
    </style>
    <script>
        $(function(){
            $("button.but").click(function () {
                if($("#logform").css("display")=="block"){
                    $("#logform").css("display","none");
                    $("#regform").css("display","block");
                }else {
                    $("#regform").css("display","none");
                    $("#logform").css("display","block");
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
            <form id="logform" class="form-signin" method="post" action="login">
                <h2 class="form-signin-heading">Please sign in</h2>
                <input class="form-control" type="text" name="name" placeholder="用户名" required autofocus/><br/>
                <input type="text" name="pass" class="form-control" placeholder="密码" required/><br/>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> 记住我
                    </label>
                </div>
                <button class="btn btn-lg btn-primary col-md-5" type="submit">登录</button>
                <button class="but btn btn-lg btn-primary col-md-5 col-md-offset-1" type="button">注册</button>
            </form>
            <form id="regform" class="form-signin" method="post" action="register">
                <h2 class="form-signin-heading">请注册</h2>
                <input class="form-control" type="text" name="name" placeholder="用户名" required autofocus/><br/>
                <input type="text" name="pass" class="form-control" placeholder="密码" required/><br/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
                <button class="but btn btn-lg btn-primary btn-block" type="button">登录</button>
            </form>
        </div>
    </div>
</body>
</html>

