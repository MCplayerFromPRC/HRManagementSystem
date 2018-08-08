<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/1
  Time: 14:34
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
    <div class="container">
        <div class="col-md-1"></div>
        <div class="panel-group col-md-8" id="accordion" role="tablist" aria-multiselectable="true">
            <c:forEach items="${guest.resumes}" var="resume" varStatus="i">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading${i.index+1}">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${i.index+1}" aria-expanded="false" aria-controls="collapse${i.index+1}">
                                简历 #${i.index+1}
                            </a>
                        </h4>
                    </div>
                    <div id="collapse${i.index+1}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${i.index+1}">
                        <div class="panel-body">
                            <form method="post" action="guest/updateresume?id=${resume.id}&gid=${resume.gid}">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <input type="text" class="form-control" name="name" value="${resume.name}" required/>
                                </div>
                                <div class="form-group">
                                    <label>性别</label>
                                    <input type="text" class="form-control" name="gender" value="${resume.gender}" required/>
                                </div>
                                <div class="form-group">
                                    <label>邮箱</label>
                                    <input type="email" class="form-control" name="email" value="${resume.email}" required/>
                                </div>
                                <div class="form-group">
                                    <label>城市</label>
                                    <input type="text" class="form-control" name="city" value="${resume.city}" required/>
                                </div>
                                <div class="form-group">
                                    <label for="school">毕业院校</label>
                                    <input type="text" class="form-control" name="school" value="${resume.school}" required/>
                                </div>
                                <div class="form-group">
                                    <label>专业</label>
                                    <input type="text" class="form-control" name="major" value="${resume.major}" required/>
                                </div>
                                <div class="form-group">
                                    <label>年龄</label>
                                    <input type="number" class="form-control" name="age" value="${resume.age}" required/>
                                </div>
                                <div class="form-group">
                                    <label>期望薪资</label>
                                    <input type="number" class="form-control" name="salary" value="${resume.salary}" required/>
                                </div>
                                <div class="form-group">
                                    <label>应聘岗位</label>
                                    <input type="text" class="form-control" name="job" value="${resume.job}" required/>
                                </div>
                                <div class="form-group">
                                    <label>备注</label>
                                    <textarea name="description" class="form-control" cols="30" required>${resume.description}</textarea>
                                </div>
                                <p class="text-center">${error+""+resume.id}</p>
                                <button type="submit" class="btn btn-default">更改</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">
                            <span class="glyphicon glyphicon-plus-sign"  aria-hidden="true"></span> 添加简历
                        </a>
                    </h4>
                </div>
                <div id="collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading">
                    <div class="panel-body">
                        <form method="post" action="guest/insertresume?gid=${guest.id}">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control" id="name" name="name"/>
                            </div>
                            <div class="form-group">
                                <label for="gender">性别</label>
                                <input type="text" class="form-control" id="gender" name="gender"/>
                            </div>
                            <div class="form-group">
                                <label for="email">邮箱</label>
                                <input type="email" class="form-control" id="email" name="email"/>
                            </div>
                            <div class="form-group">
                                <label for="city">城市</label>
                                <input type="text" class="form-control" id="city" name="city"/>
                            </div>
                            <div class="form-group">
                                <label for="school">毕业院校</label>
                                <input type="text" class="form-control" id="school" name="school"/>
                            </div>
                            <div class="form-group">
                                <label for="major">专业</label>
                                <input type="text" class="form-control" id="major" name="major"/>
                            </div>
                            <div class="form-group">
                                <label for="age">年龄</label>
                                <input type="number" class="form-control" id="age" name="age"/>
                            </div>
                            <div class="form-group">
                                <label for="salary">期望薪资</label>
                                <input type="number" class="form-control" id="salary" name="salary"/>
                            </div>
                            <div class="form-group">
                                <label for="job">应聘岗位</label>
                                <input type="text" class="form-control" id="job" name="job"/>
                            </div>
                            <div class="form-group">
                                <label for="description">备注</label>
                                <textarea name="description" class="form-control" id="description" cols="30"></textarea>
                            </div>
                            <p class="text-center">${error}</p>
                            <button type="submit" class="btn btn-default">添加</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</body>
</html>

