<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="js/blog-single.js">
    </script>
    <script>
        $(document).ready(function () {
            $("#fileinp").change(function () {
                var $file = $(this)
                var objUrl = $file[0].files[0];
                var windowURL = window.URL||window.webkitURL
                var dataURL
                dataURL = windowURL.createObjectURL(objUrl)
                $("#showImg").attr("src",dataURL)
                $("#showImg").css({"width":100,"height":100})
            })
        })
    </script>
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
<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-8 ftco-animate">
                <div class="pt-5 mt-5">
                    <div class="comment-form-wrap pt-5">



                    </div>
                </div>

            </div> <!-- .col-md-8 -->
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