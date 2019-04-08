<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zxg
  Date: 2019/3/18
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ch">
<head>
    <title>汽车租赁</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="layui/layui.js" charset="utf-8"></script>






</head>
<body>
<%--<jsp:include page="top.jsp"></jsp:include>--%>
<%--<!-- 网页内容-->--%>


<%--<jsp:include page="buttom.jsp"></jsp:include>--%>


<c:choose>

    <c:when test="${sessionScope.addScenerySuccess !=null}">

        <script>
            layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

                //用显示框展示添加结果
                layer.msg("${sessionScope.addScenerySuccess}");

                //移除session对象值,避免刷新再次弹窗
                <c:remove var="addScenerySuccess" scope="session" />
            });

        </script>

    </c:when>

    <c:when test="${sessionScope.addSceneryFail_noLogin !=null}">
        <script>
            layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

                //用显示框展示添加结果
                layer.msg("${sessionScope.addSceneryFail_noLogin}");

                //移除session对象值,避免刷新再次弹窗
                <c:remove var="addSceneryFail_noLogin" scope="session" />
            });

        </script>

    </c:when>

    <c:when test="${sessionScope.addSceneryFail !=null}">
        <script>
            layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

                //用显示框展示添加结果
                layer.msg("${sessionScope.addSceneryFail}");

                //移除session对象值,避免刷新再次弹窗
                <c:remove var="addSceneryFail" scope="session" />
            });

        </script>

    </c:when>

    <%--<c:otherwise>--%>
        <%--<script>--%>
            <%--layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句--%>
                <%--var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句--%>
                <%--layer.msg("啥也没有");--%>
            <%--});--%>

        <%--</script>--%>
    <%--</c:otherwise>--%>


</c:choose>


<form action="orderServlet?method=addCar" method="post">
    用户名:<input type="text" name="Car"><br/>
    <input type="submit" value="提交">
</form>









<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>


<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>

<script src="js/google-map.js"></script>
<script src="js/main.js"></script>


<!-- layui代码块 -->



</body>
</html>

