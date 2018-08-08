<%@ page import="com.cc.util.DateUtil" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.cc.model.Employee" %>
<%@ page import="com.cc.model.Salary" %>
<%@ page import="java.util.List" %>
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
                        $(".selecttrain").prepend($option1);
                    }
                    var optval=$("#selecttrainhidden").val();
                    $(".selecttrain option[value='"+optval+"']").attr("selected","selected");
                }
            })
            $(".panel a.rewards").one("click",function () {
                var mythis = $(this);
                var empid=$(this).siblings("input").val();
                $.ajax({
                    type:"post",
                    url:"admin/getemployeerewardspages",
                    data:{
                        empid:empid,
                        state:3
                    },
                    success:function (obj) {
                        for(var index=1;index<=obj;index++){
                            var $li=$("<li><a class='apage'>"+index+"</a></li>");
                            var $ul=mythis.parent().parent().siblings(".panel-collapse").find("ul.rewards");
                            $ul.children("input[name='rewardspage']").val("1");
                            $ul.children("li:last-child").before($li);
                        }
                    }
                })
                $.ajax({
                    type:"post",
                    url:"admin/getemployeerewardsfirstpageslist",
                    data:{
                        empid:empid
                    },
                    success:function (obj) {
                        var panel=mythis.parent().parent().siblings(".panel-collapse").find(".panel-group");
                        for(var i in obj){
                            var $form=$("<form method='post' action='admin/changerewards'></form>");
                            var $inputid=$("<input type='hidden' name='id' value='"+obj[i]["id"]+"'/>");
                            var $inputempid=$("<input type='hidden' name='empid' value='"+obj[i]["empid"]+"'/>");
                            $form.append($inputid).append($inputempid);
                            for(var attr in obj[i]){
                                var $divformgroup;
                                var $formgrouplabel;
                                var $forminput;
                                if(attr=="description"){
                                    $divformgroup=$("<div class='form-group'></div>");
                                    $formgrouplabel=$("<label>原因</label>");
                                    $forminput=$("<input type='text' class='form-control' name='"+attr+"' value='"+obj[i][attr]+"'/>");
                                }
                                if(attr=="time"){
                                    $divformgroup=$("<div class='form-group'></div>");
                                    $formgrouplabel=$("<label>时间</label>");
                                    var datetime=new Date(obj[i][attr]);
                                    $forminput=$("<input type='datetime-local' class='form-control' name='"+attr+"' value='"+datetimeFormat_1(datetime)+"'/>");
                                }
                                if(attr=="reMoney"){
                                    $divformgroup=$("<div class='form-group'></div>");
                                    $formgrouplabel=$("<label>金额</label>");
                                    $forminput=$("<input type='number' class='form-control' name='"+attr+"' value='"+obj[i][attr]+"'/>");
                                }
                                $form.append($divformgroup.append($formgrouplabel).append($forminput));
                            }
                            var $divformbutton=$("<button type='submit' class='btn btn-default'>更改</button>");
                            $form.append($divformbutton);
                            var $divcollapse=$("<div id='collapseemp"+empid+"rewards"+obj[i]["id"]+"' class='panel-collapse collapse' role='tabpanel' aria-labelledby='headingemp"+empid+"rewards"+obj[i]["id"]+"'></div>");
                            $divcollapse.append($("<div class='panel-body'></div>").append($("<div class='bs-example'></div>").append($form)));
                            var $divheadinga=$("<a class='collapsed' role='button' data-toggle='collapse' data-parent='#accordionemp"+obj[i]["id"]+"rewards' href='#collapseemp"+empid+"rewards"+obj[i]["id"]+"' aria-expanded='false' aria-controls='collapseemp"+empid+"rewards"+obj[i]["id"]+"'></a>");
                            $divheadinga.html("<span>奖惩 "+obj[i]["id"]+"</span>");
                            var $divheadingdeletea=$("<a href='admin/deleterewards?id="+obj[i]["id"]+"'></a>");
                            $divheadingdeletea.html(" <span class='glyphicon glyphicon-minus-sign' aria-hidden='true' style='float: right'>删除</span>");
                            var $divheadingh3=$("<h3 class='panel-title'></h3>");
                            $divheadingh3.append($divheadinga).append($divheadingdeletea);
                            var $divheading=$("<div class='panel-heading' role='tab' id='headingemp"+empid+"rewards"+obj[i]["id"]+"'></div>");
                            $divheading.append($divheadingh3);
                            var $divpaneldefault=$("<div class='panel panel-default'></div>");
                            $divpaneldefault.append($divheading).append($divcollapse);
                            panel.append($divpaneldefault);

                        }
                        var $form=$("<form method='post' action='admin/addemployeerewards'></form>");
                        var $divformgroup;
                        var $formgrouplabel;
                        var $forminput;
                        $divformgroup=$("<div class='form-group'></div>");
                        $formgrouplabel=$("<label>原因</label>");
                        $forminput=$("<input type='text' class='form-control' name='description'/>");
                        $form.append($divformgroup.append($formgrouplabel).append($forminput));

                        $divformgroup=$("<div class='form-group'></div>");
                        $formgrouplabel=$("<label>时间</label>");
                        $forminput=$("<input type='datetime-local' class='form-control' name='time'/>");
                        $form.append($divformgroup.append($formgrouplabel).append($forminput));

                        $divformgroup=$("<div class='form-group'></div>");
                        $formgrouplabel=$("<label>金额</label>");
                        $forminput=$("<input type='number' class='form-control' name='reMoney'/>");
                        $form.append($divformgroup.append($formgrouplabel).append($forminput));

                        var $inputempid=$("<input type='hidden' name='empid' value='"+empid+"'/>");
                        $form.append($inputempid);
                        var $divformbutton=$("<button type='submit' class='btn btn-default'>添加</button>");
                        $form.append($divformbutton);
                        var $divcollapse=$("<div id='collapseemp"+empid+"rewardsadd' class='panel-collapse collapse' role='tabpanel' aria-labelledby='headingemp"+empid+"rewardsadd'></div>");
                        $divcollapse.append($("<div class='panel-body'></div>").append($("<div class='bs-example'></div>").append($form)));
                        var $divheadinga=$("<a class='collapsed' role='button' data-toggle='collapse' data-parent='#accordionemp"+obj[i]["id"]+"rewards' href='#collapseemp"+empid+"rewardsadd' aria-expanded='false' aria-controls='collapseemp"+empid+"rewardsadd'></a>");
                        $divheadinga.html("<span class='glyphicon glyphicon-plus' aria-hidden='true'>添加奖惩</span>");
                        var $divheadingh3=$("<h3 class='panel-title'></h3>");
                        $divheadingh3.append($divheadinga);
                        var $divheading=$("<div class='panel-heading' role='tab' id='headingemp"+empid+"rewardsadd'></div>");
                        $divheading.append($divheadingh3);
                        var $divpaneldefault=$("<div class='panel panel-default'></div>");
                        $divpaneldefault.append($divheading).append($divcollapse);
                        panel.append($divpaneldefault);
                    }
                })
            })
            $("ul.rewards").on("click","li a.apage",function () {
                var mythis=$(this);
                var index=$(this).index();
                var empid=$(this).parent().parent().children("[name='empid']").val();
                var pg=$(this).parent().parent().children(":first-child").val();
                $.ajax({
                    type:"post",
                    url:"admin/getemployeerewardsbypages",
                    data:{
                        pg:$(this).text(),
                        empid:empid
                    },
                    success:function (obj) {
                        mythis.parent().parent().children(":first-child").val(mythis.text());
                        var panel=mythis.parent().parent().parent().siblings(".panel-group");
                        panel.html("");
                        for(var i in obj){
                            var $form=$("<form method='post' action='admin/changerewards'></form>");
                            var $inputid=$("<input type='hidden' name='id' value='"+obj[i]["id"]+"'/>");
                            var $inputempid=$("<input type='hidden' name='empid' value='"+obj[i]["empid"]+"'/>");
                            $form.append($inputid).append($inputempid);
                            for(var attr in obj[i]){
                                var $divformgroup;
                                var $formgrouplabel;
                                var $forminput;
                                if(attr=="description"){
                                    $divformgroup=$("<div class='form-group'></div>");
                                    $formgrouplabel=$("<label>原因</label>");
                                    $forminput=$("<input type='text' class='form-control' name='"+attr+"' value='"+obj[i][attr]+"'/>");
                                }
                                if(attr=="time"){
                                    $divformgroup=$("<div class='form-group'></div>");
                                    $formgrouplabel=$("<label>时间</label>");
                                    var datetime=new Date(obj[i][attr]);
                                    $forminput=$("<input type='datetime-local' class='form-control' name='"+attr+"' value='"+datetimeFormat_1(datetime)+"'/>");
                                }
                                if(attr=="reMoney"){
                                    $divformgroup=$("<div class='form-group'></div>");
                                    $formgrouplabel=$("<label>金额</label>");
                                    $forminput=$("<input type='number' class='form-control' name='"+attr+"' value='"+obj[i][attr]+"'/>");
                                }
                                $form.append($divformgroup.append($formgrouplabel).append($forminput));
                            }
                            var $divformbutton=$("<button type='submit' class='btn btn-default'>更改</button>");
                            $form.append($divformbutton);
                            var $divcollapse=$("<div id='collapseemp"+empid+"rewards"+obj[i]["id"]+"' class='panel-collapse collapse' role='tabpanel' aria-labelledby='headingemp"+empid+"rewards"+obj[i]["id"]+"'></div>");
                            $divcollapse.append($("<div class='panel-body'></div>").append($("<div class='bs-example'></div>").append($form)));
                            var $divheadinga=$("<a class='collapsed' role='button' data-toggle='collapse' data-parent='#accordionemp"+obj[i]["id"]+"rewards' href='#collapseemp"+empid+"rewards"+obj[i]["id"]+"' aria-expanded='false' aria-controls='collapseemp"+empid+"rewards"+obj[i]["id"]+"'></a>");
                            $divheadinga.html("<span>奖惩 "+obj[i]["id"]+"</span>");
                            var $divheadingdeletea=$("<a href='admin/deleterewards?id="+obj[i]["id"]+"'></a>");
                            $divheadingdeletea.html(" <span class='glyphicon glyphicon-minus-sign' aria-hidden='true' style='float: right'>删除</span>");
                            var $divheadingh3=$("<h3 class='panel-title'></h3>");
                            $divheadingh3.append($divheadinga).append($divheadingdeletea);
                            var $divheading=$("<div class='panel-heading' role='tab' id='headingemp"+empid+"rewards"+obj[i]["id"]+"'></div>");
                            $divheading.append($divheadingh3);
                            var $divpaneldefault=$("<div class='panel panel-default'></div>");
                            $divpaneldefault.append($divheading).append($divcollapse);
                            panel.append($divpaneldefault);
                        }
                        var $form=$("<form method='post' action='admin/addemployeerewards'></form>");
                        var $divformgroup;
                        var $formgrouplabel;
                        var $forminput;
                        $divformgroup=$("<div class='form-group'></div>");
                        $formgrouplabel=$("<label>原因</label>");
                        $forminput=$("<input type='text' class='form-control' name='description'/>");
                        $form.append($divformgroup.append($formgrouplabel).append($forminput));

                        $divformgroup=$("<div class='form-group'></div>");
                        $formgrouplabel=$("<label>时间</label>");
                        $forminput=$("<input type='datetime-local' class='form-control' name='time'/>");
                        $form.append($divformgroup.append($formgrouplabel).append($forminput));

                        $divformgroup=$("<div class='form-group'></div>");
                        $formgrouplabel=$("<label>金额</label>");
                        $forminput=$("<input type='number' class='form-control' name='reMoney'/>");
                        $form.append($divformgroup.append($formgrouplabel).append($forminput));

                        var $inputempid=$("<input type='hidden' name='empid' value='"+empid+"'/>");
                        $form.append($inputempid);
                        var $divformbutton=$("<button type='submit' class='btn btn-default'>添加</button>");
                        $form.append($divformbutton);
                        var $divcollapse=$("<div id='collapseemp"+empid+"rewardsadd' class='panel-collapse collapse' role='tabpanel' aria-labelledby='headingemp"+empid+"rewardsadd'></div>");
                        $divcollapse.append($("<div class='panel-body'></div>").append($("<div class='bs-example'></div>").append($form)));
                        var $divheadinga=$("<a class='collapsed' role='button' data-toggle='collapse' data-parent='#accordionemp"+obj[i]["id"]+"rewards' href='#collapseemp"+empid+"rewardsadd' aria-expanded='false' aria-controls='collapseemp"+empid+"rewardsadd'></a>");
                        $divheadinga.html("<span class='glyphicon glyphicon-plus' aria-hidden='true'>添加奖惩</span>");
                        var $divheadingh3=$("<h3 class='panel-title'></h3>");
                        $divheadingh3.append($divheadinga);
                        var $divheading=$("<div class='panel-heading' role='tab' id='headingemp"+empid+"rewardsadd'></div>");
                        $divheading.append($divheadingh3);
                        var $divpaneldefault=$("<div class='panel panel-default'></div>");
                        $divpaneldefault.append($divheading).append($divcollapse);
                        panel.append($divpaneldefault);
                    }
                })
            })
        })
        function datetimeFormat_1(longTypeDate){
            var datetimeType = "";
            var date = new Date();
            date.setTime(longTypeDate);
            datetimeType+= date.getFullYear();  //年
            datetimeType+= "-" + getMonth(date); //月
            datetimeType += "-" + getDay(date);  //日
            datetimeType+= "T" + getHours(date);  //时
            datetimeType+= ":" + getMinutes(date);   //分
            datetimeType+= ":" + getSeconds(date);   //分
            return datetimeType;
        }
        //返回 01-12 的月份值
        function getMonth(date){
            var month = "";
            month = date.getMonth() + 1; //getMonth()得到的月份是0-11
            if(month<10){
                month = "0" + month;
            }
            return month;
        }
        //返回01-30的日期
        function getDay(date){
            var day = "";
            day = date.getDate();
            if(day<10){
                day = "0" + day;
            }
            return day;
        }
        //返回小时
        function getHours(date){
            var hours = "";
            hours = date.getHours();
            if(hours<10){
                hours = "0" + hours;
            }
            return hours;
        }
        //返回分
        function getMinutes(date){
            var minute = "";
            minute = date.getMinutes();
            if(minute<10){
                minute = "0" + minute;
            }
            return minute;
        }
        //返回秒
        function getSeconds(date){
            var second = "";
            second = date.getSeconds();
            if(second<10){
                second = "0" + second;
            }
            return second;
        }
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
                                            <span>员工调度&emsp;${employee.job.department.name}的${employee.job.name}--${employee.account}</span>
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
                                                    <label class="control-label">培训</label>
                                                    <input type="hidden" id="selecttrainhidden" value="${employee.trainid}">
                                                    <select class="form-control selecttrain" name="trainid" >
                                                        <option value="0">不给这人培训</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-1">
                                                    <label class="control-label">操作</label>
                                                    <c:if test="${not empty employee.train}">
                                                        <button type="submit" class="btn btn-default">更改</button>
                                                    </c:if>
                                                    <c:if test="${empty employee.train}">
                                                        <button type="submit" class="btn btn-default">添加</button>
                                                    </c:if>
                                                </div>
                                            </form>
                                        </div><!-- /example -->
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading headingemprewards" role="tab" id="headingemp${employee.id}rewards">
                                    <h3 class="panel-title">
                                        <input type="hidden" value="${employee.id}">
                                        <a class="collapsed rewards" role="button" data-toggle="collapse" data-parent="#accordionemp" href="#collapseemp${employee.id}rewards" aria-expanded="false" aria-controls="collapseemp${employee.id}rewards">
                                            <span>奖惩信息</span>
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapseemp${employee.id}rewards" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingemp${employee.id}rewards">
                                    <div class="panel-body">
                                        <div class="bs-example">
                                            <div class="panel-group" id="accordionemp${employee.id}rewards" role="tablist" aria-multiselectable="true">

                                            </div>
                                            <div align="center">
                                                <ul class="pagination rewards">
                                                    <input type="hidden" name="rewardspage" value="1"/>
                                                    <input type="hidden" name="empid" value="${employee.id}">
                                                    <li>
                                                        <a aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div><!-- /example -->
                                    </div>
                                </div>
                            </div>

                            <%
                                Employee employee= (Employee) pageContext.getAttribute("employee");
                                List<Salary> salaries=employee.getSalaries();
                                Timestamp nowDate=DateUtil.getSqlDate();
                                pageContext.setAttribute("nowDate",nowDate);
                                boolean flag=false;
                                Salary thisMonth=null;
                                for(Salary salary:salaries){
                                    if(nowDate.getTime()-salary.getAddDate().getTime()<5*24*60*60*1000){
                                        thisMonth=salary;
                                        flag=true;
                                        break;
                                    }
                                }
                                Calendar calendar1 = Calendar.getInstance();
                                calendar1.set(Calendar.DAY_OF_MONTH, 1);
                                calendar1.set(Calendar.HOUR_OF_DAY,0);
                                calendar1.set(Calendar.MINUTE,0);
                                calendar1.set(Calendar.SECOND,0);
                                Calendar calendar5 = Calendar.getInstance();
                                calendar5.set(Calendar.DAY_OF_MONTH, 10);
                                calendar5.set(Calendar.HOUR_OF_DAY,23);
                                calendar5.set(Calendar.MINUTE,59);
                                calendar5.set(Calendar.SECOND,59);
                                if((nowDate.getTime()-calendar1.getTimeInMillis())*(nowDate.getTime()-calendar5.getTimeInMillis())<0&&!flag){
                            %>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingemp${employee.id}salary">
                                    <h3 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionemp" href="#collapseemp${employee.id}salary" aria-expanded="false" aria-controls="collapseemp${employee.id}salary">
                                            <span>计算薪资</span>
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapseemp${employee.id}salary" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingemp${employee.id}salary">
                                    <div class="panel-body">
                                        <div class="bs-example">
                                            <form method="post" action="admin/countemployeesalary">
                                                <input type="hidden" name="empid" value="${employee.id}"/>
                                                <input type="hidden" name="salMoney" value="${employee.salary}"/>
                                                <input type="hidden" name="bonus" value="${employee.salary*0.2}"/>
                                                <input type="hidden" name="socialSecurity" value="${employee.socialSecurity}"/>
                                                <button type="submit" class="btn btn-default">算${employee.account}的工资</button>
                                            </form>
                                        </div><!-- /example -->
                                    </div>
                                </div>
                            </div>
                            <%
                                }else if(thisMonth!=null){
                                    pageContext.setAttribute("thisMonth",thisMonth);
                            %>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingemp${employee.id}salary">
                                    <h3 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionemp" href="#collapseemp${employee.id}salary" aria-expanded="false" aria-controls="collapseemp${employee.id}salary">
                                            <span>本月薪资</span>
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapseemp${employee.id}salary" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingemp${employee.id}salary">
                                    <div class="panel-body">
                                        <div class="bs-example">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>薪资 序号</th>
                                                        <th>${thisMonth.id}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="active">
                                                        <th scope="row">基本工资</th>
                                                        <td>${thisMonth.salMoney}</td>
                                                    </tr>
                                                    <tr class="success">
                                                        <th scope="row">绩效奖金</th>
                                                        <td>${thisMonth.bonus}</td>
                                                    </tr>
                                                    <tr class="info">
                                                        <th scope="row">加班费用</th>
                                                        <td>${thisMonth.over}</td>
                                                    </tr>
                                                    <tr class="warning">
                                                        <th scope="row">奖惩费用</th>
                                                        <td>${thisMonth.rewards}</td>
                                                    </tr>
                                                    <tr class="danger">
                                                        <th scope="row">社保</th>
                                                        <td>${thisMonth.socialSecurity}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">总计</th>
                                                        <td>${thisMonth.aggregate}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">状态</th>
                                                        <td>
                                                            <c:if test="${empty thisMonth.payDate}">
                                                                未领取
                                                            </c:if>
                                                            <c:if test="${not empty thisMonth.payDate}">
                                                                已领取
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div><!-- /example -->
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
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

