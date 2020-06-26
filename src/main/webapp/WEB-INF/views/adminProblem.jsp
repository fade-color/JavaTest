<%--
  Created by IntelliJ IDEA.
  User: www37
  Date: 2019/5/31
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    pageContext.setAttribute("username",session.getAttribute("username"));
%>
<html>
<head>
    <title>问题</title>
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



<br><br><br>
<div>
    <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" name="problemId" id="problemId" class="form-control" placeholder="Problem ID" autocomplete="off">
        </div>
        <button type="button" class="btn btn-default" onclick="searchProblem()">搜索</button>
        <button type="button" class="btn btn-default" onclick="addProblem()">添加新题目</button>
    </form>
</div>

<div>
    <div class="panel panel-default">
        <table class="table">
            <thead>
            <tr class="active">
                <th width="100">编号</th>
                <th width="700">标题</th>
                <th width="200">正确</th>
                <th>提交</th>
                <th>修改</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${problemItems}" var="problemItem">
                <tr class="success">
                    <td>${problemItem.problemId}</td>
                    <td><a href="${APP_PATH}/problemInfo?problemId=${problemItem.problemId}" >${problemItem.problemContent}</a></td>
                    <td><span class="badge">${problemItem.correctNum}</span></td>
                    <td><span class="badge">${problemItem.submitNum}</span></td>
                    <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal" data-whatever="${problemItem.problemId}">修改</button></td>
                    <td><button class="btn btn-warning" onclick="deleteProblem(${problemItem.problemId})" style="height: 0.8cm;">删除</button> </td>
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
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">New message</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="problemTitle" class="control-label">题目:</label>
                        <input type="text" class="form-control" id="problemTitle">
                    </div>
                    <div class="form-group">
                        <label for="problemAnswer" class="control-label">答案:</label>
                        <input type="text" class="form-control" id="problemAnswer">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="submitBtn" onclick="updateProblem()" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('.modal-title').text('题目编号：' + recipient);
    });
    function updateProblem() {
        var title = $('#exampleModal').find('.modal-title').text().split('：');
        var problemId = title[1];
        $.ajax({
            url:'${APP_PATH}/update/'+problemId,
            data:"problemTitle="+$('#exampleModal').find('.modal-body #problemTitle').val()+
            "&problemAnswer="+$('#exampleModal').find('.modal-body #problemAnswer').val(),
            type:"post",
            success:function (result) {
                if (result.code==100) {
                    alert("修改成功");
                }
                else
                    alert("修改失败");
                location='${APP_PATH}/problemList';
            }
        });
    }
    function deleteProblem(problemId) {
        if(confirm("确认删除编号为"+problemId+"的题目吗？")) {
            $.ajax({
                url:"${APP_PATH}/deleteProblem/"+problemId,
                type:"post",
                success:function (result) {
                    if(result.code==100) {
                        alert("删除成功！");
                    } else {
                        alert("删除失败！");
                    }
                    location='${APP_PATH}/problemList';
                }
            });
        }
    }
    function addProblem() {
        location.href='${APP_PATH}/addProblem';
    }
    $("#mytab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    })
</script>
<script>
    $(function() {
        $('#myModal').modal('hide')
    });

    $("#myModal").on("shown.bs.modal", function (e) {
        var button = $(e.relatedTarget);
        var recipient = button.data("whatever");//获取whatever中的值
        var modal = $(this);
        modal.find(".modal-title").text("Hello" + recipient);
        modal.find(".modal-body input").val(recipient)//给两个弹出的输入框注入初值
    })
    $("#myModal").modal({
        backdrop:false
    })
</script>
</body>
</html>
