<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html  lang="ch">
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
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
             data-scrollax-parent="true">
            <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left"
                 data-scrollax=" properties: { translateY: '70%' }">
                <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Discover <br>A new
                    Place</h1>
                <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat, shop,
                    or visit from local experts</p>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section justify-content-end ftco-search">
    <div class="container-wrap ml-auto">
        <div class="row no-gutters">
            <div class="col-md-12 nav-link-wrap">
                <div class="nav nav-pills justify-content-center text-center" id="v-pills-tab" role="tablist"
                     aria-orientation="vertical">
                    <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab"
                       aria-controls="v-pills-1" aria-selected="true">地点</a>

                    <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab"
                       aria-controls="v-pills-2" aria-selected="false">宾馆</a>

                    <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab"
                       aria-controls="v-pills-3" aria-selected="false">汽车租赁</a>
                </div>
            </div>
            <div class="col-md-12 tab-wrap">

                <div class="tab-content p-4 px-5" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                         aria-labelledby="v-pills-nextgen-tab">
                        <form action="placeServlet?method=search&page=1&count=6" method="post" class="search-destination">
                            <div class="row">
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="from">出发地</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-my_location"></span></div>
                                            <input type="text" class="form-control" placeholder="From" id="from" name="from">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="to">目的地</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                            <input type="text" class="form-control" placeholder="Where" id="to" name="to">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="start_time">开始</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                            <input type="text" class="form-control checkin_date" placeholder="Check In" id="start_time" name="start_time">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="end_time">结束</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                            <input type="text" class="form-control checkout_date"
                                                   placeholder="Check Out" id="end_time" name="end_time">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="time">旅行时常</label>
                                        <div class="form-field">
                                            <div class="select-wrap">
                                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                <select  id="time" class="form-control" name="time">
                                                    <option>1日</option>
                                                    <option>2日</option>
                                                    <option>3日</option>
                                                    <option>4日</option>
                                                    <option>5日</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-self-end">
                                    <div class="form-group">
                                        <div class="form-field">
                                            <input type="submit" value="点击搜索" class="form-control btn btn-primary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                        <form action="hotelServlet?method=search" method="post">
                            <div class="row">
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="#">酒店名</label>
                                        <div class="form-field">
                                            <input type="text" class="form-control" name="hotelname" id="hotelname"  placeholder="From">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="#">所在地</label>
                                        <div class="form-field">
                                            <input type="text" name="hotelsite" id="hotelsite" class="form-control" placeholder="Where">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="#">开始</label>
                                        <div class="form-field">
                                            <input type="text" name="hoteldatefrom" id="hoteldatefrom" class="form-control checkin_date" placeholder="Check In">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="#">结束</label>
                                        <div class="form-field">
                                            <input type="text" name="hoteldateto" id="hoteldateto" class="form-control checkout_date"
                                                   placeholder="Check Out">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-self-end">
                                    <div class="form-group">
                                        <div class="form-field">
                                            <input type="submit" value="点击搜索" class="form-control btn btn-primary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-effect-tab">
                        <form action="carServlet?method=search&page=1&count=6" method="post" class="search-destination">
                            <div class="row">
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="carname">CarName</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                            <input type="text" class="form-control" placeholder="CarName" id="carname" name="carname">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="">开始</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                            <input type="text" class="form-control checkin_date" placeholder="Check In">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-items-end">
                                    <div class="form-group">
                                        <label for="">结束</label>
                                        <div class="form-field">
                                            <div class="icon"><span class="icon-map-marker"></span></div>
                                            <input type="text" class="form-control checkout_date"
                                                   placeholder="Check Out">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md align-self-end">
                                    <div class="form-group">
                                        <div class="form-field">
                                            <input type="submit" value="点击搜索" class="form-control btn btn-primary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2 class="mb-4">看看我们最新的度假计划</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <a href="#" class="destination-entry img" style="background-image: url(images/destination-1.jpg);">
                    <div class="text text-center">
                        <h3>海滨度假</h3>
                    </div>
                </a>
            </div>
            <div class="col-md-4 ftco-animate">
                <a href="#" class="destination-entry img" style="background-image: url(images/destination-2-1.jpg);">
                    <div class="text text-center">
                        <h3>组团旅行</h3>
                    </div>
                </a>
            </div>
            <div class="col-md-4 ftco-animate">
                <a href="#" class="destination-entry img" style="background-image: url(images/destination-3.jpg);">
                    <div class="text text-center">
                        <h3>城市优惠</h3>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<section class="ftco-about d-md-flex">
    <div class="one-half img" style="background-image: url(images/about.jpg);"></div>
    <div class="one-half ftco-animate">
        <div class="heading-section ftco-animate ">
            <h2 class="mb-4">The Best Travel Agency</h2>
        </div>
        <div>
            <p>
                在路上她遇到了一本。抄本警告小盲文，它的来源将被重写一千遍，所有从它的起源留下的东西将是“和”这个词，小盲文应该转身回到它自己的安全的国家。但那份稿子上说的任何话都无法说服她，所以没过多久，几个阴险的文案伏击了她，让她喝得酩酊大醉，获得假释，把她拖进了他们的代理机构。</p>
        </div>
    </div>
</section>

