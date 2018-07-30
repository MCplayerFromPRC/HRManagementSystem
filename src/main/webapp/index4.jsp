<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/7/30
  Time: 20:10
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
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        .dropdown-menu {
            margin-top: 0px;
            height: 420px;
            width: 485%;
            margin-left:4px;
            top: 0;
            left:100%;
        }
    </style>
</head>
<body>
    <ul class="nav nav-tabs">
        <c:if test="${empty guest}">
            <a href="logregis.jsp">登录/注册</a><br/>
        </c:if>
    </ul>
    <div class="container">
        <div class="col-md-2">
            <div class="dropdown">
                <div class="btn-group-vertical btn-block btn-group-lg" role="group">
                    <a href="" class="btn btn-danger" data-toggle="dropdown">
                        123<span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="jumbotron">
                                <h1>Hello, world!</h1>
                                <p>智联招聘（NYSE:ZPIN），为求职者提供免费注册、求职指导、简历管理、
                                    职业测评等服务，职位真实可靠，反馈快速及时。燃青春助梦想，上智
                                    联招聘，找到满意工作！马上登录！</p>
                            </div>
                        </li>
                        <div class="divider"></div>
                        <li align="center">
                            <p>*************期待你的加入*************</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="carousel-example-generic" class="carousel slide col-md-8" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/timg1.jpg" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="images/timg2.jpg" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="images/timg3.jpg" alt="...">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="container"style="padding:30px">

    </div>
    <div class="container" align="center">
        <table class="table table-striped table table-hover">
            <c:forEach var="recruitInfo" items="${recruitInfos}" >
                <tr>
                    <th class="col-md-4">
                        <h1>${recruitInfo.industry}</h1>
                    </th>
                    <td class="col-md-4">
                        <p style="color: #0077b3">${recruitInfo.company}</p>
                        <p style="color: #ee5f03">${recruitInfo.job}</p>
                        <p>${recruitInfo.salary}</p>
                    </td>
                    <td class="col-md-3">
                        <p>${recruitInfo.address}</p>
                        <p style="color: #50b26b">${recruitInfo.phone}</p>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <ul class="pagination">
            <li>
                <a href="javascript:void(0)" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="pg" begin="1" end="${pageNum}">
                <li>
                    <a class="apage" href="javascript:void(0)">${pg}</a>
                </li>
            </c:forEach>
            <li>
                <a href="javascript:void(0)" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>

