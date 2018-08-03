<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/3
  Time: 12:54
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
    <script>
        $(document).ready(function () {
            $("#eliminate").click(function () {
                $.ajax({
                    type:"post",
                    url:"admin/eliminateguest",
                    data:{
                        "id":$(this).siblings("input").val()
                    },
                    success:function (obj) {
                        $("#panel"+obj).remove();
                    }
                })
            })
        })
    </script>
</head>
<body>
    <c:if test="${not empty admin}">
        <%@ include file="adminnavbar.jsp"%>
    </c:if>
    <c:forEach items="${interviews}" var="interview">
        <c:set var="resume" value="${interview.resume}"></c:set>
        <div id="panel${interview.id}" class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading${interview.id}">
                <h3 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionResume" href="#collapse${interview.id}" aria-expanded="false" aria-controls="collapse${interview.id}">
                        <span>招录面试者&nbsp;${resume.name}</span>
                    </a>
                </h3>
            </div>
            <div id="collapse${interview.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${interview.id}">
                <div class="panel-body">
                    <form method="post" action="admin/recruitguest">
                        <input type="hidden" name="id" value="${interview.id}"/>
                        <input type="hidden" name="gid" value="${resume.gid}"/>
                        <div class="form-group">
                            <label>账号</label>
                            <input type="text" class="form-control" name="name" value="${resume.guest.name}"/>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="text" class="form-control" name="pass" value="${resume.guest.pass}"/>
                        </div>
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control" name="account" value="${resume.name}"/>
                        </div>
                        <div class="form-group">
                            <label>性别</label>
                            <input type="text" class="form-control" name="gender" value="${resume.gender}"/>
                        </div>
                        <div class="form-group">
                            <label>年龄</label>
                            <input type="number" class="form-control" name="age" value="${resume.age}"/>
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input type="email" class="form-control" name="email" value="${resume.email}"/>
                        </div>
                        <div class="form-group">
                            <label>电话</label>
                            <input type="number" class="form-control" name="phone"/>
                        </div>
                        <div class="form-group">
                            <label>薪资</label>
                            <input type="number" class="form-control" name="salary" value="${resume.salary}"/>
                        </div>
                        <div class="form-group">
                            <label>岗位</label>
                            <input type="text" class="form-control" name="job" value="${resume.job}"/>
                        </div>
                        <div class="form-group">
                            <label>培训</label>
                            <input type="text" class="form-control" name="train"/>
                        </div>
                        <button type="submit" class="btn btn-default">录用</button>
                        <button id="eliminate" type="button" class="btn btn-default">淘汰</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</body>
</html>

