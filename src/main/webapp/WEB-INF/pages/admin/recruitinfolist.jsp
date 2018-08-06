<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/6
  Time: 13:43
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
    <c:if test="${not empty recruitInfos}">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <c:forEach var="recruitInfo" items="${recruitInfos}">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading${recruitInfo.id}">
                        <h2 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${recruitInfo.id}" aria-expanded="false" aria-controls="collapse${recruitInfo.id}">
                                <span>招聘信息${recruitInfo.id}&emsp;${recruitInfo.company}&emsp;${recruitInfo.job}</span>
                            </a>
                            <a href="admin/deleterecruitinfo?id=${recruitInfo.id}">
                                <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                            </a>
                        </h2>
                    </div>
                    <div id="collapse${recruitInfo.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${recruitInfo.id}">
                        <div class="panel-body">
                            <div class="bs-example" data-example-id="contextual-table">
                                <form method="post" action="admin/updaterecruitinfo">
                                    <div class="form-group">
                                        <label>招聘信息 序号</label>
                                        <input type="text" name="id" value="${recruitInfo.id}" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>公司名称</label>
                                        <input type="text" name="company" value="${recruitInfo.company}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>公司地址</label>
                                        <input type="text" name="address" value="${recruitInfo.address}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>公司电话</label>
                                        <input type="text" name="phone" value="${recruitInfo.phone}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>行业</label>
                                        <input type="text" name="industry" value="${recruitInfo.industry}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>岗位</label>
                                        <input type="text" name="job" value="${recruitInfo.job}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>基本工资</label>
                                        <input type="text" name="salary" value="${recruitInfo.salary}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>招聘状态</label>
                                        <select name="revoke" class="form-control">
                                            <option value="0">未发布</option>
                                            <option value="1">热招中</option>
                                            <option value="2">已结束</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-default">更改</button>
                                </form>
                            </div><!-- /example -->
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true">新增招聘信息</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading">
                    <div class="panel-body">
                        <div class="bs-example" data-example-id="contextual-table">
                            <form method="post" action="admin/insertrecruitinfo">
                                <div class="form-group">
                                    <label>公司名称</label>
                                    <input type="text" name="company"/>
                                </div>
                                <div class="form-group">
                                    <label>公司地址</label>
                                    <input type="text" name="address"/>
                                </div>
                                <div class="form-group">
                                    <label>公司电话</label>
                                    <input type="text" name="phone"/>
                                </div>
                                <div class="form-group">
                                    <label>行业</label>
                                    <input type="text" name="industry"/>
                                </div>
                                <div class="form-group">
                                    <label>岗位</label>
                                    <input type="text" name="job"/>
                                </div>
                                <div class="form-group">
                                    <label>基本工资</label>
                                    <input type="text" name="salary"/>
                                </div>
                                <div class="form-group">
                                    <label>招聘状态</label>
                                    <select name="revoke" class="form-control">
                                        <option value="0">创建</option>
                                        <option value="1">发布</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-default">添加</button>
                            </form>
                        </div><!-- /example -->
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty ad_ri_pageNum}">
        <div align="center">
            <ul class="pagination" >
                <li>
                    <a href="admin/getrecruitinfomanagementbypage?pg=${page-1>0? page-1:1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="pg" begin="1" end="${ ad_ri_pageNum}">
                    <li>
                        <a class="apage" href="admin/getrecruitinfomanagementbypage?pg=${pg}">${pg}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="admin/getrecruitinfomanagementbypage?pg=${page+1> ad_ri_pageNum?page:page+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </c:if>
</body>
</html>

