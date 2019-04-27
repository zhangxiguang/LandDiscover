
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.hbuas.LandDiscover.model.javaBean.Order" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>
<C:if test="${empty requestScope.order}">
    <C:redirect url="/orderconServlet?method=listOrder"></C:redirect>
    <%--<C:redirect url="/orderconServlet?method=cxlist"></C:redirect>--%>
    <%--<C:redirect url="/orderconServlet?method=wcxlist"></C:redirect>--%>
</C:if>
<C:if test="${requestScope.error!=null}">
    <script>
        layui.use(['layer', 'jquery'], function () { //独立版的layer无需执行这一句
            var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

            //用显示框展示添加结果
            layer.msg("${requestScope.error}");

            //移除session对象值,避免刷新再次弹窗
            <C:remove var="requestScope" scope="request" />
        });

    </script>

</C:if>

<html lang="ch">
<head>
    <title>我的订单</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="js/jquery-3.3.1.js"></script>
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

    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/newb/bootstrap.css">
    <link rel="stylesheet" href="css/newb/bootstrap-theme.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="layui/layui.js" charset="utf-8"></script>





</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<%--<!-- 网页内容-->--%>





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
</c:choose>
<div style="background-color: black; height: 70px;position: absolute;top: 10px;"></div>


<div style="padding-top: 60px;background-color: black"><h3>订单详情</h3></div>
<div style="height: 500px;border: 1px solid red;">


    <!-- Single button -->
    <div class="btn-group" style="position: absolute;" id="xuanxiang">
        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="xialai">
            我的订单
        </button>
        <ul class="dropdown-menu">
            <li><a href="#" id="quanbu">全部订单</a></li>
            <li><a href="#" id="DCX">已出行</a></li>
            <li><a href="#" id="YCX">未出行</a></li>
        </ul>
    </div>

    <%--全部订单--%>
    <div style="position: relative;top: 100px" id="all">
        <ul class="list-group" id="ull">
            <C:forEach var="f" items="${requestScope.order}" varStatus="s">
                <div class="${f.orderId}">
                <li class="list-group-item">订单号:${f.orderId}<a>${f.fromId}——${f.toId}</a><a>出发时间:${f.startDate}共<em>1</em>人 实付款:<i>￥${f.money}</i><span  > <a href="###" class="sssp" name="${f.orderId}" >取消订单</a></span></li>
                </div>
             </C:forEach>
        </ul>
    </div>


    <%--未出行订单--%>
    <div style="position: relative;top: 100px" id="wcxdiv">
        <ul class="list-group" id="wull">
            <C:forEach var="f" items="${requestScope.wcxorder}" varStatus="s">
                <div class="${f.orderId}">
                    <li class="list-group-item">订单号:${f.orderId}<a>${f.fromId}——${f.toId}</a><a>出发时间:${f.startDate}共<em>1</em>人 实付款:<i>￥${f.money}</i><span  > <a href="###" class="sssp" name="${f.orderId}" >取消订单</a></span></li>
                </div>
            </C:forEach>
        </ul>
    </div>


    <%--出行订单--%>
    <div style="position: relative;top: 100px" id="cxdiv">
        <ul class="list-group" id="cull">
            <C:forEach var="f" items="${requestScope.cxorder}" varStatus="s">
                <div class="${f.orderId}">
                    <li class="list-group-item">订单号:${f.orderId}<a>${f.fromId}——${f.toId}</a><a>出发时间:${f.startDate}共<em>1</em>人 实付款:<i>￥${f.money}</i><span  > <a href="###" class="sssp" name="${f.orderId}" >取消订单</a></span></li>
                </div>
            </C:forEach>
        </ul>
    </div>



    <div style="position: relative;top: 200px;left: 100px;width: 300px">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <C:forEach var = "num" begin="1" end="${requestScope.count}">
                <li><a href="#" onclick="pagecut(${num})">${num}</a></li>
                </C:forEach>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</div>






<!-- loader -->
<jsp:include page="buttom.jsp"></jsp:include>

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


