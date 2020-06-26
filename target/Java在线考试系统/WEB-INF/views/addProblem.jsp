<%--
  Created by IntelliJ IDEA.
  User: www37
  Date: 2019/5/31
  Time: 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    String status = request.getParameter("status");
%>
<html>
<head>
    <title>添加题目</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${status==1}">
    <script>alert("添加成功！");</script>
</c:if>
<c:if test="${status==0}">
    <script>alert("添加失败！");</script>
</c:if>
<div>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="row">

                <div class="navbar-header col-md-2 ">
                    <a class="navbar-brand " href="${APP_PATH}/welcome.jsp">即可</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav" style="margin-right: 250px">
                        <li style="width: 150px;text-align: center" class="active" ><a href="${APP_PATH}/problemList">问题</a> </li>
                        <li style="width: 150px;text-align: center"><a href="${APP_PATH}/statusList">状态</a> </li>
                        <li style="width: 150px;text-align: center"><a href="${APP_PATH}/rankList">排名</a> </li>
                    </ul>

                    <ul class="nav  navbar-nav navbar-right">
                        <li class="dropdown">
                            <c:if test="${username==null}" var="guest">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">点我<span class="caret"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="${APP_PATH}/index.jsp">登录</a></li>
                                    <li><a href="${APP_PATH}/register.jsp">注册</a></li>
                                </ul>
                            </c:if>
                            <c:if test="${not guest}">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${username}<span class="caret"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a data-toggle="modal" data-target="#myModal" data-whatever="${username}" href="">我的信息</a></li>
                                    <li><a href="${APP_PATH}/mySubmitList">我的提交</a> </li>
                                    <li><a href="${APP_PATH}/logout">注销</a></li>
                                </ul>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>
<br><br><br>



<div class="container">
<form action="${APP_PATH}/AddProblem" method="post">
    <div class="panel panel-info">
        <div class="panel-heading">
            请输入题目
        </div>
        <div class="panel-body">
            <textarea name="question" style="width: 29.3cm;height:8cm;resize: none;"></textarea>
        </div>
        <div class="panel-heading">
            请输入答案
        </div>
        <div class="panel-body">
            <textarea name="answer" style="width: 29.3cm;height:3cm;resize: none;"></textarea>
        </div>
        <div class="panel-footer panel-danger">
            <button class="btn btn-info" type="submit " style="height: 0.8cm;" >提交</button>
        </div>
    </div>
</form>
</div>

<script>
    $("#mytab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    })
</script>
</body>
</html>
