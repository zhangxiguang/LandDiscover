<%--
  Created by IntelliJ IDEA.
  User: TengSir
  Date: 2019/4/8
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>个人信息</title>
    <link rel="stylesheet" href="css/auth.css">
</head>
<body>

<form action="changeInformation.jsp" method="post" enctype="multipart/form-data">
    <div class="lowin">
        <div class="lowin-brand">
            <img src='${sessionScope.user.image}' id="adv" alt="logo" style="border-radius: 50%;">
        </div>
        <div class="lowin-wrapper">

            <div class="lowin-box lowin-register">
                <div class="lowin-box-inner">

                    <p>我的信息</p>
                    <div class="lowin-group">
                        <label>Username</label>
                        <input type="text" name="userName" id="name" class="lowin-input" value="${sessionScope.user.username}"  readonly="true">
                    </div>
                    <div class="lowin-group">
                        <label>Nickname</label>
                        <input type="text" name="nickName" id="nick" autocomplete="nickName" class="lowin-input" value="${sessionScope.user.nickname}" readonly="true">
                    </div>
                    <div class="lowin-group">
                        <label>phone</label>
                        <input type="phone"  name="phone" id="phone" autocomplete="phone" class="lowin-input" value="${sessionScope.user.phone}" readonly="true">
                    </div>
                    <div class="lowin-group">
                        <label>Sex</label>
                        <input type="text"  name="sex" id="sex" autocomplete="sex" class="lowin-input"  value="${sessionScope.user.sex}" readonly="true">
                    </div>
                    <div class="lowin-group">
                        <label>Address</label>
                        <input type="text" autocomplete="address" name="address" id="address" class="lowin-input" value="${sessionScope.user.address}" readonly="true">
                    </div>

                    <%--<input type="button" value="Sign Up" onclick="checkUser()" class="lowin-btn">--%>

                    <button class="lowin-btn">
                        编辑资料
                    </button>

                    <div class="text-foot">
                        Do you want to return the page?<a href="../index.jsp" class="login-link">返回</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</form>
<%--welcome:${sessionScope.user.nickname}<br/>--%>

<%--${sessionScope.user.username}<br/>--%>
<%--${sessionScope.user.password}<br/>--%>
<%--${sessionScope.user.sex}<br/>--%>
<%--${sessionScope.user.phone}<br/>--%>
<%--${sessionScope.user.address}<br/>--%>
<%--<img  src="${sessionScope.user.image}"/>--%>

</body>
</html>
