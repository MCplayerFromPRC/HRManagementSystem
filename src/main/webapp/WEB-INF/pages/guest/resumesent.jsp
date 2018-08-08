<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/1
  Time: 20:28
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
        textarea{
            resize:none;
        }
    </style>
</head>
<body>
    <c:if test="${not empty guest}">
        <%@ include file="guestnavbar.jsp"%>
    </c:if>
    <c:if test="${not empty error}">
        <p class="h3">${error}</p>
    </c:if>
    <c:if test="${empty error}">
        <c:if test="${not empty resume}">
            <p class="h4">已发送简历</p>
            <table class="table">
                <thead>
                <tr>
                    <th>简历 序号</th>
                    <th>${resume.id}</th>
                </tr>
                </thead>
                <tbody>
                <tr class="active">
                    <th scope="row">姓名</th>
                    <td>${resume.name}</td>
                </tr>
                <tr>
                    <th scope="row">性别</th>
                    <td>${resume.gender}</td>
                </tr>
                <tr class="success">
                    <th scope="row">邮箱</th>
                    <td>${resume.email}</td>
                </tr>
                <tr>
                    <th scope="row">城市</th>
                    <td>${resume.city}</td>
                </tr>
                <tr class="info">
                    <th scope="row">学校</th>
                    <td>${resume.school}</td>
                </tr>
                <tr>
                    <th scope="row">专业</th>
                    <td>${resume.major}</td>
                </tr>
                <tr class="warning">
                    <th scope="row">年龄</th>
                    <td>${resume.age}</td>
                </tr>
                <tr>
                    <th scope="row">期望薪资</th>
                    <td>${resume.salary}</td>
                </tr>
                <tr class="danger">
                    <th scope="row">应聘职位</th>
                    <td>${resume.job}</td>
                </tr>
                <tr>
                    <th scope="row" rowspan="2">详情</th>
                    <td rowspan="2">${resume.description}</td>
                </tr>
                <tr>

                </tr>
                </tbody>
            </table>
        </c:if>
    </c:if>
</body>
</html>

