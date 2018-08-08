<%@ page import="com.cc.model.Attendance" %>
<%@ page import="com.cc.util.DateUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/8
  Time: 13:34
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
    <c:if test="${not empty attendance}">
        <%
            Attendance attendance= (Attendance) request.getAttribute("attendance");
        %>
        <h3>打卡成功</h3>
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
    </c:if>
</body>
</html>

