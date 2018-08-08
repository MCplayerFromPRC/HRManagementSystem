<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/1
  Time: 9:45
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
        <div class="col-md-10">
            <form method="post" action="employee/updateemployeeinfo">
                <input type="hidden" name="id" value="${employee.id}"/>
                <div class="form-group">
                    <label>姓名</label>
                    <input type="text" class="form-control" name="account" value="${employee.account}" required/>
                </div>
                <div class="form-group">
                    <label>账号</label>
                    <input type="text" class="form-control" name="name" value="${employee.name}" required/>
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input type="text" class="form-control" name="pass" value="${employee.pass}" required/>
                </div>
                <div class="form-group">
                    <label>性别</label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" value="男" checked> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" value="女"> 女
                    </label>
                </div>
                <div class="form-group">
                    <label>年龄</label>
                    <input type="number" class="form-control" name="age" value="${employee.age}" required/>
                </div>
                <div class="form-group">
                    <label>电话</label>
                    <input type="number" class="form-control" name="phone" value="${employee.phone}" required/>
                </div>
                <div class="form-group">
                    <label>邮箱</label>
                    <input type="email" class="form-control" name="email" value="${employee.email}" required/>
                </div>
                <button type="submit" class="btn btn-default">更改</button>
            </form>
        </div>
    </c:if>
</body>
</html>

