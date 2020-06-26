<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录页面</title>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/style/login.css">
</head>
<body>
    <main class="main" role="main">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-4">
                    <form class="form-container" action="login" method="post">
                        <h2>JAVA考试系统</h2>
                        <div class="form-group">
                            <label for="username">账号</label>
                            <input type="text" class="form-control" name="username" id="username" onchange="textChange()" placeholder="输入账号" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" class="form-control" name="password" id="password" onchange="textChange()" placeholder="输入密码">
                        </div>
                        <div style="color:#e74c3c" id="info"></div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 记住我&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="register.jsp">没有账号？点击注册</a>
                            </label>
                        </div>
                        <button type="button" class="btn btn-success btn-block" id="login_btn" onclick="login()">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
<script type="text/javascript">
    function login() {
        logging();
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        // 发送ajax请求，将登录结果返回出来进行验证，成功后跳到main.jsp
        $.ajax({
            url:"${APP_PATH}/login",
            data:"username="+username+"&password="+password,
            type:"post",
            success:function (result) {
                if (result.code=="100") {
                    location.href="${APP_PATH}/enterMain?username="+username+"&password="+password;
                } else {
                    loginFail();
                }
            }
        });
    }
    function textChange() {
        $(".form-group").removeClass("has-error");
        $("#info").html("");
    }
    function logging() {
        $("#login_btn").removeClass("btn-success");
        $("#login_btn").addClass("btn-primary");
        $("#login_btn").html("登录中...");
        textChange();
    }
    function loginFail() {
        $("#login_btn").removeClass("btn-primary");
        $("#login_btn").addClass("btn-success");
        $("#login_btn").html("登录");
        $(".form-group").addClass("has-error");
        $("#info").html("账号或密码错误！");
    }
    $(function(){
        $('body').keydown(function(e) {
            if (e.keyCode == 13) { // 按下回车登录
                login();
            }
        });
    });
</script>
</body>
</html>