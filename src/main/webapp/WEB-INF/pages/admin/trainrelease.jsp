<%@ page import="com.cc.model.Train" %>
<%@ page import="com.cc.util.DateUtil" %>
<%@ page import="java.sql.Timestamp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/6
  Time: 9:04
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
        function process(v) {
            document.theForm.action = v;
            document.theForm.submit();
        }
    </script>
</head>
<body>
    <c:if test="${not empty admin}">
        <%@ include file="adminnavbar.jsp"%>
    </c:if>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <c:forEach var="train" items="${trains}">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading${train.id}">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${train.id}" aria-expanded="false" aria-controls="collapse${train.id}">
                            <span>培训 ${train.id}&emsp;${train.content}</span>
                        </a>
                        <a href="admin/changestatetrain?id=${train.id}&&state=4">
                            <span class="glyphicon glyphicon-minus-sign" aria-hidden="true" style="float: right">删除</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse${train.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${train.id}">
                    <div class="panel-body">
                        <div class="bs-example">
                            <form method="post" name="theForm">
                                <input type="hidden" name="id" value="${train.id}"/>
                                <div class="form-group">
                                    <label>科目</label>
                                    <input type="text" class="form-control" name="subject" value="${train.subject}" required/>
                                </div>
                                <div class="form-group">
                                    <label>内容</label>
                                    <input type="text" class="form-control" name="content" value="${train.content}" required/>
                                </div>
                                <div class="form-group">
                                    <label>对象</label>
                                    <input type="text" class="form-control" name="object" value="${train.object}" required/>
                                </div><br/>
                                <h5>时间定于
                                <%
                                    Train train= (Train) pageContext.getAttribute("train");
                                    Timestamp nowTime=(Timestamp) request.getAttribute("nowTime");
                                    out.print(DateUtil.dataBaseVarcharFormDateTimeLocalFormatTojavaString(train.getStartTime())+"时-"+DateUtil.dataBaseVarcharFormDateTimeLocalFormatTojavaString(train.getEndTime())+"时");
                                %>
                                </h5><br/>
                                <div class="form-group">
                                    <label>开始时间</label>
                                    <input type="datetime-local" class="form-control" name="startTime" value="${train.startTime}" required/>
                                </div>
                                <div class="form-group">
                                    <label>结束时间</label>
                                    <input type="datetime-local" class="form-control" name="endTime" value="${train.endTime}" required/>
                                </div>
                                <div class="form-group">
                                    <label>地点</label>
                                    <input type="text" class="form-control" name="place" value="${train.place}" required/>
                                </div>
                                <%
                                    if(train.getReleaseTime()!=null) {
                                        Long period = nowTime.getTime()-train.getReleaseTime().getTime();
                                        pageContext.setAttribute("period", period);
                                    }
                                %>
                                <c:if test="${train.state==0}">
                                    <input type="hidden" name="state" value="${train.state}"/>
                                    <button type="button" class="btn btn-default" onclick="process('admin/releasetrain')">发布</button>
                                    <button type="button" class="btn btn-default" onclick="process('admin/updatetrain')">更改</button>
                                </c:if>
                                <c:if test="${not empty period}">
                                    <c:if test="${train.state==1&&(period)/600000<1}">
                                        <input type="hidden" name="state" value="3"/>
                                        <button type="button" class="btn btn-default" onclick="process('admin/changestatetrain')">撤销</button>
                                    </c:if>
                                    <c:if test="${train.state==1&&(period)/600000>1}">
                                        <input type="hidden" name="state" value="2"/>
                                        <button type="button" class="btn btn-default" onclick="process('admin/changestatetrain')">结束</button>
                                    </c:if>
                                </c:if>
                                <c:if test="${train.state==3}">
                                    <input type="hidden" name="state" value="1"/>
                                    <button type="button" class="btn btn-default" onclick="process('admin/changestatetrain')">重新发布</button>
                                </c:if>
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
                        <span class="glyphicon glyphicon-plus" aria-hidden="true">添加培训</span>
                    </a>
                </h2>
            </div>
            <div id="collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading">
                <div class="panel-body">
                    <div class="bs-example">
                        <form method="post" action="admin/inserttrain">
                            <input type="hidden" name="state" value="0"/>
                            <div class="form-group">
                                <label>科目</label>
                                <input type="text" class="form-control" name="subject" required/>
                            </div>
                            <div class="form-group">
                                <label>内容</label>
                                <input type="text" class="form-control" name="content" required/>
                            </div>
                            <div class="form-group">
                                <label>对象</label>
                                <input type="text" class="form-control" name="object"/>
                            </div>
                            <div class="form-group">
                                <label>开始时间</label>
                                <input type="datetime-local" class="form-control" name="startTime" required/>
                            </div>
                            <div class="form-group">
                                <label>结束时间</label>
                                <input type="datetime-local" class="form-control" name="endTime" required/>
                            </div>
                            <div class="form-group">
                                <label>地点</label>
                                <input type="text" class="form-control" name="place" required/>
                            </div>
                            <button type="submit" class="btn btn-default">添加</button>
                        </form>
                    </div><!-- /example -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>

