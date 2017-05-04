<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sellOrNot.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>

</head>
<body>
<div class="container">
    <%@ include file="Header.jsp" %>
    <div class="input-group">
        <input type="text" class="form-control input-lg">
        <span class="input-group-addon btn btn-primary searchBtn"><strong>搜索</strong></span>
    </div>
    <div class="exchangeTitle">
        <div class="nav nav-tabs exchangeTab">
            <h3>欢迎查看购物车</h3>
            <div class="design" id="leftColumn">
                <ul id="myTab">
                    <li class="active">
                        <div class="linkDiv">
                            <a href="#xw1" data-toggle="tab">已买入的</a>
                        </div>
                    </li>
                    <li>
                        <div class="linkDiv">
                            <a href="#xw2" data-toggle="tab">准备买的</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="exchangeContainer">
        <div class="tab-content">
            <div class="tab-pane active fade in" id="xw1">
                <div class="exchangeGoods">
                    <img src="images/shoes/shoes/003.jpg" alt="商品图片">
                    <p>这是我手里的一双乔1，9成新，42码，换一双41码乔1<br>有意者联系QQ：<span>543372027</span></p>
                </div>
                <div class="exchangeGoods">
                    <img src="images/shoes/music/002.jpg" alt="商品图片">
                    <p>这是我手里的一把尤克里里，95成新，买回来没怎么弹过，闲置浪费地方也舍不得扔掉，我想要换一把吉他<br>
                        有意者联系QQ：<span>543372027</span></p>
                </div>
                <div class="exchangeGoods">
                    <img src="images/clothes/female/001.jpg" alt="商品图片">
                    <p>这是我手里的一件雪纺衫，95成新，L码，我想要换一件白色M码的雪纺衫<br>有意者联系QQ：<span>543372027</span></p>
                </div>
                <div class="exchangeGoods">
                    <img src="images/shoes/shoes/002.jpg" alt="商品图片">
                    <p>这是我手里的一双科比毒液6，9成新，40码，我想要换一双41码的蓝球鞋，最好是白色或者灰色的<br>有意者联系QQ：<span>543372027</span></p>
                </div>
                <div class="exchangeGoods">
                    <img src="images/shoes/music/002.jpg" alt="商品图片">
                    <p>这是我手里的一把尤克里里，95成新，买回来没怎么弹过，闲置浪费地方也舍不得扔掉，我想要换一把吉他<br>
                        有意者联系QQ：<span>543372027</span></p>
                </div>
            </div>
            <div class="tab-pane" id="xw2">
                <div class="exchangeGoods">
                    <img src="images/shoes/shoes/001.jpg" alt="商品图片">
                    <p>这是我手里的一双李宁篮球鞋，95成新，42码，我想要换一双41码的蓝球鞋<br>有意者联系QQ：<span>543372027</span></p>
                </div>
            </div>
        </div>
    </div>
    <div class="position">
        <img src="images/components/line.png" alt="" width="100%">
    </div>
    <div class="pos"></div>
    <%@ include file="Footer.jsp" %>
</div>
</body>
</html>

