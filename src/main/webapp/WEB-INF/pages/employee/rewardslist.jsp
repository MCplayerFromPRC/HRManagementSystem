<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/7
  Time: 11:46
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
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <c:forEach var="rewards" items="${rewardss}">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading${rewards.id}">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${rewards.id}" aria-expanded="false" aria-controls="collapse${rewards.id}">
                            <span>奖惩 ${rewards.id}</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse${rewards.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${rewards.id}">
                    <div class="panel-body">
                        <div class="bs-example">
                            <table class="table">
                                <tbody>
                                    <tr class="success">
                                        <th>奖惩 序号</th>
                                        <th>${rewards.id}</th>
                                    </tr>
                                    <tr class="info">
                                        <c:if test="${rewards.reMoney>0}">
                                            <th scope="row">
                                                奖励金额
                                            </th>
                                            <td>${rewards.reMoney}</td>
                                        </c:if>
                                        <c:if test="${rewards.reMoney<0}">
                                            <th scope="row">
                                                惩罚金额
                                            </th>
                                            <td>${rewards.reMoney*(-1)}</td>
                                        </c:if>
                                    </tr>
                                    <tr class="warning">
                                        <th scope="row">原因</th>
                                        <td>${rewards.description}</td>
                                    </tr>
                                    <tr class="danger">
                                        <th scope="row">时间</th>
                                        <td>${rewards.time}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /example -->
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>

