<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>发起物物置换</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/exchange.css">
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
        <div class="nav nav-tabs exchangeTab" id="tab">
                <h3>欢迎使用物物置换</h3>
                <div class="design" id="leftColumn">
                    <ul id="myTab">
                        <li class="active">
                            <div class="linkDiv">
                                <a href="#xw1" data-toggle="tab">当前所有置换</a>
                            </div>
                        </li>
                        <li>
                            <div class="linkDiv">
                                <a href="#xw2" data-toggle="tab">我要发起置换</a>
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
                        <img src="./images/shoes/shoes/001.jpg" alt="商品图片">
                        <p>这是我手里的一双李宁篮球鞋，95成新，42码，我想要换一双41码的蓝球鞋<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/shoes/002.jpg" alt="商品图片">
                        <p>这是我手里的一双科比毒液6，9成新，40码，我想要换一双41码的蓝球鞋，最好是白色或者灰色的<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/shoes/003.jpg" alt="商品图片">
                        <p>这是我手里的一双乔1，9成新，42码，换一双41码乔1<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/shoes/001.jpg" alt="商品图片">
                        <p>这是我手里的一双李宁篮球鞋，95成新，42码，我想要换一双41码的蓝球鞋<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/music/002.jpg" alt="商品图片">
                        <p>这是我手里的一把尤克里里，95成新，买回来没怎么弹过，闲置浪费地方也舍不得扔掉，我想要换一把吉他<br>
                            有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/clothes/female/001.jpg" alt="商品图片">
                        <p>这是我手里的一件雪纺衫，95成新，L码，我想要换一件白色M码的雪纺衫<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/shoes/002.jpg" alt="商品图片">
                        <p>这是我手里的一双科比毒液6，9成新，40码，我想要换一双41码的蓝球鞋，最好是白色或者灰色的<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/shoes/003.jpg" alt="商品图片">
                        <p>这是我手里的一双乔1，9成新，42码，换一双41码乔1<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/shoes/003.jpg" alt="商品图片">
                        <p>这是我手里的一双乔1，9成新，42码，换一双41码乔1<br>有意者联系QQ：<span>543372027</span></p>
                    </div>
                    <div class="exchangeGoods">
                        <img src="./images/shoes/music/002.jpg" alt="商品图片">
                        <p>这是我手里的一把尤克里里，95成新，买回来没怎么弹过，闲置浪费地方也舍不得扔掉，我想要换一把吉他<br>
                            有意者联系QQ：<span>543372027</span></p>
                    </div>
                </div>
                <div class="tab-pane" id="xw2">
                    <div class="exchangeReq">
                        <form role="form">
                            <div class="form-group">
                                <label for="hold">描述</label>
                                <input type="text" class="form-control"  name="form-exchangeDesc" id="hold" placeholder="请输入您闲置物品的描述,最多不超过30个字" maxlength="30">
                            </div>
                            <div class="form-group">
                                <label for="need">描述</label>
                                <input type="text" class="form-control"  name="form-needDesc" id="need" placeholder="请输入您所需物品的描述，最多不超过30个字" maxlength="30">
                            </div>
                            <div class="form-group">
                                <label for="need">描述</label>
                                <input type="text" class="form-control"  name="form-needDesc" id="need" placeholder="请输入您所需物品的描述，最多不超过30个字" maxlength="30">
                            </div>
                            <div class="form-group">
                                <label for="inputfile">请上传你的闲置物品的照片一张</label>
                                <input type="file" id="inputfile"  name="form-exchangePic">
                            </div>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </form>
                    </div>
                    <div class="pos"></div>
                </div>
            </div>
    </div>
    <div class="position">
        <img src="./images/components/line.png" alt="" width="100%">
    </div>
    <%@ include file="Footer.jsp" %>
</div>

</body>
</html>

