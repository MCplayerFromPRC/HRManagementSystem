<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/3
  Time: 15:56
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
    <c:if test="${not empty department}">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">
                            <span>部门 ${department.id}&emsp;${department.name}</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading">
                    <div class="panel-body">
                        <div class="bs-example">
                            <form method="post" action="">
                                <div class="form-group">
                                    <label>部门</label>
                                    <input type="text" class="form-control" name="name" value="${department.name}"/>
                                </div>
                                <div class="form-group">
                                    <label>人数</label>
                                    <input type="number" class="form-control" name="empno" value="${department.empno}"/>
                                </div>
                                <div class="form-group">
                                    <label>创立时间</label>
                                    <input type="text" class="form-control" name="createTime" value="${department.createTime}"/>
                                </div>
                                <div class="form-group">
                                    <label for="selectstate" class="control-label">部门状态</label>
                                    <select class="form-control" id="selectstate" name="state">
                                        <option value="0" selected>仍存在</option>
                                        <option value="1">撤销该部门</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-default">更改</button>
                            </form>
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
                                                <a href="">
                                                    <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
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
                                                                <a href="">
                                                                    <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                                                                </a>
                                                            </h3>
                                                        </div>
                                                        <div id="collapseJobdetail${job.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJobdetail${job.id}">
                                                            <div class="panel-body">
                                                                <div class="bs-example">
                                                                    <form method="post" action="">
                                                                        <div class="form-group">
                                                                            <label>职位</label>
                                                                            <input type="text" class="form-control" name="name" value="${job.name}"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="selectjobstate" class="control-label">职位状态</label>
                                                                            <select class="form-control" id="selectjobstate" name="state">
                                                                                <option value="0" selected>仍存在</option>
                                                                                <option value="1">撤销该职位</option>
                                                                            </select>
                                                                        </div>
                                                                        <button type="submit" class="btn btn-default">更改</button>
                                                                    </form>
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
                                                                <a href="">
                                                                    <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
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
                                                                                        <a href="">
                                                                                            <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                                                                                        </a>
                                                                                    </h3>
                                                                                </div>
                                                                                <div id="collapseJob${job.id}emp${employee.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJob${job.id}emp${employee.id}">
                                                                                    <div class="panel-body">
                                                                                        <div class="bs-example">
                                                                                            <form method="post" action="">
                                                                                                <div class="form-group">
                                                                                                    <label>姓名</label>
                                                                                                    <input type="text" class="form-control" name="account" value="${employee.account}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>性别</label>
                                                                                                    <input type="text" class="form-control" name="gender" value="${employee.gender}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>年龄</label>
                                                                                                    <input type="number" class="form-control" name="age" value="${employee.age}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>薪资</label>
                                                                                                    <input type="number" class="form-control" name="salary" value="${employee.salary}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>社保</label>
                                                                                                    <input type="number" class="form-control" name="socialSecurity" value="${employee.socialSecurity}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>电话</label>
                                                                                                    <input type="number" class="form-control" name="phone" value="${employee.phone}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>邮箱</label>
                                                                                                    <input type="text" class="form-control" name="email" value="${employee.email}"/>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label for="selectjobstate" class="control-label">就职状态</label>
                                                                                                    <select class="form-control" id="selectjobempstate" name="state">
                                                                                                        <option value="0">准备上班</option>
                                                                                                        <option value="1">试用期</option>
                                                                                                        <option value="2">正式入职</option>
                                                                                                        <option value="3">休假</option>
                                                                                                        <option value="4">离职</option>
                                                                                                    </select>
                                                                                                </div>
                                                                                                <button type="submit" class="btn btn-default">更改</button>
                                                                                            </form>
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
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingJobadd">
                                    <h3 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionJob" href="#collapseJobadd" aria-expanded="false" aria-controls="collapseJobadd">
                                            <span class="glyphicon glyphicon-plus" aria-hidden="true">添加职位</span>
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapseJobadd" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJobadd">
                                    <div class="panel-body">
                                        <div class="bs-example">
                                            <form method="post" action="">
                                                <div class="form-group">
                                                    <label>职位</label>
                                                    <input type="text" class="form-control" name="name" value="${job.name}"/>
                                                </div>
                                                <input type="hidden" id="addjobstate" name="state" value="0"/>
                                                <button type="submit" class="btn btn-default">更改</button>
                                            </form>
                                        </div><!-- /example -->
                                    </div>
                                </div>
                            </div>
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
                    <a href="admin/getdepartmentbypage?pg=${page-1>0? page-1:1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="pg" begin="1" end="${ ad_de_pageNum}">
                    <li>
                        <a class="apage" href="admin/getdepartmentbypage?pg=${pg}">${pg}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="admin/getdepartmentbypage?pg=${page+1> ad_de_pageNum?page:page+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </c:if>
</body>
</html>

