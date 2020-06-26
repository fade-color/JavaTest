<%--
  Created by IntelliJ IDEA.
  User: 31882
  Date: 2019/5/27
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    String username = (String) session.getAttribute("username");
    pageContext.setAttribute("username",username);
%>
<html>
<head>
    <title>问题详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div id="div1" style="height: 100vh">
    <!--navbar-fixed-top固定在顶端-->
    <!--navbar-default默认白色 navbar-inverse黑色-->
    <div>
        <nav class="navbar navbar-inverse navbar-fixed-top"  role="navigation">
            <div class="container-fluid">
                <div class="row">

                    <div class="navbar-header col-md-2 ">
                        <a class="navbar-brand " href="${APP_PATH}/welcome.jsp">即可</a>
                    </div>

                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav" style="margin-right: 250px">
                            <li style="width: 150px;text-align: center" ><a href="${APP_PATH}/problemList">问题</a> </li>
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
                                        <li><a href="${APP_PATH}/mySubmitList">我的提交</a></li>
                                        <li><a href="${APP_PATH}/logout">注销</a></li>
                                    </ul>
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
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
            <form role="form" id="codeForm" style="margin-top: 100px">
                <h2 style="padding: 0 200px;">问题${problem.problemId}:</h2>
                <h4 style="padding: 0 200px;">${problem.problemContent}</h4>
                <div class="form-group" style="padding: 20px 200px">
                    <label for="code">编码区</label>
                    <textarea id="code" name="code" class="form-control" rows="15">public class Main {
    public static void main(String[] args) {
         System.out.println("hello world!");
    }
}
        </textarea>
                </div>

                <button type="button" id="submitBtn" style="width: 200px" class="btn btn-success center-block" aria-hidden="true">提交</button>
                <br><br><br>

                <div style="padding: 20px">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">运行信息</h3>
                        </div>
                        <div class="panel-body" id="compileInfoDiv">
                        </div>
                    </div>
                </div>

                <div style="padding: 20px">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">运行结果</h3>
                        </div>
                        <div class="panel-body" id="resultDiv">

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $("#mytab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    });
</script>
<script>
    $(function () {
        $("#submitBtn").on("click",function () {
            $("#compileInfoDiv").html("");
            $("#resultDiv").html("");
            $.ajax({
                url:"${APP_PATH}/submitCode",
                data:$("#codeForm").serialize()+"&problemId=${problem.problemId}",
                type:"post",
                success:function (result) {
                    console.log(result);
                    if (result.code==100) { // 成功
                        $("#compileInfoDiv").html(result.extend.compileStatus);
                        $("#resultDiv").html(result.extend.runStatus.toString().replace(/\n/g,"<br/>"));
                        document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight;
                    }
                    else if (result.code=="200") { // 失败
                        $("#compileInfoDiv").html(result.extend.compileStatus);
                        document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight;
                    }
                    else // 异常
                        if (result.extend.status == "请登录后进行相关操作！") {
                            alert(result.extend.status)
                        } else {
                            alert(result.msg)
                        }
                }
            });
        });
    });
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
