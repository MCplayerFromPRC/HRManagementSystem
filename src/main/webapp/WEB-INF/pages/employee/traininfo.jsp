<%@ page import="com.cc.model.Train" %>
<%@ page import="com.cc.util.DateUtil" %>
<%@ page import="com.cc.model.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/6
  Time: 16:49
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
    <c:if test="${not empty employee.train&&employee.train.state==1}">
        <div class="bs-example" data-example-id="contextual-table">
            <%
                Train train= ((Employee) session.getAttribute("employee")).getTrain();
            %>
            <table class="table">
                <thead>
                    <tr>
                        <th>培训 序号</th>
                        <th>${train.id}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="success">
                        <th scope="row">培训科目</th>
                        <td>${train.subject}</td>
                    </tr>
                    <tr>
                        <th scope="row">培训内容</th>
                        <td>${train.content}</td>
                    </tr>
                    <tr class="info">
                        <th scope="row">培训对象</th>
                        <td>${train.object}</td>
                    </tr>
                    <tr>
                        <th scope="row">培训时间</th>
                        <td>
                            <%
                                if(train!=null) {
                                    out.print(DateUtil.dataBaseVarcharFormDateTimeLocalFormatTojavaString(train.getStartTime()) + "时 至 " +
                                            DateUtil.dataBaseVarcharFormDateTimeLocalFormatTojavaString(train.getEndTime()) + "时");
                                }
                            %>
                        </td>
                    </tr>
                    <tr class="warning">
                        <th scope="row">培训地点</th>
                        <td>${train.place}</td>
                    </tr>
                </tbody>
            </table>
        </div><!-- /example -->
    </c:if>
    <c:if test="${empty employee.train&&employee.train.state!=1}">
        <p class="lead">没有培训项目</p>
    </c:if>
</body>
</html>

