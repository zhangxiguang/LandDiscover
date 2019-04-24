<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.hbuas.LandDiscover.control.commentServlet " %>
<%@ page import="edu.hbuas.LandDiscover.model.javaBean.Blog" %>
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
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/blog-single.js"></script>
  </head>
  <body>
    
	 <jsp:include page="top.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">首页 ·</a></span> <span>博客</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">--文章--</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
            <h2 class="mb-3"><%= ((Blog)request.getSession().getAttribute("blog")).getBlogtitle()%></h2>
            <p> <%= ((Blog)request.getSession().getAttribute("blog")).getBlogtext()%></p>

            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">

                <a href="blogServlet?method=getBlogByTag&tag=<%= ((Blog)request.getSession().getAttribute("blog")).getBlogtag() %>"  class="tag-cloud-link"><%= ((Blog)request.getSession().getAttribute("blog")).getBlogtag()%></a>
              </div>
            </div>




            <div class="pt-5 mt-5">
              <h3 id="allcomment" class="mb-5"><a>共0条评论</a></h3>
              <ul class="comment-list" id="comment">

              </ul>

              <a id="moreComment" href="javascript:void(0);">查看更多评论</a>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">发表评论</h3>
                <form action="commentServlet?method=addComment"  method="post"  class="p-5 bg-light">

                  <div class="form-group">
                    <label for="message">正文</label>
                    <textarea name="text" id="message" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="text" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>

          </div> <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="blogServlet?method=getBlogByKeywords" method="post" class="search-form" accept-charset="UTF-8">
                <div class="form-group">
                  <span class="icon icon-search"></span>
                  <input type="text" class="form-control" name="keywords" placeholder="键入关键字并按回车键">
                </div>
              </form>
            </div>


            <div id="lately" class="sidebar-box ftco-animate">
              <h3>近期文章</h3>

            </div>

            <div class="sidebar-box ftco-animate">
              <h3>标签</h3>
              <div id="blogtag" class="tagcloud">
              </div>
            </div>

          </div>

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

  <script src="js/scrollax.min.js"></script>

  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>