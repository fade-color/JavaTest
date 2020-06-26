<%--
  Created by IntelliJ IDEA.
  User: www37
  Date: 2019/5/29
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>我的提交</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function searchProblem(){
            var url='problemInfo?problemId='+$("#problemId").val();
            location.href=url;
        }
    </script>
</head>
<body>
<div>
    <%--    导航栏--%>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="row">

                <div class="navbar-header col-md-2 ">
                    <a class="navbar-brand " href="${APP_PATH}/welcome.jsp">即可</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav" style="margin-right: 250px">
                        <li style="width: 150px;text-align: center"><a href=" ${APP_PATH}/problemList">问题</a> </li>
                        <li style="width: 150px;text-align: center"><a href="${APP_PATH}/statusList">状态</a> </li>
                        <li style="width: 150px;text-align: center"><a href="${APP_PATH}/rankList">排名</a> </li>
                    </ul>

                    <ul class="nav  navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">点我<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a data-toggle="modal" data-target="#myModal" data-whatever="${username}" href="">我的信息</a></li>
                                <li><a href="${APP_PATH}/mySubmitList">我的提交</a> </li>
                                <li><a href="${APP_PATH}/logout">注销</a> </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>
<br><br><br>
<div class="modal fade bs-example-modal-sm" id="myModal" role="dialog" aria-label="myModalLable"
     aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="control-label">昵称</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="control-label">密码 </label>
                        <input type="password" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary">
                    保存
                </button>
            </div>
        </div>
    </div>
</div>
<div>
    <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" id="problemId" class="form-control"placeholder="Problem ID" autocomplete="off">
        </div>
        <button type="button" class="btn btn-default" onclick="searchProblem()">搜索</button>
    </form>
</div>

<div>
    <div class="panel panel-default">
        <table class="table">
            <thead>
            <tr class="active">
                <th width="150">运行编号</th>
                <th width="200">用户</th>
                <th width="200">问题</th>
                <th>结果</th>
                <th>运行时间</th>
                <th>提交时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${MySubmitList}" var="record">
                <tr class="success">
                    <td>${record.recordId}</td>
                    <td> <a href="#" >${record.userId}</a></td>
                    <td> <a href="#" > ${record.problemId}</a></td>
                    <td><button class="btn ${record.result==1?"btn-success":"btn-danger"} "style="height: 0.8cm;">${record.result==1?"Success":"&nbsp;Wrong &nbsp;"}  </button> </td>
                    <td>${record.runTime}</td>
                    <td><fmt:formatDate value="${record.submitTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div align="center">
        <nav>
            <ul class="pagination">
                <li class="disabled"><a href="#" >&laquo;</a> </li>
                <li class="active"><a href="#" >1</a> </li>
                <li><a href="#">&raquo;</a> </li>
            </ul>
        </nav>
    </div>
</div>
<script>
    $("#mytab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    })
    $(function() {
        $('#myModal').modal('hide')
    });

    $("#myModal").on("shown.bs.modal", function (e) {
        var button = $(e.relatedTarget);
        var recipient = button.data("whatever");//获取whatever中的值
        var modal = $(this);
        modal.find(".modal-title").text("Hello" + recipient);
        modal.find(".modal-body input").val(recipient)//给两个弹出的输入框注入初值
    });
    $("#myModal").modal({
        backdrop:false
    });
</script>
</body>
</html>
