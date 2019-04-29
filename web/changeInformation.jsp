<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>修改个人信息</title>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/lxs_index00.js"></script>
    <script src="js/min_com.js"></script>
    <link rel="stylesheet" href="css/auth.css" />
    <script src="js/changeInfor.js" type="text/javascript"></script>
    <style type="text/css">
        .check{
            color: #55C9E1;;
        }
    </style>
</head>

<body>
<form  action="UserServlet?method=changeInformation" method="post" enctype="multipart/form-data">
    <div class="lowin">
        <div class="lowin-brand">
            <img src="images/kodinger.jpg" id="adv" alt="logo" style="border-radius: 50%;">
        </div>
        <div class="lowin-wrapper">

            <div class="lowin-box lowin-register">
                <div class="lowin-box-inner">

                    <p>Let's create your account</p>

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
                        <input type="file" name="image" id="image" onchange="showImage(this)" autocomplete="image" class="lowin-input">
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

                    <button  type="button" class="lowin-btn" id="send">
                        确认修改
                    </button>
                    <div class="text-foot">
                        Do you want to change the password?  <a href="changePassword.jsp" class="login-link">Change Password?</a>
                    </div>
                    <div class="text-foot">
                        Do you want to return the page?<a href="profile.jsp" class="login-link">返回</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</form>
<%--<script src="js/auth.js"></script>--%>

</body>
</html>