<script>
    var pagecut;
    $(document).ready(function () {

        // $.get("orderconServlet?method=listOrder")


        $("#xuanxiang").show();
        $("#wcxdiv").hide();
        $("#cxdiv").hide()
        $("#DCX").click(function () {
            $("#xuanxiang").show();
            console.log("223131");
            $("#all").hide();
            $("#cxdiv").hide();
            $("#wcxdiv").show();
        })
        $("#quanbu").click(function () {
            $("#xuanxiang").show();
            $("#wcxdiv").hide();
            $("#cxdiv").hide();
            $("#all").show();
        })
        $("#YCX").click(function () {
            $("#xuanxiang").show();
            $("#wcxdiv").hide();
            $("#all").hide();
            $("#cxdiv").show();
        })

        var dnum;
        $("body").on("click",".sssp",function () {
            dnum=$(this).attr("name");
            console.log(dnum);

            if(window.confirm("确认删除？")) {

                $.get("orderconServlet?method=detor&oid=" + dnum, function (data) {
                    if (data == "false") {
                        alert("删除失败")
                    } else {
                        $("." + dnum).remove();
                    }
                })
            }else {
                alert("删除失败")
            }
        })

         pagecut=function (currentPage) {
            $.ajax({
                url:"AjaxServlet?method=listOrder&currentPage=" + currentPage,
                dataType:"json",
                success: function (data) {
                    var str = "";
                    var st = "";
                    var s = "";
                    var da;
                    console.log("length="+data.length);

                        var da0 = data[0];
                        var da1 = data[1];
                        var da2 = data[2];
                        // for (var i = 0; i < data[y].length; i++) {
                        //     str += "<div class='" + data[i].orderId + "'>\n" +
                        //         "                    <li class='list-group-item'>订单号:<a>" + data[i].fromId + "——" + data[i].toId + "</a><a>出发时间:" + data[i].startDate + "共<em>1</em>人 实付款:<i>￥" + data[i].money + "</i><span  > <a href='###' class='sssp' name='" + data[i].orderId + "' >取消订单</a></span></li>\n" +
                        //         "                </div>";
                        //
                        // }
                        // $("#ull").html(str);


                    for (var i = 0; i < da0.length;i++){
                        str += "<div class='" +  da0[i].orderId + "'>\n" +
                                "                    <li class='list-group-item'>订单号:"+  da0[i].orderId +"<a>" +  da0[i].fromId + "——" +  da0[i].toId + "</a><a>出发时间:" +  da0[i].startDate + "共<em>1</em>人 实付款:<i>￥" +  da0[i].money + "</i><span  > <a href='###' class='sssp' name='" +  da0[i].orderId + "' >取消订单</a></span></li>\n" +
                                "                </div>";
                    }
                    for (var i = 0; i < da1.length;i++){
                        st += "<div class='" +  da1[i].orderId + "'>\n" +
                            "                    <li class='list-group-item'>订单号:"+  da1[i].orderId +"<a>" +  da1[i].fromId + "——" +  da1[i].toId + "</a><a>出发时间:" +  da1[i].startDate + "共<em>1</em>人 实付款:<i>￥" +  da1[i].money + "</i><span  > <a href='###' class='sssp' name='" +  da1[i].orderId + "' >取消订单</a></span></li>\n" +
                            "                </div>";
                    }
                    for (var i = 0; i < da2.length;i++){
                        s += "<div class='" +  da2[i].orderId + "'>\n" +
                            "                    <li class='list-group-item'>订单号:"+  da2[i].orderId +"<a>" +  da2[i].fromId + "——" +  da2[i].toId + "</a><a>出发时间:" +  da2[i].startDate + "共<em>1</em>人 实付款:<i>￥" +  da2[i].money + "</i><span  > <a href='###' class='sssp' name='" +  da2[i].orderId + "' >取消订单</a></span></li>\n" +
                            "                </div>";
                    }
                     $("#ull").html(str);
                     $("#wull").html(st);
                     $("#cull").html(s);

                }

            })
        }

    })

</script>



</html>