<section class="ftco-section services-section bg-light">
    <div class="container">
        <div class="row d-flex">
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-yatch"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Special Activities</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-around"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Travel Arrangements</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-compass"></span></div>
                    <div wclass="media-body">
                        <h3 class="heading mb-3">Private Guide</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-map-of-roads"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Location Manager</h3>
                        <p>A small river named Duden flows by their place and supplies.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2 class="mb-4">最受欢迎的目的地</h2>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/destination-1.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">Paris, Italy</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price">$200</span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <p class="days"><span>2 days 3 nights</span></p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Discover</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination d-md-flex flex-column-reverse">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/destination-2.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">Paris, Italy</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price">$200</span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <p class="days"><span>2 days 3 nights</span></p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Discover</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/destination-3.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">Paris, Italy</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price">$200</span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <p class="days"><span>2 days 3 nights</span></p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Discover</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination d-md-flex flex-column-reverse">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/destination-4.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">Paris, Italy</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price">$200</span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <p class="days"><span>2 days 3 nights</span></p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Discover</a></span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/">网页模板</a></div>
<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="100000">0</strong>
                                <span>已出行的游客</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="40000">0</strong>
                                <span>已发现的目的地</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="87000">0</strong>
                                <span>住宿</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <strong class="number" data-number="56400">0</strong>
                                <span>餐厅</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2 class="mb-4"><strong>最受欢迎的</strong> 旅店</h2>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/hotel-1.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">New Orleans, Hotel</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price per-price">$40<br><small>/night</small></span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> Miami, Fl</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination d-md-flex flex-column-reverse">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/hotel-2.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">New Orleans, Hotel</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price per-price">$40<br><small>/night</small></span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> Miami, Fl</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/hotel-3.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">New Orleans, Hotel</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price per-price">$40<br><small>/night</small></span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> Miami, Fl</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination d-md-flex flex-column-reverse">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/hotel-4.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">New Orleans, Hotel</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price per-price">$40<br><small>/night</small></span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> Miami, Fl</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm col-md-6 col-lg ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/hotel-5.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <div class="d-flex">
                            <div class="one">
                                <h3><a href="#">New Orleans, Hotel</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                            </div>
                            <div class="two">
                                <span class="price per-price">$40<br><small>/night</small></span>
                            </div>
                        </div>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> Miami, Fl</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section testimony-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                <h2 class="mb-4">来自客户的好评</h2>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live
                    the blind texts. Separated they live in</p>
            </div>
        </div>
        <div class="row ftco-animate">
            <div class="col-md-12">
                <div class="carousel-testimony owl-carousel ftco-owl">
                    <div class="item">
                        <div class="testimony-wrap p-4 pb-5">
                            <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia
                                    and Consonantia, there live the blind texts.</p>
                                <p class="name">Mark Web</p>
                                <span class="position">Marketing Manager</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap p-4 pb-5">
                            <div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia
                                    and Consonantia, there live the blind texts.</p>
                                <p class="name">Mark Web</p>
                                <span class="position">Interface Designer</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap p-4 pb-5">
                            <div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia
                                    and Consonantia, there live the blind texts.</p>
                                <p class="name">Mark Web</p>
                                <span class="position">UI Designer</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap p-4 pb-5">
                            <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia
                                    and Consonantia, there live the blind texts.</p>
                                <p class="name">Mark Web</p>
                                <span class="position">Web Developer</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap p-4 pb-5">
                            <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia
                                    and Consonantia, there live the blind texts.</p>
                                <p class="name">Mark Web</p>
                                <span class="position">System Analyst</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2 class="mb-4">推荐的餐厅</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/restaurant-1.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <h3><a href="#">Luxury Restaurant</a></h3>
                        <p class="rate">
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star-o"></i>
                            <span>8 Rating</span>
                        </p>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Discover</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="destination d-md-flex flex-column-reverse">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/restaurant-2.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <h3><a href="#">Luxury Restaurant</a></h3>
                        <p class="rate">
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star-o"></i>
                            <span>8 Rating</span>
                        </p>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="destination">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/restaurant-3.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <h3><a href="#">Luxury Restaurant</a></h3>
                        <p class="rate">
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star-o"></i>
                            <span>8 Rating</span>
                        </p>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="destination d-md-flex flex-column-reverse">
                    <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                       style="background-image: url(images/restaurant-4.jpg);">
                        <div class="icon d-flex justify-content-center align-items-center">
                            <span class="icon-link"></span>
                        </div>
                    </a>
                    <div class="text p-3">
                        <h3><a href="#">Luxury Restaurant</a></h3>
                        <p class="rate">
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star-o"></i>
                            <span>8 Rating</span>
                        </p>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                            <span><i class="icon-map-o"></i> San Franciso, CA</span>
                            <span class="ml-auto"><a href="#">Book Now</a></span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2><strong>Tips</strong> &amp; Articles</h2>
            </div>
        </div>
        <div class="row d-flex">
            <div class="col-md-4 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.jsp" class="block-20" style="background-image: url('images/image_1.jpg');">
                    </a>
                    <div class="text">
                        <span class="tag">旅行技巧</span>
                        <h3 class="heading mt-3"><a href="#">8 Best homestay in Philippines that you don't miss out</a>
                        </h3>
                        <div class="meta mb-3">
                            <div><a href="#">October 3, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.jsp" class="block-20" style="background-image: url('images/image_2.jpg');">
                    </a>
                    <div class="text">
                        <span class="tag">Culture</span>
                        <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                            blind texts</a></h3>
                        <div class="meta mb-3">
                            <div><a href="#">October 3, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex ftco-animate">
                <div class="blog-entry align-self-stretch">
                    <a href="blog-single.jsp" class="block-20" style="background-image: url('images/image_3.jpg');">
                    </a>
                    <div class="text">
                        <span class="tag">Tips, Travel</span>
                        <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                            blind texts</a></h3>
                        <div class="meta mb-3">
                            <div><a href="#">October 3, 2018</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
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

</body>
</html>