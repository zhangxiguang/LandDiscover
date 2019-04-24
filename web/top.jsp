<%--
  Created by IntelliJ IDEA.
  User: zxg
  Date: 2019/3/17
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="login.jsp">点击登录</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="index.jsp" class="nav-link">首页</a></li>
                <li class="nav-item"><a href="about.jsp" class="nav-link">关于我们</a></li>
                <li class="nav-item"><a href="places.jsp" class="nav-link">地点</a></li>
                <li class="nav-item"><a href="hotel.jsp" class="nav-link">住宿</a></li>
                <li class="nav-item"><a href="car.jsp" class="nav-link">汽车租赁</a></li>
                <li class="nav-item"><a  href="blogServlet?method=getFirstPage" class="nav-link">博客</a></li>
                <li class="nav-item"><a href="contact.jsp" class="nav-link">联系我们</a></li>
                <li class="nav-item"><a href="订单填写.jsp" class="nav-link">购物车</a></li>
            </ul>
        </div>
    </div>
</nav>

