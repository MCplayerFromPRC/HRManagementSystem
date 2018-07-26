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
    <base href="<%=basePath%>"/>
    <title>Title</title>
</head>
<style>
    #regform{
        display: none;
    }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
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
<body>
    <form id="logform" method="post" action="login">
        用户名：<input type="text" name="name"/><br/>
        密&emsp;码：<input type="text" name="pass"><br/>
        <button type="submit">登录</button>
        <button class="but" type="button">注册</button>
    </form>
    <form id="regform" method="post" action="register">
        用户名：<input type="text" name="name"/><br/>
        密&emsp;码：<input type="text" name="pass"><br/>
        <button type="submit">注册</button>
        <button class="but" type="button">登录</button>
    </form>
</body>
</html>

