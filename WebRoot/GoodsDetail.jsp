<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>商品详情页面</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/goodsDetail.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
    <script src="js/accordion.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>

</head>
<body>
<div class="container">
    <%@ include file="Header.jsp" %>
    <div class="goodsContent">
        <div class="goodsDesc">
            <div class="imgDesc">
                <img src="images/clothes/female/001.jpg" class="goodsLogo">
            </div>
            <div class="logoDesc">
                <p class="title">商品名称<span>宽松套头卫衣女学生长袖打底衫棉立方2017春装新款女装潮韩版上衣</span></p>
                <div class="priceDiv">
                    <p class="price">原价<span class="spanPrice">388</span></p>
                    <p class="priceDesc">衣服不错，面料厚实，棉立方第一次买这个牌子，做工精细，真的是物美价廉。我选的L的，稍大一些，所以低价二手出</p>
                    <p class="priceNow" >当前价格<span class="spanPN">188</span></p>
                    <p class="color" >衣服尺寸<span class="spanColor">L</span></p>
                    <p class="color">商品颜色<span class="spanColor">白色</span></p>
                </div>
                <div class="btnGroup">

                    <button class="btn col-sm-3" id="likeBtn">收藏</button>
                    <span class="col-sm-4"></span>
                    <button class="btn col-sm-3" id="buyBtn">立即购买</button>
                </div>


            </div>
        </div>
        <div class="goodsImages">
            <div class="goodsImage"><img src="images/clothes/detail/001.png"></div>
            <div class="goodsImage"><img src="images/clothes/detail/016.jpg"></div>
            <div class="goodsImage"><img src="images/clothes/detail/004.jpg" alt=""></div>
            <div class="goodsImage"><img src="images/clothes/detail/019.jpg" alt=""></div>
            <div class="goodsImage"><img src="images/clothes/detail/009.jpg" alt=""></div>
        </div>
    </div>
    <%@ include file="Footer.jsp" %>
</div>

</body>
</html>
