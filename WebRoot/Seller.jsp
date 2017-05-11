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
    <title>卖家中心</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/seller.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script>
    	$.post({
    		url:"commodityInfo/getCommodities.do",
    		dataType:'json',
    		success:callback
    	});
    	
    	function callback(data){
    		alert(data);
    	}
    </script>

</head>
<body>
    <div class="container">
        <%@ include file="Header.jsp" %>
        <div class="sellerTitle" style="overflow: hidden">
            <img src="./images/logo/2.jpg" alt="" class="sellerLogo col-sm-3">
            <div class="sellerTitleContainer sellerLogo col-sm-9">
                <table class="table table-condensed">
                    <caption>LCX的卖家中心</caption>
                    <thead>
                    <tr>
                        <th>地址：中国·江苏·南京</th>
                        <th>开店时长：</th>
                        <th>108天</th></tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>服务态度</td>
                        <td>评分：</td>
                        <td>7.1</td></tr>
                    <tr>
                        <td>描述相符</td>
                        <td>评分：</td>
                        <td>8.1</td></tr>
                    <tr>
                        <td>个人店铺</td>
                        <td>评分：</td>
                        <td>100</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="sellerGoods">
            <h2>我的卖品</h2>
            <img src="./images/components/line.png" alt="" class="line">
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
                <img src="./images/shoes/shoes/001.jpg" alt="商品图片">
                <p>这是我手里的一双李宁篮球鞋，95成新，42码，我想要换一双41码的蓝球鞋<br>有意者联系QQ：<span>543372027</span></p>
            </div>
            <div class="exchangeGoods">
                <img src="./images/shoes/music/002.jpg" alt="商品图片">
                <p>这是我手里的一把尤克里里，95成新，买回来没怎么弹过，闲置浪费地方也舍不得扔掉，我想要换一把吉他<br>
                    有意者联系QQ：<span>543372027</span></p>
            </div><br>
            <p class="add">您可以点击这里来 <a href="./PublishGoods.jsp" target="_blank">添加商品</a></p>
            <img src="./images/components/line.png" alt="" class="line">
            <h2>我的店铺</h2>
            <img src="./images/components/line.png" alt="" class="line">
            <p class="add">您当前暂无店铺，您可以选择 <a href="./BuildShop.jsp" target="_blank">创建店铺</a></p>
        </div>
        <%@ include file="Footer.jsp" %>
    </div>

</body>
</html>
