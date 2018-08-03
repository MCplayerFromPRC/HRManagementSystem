<%@ page import="com.cc.model.Interview" %>
<%@ page import="com.cc.util.DateUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/2
  Time: 22:03
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
            $(".accept").click(function () {
                $.ajax({
                    type:"post",
                    url:"guest/updateinterviewstate",
                    data:{
                        "id":$(this).siblings("input").val(),
                        "state":3
                    },
                    success:function (obj) {
                        $("#panel"+obj).remove();
                    }
                })
            })
            $(".refuse").click(function () {
                $.ajax({
                    type:"post",
                    url:"guest/updateinterviewstate",
                    data:{
                        "id":$(this).siblings("input").val(),
                        "state":4
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
    <c:if test="${not empty guest}">
        <%@ include file="guestnavbar.jsp"%>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <c:forEach items="${guest.resumes}" var="resume">
                <c:forEach items="${resume.interviews}" var="interview">
                    <c:if test="${interview.state==2}">
                        <div id="panel${interview.id}" class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading${resume.id}">
                                <h3 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionResume" href="#collapse${resume.id}" aria-expanded="false" aria-controls="collapse${resume.id}">
                                        <span>${interview.recruitInfo.company}面试邀请</span>
                                    </a>
                                </h3>
                            </div>
                            <div id="collapse${resume.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${resume.id}">
                                <div class="panel-body">
                                    <p>
                                        亲爱的${resume.name}：<br/>
                                        &emsp;本公司诚挚邀请您参加定于<%Interview interview= (Interview) pageContext.getAttribute("interview");
                                            out.print(DateUtil.DataBaseVarcharFormDateTimeLocalFormatTojavaString(interview.getIvtime())+"时");%>的面试<br/>
                                        &emsp; &emsp; &emsp; &emsp;${interview.recruitInfo.company}人事部<br/>
                                        &emsp; &emsp; &emsp; &emsp;<%out.print(DateUtil.transDataBaseDate(interview.getInviteTime()).split(" ")[0]);%>
                                    </p>
                                    <form>
                                        <input type="hidden" name="id" value="${interview.id}"/>
                                        <button type="button" class="btn btn-default accept">接受邀请</button>
                                        <button type="button" class="btn btn-default refuse">拒绝邀请</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>

