<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<C:if test="${empty requestScope.SearchPlaces&&empty requestScope.Places}">
    <C:redirect url="/placeServlet?method=getPlacelist&page=1&count=6"></C:redirect>
</C:if>
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

    <link rel="stylesheet" href="layui/css/layui.css" media="all">
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
                <%--<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span--%>
                        <%--class="mr-2"><a href="index.jsp">首页</a></span> <span>景点</span></p>--%>
                <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">目的地</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 sidebar order-md-last ftco-animate" id="rightmenu">
                <div class="sidebar-wrap ftco-animate">
                    <div class="fields">
                        <C:choose>
                            <C:when test="${empty requestScope.SearchPlaces}">
                                <div class="form-group">
                                    <form action="placeServlet?method=getPlacelist&page=${requestScope.pageBean.nowPage}&count=6&orderBy=price" method="post">
                                        <input type="submit" value="按价格从低到高排序" class="btn btn-primary py-3 px-5">
                                    </form>
                                </div>
                                <div class="form-group">
                                    <form action="placeServlet?method=getPlacelist&page=${requestScope.pageBean.nowPage}&count=6&orderBy=grade" method="post">
                                        <input type="submit" value="按星级从高到低排序" class="btn btn-primary py-3 px-5">
                                    </form>
                                </div>
                            </C:when>
                            <C:otherwise>
                                <div class="form-group">
                                    <form action="placeServlet?method=SearchPaging&page=${requestScope.SearchPageBean.nowPage}&count=6&orderBy=price" method="post">
                                        <input type="submit" value="按价格从低到高排序" class="btn btn-primary py-3 px-5">
                                    </form>
                                </div>
                                <div class="form-group">
                                    <form action="placeServlet?method=SearchPaging&page=${requestScope.SearchPageBean.nowPage}&count=6&orderBy=grade" method="post">
                                        <input type="submit" value="按星级从高到低排序" class="btn btn-primary py-3 px-5">
                                    </form>
                                </div>
                            </C:otherwise>
                        </C:choose>
                    </div>
                </div>
            </div><!-- END-->
            <div class="col-lg-9">
                <div class="row" id="allContent">
                    <C:choose>
                        <C:when test="${empty requestScope.SearchPlaces}">
                            <C:forEach items="${requestScope.Places}" var="c" varStatus="s">
                                <div class="col-sm col-md-6 col-lg-4 ftco-animate">
                                    <div class="destination">
                                        <a href="placeServlet?method=Placeinfo&id=${c.id}"
                                           class="img img-2 d-flex justify-content-center align-items-center"
                                           style="background-image: url(${c.image});background-size: 255px 300px">
                                            <div class="icon d-flex justify-content-center align-items-center">
                                                <span class="icon-link"></span>
                                            </div>
                                        </a>
                                        <div class="text p-3">
                                            <div class="d-flex">
                                                <div class="one">
                                                    <h3 style="height: 54px"><a href="#">${c.name}</a></h3>
                                                    <p class="rate">
                                                        <C:forEach var="i" begin="1" end="${c.grade}" step="1" varStatus="status">
                                                            <i class="icon-star"></i>
                                                        </C:forEach>
                                                        <C:if test="${c.grade lt 5}">
                                                            <C:forEach var="i" begin="${c.grade}" end="4" step="1" varStatus="status">
                                                                <i class="icon-star-o"></i>
                                                            </C:forEach>
                                                        </C:if>

                                                        <span>${c.grade}</span>
                                                    </p>
                                                </div>
                                                <div class="two">
                                                    <span class="price">¥${c.price}<br>
                                                        <small>/人起</small></span>
                                                </div>
                                            </div>
                                            <p style="height: 200px">${c.describe}</p>
                                            <p class="days"><span>${c.start_time}——${c.end_time} 共${c.time}游</span></p>
                                            <hr>
                                            <p class="bottom-area d-flex ">
                                                <span><i class="icon-map-o"></i>  ${c.from}——${c.to}</span>
                                                <span class="ml-auto"><a href="javascript:void(0)" class="order"
                                                                         name="${c.id}">加入购物车</a></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </C:forEach>
                        </C:when>
                        <C:otherwise>
                            <C:forEach items="${requestScope.SearchPlaces}" var="c" varStatus="s">
                                <div class="col-sm col-md-6 col-lg-4 ftco-animate">
                                    <div class="destination">


                                        <a href="placeServlet?method=Placeinfo&id=${c.id}"
                                           class="img img-2 d-flex justify-content-center align-items-center"
                                           style="background-image: url(${c.image});background-size: 255px 300px">
                                            <div class="icon d-flex justify-content-center align-items-center">
                                                <span class="icon-link"></span>
                                            </div>
                                        </a>
                                        <div class="text p-3">
                                            <div class="d-flex">
                                                <div class="one">
                                                    <h3 style="height: 54px"><a href="#">${c.name}</a></h3>
                                                    <p class="rate">
                                                        <C:forEach var="i" begin="1" end="${c.grade}" step="1" varStatus="status">
                                                            <i class="icon-star"></i>
                                                        </C:forEach>
                                                        <C:if test="${c.grade lt 5}">
                                                            <C:forEach var="i" begin="${c.grade}" end="4" step="1" varStatus="status">
                                                                <i class="icon-star-o"></i>
                                                            </C:forEach>
                                                        </C:if>
                                                        <span>${c.grade}</span>
                                                    </p>
                                                </div>
                                                <div class="two">
                                                    <span class="price">¥${c.price}<br>
                                                        <small>/人起</small></span>
                                                </div>
                                            </div>
                                            <p style="height: 200px">${c.describe}</p>
                                            <p class="days"><span>${c.start_time}——${c.end_time} 共${c.time}游</span></p>
                                            <hr>
                                            <p class="bottom-area d-flex ">
                                                <span><i class="icon-map-o"></i>  ${c.from}——${c.to}</span>
                                                <span class="ml-auto "><a href="javascript:void(0)" class="order"
                                                                          name="${c.id}">加入购物车</a></span>
                                            <div style="display: none">${c.id}</div>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </C:forEach>
                        </C:otherwise>
                    </C:choose>

                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <C:choose>
                                    <C:when test="${empty requestScope.SearchPlaces}">
                                        <li>
                                            <a href="placeServlet?method=getPlacelist&page=${requestScope.pageBean.previousPage}&count=6">&lt;</a>
                                        </li>

                                        <C:forEach var="i" begin="1" end="${requestScope.pageBean.allPages}" step="1"
                                                   varStatus="status">
                                            <li>
                                                <a href="placeServlet?method=getPlacelist&page=${status.index}&count=6">${status.index}</a>
                                            </li>
                                        </C:forEach>

                                        <li>
                                            <a href="placeServlet?method=getPlacelist&page=${requestScope.pageBean.nextPage}&count=6">&gt;</a>
                                        </li>
                                    </C:when>
                                    <C:otherwise>
                                        <li>
                                            <a href="placeServlet?method=SearchPaging&page=${requestScope.SearchPageBean.previousPage}&count=6">&lt;</a>
                                        </li>

                                        <C:forEach var="i" begin="1" end="${requestScope.SearchPageBean.allPages}"
                                                   step="1" varStatus="status">
                                            <li>
                                                <a href="placeServlet?method=SearchPaging&page=${status.index}&count=6">${status.index}</a>
                                            </li>
                                        </C:forEach>

                                        <li>
                                            <a href="placeServlet?method=SearchPaging&page=${requestScope.SearchPageBean.nextPage}&count=6">&gt;</a>
                                        </li>
                                    </C:otherwise>
                                </C:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </div> <!-- .col-md-8 -->
        </div>
    </div>
</section> <!-- .section -->


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
<script type="text/javascript">

    $(document).ready(function () {
        $(".order").click(function () {
            var id = $(this).attr("name");
            $.ajax({
                type: "get",
                url: "placeServlet?method=order&id=" + id,
                success: function (data) {
                    if (data = true) {
                        layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
                            //用显示框展示添加结果
                            layer.msg("添加成功，在购物车等亲哦～");
                        });
                    } else {
                        layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
                            //用显示框展示添加结果
                            layer.msg("添加失败");
                        });
                    }

                }
            });
        });

    });


</script>
</body>
</html>