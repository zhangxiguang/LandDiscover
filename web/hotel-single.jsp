<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  </head>
  <body>

  <jsp:include page="top.jsp"></jsp:include>
    <!-- END nav -->

    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Hotel</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels</h1>
          </div>
        </div>
      </div>
    </div>

		<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-9">
          	<div class="row">
				<%--这里是显示当前酒店的详情数据--%>
				<div class="col-md-12 ftco-animate">
					<div class="single-slider owl-carousel">
						<div class="item">
							<div class="hotel-img" style="background-image: url('${requestScope.hotelInfo.hotelimg}');"></div>
						</div>
						<div class="item">
							<div class="hotel-img" style="background-image: url(images/hotel-3.jpg);"></div>
						</div>
						<div class="item">
							<div class="hotel-img" style="background-image: url(images/hotel-4.jpg);"></div>
						</div>
					</div>
				</div>
				<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
					<span>ID: ${requestScope.hotelInfo.hotelid} &nbsp; </span><%--酒店id--%>
					<h2>${requestScope.hotelInfo.hotelname}  &nbsp;  &nbsp;  &nbsp;  &nbsp;  <span> ${requestScope.hotelInfo.hotelprice} $</span></h2><%--酒店名--%>
					<p>Area：${requestScope.hotelInfo.hotelsite} &nbsp;  &nbsp;  &nbsp;  &nbsp;</p>
					<p class="rate mb-5">
						<span class="loc"><a href="#"><i class="icon-map"></i> ${requestScope.hotelInfo.hotelintroduction}</a></span><%--酒店描述--%>
						<span class="star">
    							<i class="icon-star"></i>

                        </span>
						:&nbsp;${requestScope.hotelInfo.hotelrating}Rating
					</p>
					<%--introduct--%>
					<p>${requestScope.hotelInfo.hotelintroduction} </p>
					<div class="d-md-flex mt-5 mb-5">
						<ul>
							<li>The Big Oxmox advised her not to do so</li>
							<li>When she reached the first hills of the Italic Mountains</li>
							<li>She had a last view back on the skyline of her hometown </li>
							<li>Bookmarksgrove, the headline of Alphabet </li>
						</ul>
						<ul class="ml-md-5">
							<li>Question ran over her cheek, then she continued</li>
							<li>Pityful a rethoric question ran</li>
							<li>Mountains, she had a last view back on the skyline</li>
							<li>Headline of Alphabet Village and the subline</li>
						</ul>
					</div>
				</div>

          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
          			<h4 class="mb-4">Related Hotels</h4>
          			<div class="row">
						<C:forEach var="b" items="${requestScope.hotelbyprice}">
							<div class="col-md-4">
								<div class="destination">
									<a href="hotel-single.jsp" class="img img-2" style="background-image: url(${b.hotelimg});"></a>
									<div class="text p-3">
										<div class="d-flex">
											<div class="one">
												<h3><a href="hotel-single.jsp">${b.hotelname}</a></h3>
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
												<span class="price per-price">${b.hotelprice}<br><small>/night</small></span>
											</div>
										</div>
										<p>${b.hotelintroduction}</p>
										<hr>
										<p class="bottom-area d-flex">
											<span><i class="icon-map-o"></i> ${b.hotelsite}</span>
											<span class="ml-auto"><a href="#">Book Now</a></span>
										</p>
									</div>
								</div>
							</div>
						</C:forEach>
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
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
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

  </body>
</html>