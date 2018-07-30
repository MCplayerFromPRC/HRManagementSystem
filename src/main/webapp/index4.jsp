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
    <link rel="stylesheet" type="text/css" href="css/smallpagetemplate.css"/>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
<c:if test="${empty guest}">
    <a href="logregis.jsp">登录/注册</a><br/>
</c:if>
<div class="container">
    <c:forEach var="recruitInfo" items="${recruitInfos}">
        <div class="col-md-4">
            <h1>${recruitInfo.industry}</h1>
        </div>
        <div class="col-md-8">
            <div class="col-md-5">
                <p>${recruitInfo.company}</p>
                <p>${recruitInfo.job}</p>
                <p>${recruitInfo.salary}</p>
            </div>
            <div class="col-md-5">
                <p>${recruitInfo.address}</p>
                <p>${recruitInfo.phone}</p>
            </div>
        </div>
    </c:forEach>
</div>
<ul class="pagination"></ul>
</body>
</html>

