<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>修改密码</title>
    <link rel="stylesheet" href="css/auth.css">
    <script src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/lxs_index00.js"></script>
    <script src="js/min_com.js"></script>
    <script src="js/order_xianlu.js"></script>
    <script>
        $(document).ready(function () {
            $("body").on('click',"#send",function () {
                console.log($("#oldpwd").text()+"---"+$("#password1").val())
                if($("#oldpwd").val()!="" &&$("#password1").val()!=""&&$("#password2").val()!=""){
                   if($("#password1").val()==$("#password2").val()){
                       if(check_passWord()==true){
                           $.get({
                               url:"UserServlet?method=changePassword",
                               data:{
                                   oldpwd:$("#oldpwd").val(),
                                   password1:$("#password1").val()
                               },
                               success:function (data) {
                                   alert(data)
                                   if (data=="true"){
                                       window.location.href = "login.jsp";

                                   } else {
                                       alert("修改失败！");
                                   }
                               }
                           })
                       }else {
                           alert("长度不够");
                       }

                   }else {
                       alert("两次密码输入的不一致");
                   }
                }else {
                    alert("不能为空")
                }
            })
        })

        //验证密码
        function check_passWord() {
            var passWord = document.getElementById("password1").value;
            var regPwd = /^(\w){4,20}$/;
            if (passWord == "" || passWord.trim() == "") {
                document.getElementById("err_pwd").innerHTML = "请输入密码";
                return false;
            } else if (!regPwd.test(passWord)) {
                document.getElementById("err_pwd").innerHTML = "由4-20个字母、数字、下划线组成";
                return false;
            } else {
                document.getElementById("err_pwd").innerHTML = "ok!!!";
                return true;
            }
        }
    </script>
    <style type="text/css">
        .check{
            color: #55C9E1;
        }
    </style>
</head>

<body>
<form  action="changeInformation.jsp" method="post" >
    <div class="lowin">
        <div class="lowin-brand">
            <img src='${sessionScope.user.image}' id="adv" alt="logo" style="border-radius: 50%;">
        </div>
        <div class="lowin-wrapper">
            <div class="lowin-box lowin-login">
                <div class="lowin-box-inner">

                    <p>Sign in to continue</p>
                    <div class="lowin-group" password-group>
                        <label>您的用户名为</label>
                        <input type="username" name="username" autocomplete="current-password" class="lowin-input" value="${sessionScope.user.username}"  readonly="true">
                    </div>
                    <div class="lowin-group password-group">
                        <label>请输入旧密码</label>
                        <input type="password" name="oldpwd" autocomplete="current-password" class="lowin-input" id="oldpwd">
                    </div>
                    <div class="lowin-group password-group">
                        <label>请输入新密码</label>
                        <input type="password" name="password1" id="password1" autocomplete="current-password" onblur="check_passWord()" class="lowin-input" placeholder="由英文字母和数字组成的4-10位字符">
                        <br><span id="err_pwd" class="check"> </span>
                    </div>
                    <div class="lowin-group password-group">
                        <label>请确认新密码</label>
                        <input type="password" name="password2" autocomplete="current-password" class="lowin-input" id="password2" >
                    </div>
                    <button  id="send" type="button" class="lowin-btn">
                        提交修改
                    </button>
                    <div class="text-foot">
                        Do you want to return the page?<a href="changeInformation.jsp" class="login-link">返回</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%--<script src="js/auth.js"></script>--%>
<%--<script>--%>
<%--Auth.init({--%>
<%--login_url: '#login',--%>
<%--forgot_url: '#forgot'--%>
<%--});--%>
<%--</script>--%>
</body>
</html>