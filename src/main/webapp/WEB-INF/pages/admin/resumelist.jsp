<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/2
  Time: 10:06
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
</head>
<body>
    <c:if test="${not empty admin}">
        <%@ include file="adminnavbar.jsp"%>
    </c:if>
    <c:if test="${not empty recruitInfo}">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">
                            <span>招聘信息${recruitInfo.id}&emsp;${recruitInfo.company}&emsp;${recruitInfo.job}</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading">
                    <div class="panel-body">
                        <div class="bs-example" data-example-id="contextual-table">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>招聘信息 序号</th>
                                    <th>${recruitInfo.id}</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="success">
                                    <th scope="row">公司名称</th>
                                    <td>${recruitInfo.company}</td>
                                </tr>
                                <tr>
                                    <th scope="row">公司地址</th>
                                    <td>${recruitInfo.address}</td>
                                </tr>
                                <tr class="info">
                                    <th scope="row">公司电话</th>
                                    <td>${recruitInfo.phone}</td>
                                </tr>
                                <tr>
                                    <th scope="row">行业</th>
                                    <td>${recruitInfo.industry}</td>
                                </tr>
                                <tr class="warning">
                                    <th scope="row">岗位</th>
                                    <td>${recruitInfo.job}</td>
                                </tr>
                                <tr>
                                    <th scope="row">基本工资</th>
                                    <td>${recruitInfo.salary}</td>
                                </tr>
                                <tr class="danger">
                                    <th scope="row">招聘状态</th>
                                    <c:if test="${recruitInfo.revoke==0}">
                                        <td>热招中</td>
                                    </c:if>
                                    <c:if test="${recruitInfo.revoke==1}">
                                        <td>已结束</td>
                                    </c:if>
                                </tr>
                                </tbody>
                            </table>
                        </div><!-- /example -->
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingResume">
                    <h2 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseResume" aria-expanded="true" aria-controls="collapseResume">
                            招聘信息&emsp;id${recruitInfo.id}&emsp;收到的简历
                        </a>
                    </h2>
                </div>
                <div id="collapseResume" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingResume">
                    <div class="panel-body">
                        <div class="panel-group" id="accordionResume" role="tablist" aria-multiselectable="true">
                            <c:forEach items="${recruitInfo.interviews}" var="interview">
                                <c:if test="${interview.state==0}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="heading${interview.resume.id}">
                                            <h3 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionResume" href="#collapse${interview.resume.id}" aria-expanded="false" aria-controls="collapse${interview.resume.id}">
                                                    <span>简历${interview.resume.id}&emsp;${interview.resume.name}&emsp;${interview.resume.school}</span>
                                                </a>
                                                <a href="/admin/updateinterview1state?id=${interview.id}">
                                                    <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                                                </a>
                                            </h3>
                                        </div>
                                        <div id="collapse${interview.resume.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${interview.resume.id}">
                                            <div class="panel-body">
                                                <div class="bs-example" data-example-id="contextual-table">
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>简历 序号</th>
                                                            <th>${interview.resume.id}</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr class="active">
                                                            <th scope="row">姓名</th>
                                                            <td>${interview.resume.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">性别</th>
                                                            <td>${interview.resume.gender}</td>
                                                        </tr>
                                                        <tr class="success">
                                                            <th scope="row">邮箱</th>
                                                            <td>${interview.resume.email}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">城市</th>
                                                            <td>${interview.resume.city}</td>
                                                        </tr>
                                                        <tr class="info">
                                                            <th scope="row">学校</th>
                                                            <td>${interview.resume.school}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">专业</th>
                                                            <td>${interview.resume.major}</td>
                                                        </tr>
                                                        <tr class="warning">
                                                            <th scope="row">年龄</th>
                                                            <td>${interview.resume.age}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">期望薪资</th>
                                                            <td>${interview.resume.salary}</td>
                                                        </tr>
                                                        <tr class="danger">
                                                            <th scope="row">应聘职位</th>
                                                            <td>${interview.resume.job}</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" rowspan="2">详情</th>
                                                            <td rowspan="2">${interview.resume.description}</td>
                                                        </tr>
                                                        <tr>

                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <form method="post" action="admin/updateinterview2state?id=${interview.id}">
                                                        <div class="form-group">
                                                            <label for="ivtime">选择面试日期</label>
                                                            <input id="ivtime" type="datetime-local" name="ivtime"/>
                                                        </div>
                                                        <button type="submit" class="btn btn-default">发出面试邀请</button>
                                                    </form>
                                                </div><!-- /example -->
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty ad_iv_pageNum}">
        <div align="center">
            <ul class="pagination" >
                <li>
                    <a href="admin/getrecruitinfobypage?pg=${page-1>0? page-1:1}&revoke=0" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="pg" begin="1" end="${ ad_iv_pageNum}">
                    <li>
                        <a class="apage" href="admin/getrecruitinfobypage?pg=${pg}&revoke=0">${pg}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="admin/getrecruitinfobypage?pg=${page+1> ad_iv_pageNum?page:page+1}&revoke=0" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </c:if>
</body>
</html>

