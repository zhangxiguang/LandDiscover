<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ch">
<head>
	<meta charset="utf-8">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>登陆</title>
	<link rel="stylesheet" href="css/auth.css">
	<script type="text/javascript">
        $(document).ready(function() {
            $("img[src='CodeServlet']").click(function () {
                $(this).attr("src", "CodeServlet?sdfsf=" + Math.random());
            });

            $("#verfy").blur(function () {

                var code = $(this).val();

                $.get("/UserServlet?method=checkCode&code=" + code, function (data) {
                    if (data == 'false') {
                        alert("验证码错误");
                    }
                });

            })
        })
	</script>
    <style type="text/css">
        .check{
            color: red;
        }
    </style>
</head>

<body>
<form action="UserServlet?method=login" method="post" enctype="multipart/form-data">
	<div class="lowin">
		<div class="lowin-brand">
			<img src="images/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">
			<div class="lowin-box lowin-login">
				<div class="lowin-box-inner">

						<p>Sign in to continue</p>
						<div class="lowin-group">
							<label>Username <a href="#" class="login-back-link">Sign in?</a></label>
							<input type="username" autocomplete="username" name="username" class="lowin-input" onblur="check_userName()" id="name">
                            <br><span id="err_name" class="check"> </span>
						</div>
						<div class="lowin-group password-group">
							<label>Password </label>
							<input type="password" name="password" autocomplete="current-password" class="lowin-input">
						</div>
						<div class="lowin-group">
							<label>验证码</label>
							<input type="text" name="inputCode" autocomplete="inputCode" class="lowin-input" style="width: 160px"><img src="CodeServlet"/>
						</div>

						<C:choose>
							<C:when test="${empty cookie.username.value}">
								<input type="checkbox" name="rememberMe" value="true" />三天免登陆<br/>
							</C:when>
							<C:otherwise>
								<input type="checkbox" name="rememberMe" value="true"  checked="checked"/>三天免登陆<br/>
							</C:otherwise>
						</C:choose>

					<button class="lowin-btn">
						Sign In
					</button>

						<div class="text-foot">
							Don't have an account? <a href="register.jsp" class="register">Register</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer class="lowin-footer">
		</footer>
	</div>

	<%--<script src="js/auth.js"></script>--%>
	<%--<script>--%>
		<%--Auth.init({--%>
			<%--login_url: '#login',--%>
			<%--forgot_url: '#forgot'--%>
		<%--});--%>
	<%--</script>--%>
</body>
</html>
