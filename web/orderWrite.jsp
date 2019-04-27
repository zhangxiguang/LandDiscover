<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <title>LandDiscover订单填写</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="full-screen" content="yes">
    <meta name="browsermode" content="application">
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/lxs_index00.js"></script>
    <script src="js/min_com.js"></script>
    <script src="js/order_xianlu.js"></script>
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
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js" charset="utf-8"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="all">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js" charset="utf-8"></script>


    <script>
        $(document).ready(function () {

            $("#allOrderInfo").click(function () {
                $(location).attr('href', 'allOrderInfo.jsp');
            });

        });
    </script>

</head>
<body>
<!-- 引进头部文件-->
<jsp:include page="top.jsp"></jsp:include>


<c:choose>

    <%--<c:when test="${empty sessionScope.userId}">--%>
        <%--<script>--%>
            <%--layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句--%>
                <%--var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句--%>

                <%--//用显示框展示添加结果--%>
                <%--layer.msg("当前未登录，请返回并登录后再试");--%>

            <%--});--%>

        <%--</script>--%>
    <%--</c:when>--%>
    <c:when test="${sessionScope.orderNothing !=null}">
        <script>
            layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
                var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

                //用显示框展示添加结果
                layer.msg("${sessionScope.orderNothing}");

            });

        </script>
    </c:when>
    <c:when test="${empty sessionScope.allOrderInfo}">
        <c:redirect url="orderServlet?method=allOrderInfo"></c:redirect>
    </c:when>
</c:choose>


<!-- 主体-->
<div class="container">
    <div class="container" style="padding-top: 40px">
        <span style="font-size: 18px;color: red">当前订单详情如下：</span>
        <input id="orderId_ord" type="hidden" value="${sessionScope.allOrderInfo.orderId}">
    </div>
    <div>
        <form class="form-horizontal">
            <fieldset disabled>
                <div class="form-group">
                    <label for="inputEmail1" class="col-sm-2 control-label">线路名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail1"
                               placeholder="${sessionScope.allOrderInfo.scenery}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">线路类型</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" placeholder="私人订制游">
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputEmail2" class="col-sm-2 control-label">始发地</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail2"
                               placeholder="${sessionScope.allOrderInfo.fromId}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">目的地</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3"
                               placeholder="${sessionScope.allOrderInfo.toId}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputEmail4" class="col-sm-2 control-label">宾馆</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail4"
                               placeholder="${sessionScope.allOrderInfo.hotel}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputEmail5" class="col-sm-2 control-label">汽车</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail5"
                               placeholder="${sessionScope.allOrderInfo.car}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputEmail6" class="col-sm-2 control-label">出发日期</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail6"
                               placeholder="${sessionScope.allOrderInfo.startDate}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputEmail7" class="col-sm-2 control-label">结束日期</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail7"
                               placeholder="${sessionScope.allOrderInfo.endDate}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputEmail8" class="col-sm-2 control-label">游玩时常</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail8"
                               placeholder="${sessionScope.allOrderInfo.time}">
                    </div>
                </div>

            </fieldset>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">出行人数</label>
                <div class="col-sm-10">
                    <select class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
            </div>

        </form>
    </div>

    <div class="container">
        <span style="font-size: 18px;color: red">请填写联系人信息</span>
    </div>

    <div class="container">
        <form>
            <div class="form-group">
                <label for="lianxirenName">联系人</label>
                <input type="text" class="form-control" name="truename" id="lianxirenName" placeholder="真实姓名(必填项)">
            </div>
            <div class="form-group">
                <label for="lianxirenPhone">手机号码</label>
                <input type="number" class="form-control" name="mobiletel" id="lianxirenPhone" placeholder="手机号码(必填项)">
                <button id="btn" type="button" class="btn btn-success" >免费获取验证码</button>
            </div>
            <div class="form-group">
                <label for="duanxinYanzheng">验证码</label>
                <input type="number" class="form-control" id="duanxinYanzheng" placeholder="短信验证码(必填项)">
            </div>
        </form>
    </div>


    <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <span style="font-size: 24px;color: red">当前总价为:¥<span id="allMONEY">${sessionScope.allOrderInfo.money}</span></span>
            <button id="saveall" type="button" class="btn btn-success">提交订单</button>
        </div>
    </nav>
</div>


<!-- 引进底部文件-->

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
        $("#btn").click(function () {
            //这里写发送验证码的代码
            var time = 60;
            settime($(this));

            var mobiletel = $("#lianxirenPhone").val()
            // alert(mobiletel)
            if (mobiletel == '') {
                alert('手机号码为必须填写项');
                return false;
            } else if (mobiletel.length != 11 || !mobiletel_regexp.test(mobiletel)) {
                alert('手机号码不正确，请重新输入');
                return false;
            }

            function settime(obj) {
                if (time == 0) {
                    $(obj).attr('disabled', false);
                    $(obj).html("点击获取验证码");
                    time = 60;
                    return;
                } else {
                    $(obj).attr('disabled', true);
                    $(obj).html(time + "秒后重新发送");
                    time--;
                }
                setTimeout(function () {
                    settime(obj)
                }, 1000)
            }

        });


        $("#lianxirenName").blur(function () {
            var name = $(this).val()

            if (name == '') {
                alert('联系人为必须填写项');
                return false;
            } else if (name.length < 2) {
                alert('联系人过短，请重新输入');
                return false;
            } else if (name.length > 10) {
                alert('联系人长度仅限10个字符，请重新输入');
                return false;
            }
        });

        $("#lianxirenPhone").blur(function () {
            var phone = $(this).val()

            if (phone == '') {
                alert('手机号码为必须填写项');
                return false;
            } else if (phone.length != 11 || !mobiletel_regexp.test(phone)) {
                alert('手机号码不正确，请重新输入');
                return false;
            }
        });

        $("#saveall").click(function () {
            // alert("test")
            var orderId=$("#orderId_ord").val();
            var username=$("#lianxirenName").val();
            var usertelephone=$("#lianxirenPhone").val();
            var number=$("select option:checked").text();
            var moneyss=$("#allMONEY").text();

            // alert(number,moneyss)

            if(username.length!=0&&usertelephone.length!=0){


                $.get("/orderServlet?method=orderOwner&orderID_ord="+orderId+"&username_ord="+username+"&usertelephone="+usertelephone+"&number="+number+"&moneyS="+moneyss,function () {
                    window.location.href="neworder.jsp";
                })

            }else {
                // alert("联系人信息不能为空哦！");
            }

        });

    });
</script>

</body>
</html>
