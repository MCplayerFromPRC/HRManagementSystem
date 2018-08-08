<%@ page import="com.cc.util.DateUtil" %>
<%@ page import="com.cc.model.Attendance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/8
  Time: 14:22
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
        <c:forEach var="attendance" items="${attendances}">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading${attendance.id}">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${attendance.id}" aria-expanded="false" aria-controls="collapse${attendance.id}">
                            <span>打卡记录 ${attendance.id}</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse${attendance.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${attendance.id}">
                    <div class="panel-body">
                        <div class="bs-example">
                            <%
                                Attendance attendance= (Attendance) pageContext.getAttribute("attendance");
                            %>
                            <table class="table">
                                <thead>
                                <tr class="success">
                                    <th>打卡 序号</th>
                                    <th>${attendance.id}</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="info">
                                    <th scope="row">上班时间</th>
                                    <td>
                                        <%
                                            out.print(DateUtil.transDataBaseDate(attendance.getStartTime()));
                                        %>
                                    </td>
                                </tr>
                                <c:if test="${not empty attendance.endTime}">
                                    <tr class="warning">
                                        <th scope="row">下班时间</th>
                                        <td>
                                            <%
                                                out.print(DateUtil.transDataBaseDate(attendance.getEndTime()));
                                            %>
                                        </td>
                                    </tr>
                                </c:if>
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

