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
        div.btn-group-vertical .dropdown-menu {
            margin-top: 0px;
            height: 420px;
            width: 485%;
            margin-left:4px;
            top: 0px;
            left:100%;
        }
        #dropdown2{
            top:-100%;
        }
        #dropdown3{
            top:-200%;
        }
        #dropdown4{
            top:-300%;
        }
        #dropdown5{
            top:-400%;
        }
    </style>
</head>
<body>
    <c:if test="${not empty admin}">
        <%@ include file="WEB-INF/pages/admin/adminnavbar.jsp"%>
    </c:if>
    <c:if test="${empty admin}">
        <c:if test="${not empty employee}">
            <%@ include file="WEB-INF/pages/employee/employeenavbar.jsp"%>
        </c:if>
        <c:if test="${empty employee}">
            <c:if test="${not empty guest}">
                <%@ include file="WEB-INF/pages/guest/guestnavbar.jsp"%>
            </c:if>
            <c:if test="${empty guest}">
                <%@ include file="navbar.jsp"%>
            </c:if>
        </c:if>
    </c:if>
    <div class="container">
        <div class="col-md-2 col-md-offset-1">
            <div class="dropdown">
                <div class="btn-group-vertical btn-block" role="group">
                    <div class="btn-group btn-group-lg">
                        <a href="" class="btn btn-danger" data-toggle="dropdown">
                            公司简介<span class="glyphicon glyphicon-chevron-right"></span>
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
                    <div class="btn-group btn-group-lg">
                        <a href="" class="btn btn-warning" data-toggle="dropdown">
                            新闻播报<span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        <ul class="dropdown-menu" id="dropdown2">
                            <li>
                                <div class="jumbotron">
                                    <h3>上半年居民收入榜出炉 京沪人均可支配收入超 3 万</h3>
                                    <p>上半年居民收入榜出炉。国家统计局公布的数据显示，上海、
                                        北京上半年居民人均可支配收入突破 3 万元，属于居民收
                                        入排行榜的 " 第一梯队 "。总体来看，共有 9 个省份上
                                        半年人均可支配收入超过全国水平。</p>
                                </div>
                            </li>
                            <div class="divider"></div>
                            <li align="center">
                                <p>*************期待你的加入*************</p>
                            </li>
                        </ul>
                    </div>
                    <div class="btn-group btn-group-lg">
                        <a href="" class="btn btn-info" data-toggle="dropdown">
                            行业要闻<span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        <ul class="dropdown-menu" id="dropdown3">
                            <li>
                                <div class="jumbotron">
                                    <h3>培育产教融合IT人才新力量</h3>
                                    <p>2018年7月1日，中国软件行业协会在北京展览馆报告厅举办了中国IT人才
                                        培养发展论坛。本次论坛主题为“新力量——推动学科建设和发展，
                                        加快行业人才培养和输送”。出席论坛的领导和嘉宾有工业和信息化部
                                        信息化和软件服务业司李冠宇副司长、中国软件行业协会智能应用服务
                                        分会邱钦伦秘书长、北京大学软件与微电子学院林慧苹副院长，以及来自
                                        百度、腾讯、中软国际等企业嘉宾。出席论坛的还有软件领域的专家、
                                        研究机构、企业代表、地方协会、国际友人等近300人。北京航空航天大
                                        学计算机学院院长高小鹏教授主持了本次论坛。</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btn-group btn-group-lg">
                        <a href="" class="btn btn-success" data-toggle="dropdown">
                            行业资讯<span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        <ul class="dropdown-menu" id="dropdown4">
                            <li>
                                <div class="jumbotron">
                                    <h4>行业选择</h4>
                                    <table class="table">
                                        <tr>
                                            <th>
                                                <p><small><a href="">互联网IT</a></small></p>
                                                <p><small><a href="">房地产/建筑</a></small></p>
                                                <p><small><a href="">贸易/零售/物流</a></small></p>
                                                <p><small><a href="">教育/传媒/广告</a></small></p>
                                                <p><small><a href="">市场/销售</a></small></p>
                                                <p><small><a href="">人事/财务/行政</a></small></p>
                                            </th>
                                            <td>
                                                <p><small><a href="">Java开发</a>/</small></p>
                                                <p><small><a href="">土建工程师</a></small></p>
                                                <p><small><a href="">外贸</a></small></p>
                                                <p><small><a href="">编导</a></small></p>
                                                <p><small><a href="">市场策划</a></small></p>
                                                <p><small><a href="">人力资源主管</a></small></p>
                                            </td>
                                            <td>
                                                <p><small><a href="">Web前端</a></small></p>
                                                <p><small><a href="">施工员</a></small></p>
                                                <p><small><a href="">采购经理</a></small></p>
                                                <p><small><a href="">美术指导</a></small></p>
                                                <p><small><a href="">销售经理</a></small></p>
                                                <p><small><a href="">出纳</a></small></p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btn-group btn-group-lg">
                        <a href="" class="btn btn-primary" data-toggle="dropdown">
                            友情链接<span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        <ul class="dropdown-menu" id="dropdown5">
                            <li>
                                <div class="jumbotron">
                                    <h3>常用合作网站</h3>
                                    <table class="table">
                                        <tr>
                                            <td>
                                                <p><a href="">百度</a></p>
                                                <p><a href="">优酷</a></p>
                                                <p><a href="">土豆</a></p>
                                                <p><a href="">爱奇艺</a></p>
                                            </td>
                                            <td>
                                                <p><a href="">新浪</a></p>
                                                <p><a href="">腾讯</a></p>
                                                <p><a href="">淘宝</a></p>
                                                <p><a href="">京东</a></p>
                                            </td>
                                            <td>
                                                <p><a href="">雅虎</a></p>
                                                <p><a href="">虎扑</a></p>
                                                <p><a href="">微博</a></p>
                                                <p><a href="">网易</a></p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </li>
                            <div class="divider"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="carousel-example-generic" class="carousel slide col-md-7" data-ride="carousel">
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
                        <c:if test="${not empty guest}">
                            <c:set var="flag" value="${0}"></c:set>
                            <c:forEach items="${guest.resumes}" var="resume">
                                <c:forEach items="${recruitInfo.interviews}" var="interview">
                                    <c:if test="${interview.resume.id==resume.id}">
                                        <c:set var="flag" value="${flag+1}"></c:set>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <c:if test="${flag<guest.resumes.size()}">
                                <form method="post" action="guest/insertinterview?riid=${recruitInfo.id}">
                                    <button type="submit">投递简历</button>
                                </form>
                            </c:if>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <ul class="pagination">
            <li>
                <a href="showrecruitinfobypage?pg=${page-1>0?page-1:1}&pageSize=4&revoke=0" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="pg" begin="1" end="${pageNum}">
                <li>
                    <a class="apage" href="showrecruitinfobypage?pg=${pg}&pageSize=4&revoke=0">${pg}</a>
                </li>
            </c:forEach>
            <li>
                <a href="showrecruitinfobypage?pg=${page+1>pageNum?page:page+1}&pageSize=4&revoke=0" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>

