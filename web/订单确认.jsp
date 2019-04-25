<%@ page import="edu.hbuas.LandDiscover.model.javaBean.Order" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<C:if test="${empty requestScope.order}">
    <C:redirect url="/orderconServlet?method=listOrder"></C:redirect>
    <%--<C:redirect url="/orderconServlet?method=cxlist"></C:redirect>--%>
    <%--<C:redirect url="/orderconServlet?method=wcxlist"></C:redirect>--%>
</C:if>

<%--<C:if test="${empty requestScope.wcxorder}">--%>
    <%--<C:redirect url="/orderconServlet?method=wcxlist"></C:redirect>--%>
    <%--&lt;%&ndash;<C:redirect url="/orderconServlet?method=cxlist"></C:redirect>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<C:redirect url="/orderconServlet?method=wcxlist"></C:redirect>&ndash;%&gt;--%>
<%--</C:if>--%>


<!DOCTYPE html>
<html lang="ch">
    <head>
        <meta charset="UTF-8">
        <title>我的订单</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/tab.js"></script>
        <script type="text/javascript" src="js/popUP.js"></script>


    </head>
    <body>




        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed b-line">
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-return tiaozhuan" ></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title">我的订单</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-more"></i>
                    <%--<span class="badge badge-hollow">9+</span>--%>
                </a>
            </header>
            <section class="aui-scrollView">
                <div class="aui-tab" data-ydui-tab>
                    <ul class="tab-nav">
                        <li class="tab-nav-item tab-active">
                            <a href="javascript:;" id="quanbu">全部</a>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;" id="DCX">待出行</a>
                            <%--<span class="badge badge-hollow">5</span>--%>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;" id="YCX">已出行</a>
                            <%--<span class="badge badge-hollow">15</span>--%>
                        </li>

                    </ul>
                </div>

                    <div class="divHeight"></div>

                    <div id="all">
                    <C:forEach var="f" items="${requestScope.order}" varStatus="s">
                    <div class="tab-panel ${f.orderId}">

                        <div class="tab-panel-item tab-active">

                            <div class="tab-item">
                                <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear b-line">
                                    <div class="aui-well-item-bd">
                                        <h3></h3>
                                        <h3 href="/orderconServlet?method=order">${f.startDate}</h3>
                                    </div>

                                </a>
                                <%

                                %>


                                <div class="aui-mail-product b-line">
                                    <a href="javascript:;" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="images/pd-001.png" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p href="/orderconServlet?method=order">${f.fromId}——${f.toId} ${f.status}</p>
                                            <p href="/orderconServlet?method=order">${f.hotel}</p>
                                        </div>
                                        <div class="aui-mail-product-right">

                                        </div>
                                    </a>
                                </div>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p href="/orderconServlet?method=order">共<em>1</em>人 实付款:<i>￥${f.money}</i></p>
                                </a>
                                <div class="aui-mail-button">
                                    <a href="javascript:;" class="aui-df-color">再次购买</a>
                                </div>
                                <div class="aui-mail-button">
                                    <%--<a href="javascript:;">立即付款</a>--%>
                                   <span  class="sssp" name="${f.orderId}"> <a href="javascript:;" class="aui-df-color ClickMe"  >取消订单</a></span>
                                </div>
                            </div>


                        </div>
                    </div>
                    </C:forEach>
                    </div>
                        <%--</div>--%>


                <div id="wcxdiv">
                    <C:forEach var="f" items="${requestScope.wcxorder}" varStatus="s">
                        <div class="tab-panel ${f.orderId}">

                            <div class="tab-panel-item tab-active">

                                <div class="tab-item">
                                    <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear b-line">
                                        <div class="aui-well-item-bd">
                                            <h3></h3>
                                            <h3 href="/orderconServlet?method=listOrder">${f.startDate}</h3>
                                        </div>

                                    </a>


                                    <div class="aui-mail-product b-line">
                                        <a href="javascript:;" class="aui-mail-product-item">
                                            <div class="aui-mail-product-item-hd">
                                                <img src="images/pd-001.png" alt="">
                                            </div>
                                            <div class="aui-mail-product-item-bd">
                                                <p href="/orderconServlet?method=listOrder">${f.fromId}——${f.toId} ${f.status}</p>
                                                <p href="/orderconServlet?method=listOrder">${f.hotel}</p>
                                            </div>
                                            <div class="aui-mail-product-right">

                                            </div>
                                        </a>
                                    </div>
                                    <a href="javascript:;" class="aui-mail-payment">
                                        <p href="/orderconServlet?method=listOrder">共<em>1</em>人 实付款:<i>￥${f.money}</i></p>
                                    </a>
                                    <div class="aui-mail-button">
                                        <a href="javascript:;" class="aui-df-color">再次购买</a>
                                    </div>
                                    <div class="aui-mail-button">
                                            <%--<a href="javascript:;">立即付款</a>--%>
                                        <span  class="sssp" name="${f.orderId}"><a href="javascript:;" class="aui-df-color ClickMe">取消订单</a></span>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </C:forEach>
                </div>

                <div id="cxdiv">

                    <C:forEach var="f" items="${requestScope.cxorder}" varStatus="s">
                        <div class="tab-panel ${f.orderId}">

                            <div class="tab-panel-item tab-active">

                                <div class="tab-item">
                                    <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear b-line" >
                                        <div class="aui-well-item-bd">
                                            <h3></h3>
                                            <h3 href="/orderconServlet?method=listOrder">${f.startDate}</h3>
                                        </div>

                                    </a>
                                    <%

                                    %>


                                    <div class="aui-mail-product b-line">
                                        <a href="javascript:;" class="aui-mail-product-item">
                                            <div class="aui-mail-product-item-hd">
                                                <img src="images/pd-001.png" alt="">
                                            </div>
                                            <div class="aui-mail-product-item-bd">
                                                <p href="/orderconServlet?method=listOrder">${f.fromId}——${f.toId} ${f.status}</p>
                                                <p href="/orderconServlet?method=listOrder">${f.hotel}</p>
                                            </div>
                                            <div class="aui-mail-product-right">

                                            </div>
                                        </a>
                                    </div>
                                    <a href="javascript:;" class="aui-mail-payment">
                                        <p href="/orderconServlet?method=wcxlist">共<em>1</em>人 实付款:<i>￥${f.money}</i></p>
                                    </a>
                                    <div class="aui-mail-button">
                                        <a href="javascript:;" class="aui-df-color">再次购买</a>
                                    </div>
                                    <div class="aui-mail-button">
                                            <%--<a href="javascript:;">立即付款</a>--%>
                                        <span  class="sssp" name="${f.orderId}"> <a href="javascript:;" class="aui-df-color ClickMe"  >取消订单</a></span>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </C:forEach>

                </div>
            </section>
        </section>


        <div>
            <div id="aui-mask-box"></div>
            <div id="aui-dialog-box">
                <p>
                    是否删除该订单
                </p>
                <%--<h3 class="aui-dialog-title">请选择取消订单的理由</h3>--%>
                <%--<label class="cell-item">--%>
                    <%--<label class="cell-right">--%>
                        <%--<input type="radio" value="2" name="checkbox">--%>
                        <%--<i class="cell-checkbox-icon"></i>--%>
                    <%--</label>--%>
                    <%--<span class="cell-left">收货人信息有误</span>--%>
                <%--</label>--%>
                <%--<label class="cell-item">--%>
                    <%--<label class="cell-right">--%>
                        <%--<input type="radio" value="2" name="checkbox">--%>
                        <%--<i class="cell-checkbox-icon"></i>--%>
                    <%--</label>--%>
                    <%--<span class="cell-left">商品数量或款式需调整</span>--%>
                <%--</label>--%>
                <%--<label class="cell-item">--%>
                    <%--<label class="cell-right">--%>
                        <%--<input type="radio" value="2" name="checkbox">--%>
                        <%--<i class="cell-checkbox-icon"></i>--%>
                    <%--</label>--%>
                    <%--<span class="cell-left">有更优惠的购买方案</span>--%>
                <%--</label>--%>
                <%--<label class="cell-item">--%>
                    <%--<label class="cell-right">--%>
                        <%--<input type="radio" value="2" name="checkbox">--%>
                        <%--<i class="cell-checkbox-icon"></i>--%>
                    <%--</label>--%>
                    <%--<span class="cell-left">商品缺货</span>--%>
                <%--</label>--%>
                <%--<label class="cell-item">--%>
                    <%--<label class="cell-right">--%>
                        <%--<input type="radio" value="2" name="checkbox">--%>
                        <%--<i class="cell-checkbox-icon"></i>--%>
                    <%--</label>--%>
                    <%--<span class="cell-left">我不想买了</span>--%>
                <%--</label>--%>
                <%--<label class="cell-item">--%>
                    <%--<label class="cell-right">--%>
                        <%--<input type="radio" value="2" name="checkbox">--%>
                        <%--<i class="cell-checkbox-icon"></i>--%>
                    <%--</label>--%>
                    <%--<span class="cell-left">其他原因</span>--%>
                <%--</label>--%>

                <div class="close1">
                    <a href="javascript:void(0)" class="aui-close">取消</a>
                    <a href="javascript:void(0)" class="aui-close" id="aj">确认</a>
                </div>


            </div>
        </div>
    </body>

    <script>

        $(".tiaozhuan").click(function(){
           window.location.href="index.jsp";
        });
        $(document).ready(function () {
            $("#wcxdiv").hide();
            $("#cxdiv").hide()
            $("#DCX").click(function () {
                console.log("223131");
                $("#all").hide();
                $("#cxdiv").hide();
                $("#wcxdiv").show();
            })
            $("#quanbu").click(function () {
                $("#wcxdiv").hide();
                $("#cxdiv").hide();
                $("#all").show();

            })

            $("#YCX").click(function () {
                $("#wcxdiv").hide();
                $("#all").hide();
                $("#cxdiv").show();
            })

        })
        var dnum;

        $("body").on("click",".sssp",function () {
          dnum=$(this).attr("name");
          console.log(dnum);
        })

        $("#aj").click(function () {
            $.get("orderconServlet?method=detor&oid="+dnum,function (data) {
                if(data == "false"){
                    alert("删除失败")
                }else {
                    $("."+dnum).remove();
                }


            })

        })

    </script>


</html>
