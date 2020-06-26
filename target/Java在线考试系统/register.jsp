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
    <title>注册页面</title>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/style/login.css">
</head>
<body>
<form class="form-horizontal form-container" id="registerForm" style="width:500px;margin:80px auto" action="${APP_PATH}/register/user" method="post">
    <h2>注册</h2>
    <div class="form-group">
        <label for="userId" class="col-sm-offset-1 col-sm-2 control-label">账号</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" name="userId" id="userId" autocomplete="off" placeholder="账号">
        </div>
        <label class="control-label" id="userIdLb"></label>
    </div>
    <div class="form-group">
        <label for="userName" class="col-sm-offset-1 col-sm-2  control-label">用户名</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" name="userName" id="userName" autocomplete="off" placeholder="用户名">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-offset-1 col-sm-2 control-label">密码</label>
        <div class="col-sm-7">
            <input type="password" class="form-control" name="password" id="password" placeholder="密码">
        </div>
    </div>
    <div class="form-group">
        <label for="rePassword" class="col-sm-3 control-label">确认密码</label>
        <div class="col-sm-7">
            <input type="password" class="form-control" id="rePassword" placeholder="确认密码">
        </div>
        <label class="control-label" id="rePwdLb"></label>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-7" id="rePwdMsg" style="color:red"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-7">
            <button type="button" class="btn btn-primary btn-block" id="submitBtn">注册</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    var submitStatus=false,pwdStatus=false;
    $(function(){
        $("#submitBtn").on("click",function () {
            submitForm();
        });
        $("#password").on("blur",function () {
            if ($("#password").val()!="") {
                pwdVerify();
            } else {
                $("#rePwdLb").html("");
                $("#rePwdMsg").html("");
                pwdStatus=false;
            }
        });
        $("#rePassword").on("blur",function () {
            if ($("#rePassword").val()!="") {
                pwdVerify();
            } else {
                $("#rePwdLb").html("");
                $("#rePwdMsg").html("");
                pwdStatus=false;
            }
        });
        $("#userId").on("blur",function () {
            if ($("#userId").val()!="") {
                userIdVerify();
            } else {
                $("#userIdLb").html("");
                submitStatus=false;
            }
        });
        $('body').keydown(function(e) {
            if (e.keyCode == 13) { // 按下回车注册
                submitForm();
            }
        });
    });
    function pwdVerify() {
        if ($("#password").val()==$("#rePassword").val()) {
            $("#rePwdLb").html("<span style=\"color:green\" class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
            $("#rePwdMsg").html("");
            pwdStatus=true;
        } else {
            $("#rePwdLb").html("<span style=\"color:red\" class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>");
            $("#rePwdMsg").html("两次密码不一致！");
            pwdStatus=false;
        }
    }
    function userIdVerify() {
        var userId = $("#userId").val();
        $.ajax({
            url:"${APP_PATH}/register/verify",
            data:"userId="+userId,
            type:"post",
            success:function (result) {
                if (result.code=="100") {
                    $("#userIdLb").html("<span style=\"color:green\" class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>");
                    submitStatus=true;
                } else {
                    $("#userIdLb").html("<span style=\"color:red\" class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>");
                    submitStatus=false;
                }
            }
        });
    }
    function submitForm() {
        if ($("#rePassword").val()!=""&&$("#password").val()!="") {
            pwdVerify();
        } else {
            $("#rePwdLb").html("");
            $("#rePwdMsg").html("");
            pwdStatus=false;
        }
        if ($("#userId").val()!="") {
            userIdVerify();
        } else {
            $("#userIdLb").html("");
            submitStatus=false;
        }
        if (submitStatus===true&&pwdStatus===true) {
            $("form").submit();
        }
    }
</script>
</body>
</html>