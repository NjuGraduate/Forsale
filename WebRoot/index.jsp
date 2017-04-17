<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>ForSale 二手交易网站</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/advertisement.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
</head>
<body>
	<div class="container">
    	<div class="header">
        	<div class="header-left">
            	<span>Hi! Welcome to Forsale</span>
            	<span><a href="login.jsp">请登录</a></span>
            	<span><a href="register.jsp">免费注册</a></span>
        	</div>
        	<div class="header-right">
            	<ul id="menu">
                	<li>
                    	<a href="">二手网首页</a>
                    	<ul><li><a href="index.jsp">回到首页</a></li></ul>
	                </li>
	                <li>
	                    <a href="">我的二手</a>
	                    <ul id="myForSale">
	                        <li><a href="">我的二手</a></li>
	                        <li><a href="">已买的二手</a></li>
	                        <li><a href="">我要置换</a></li>
	                        <li><a href="">浏览足迹</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="">购物车</a>
	                    <ul id="myCart">
	                        <li><a href="">查看我的购物车</a></li>
	                        <li><a href="">近期购入</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="">卖家中心</a>
	                    <ul id="seller">
	                        <li><a href="">我的卖品</a></li>
	                        <li><a href="">我的店铺</a></li>
	                        <li><a href="">已卖出的宝贝</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="">联系客服</a>
	                    <ul id="serviceCenter">
	                        <li><a href="">卖家客服</a></li>
	                        <li><a href="">买家客服</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="">用户指南</a>
	                    <ul id="guideBook">
	                        <li><a href="">卖家指南</a></li>
	                        <li><a href="">买家指南</a></li>
	                    </ul>
	                </li>
            	</ul>
        	</div>
    	</div>
	    <div class="input-group">
	        <input type="text" class="form-control input-lg">
	        <span class="input-group-addon btn btn-primary searchBtn"><strong>搜索</strong></span>
	    </div>
	    <div class="nav nav-tabs" id="myTab">
	        主题市场
	        <div class="design" id="leftcolumn">
	            <a href="./clothes.html" data-toggle="tab" target="_self">女装/男装/内衣
	                <span>&raquo;</span></a>
	            <a href="./shoes.html" data-toggle="tab" target="_self">鞋靴/箱包/配件
	                <span>&raquo;</span></a>
	            <a href="./digit.html" data-toggle="tab" target="_self">家电/数码/手机
	                <span>&raquo;</span></a>
	            <a href="./cosmetics.html" data-toggle="tab" target="_self">美妆/洗护/保健品
	                <span>&raquo;</span></a>
	            <a href="./watch.html" data-toggle="tab" target="_self">珠宝/眼镜/手表
	                <span>&raquo;</span></a>
	            <a href="./sports.html" data-toggle="tab" target="_self">运动/户外/乐器
	                <span>&raquo;</span></a>
	            <a href="./house.html" data-toggle="tab" target="_self">房产/装修/材料
	                <span>&raquo;</span></a>
	            <a href="./cars.html" data-toggle="tab" target="_self">汽车/二手车/用品
	                <span>&raquo;</span></a>
	            <a href="./furniture.html" data-toggle="tab" target="_self">家具/家饰/家纺
	                <span>&raquo;</span></a>
	        </div>
	    </div>
	    <div class="advertisement" id="banner">
	        <div class="adPic">
	            <img src="images/index/advertisement/1.jpg"
	                 title="旗下淘宝平台" style="display: block">
	            <img src="images/index/advertisement/2.jpg" title="旗下新浪平台">
	            <img src="images/index/advertisement/3.jpg" title="旗下咸鱼平台">
	            <img src="images/index/advertisement/4.jpg" title="旗下58同城">
	            <img src="images/index/advertisement/5.jpg" title="签约艺人科比-布莱恩特">
	        </div>
	        <div class="lib">
	            <span class="defaultSpan"></span>
	            <span></span>
	            <span></span>
	            <span></span>
	            <span></span>
	        </div>
	        <a href="#" id="left"><img src="images/arrow1.png" alt=""></a>
	        <a href="#" id="right"><img src="images/arrow2.png" alt=""></a>
	    </div>
    	<div class="footerWrapper">
            <footer class="container-fluid foot-wrap">
                <div class="row">
                    <div class="row-content col-lg-3 col-sm-4 col-xs-6">
                        <h3>关于我们</h3>
                        <ul>
                            <li><a href="#">客服中心</a></li>
                            <li><a href="#">用户须知</a></li>
                        </ul>
                    </div>
                    <div class="row-content col-lg-3 col-sm-4 col-xs-6">
                        <h3>浏览器支持</h3>
                        <ul>
                            <li><a href="#">opera</a></li>
                            <li><a href="#">chrome</a></li>
                            <li><a href="#">ie8+</a></li>
                        </ul>
                    </div>
                    <div class="row-content col-lg-3 col-sm-4 col-xs-6">
                        <h3>举报中心</h3>
                        <ul>
                            <li><a href="#">联系电话</a></li>
                            <li><a href="#">官方QQ</a></li>
                        </ul>
                    </div>
                    <div class="row-content col-lg-3 col-sm-4 col-xs-6">
                        <h3>合作伙伴</h3>
                        <ul>
                            <li><a href="#">阿里巴巴</a></li>
                            <li><a href="#">58同城</a></li>
                        </ul>
                    </div>
                </div>
            </footer>
        </div>
	</div>
</body>
</html>