<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MCplayer
  Date: 2018/7/25
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/smallpagetemplate.css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <style>
        #page1{
            display: block;
        }
        .page{
            display: none;
            width: 100%;
        }
    </style>
    <script>
        $(document).ready(
            $.ajax({
                type: "post",
                url: "showrecruitinfo",
                data: {
                    "revoke": 0
                },
                success: function (obj) {
                    if (obj != null) {
                        var flag = true;
                        var table = $("#recruitinfo");
                        // table.setAttribute("id", "recruitinfo");
                        // table.setAttribute("align", "center");
                        // var th="<tr>";
                        if (obj.length < 5) {
                            var viewth = document.createElement("tr");
                            for (var tr in obj) {
                                var viewtr = document.createElement("tr");
                                // table += ("<tr>");
                                for (var td in obj[tr]) {
                                    if (flag) {
                                        // th += ("<th>" + td + "</th>");
                                        var addth = document.createElement("th");
                                        var thtext = document.createTextNode(td);
                                        addth.appendChild(thtext);
                                        viewth.appendChild(addth);
                                    }
                                    // table += ("<td>" + obj[tr][td] + "</td>");
                                    var viewtd = document.createElement("td");
                                    var tdtext = document.createTextNode(obj[tr][td]);
                                    viewtd.appendChild(tdtext)
                                    viewtr.appendChild(viewtd);
                                }
                                flag = false;
                                table.appendChild(viewtr);
                                // if (flag) {
                                //     flag = false;
                                //     th += ("</tr>");
                                // }
                                // table += ("</tr>");
                            }
                            // table=th+table;
                            table.prepend(viewth);
                        } else {
                            var pageNum = Math.ceil(obj.length / 5);
                            // var table = document.createElement("table");
                            // table.setAttribute("id", "recruitinfo");
                            // table.setAttribute("align", "center");
                            for (var pg = 1; pg <= pageNum; pg++) {
                                // table+="<div id='page"+pg+"' class='page'>";
                                var div = document.createElement("div");
                                div.setAttribute("id", "page" + pg);
                                div.setAttribute("class", "page");
                                var viewth = document.createElement("tr");
                                for (var tr = 5 * (pg - 1); tr < 5 * pg && tr < obj.length; tr++) {
                                    // table += ("<tr>");
                                    var viewtr = document.createElement("tr");
                                    for (var td in obj[tr]) {
                                        if (flag) {
                                            // th += ("<th>" + td + "</th>");
                                            var addth = document.createElement("th");
                                            var thtext = document.createTextNode(td);
                                            addth.appendChild(thtext);
                                            viewth.appendChild(addth);
                                        }
                                        // table += ("<td>" + obj[tr][td] + "</td>");
                                        var viewtd = document.createElement("td");
                                        var tdtext = document.createTextNode(obj[tr][td]);
                                        viewtd.appendChild(tdtext)
                                        viewtr.appendChild(viewtd);
                                    }
                                    // if (flag) {
                                    //     flag = false;
                                    //     th += ("</tr>");
                                    // }
                                    // table += ("</tr>");
                                    flag = false;
                                    div.appendChild(viewtr);
                                }
                                // table+="</div>";
                                div.prepend(viewth);
                                flag = true;
                                table.append(div);
                            }
                            for (var pg = 1; pg <= pageNum; pg++) {
                                var a = document.createElement("a");
                                a.setAttribute("id",pg);
                                a.setAttribute("class", "apage");
                                a.setAttribute("href", "javascript:void(0)");
                                var aval = document.createTextNode(pg);
                                a.appendChild(aval);
                                table.append(a);
                            }
                        }
                        $("body").append(table);
                    }
                }
            })
        );
        window.onload = function() {
            $("#recruitinfo").on("click","a",function () {
                var pg = $(this).attr("id");
                $(this).siblings(".page").css("display", "none").siblings("#page" + pg).css("display", "block");
            });
        }
    </script>
</head>
<body>
    <c:if test="${empty guest}">
        <a href="logregis.jsp">登录/注册</a><br/>
    </c:if>
    <table id="recruitinfo" align='center'></table>
</body>
</html>

