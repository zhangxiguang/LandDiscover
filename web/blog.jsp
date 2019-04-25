<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<<html lang="ch">
  <head>
    <title>文章</title>
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

      <style>
          #btn{
              padding: 5px 10px;
              background: #00b0f0;
              color: #FFF;
              border: none;
              border-radius: 5px;
          }
          label{
              position: relative;
          }
          #fileinp{
              position: absolute;
              left: 0;
              top: 0;
              opacity: 0;
          }
          #btn{
              margin-right: 5px;
          }
          #text{
              color: red;
          }
      </style>
  </head>
  <body>
    
	  <jsp:include page="top.jsp"></jsp:include>
    <!-- END nav -->

      <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
            <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
              <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="login.jsp">首页</a></span> <span>博客</span></p>
              <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span id="writeBlog"><b  href="javascript:void(0)">写文章</b></span> &amp; <span id="readBlog"><a  href="javascript:void(0)">读文章</a></span> </h1>
            </div>
          </div>
        </div>
      </div>

      <section class="ftco-section bg-light">
        <div class="container">
          <div id="show" class="row d-flex" >

            <%--<div class="col-md-4 d-flex ftco-animate">--%>
              <%--<div class="blog-entry align-self-stretch">--%>
                <%--<a href="blog-single.html" class="block-20" style="background-image: url('images/image_1.jpg');">--%>
                <%--</a>--%>
                <%--<div class="text">--%>
                  <%--<span class="tag">建议, Travel</span>--%>
                  <%--<h3 class="heading mt-3"><a href="#">8 Best homestay in Philippines that you don't miss out</a></h3>--%>
                  <%--<div class="meta mb-3">--%>
                    <%--<div><a href="#">October 3, 2018</a></div>--%>
                    <%--<div><a href="#">Admin</a></div>--%>
                    <%--<div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>--%>
                  <%--</div>--%>
                <%--</div>--%>
              <%--</div>--%>
            <%--</div>--%>



          </div>

          <div class="row mt-5">
            <div class="col text-center">
              <div class="block-27">

                <ul id="choosepage">
                </ul>

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
  <script src="js/scrollax.min.js"></script>
  <script src="js/blog.js"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>