<%--
  Created by IntelliJ IDEA.
  User: 31882
  Date: 2019/5/31
  Time: 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新题目</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
<div>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="row">

                <div class="navbar-header col-md-2 ">
                    <a class="navbar-brand " href="#">即可</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav" style="margin-right: 250px" id="mytab">
                        <li style="width: 150px;text-align: center" ><a href="#">问题</a> </li>
                        <li style="width: 150px;text-align: center"><a href="#">状态</a> </li>
                        <li style="width: 150px;text-align: center"><a href="#">排名</a> </li>
                    </ul>

                    <ul class="nav  navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">点我<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">我的信息</a> </li>
                                <li><a href="#">我的提交</a> </li>
                                <li><a href="#">注销</a> </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>
<br><br><br>



<div class="container">

    <div class="panel panel-info">
        <div class="panel-heading">
            请输入题目
        </div>
        <div class="panel-body">
            <textarea style="width: 29.3cm;height:8cm;resize: none;"></textarea>
        </div>
        <div class="panel-heading">
            请输入答案
        </div>
        <div class="panel-body">
            <textarea style="width: 29.3cm;height:3cm;resize: none;"></textarea>
        </div>
        <div class="panel-footer panel-danger">
            <button class="btn btn-info" style="height: 0.8cm;">提交</button>
        </div>
    </div>

</div>
<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $("#mytab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    })
</script>
</body>
