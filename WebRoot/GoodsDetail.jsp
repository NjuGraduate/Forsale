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
	<script>
		$(document).ready(function (){
			detail(${detail}) ;
		}); 
		function detail(goods){
			let container = document.getElementsByClassName("goodsDesc")[0];
			let div = document.createElement("div");
			div.classList.add("imgDesc");
			let img = document.createElement("img");
			img.classList.add("goodsLogo");
			img.src = goods.pic;
			div.appendChild(img);
			container.appendChild(div);
			let desc = document.getElementsByClassName("title")[0];
			desc.innerHTML = goods.des;
			let price = document.getElementsByClassName("spanPN")[0];
			price.innerHTML = goods.price;
			let size = document.getElementsByClassName("spanSize")[0];
			size.innerHTML = goods.size;
			let color = document.getElementsByClassName("spanColor")[0];
			color.innerHTML = goods.color;
			let imgContainer = document.getElementsByClassName("goodsImages")[0];
			let img1 = document.createElement("img");
			img1.src = goods.pic;
			img1.style.width="100%";
			img1.style.margin="10px 0 10px 0";
			imgContainer.appendChild(img1);
		};
	</script>
</head>
<body>
<div class="container">
    <%@ include file="Header.jsp" %>
    <div class="goodsContent">
        <div class="goodsDesc">
            <div class="logoDesc">
                <p class="title"></p>
                <div class="priceDiv">
                    <p class="price">原价<span class="spanPrice">很贵很贵</span></p>
                    <p class="priceDesc"></p>
                    <p class="priceNow" >当前价格<span class="spanPN"></span></p>
                    <p class="color" >衣服尺寸&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="spanSize"></span></p>
                    <p class="color">商品颜色<span class="spanColor"></span></p>
                </div>
                <br><br><br><br><br><br>
                <div class="btnGroup">
					<form role="form" action="commodityInfo/collectCommodity.do" method="post">
						<button class="btn col-sm-3" id="likeBtn" name="commodity_id" type="submit">加入购物车</button>
					</form>
                    <span class="col-sm-4"></span>
                    <form role="form" action="commodityInfo/buyCommodity.do" method="post">
	                    <button class="btn col-sm-3" name="id" id="buyBtn" type="submit">立即购买</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="goodsComments">
        	<div class="publishComments"> 
        		
        	</div>
        	<div class="checkComments">
        		
        	</div>
        </div>
    </div>
    <%@ include file="Footer.jsp" %>
</div>

</body>
</html>
