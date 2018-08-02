<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/1
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--String path = request.getContextPath();--%>
    <%--String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";--%>
<%--%>--%>
<html>
<head>
    <%--<base href="<%=basePath%>"/>--%>
    <%--<title>Title</title>--%>
        <style>
            #navbardropdown {
                margin-top: 0px;
                width: 100%;
            }
        </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">智联招聘</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="admin/getrecruitinfofirstpage">查看简历</a></li>
                <li><a href="#">应聘录用</a></li>
                <li><a href="#">薪资结算</a></li>
                <li><a href="#">惩罚记录</a></li>
                <li><a href="#">考勤记录</a></li>
                <li><a href="#">培训管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">内部管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu" id="navbardropdown">
                        <li align="center">
                            <a href="#">
                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 部门管理
                            </a>
                        </li>
                        <li align="center">
                            <a href="#">
                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 职位管理
                            </a>
                        </li>
                        <li align="center">
                            <a href="#">
                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 职工管理
                            </a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li align="center">
                            <a href="#">技术支持<br/>***CC***</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入要搜索的内容">
                </div>
                <button type="submit" class="btn btn-default">查找</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="pages/admin/admininfo">个人信息</a></li>
                <li><a href="#">消息</a></li>
                <li><a href="/showrecruitinfo?pageSize=4&revoke=0">主页</a></li>
                <li><a href="/exitlogin">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>

