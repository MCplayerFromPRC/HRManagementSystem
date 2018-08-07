<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/7
  Time: 14:08
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
    <c:if test="${not empty employee}">
        <%@ include file="employeenavbar.jsp"%>
    </c:if>
    <c:if test="${not empty department}">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">
                            <span>部门 ${department.id}&emsp;${department.name}</span>
                        </a>
                        <a href="admin/dlistdeletedepartment?id=${department.id}">
                            <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading">
                    <div class="panel-body">
                        <div class="bs-example">
                            <div class="bs-example" data-example-id="contextual-table">
                                <table class="table">
                                    <tr class="success">
                                        <th scope="row">部门</th>
                                        <td>${department.name}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">人数</th>
                                        <td>${department.empno}</td>
                                    </tr>
                                    <tr class="info">
                                        <th scope="row">创立时间</th>
                                        <td>${department.createTime}</td>
                                    </tr>
                                </table>
                            </div><!-- /example -->
                        </div><!-- /example -->
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingJob">
                    <h2 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseJob" aria-expanded="false" aria-controls="collapseJob">
                            部门 id${department.id}&emsp;${department.name}的职位
                        </a>
                    </h2>
                </div>
                <div id="collapseJob" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJob">
                    <div class="panel-body">
                        <div class="panel-group" id="accordionJob" role="tablist" aria-multiselectable="true">
                            <c:forEach items="${department.jobs}" var="job">
                                <c:if test="${job.state==0}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingJob${job.id}">
                                            <h3 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionJob" href="#collapseJob${job.id}" aria-expanded="false" aria-controls="collapseJob${job.id}">
                                                    <span>职位 ${job.id}&emsp;${job.name}及其员工信息</span>
                                                </a>
                                            </h3>
                                        </div>
                                        <div id="collapseJob${job.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJob${job.id}">
                                            <div class="panel-body">
                                                <div class="panel-group" id="accordionJobdetail" role="tablist" aria-multiselectable="true">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" role="tab" id="headingJobdetail${job.id}">
                                                            <h3 class="panel-title">
                                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionJobdetail" href="#collapseJobdetail${job.id}" aria-expanded="false" aria-controls="collapseJobdetail${job.id}">
                                                                    <span>职位 ${job.id}&emsp;${job.name}</span>
                                                                </a>
                                                                <a href="admin/dlistdeletejob?id=${job.id}">
                                                                    <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                                                                </a>
                                                            </h3>
                                                        </div>
                                                        <div id="collapseJobdetail${job.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJobdetail${job.id}">
                                                            <div class="panel-body">
                                                                <div class="bs-example" data-example-id="contextual-table">
                                                                    <table class="table">
                                                                        <tr class="success">
                                                                            <th scope="row">职位</th>
                                                                            <td>${job.name}</td>
                                                                        </tr>
                                                                    </table>
                                                                </div><!-- /example -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" role="tab" id="headingJob${job.id}emp">
                                                            <h3 class="panel-title">
                                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionJobdetail" href="#collapseJob${job.id}emp" aria-expanded="false" aria-controls="collapseJob${job.id}emp">
                                                                    <span>职位 ${job.id}&emsp;${job.name}的员工</span>
                                                                </a>
                                                            </h3>
                                                        </div>
                                                        <div id="collapseJob${job.id}emp" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJob${job.id}emp">
                                                            <div class="panel-body">
                                                                <div class="bs-example">
                                                                    <div class="panel-group" id="accordionJobemp" role="tablist" aria-multiselectable="true">
                                                                        <c:forEach var="employee" items="${job.employees}">
                                                                            <div class="panel panel-default">
                                                                                <div class="panel-heading" role="tab" id="headingJob${job.id}emp${employee.id}">
                                                                                    <h3 class="panel-title">
                                                                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionJobemp" href="#collapseJob${job.id}emp${employee.id}" aria-expanded="false" aria-controls="collapseJob${job.id}emp${employee.id}">
                                                                                            <span>员工 ${employee.id}&emsp;${employee.account}</span>
                                                                                        </a>
                                                                                    </h3>
                                                                                </div>
                                                                                <div id="collapseJob${job.id}emp${employee.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJob${job.id}emp${employee.id}">
                                                                                    <div class="panel-body">
                                                                                        <div class="bs-example" data-example-id="contextual-table">
                                                                                            <table class="table">
                                                                                                <tr class="success">
                                                                                                    <th scope="row">姓名</th>
                                                                                                    <td>${employee.account}</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th scope="row">性别</th>
                                                                                                    <td>${employee.gender}</td>
                                                                                                </tr>
                                                                                                <tr class="info">
                                                                                                    <th scope="row">年龄</th>
                                                                                                    <td>${employee.age}</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th scope="row">电话</th>
                                                                                                    <td>${employee.phone}</td>
                                                                                                </tr>
                                                                                                <tr class="warning">
                                                                                                    <th scope="row">邮箱</th>
                                                                                                    <td>${employee.email}</td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </div><!-- /example -->
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div><!-- /example -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
    <c:if test="${not empty ad_de_pageNum}">
        <div align="center">
            <ul class="pagination" >
                <li>
                    <a href="employee/getcompanybypage?pg=${page-1>0? page-1:1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="pg" begin="1" end="${ ad_de_pageNum}">
                    <li>
                        <a class="apage" href="employee/getcompanybypage?pg=${pg}">${pg}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="employee/getcompanybypage?pg=${page+1> ad_de_pageNum?page:page+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </c:if>
</body>
</html>

