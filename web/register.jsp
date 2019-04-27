<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>注册</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/auth.css" />
    <script src="js/register.js" type="text/javascript"></script>
    <style type="text/css">
        .check{
            color:#55C9E1;
        }
    </style>
</head>

<body>
<form action="UserServlet?method=register" method="post" enctype="multipart/form-data">
    <div class="lowin">
        <div class="lowin-brand">
            <img src="images/kodinger.jpg" id="adv" alt="logo" style="border-radius: 50%;">
        </div>
        <div class="lowin-wrapper">

            <div class="lowin-box lowin-register">
                <div class="lowin-box-inner">

                    <p>Let's create your account</p>
                    <div class="lowin-group">
                        <label>Username</label>
                        <input type="text" name="userName" id="name" class="lowin-input" onblur="javascript:check_userName();" placeholder="由英文字母和数字组成的4-16位字符，以字母开头">
                        <br><span id="err_name" class="check"> </span>
                    </div>
                    <div class="lowin-group">
                        <label>Password</label>
                        <input type="password" name="pwd" id="pwd" autocomplete="current-password" onblur="check_passWord()" class="lowin-input" placeholder="由英文字母和数字组成的4-10位字符">
                        <br><span id="err_pwd" class="check"> </span>
                    </div>
                    <div class="lowin-group">
                        <label>Nickname</label>
                        <input type="text" name="nickName" id="nick" autocomplete="nickName" class="lowin-input" onblur="check_nickName()" placeholder="由2-6个汉字组成">
                        <br><span id="err_nick" class="check"> </span>
                    </div>
                    <div class="lowin-group">
                        <label>phone</label>
                        <input type="phone"  name="phone" id="phone" autocomplete="phone" class="lowin-input" onblur="check_phone()" placeholder="手机号由11位数字组成，且以13,15,18开头">
                        <br><span id="err_phone" class="check"> </span>
                    </div>
                    <div class="lowin-group">
                        <label>image</label>
                        <input type="file" name="image" id="image" onchange="showImage(this) "   autocomplete="image" class="lowin-input">
                    </div>
                    <div class="lowin-group">
                        <label>Sex</label>
                        <input type="radio" value="0" name="sex">男<input type="radio" value="1" name="sex">女
                    </div>
                    <div class="lowin-group">
                        <label>Address</label>
                        <input type="text" autocomplete="address" name="address" id="address" class="lowin-input"  onblur="check_address()" placeholder="由2-6个汉字组成">
                        <br><span id="err_add" class="check"> </span>
                    </div>

                    <%--<input type="button" value="Sign Up" onclick="checkUser()" class="lowin-btn">--%>

                    <button  type="button" class="lowin-btn" id="send">
                        Sign Up
                    </button>

                    <div class="text-foot">
                        Already have an account? <a href="login.jsp" class="login-link">Login</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</form>
<%--<script src="js/auth.js"></script>--%>

</body>
</html>