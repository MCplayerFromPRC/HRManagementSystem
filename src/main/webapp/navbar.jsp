<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/7/31
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--String nbpath = request.getContextPath();--%>
    <%--String nbbasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + nbpath + "/";--%>
<%--%>--%>
<html>
<head>
    <%--<meta charset="utf-8">--%>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<base href="<%=nbbasePath%>"/>--%>
    <%--<title>Title</title>--%>
    <%--<link rel="stylesheet" href="css/bootstrap.css">--%>
    <%--<script type="text/javascript" src="js/jquery-1.9.1.js"></script>--%>
    <%--<script src="js/bootstrap.js"></script>--%>
    <style>
        #navbardropdown {
            margin-top: 0px;
            width: 100%;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-default">
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
                    <li><a href="#">校园招聘</a></li>
                    <li><a href="#">高端职位</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">智商检测 <span class="caret"></span></a>
                        <ul class="dropdown-menu" id="navbardropdown">
                            <li align="center">
                                <a href="#">
                                    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 行业介绍
                                </a>
                            </li>
                            <li align="center">
                                <a href="#">
                                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 欢迎光临
                                </a>
                            </li>
                            <li align="center">
                                <a href="#">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 加入我们
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
                    <li><a href="logregis.jsp">登录/注册</a></li>
                    <li>
                        <a>
                            <span>定位：</span>
                            <select class="form-inline">
                                <option>上海</option>
                                <option>北京</option>
                                <option>广州</option>
                                <option>深圳</option>
                                <option>其他</option>
                            </select>
                        </a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</body>
</html>

