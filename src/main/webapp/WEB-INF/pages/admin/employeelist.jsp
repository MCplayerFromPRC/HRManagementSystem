<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/8/5
  Time: 14:48
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
            var arr=[];
            $.ajax({
                type:"post",
                url:"admin/getdepartmentjobcontact",
                data:{
                    state:0
                },
                success:function (obj) {
                    for(var index in obj){
                        arr[index]=obj[index]["name"];
                        arr[obj[index]["name"]]=obj[index]["jobs"];
                        $(".selectdept").append("<option value='"+obj[index]["id"]+"'>"+obj[index]["name"]+"</option>")
                        if(index==0){
                            for(var a in obj[index]["jobs"]){
                                var $option1=$("<option value='"+obj[index]["jobs"][a]["id"]+"'>"+obj[index]["jobs"][a]["name"]+"</option>");
                                $(".selectjob").append($option1);
                            }
                        }
                    }
                }
            })
            $(".selectdept").on("input",function () {
                var index = $(this).find("option:selected").text();
                $(".selectjob").html("");
                for (var i in arr[index]){
                    var $option1=$("<option></option>");
                    $option1.append(arr[index][i]["name"]);
                    $option1.attr("value",arr[index][i]["id"]);
                    $(".selectjob").append($option1);
                }
            })
            $.ajax({
                type:"post",
                url:"admin/gettrainforemployee",
                data:{},
                success:function (obj) {
                    for(var index in obj){
                        var $option1=$("<option value='"+obj[index]["id"]+"'>"+obj[index]["subject"]+"</option>");
                        $(".selecttrain").append($option1);
                    }
                }
            })
        })
    </script>
</head>
<body>
    <c:if test="${not empty admin}">
        <%@ include file="adminnavbar.jsp"%>
    </c:if>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <c:forEach var="employee" items="${employees}">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading${employee.id}">
                    <h2 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${employee.id}" aria-expanded="false" aria-controls="collapse${employee.id}">
                            <span>员工 ${employee.id} &emsp;${employee.account}</span>
                        </a>
                    </h2>
                </div>
                <div id="collapse${employee.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${employee.id}">
                    <div class="panel-body">
                        <div class="panel-group" id="accordionemp" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingemp${employee.id}">
                                    <h3 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionemp" href="#collapseemp${employee.id}" aria-expanded="false" aria-controls="collapseemp${employee.id}">
                                            <span>员工调度</span>
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapseemp${employee.id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingemp${employee.id}">
                                    <div class="panel-body">
                                        <div class="bs-example">
                                            <form method="post" action="admin/changeemployeejob?id=${employee.id}">
                                                <div class="col-md-3">
                                                    <label class="control-label">部门</label>
                                                    <select class="form-control selectdept" name="deptid">

                                                    </select>
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="control-label">职位</label>
                                                    <select class="form-control selectjob" name="jobid">

                                                    </select>
                                                </div>
                                                <div class="col-md-1">
                                                    <label class="control-label">操作</label>
                                                    <button type="submit" class="btn btn-default">更改</button>
                                                </div>
                                            </form>
                                        </div><!-- /example -->
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty employee.train}">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingemp${employee.id}train">
                                        <h3 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionemp" href="#collapseemp${employee.id}train" aria-expanded="false" aria-controls="collapseemp${employee.id}train">
                                                <span>培训信息</span>
                                            </a>
                                        </h3>
                                    </div>
                                    <div id="collapseemp${employee.id}train" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingemp${employee.id}train">
                                        <div class="panel-body">
                                            <div class="bs-example">
                                                <form method="post" action="admin/changeemployeetrain?id=${employee.id}">
                                                    <div class="col-md-3">
                                                        <label for="selecttrain${employee.id}" class="control-label">培训</label>
                                                        <select class="form-control selecttrain" name="trainid" >

                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-default">更改</button>
                                                </form>
                                            </div><!-- /example -->
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <%--<c:if test="${not empty employee.}">--%>
                                <%--<div class="panel panel-default">--%>
                                    <%--<div class="panel-heading" role="tab" id="headingemp${employee.id}train">--%>
                                        <%--<h3 class="panel-title">--%>
                                            <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionemp" href="#collapseemp${employee.id}train" aria-expanded="false" aria-controls="collapseemp${employee.id}train">--%>
                                                <%--<span>培训信息</span>--%>
                                            <%--</a>--%>
                                        <%--</h3>--%>
                                    <%--</div>--%>
                                    <%--<div id="collapseemp${employee.id}train" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingemp${employee.id}train">--%>
                                        <%--<div class="panel-body">--%>
                                            <%--<div class="bs-example">--%>
                                                <%--<form method="post" action="">--%>
                                                    <%--<div class="col-md-3">--%>
                                                        <%--<label for="selecttrain${employee.id}" class="control-label">培训</label>--%>
                                                        <%--<select class="form-control" id="selecttrain${employee.id}" name="state">--%>

                                                        <%--</select>--%>
                                                    <%--</div>--%>
                                                    <%--<button type="submit" class="btn btn-default">更改</button>--%>
                                                <%--</form>--%>
                                            <%--</div><!-- /example -->--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</c:if>--%>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <c:if test="${not empty ad_emp_pageNum}">
        <div align="center">
            <ul class="pagination" >
                <li>
                    <a href="admin/getemployeebypage?pg=${page-1>0? page-1:1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="pg" begin="1" end="${ ad_emp_pageNum}">
                    <li>
                        <a class="apage" href="admin/getemployeebypage?pg=${pg}">${pg}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="admin/getemployeebypage?pg=${page+1> ad_emp_pageNum?page:page+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </c:if>
</body>
</html>

