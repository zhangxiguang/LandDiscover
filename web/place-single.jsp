<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <title>Adventure - Free Bootstrap 4 Template by Colorlib</title>
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

<jsp:include page="top.jsp"></jsp:include>
<!-- END nav -->

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
             data-scrollax-parent="true">
            <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Place</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-md-5 ftco-animate">
                        <div class="single-slider owl-carousel">
                            <div class="item">
                                <div class="hotel-img"
                                     style="background-image: url(${requestScope.placeInfo.image});"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 hotel-single mt-4 mb-5 ftco-animate">

                        <h2>${requestScope.placeInfo.name}</h2>
                        <span style="color: red">¥${requestScope.placeInfo.price}
                            <small>/人起</small></span>
                        <p class="rate mb-5">
                            <span class="loc"><a href="#"><i
                                    class="icon-map"></i> ${requestScope.placeInfo.from}——${requestScope.placeInfo.to}</a></span>
                            <span class="star">
    							 <C:forEach var="i" begin="1" end="${requestScope.placeInfo.grade}" step="1" varStatus="status">
                                     <i class="icon-star"></i>
                                 </C:forEach>
                                <C:if test="${requestScope.placeInfo.grade lt 5}">
                                    <C:forEach var="i" begin="${requestScope.placeInfo.grade}" end="4" step="1" varStatus="status">
                                        <i class="icon-star-o"></i>
                                    </C:forEach>
                                </C:if>

                                ${requestScope.placeInfo.grade}</span>
                        </p>
                        <p>${requestScope.placeInfo.start_time}——${requestScope.placeInfo.end_time}
                            共${requestScope.placeInfo.time}游</p>
                        <p>${requestScope.placeInfo.describe}</p>
                        <div class="d-md-flex mt-5 mb-5">
                            <ul>
                                <li>服务保障:</li>
                                <li>供应商:</li>
                            </ul>
                            <ul class="ml-md-5">
                                <li>成团保障</li>
                                <li>自营</li>
                            </ul>
                        </div>
                        <div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <%--<form action="#">--%>
                                    <input type="button" value="加入购物车" class="btn btn-primary py-3" id="order">
                                    <%--</form>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div> <!-- .col-md-8 -->
    </div>
    </div>
</section> <!-- .section -->
<section class="ftco-section-parallax">
    <div class="parallax-img d-flex align-items-center">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                    <h2>Subcribe to our Newsletter</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                        live the blind texts. Separated they live in</p>
                    <div class="row d-flex justify-content-center mt-5">
                        <div class="col-md-8">
                            <form action="#" class="subscribe-form">
                                <div class="form-group d-flex">
                                    <input type="text" class="form-control" placeholder="Enter email address">
                                    <input type="submit" value="Subscribe" class="submit px-3">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="buttom.jsp"></jsp:include>


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

<script>
    // $(document).ready(function () {
        $("#order").click(function () {
            $.ajax({
                type: "get",
                url: "placeServlet?method=order&id=${requestScope.placeInfo.id}",
                success: function (data) {
                    if(data=true){
                        layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
                            //用显示框展示添加结果
                            layer.msg("添加成功，在购物车等亲哦～");
                        });
                    }else {
                        layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
                            //用显示框展示添加结果
                            layer.msg("添加失败");
                        });
                    }

                }
            });
        });

    // })
</script>


</body>
</html>