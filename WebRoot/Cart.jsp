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
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
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
    <script>
    	$.getJSON({
    		url:"commodityInfo/showCollectCommodity.do",
    		success:cart
    	});
    	function cart(json){
    		if(json){
    			let data = JSON.parse(json);
        		let xw2 = document.getElementById("xw2");
        		for(var i = 0; i <data.length;i++){
        			let cartDiv = document.createElement("div");
        			cartDiv.classList.add("exchangeGoods");
        			let cartImg = document.createElement("img");
        			cartImg.src = data[i].pic;
        			let cartP = document.createElement("p");
        			cartP.innerHTML = data[i].des;
        			cartDiv.appendChild(cartImg);
        			cartDiv.appendChild(cartP);
        			let cartA = document.createElement("a");
        			cartA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        			cartA.appendChild(cartDiv);
        			xw2.appendChild(cartA);
        		}
    		}
    	}
    	$.getJSON({
    		url:"commodityInfo/showbuyerOrder.do",
    		success:buy
    	});
    	
    	function buy(json){
    		let data = JSON.parse(json);
    		let xw1 = document.getElementById("xw1");
    		for(var i = 0; i <data.length;i++){
    			let buyDiv = document.createElement("div");
    			buyDiv.classList.add("exchangeGoods");
    			let buyImg = document.createElement("img");
    			buyImg.src = data[i].coPic;
    			let buyP = document.createElement("p");
    			buyP.innerHTML = data[i].coDes;
    			buyDiv.appendChild(buyImg);
    			buyDiv.appendChild(buyP);
    			xw1.appendChild(buyDiv);
    	}
    	}
    </script>

</head>
<body>
<div class="container">
    <%@ include file="Header.jsp" %>
    <div class="input-group">
        <input type="text" class="form-control input-lg" name="form-cartSearch">
        <span class="btn searchBtn"><strong>搜索</strong></span>
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
                            <a href="#xw2" data-toggle="tab">购物车</a>
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

