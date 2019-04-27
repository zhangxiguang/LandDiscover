<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<C:if test="${empty sessionScope.hotelb}">
	<C:redirect url="/hotelServlet?method=listTopHotel&page=1&count=6"></C:redirect>
</C:if>
<!DOCTYPE html>
<html lang="ch">
<head>
	<title>LandDiscover-探索属于你的新大陆</title>
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
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
			<div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
				<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">首页</a></span> <span>酒店</span></p>
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">酒店住宿</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 sidebar order-md-last ftco-animate">
				<div class="sidebar-wrap ftco-animate">
					<h3 class="heading mb-4">Find City</h3>
					<%--from表单--%>
					<form method="post" action="hotelServlet?method=search">
						<div class="fields">
							<div class="form-group">
								<%--搜索框1--%>
								<input type="text" name="hotelname" id="hotelname" class="form-control" placeholder="Destination, City">
							</div>
							<div class="form-group">
								<div class="select-wrap one-third">
									<div class="icon"><span class="ion-ios-arrow-down"></span></div>
									<%--搜索框2--%>
									<input type="text" name="hotelsite" id="hotelsite" class="form-control" placeholder="Keyword search">
								</div>
							</div>
							<div class="form-group">
								<%--搜索框3--%>
								<input type="text" id="hotedatefrom" name="hoteldatefrom" class="form-control checkin_date" placeholder="Date from">
							</div>
							<div class="form-group">
								<%--搜索框4--%>
								<input type="text" id="hoteldateto" name="hoteldateto" class="form-control checkout_date" placeholder="Date to">
							</div>
							<div class="form-group">
								<div class="range-slider">
		              		<span>

										    <input type="number" value="25000" min="0" max="120000"/>	-
										    <input type="number" value="50000" min="0" max="120000"/>
										  </span>
									<input value="1000" min="0" max="120000" step="500" type="range"/>
									<input value="50000" min="0" max="120000" step="500" type="range"/>
									</svg>
								</div>
							</div>
							<div class="form-group">
								<input type="submit"  value="Search" id="search" name="search" class="btn btn-primary py-3 px-5"/>
								<%--<script>--%>
									<%--$("body").delegate('#search','click',function () {--%>
                                        <%--alert("test11111");--%>
                                        <%--var hotelname=$("#hotelname").val();--%>
                                        <%--var hotelsite=$("#hotelsite:checked").val();--%>
                                        <%--var hotedatefrom=$("#hotedatefrom").val();--%>
                                        <%--var hoteldateto=$("#hoteldateto").val();--%>
                                        <%--console.log(hotelname,hotelsite,hotedatefrom,hoteldateto);--%>
                                        <%--$.get("hotelServlet?method=search&hotelname="+hotelname+"&hotelsite="+hotelsite+"&hotedatefrom="+hotedatefrom+"&hoteldateto="+hoteldateto,function () {--%>
                                            <%--alert("test2222222");--%>
                                            <%--window.location.reload();--%>
                                        <%--})--%>
                                    <%--})--%>

								<%--</script>--%>
							</div>
						</div>
					</form>
					<%--from表单--%>
				</div>
				<div class="sidebar-wrap ftco-animate">
					<h3 class="heading mb-4">Star Rating</h3>
					<form method="post" class="star-rating">
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">
								<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">
								<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">
								<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">
								<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							</label>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">
								<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							</label>
						</div>
					</form>
				</div>
			</div><!-- END-->
			<div class="col-lg-9">
				<div class="row">

							<%--遍历--%>
							<C:forEach var="b" items="${sessionScope.hotelb}">
								<div class="col-sm col-md-6 col-lg-4 ftco-animate">
									<div class="destination">
										<a href="hotelServlet?method=detail&hotelid=${b.hotelid}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${b.hotelimg});">
											<div class="icon d-flex justify-content-center align-items-center">
												<span href="" class="icon-link"></span>
											</div>
										</a>
										<div class="text p-3">
											<div class="d-flex">
												<div class="one">
													<h3><a href="#">${b.hotelname}</a></h3>
													<p class="rate">
														<i class="icon-star"></i>
														<i class="icon-star"></i>
														<i class="icon-star"></i>
														<i class="icon-star"></i>
														<i class="icon-star-o"></i>
														<span>${b.hotelrating} Rating</span>
													</p>
												</div>
												<div class="two">
													<span class="price">${b.hotelprice}$</span>
												</div>
											</div>
											<p>${b.hotelintroduction}</p>
											<p class="days"><span>2 days 3 nights</span></p>
											<hr>
											<p class="bottom-area d-flex">
												<span><i class="icon-map-o"></i> ${b.hotelsite}</span>

												<span class="ml-auto "><a href="javascript:void(0)" class="order"
																		  name="${b.hotelid}">Booking</a></span>

											</p>
										</div>
									</div>
								</div>
							</C:forEach>
							<%--遍历--%>
				</div>
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
										<li><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.previousPage}&count=6">&lt;</a></li>

										<li class="active"><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.onePage}&count=6">${requestScope.pageBean.onePage}</a></li>
										<li><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.twoPage}&count=6">${requestScope.pageBean.twoPage}</a></li>
										<li><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.threePage}&count=6">${requestScope.pageBean.threePage}</a></li>
										<li><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.fourPage}&count=6">${requestScope.pageBean.fourPage}</a></li>
										<li><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.fivePage}&count=6">${requestScope.pageBean.fivePage}</a></li>

										<li><a href="hotelServlet?method=listTopHotel&page=${requestScope.pageBean.nextPage}&count=6">&gt;</a></li>
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
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

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
                url: "hotelServlet?method=order&id=" + id,
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