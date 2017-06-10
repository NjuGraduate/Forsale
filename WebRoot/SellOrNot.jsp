<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看已卖出的和未卖出的商品</title>
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
    		url:"commodityInfo/showSellerOrder.do",
    		success:sell
    	});
    	function sell(json){
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
    	
    	$.getJSON({
    		url:"commodityInfo/getCommodities.do",
    		success:notSell
    	});
    	function notSell(json){
    		let data = JSON.parse(json);
    		let container = document.getElementById("goodsContainer");
    		for (let item of data) { 
    			let div = document.createElement("div");
    			div.classList.add("exchangeGoods");
    			let a = document.createElement("a");
    			div.appendChild(a);
    			let img = document.createElement("img");
    			img.src = item.pic;
    			a.appendChild(img);
    			let xxx = document.createElement("p");
    			xxx.innerHTML = item.des+'<br><br>'+'有意者联系QQ：<span>543372027</span>';
    			a.appendChild(xxx);
    			/*申请广告*/
    			let btn1 = document.createElement("button");
    			btn1.classList.add("btn-primary");
    			btn1.classList.add("btn");
    			btn1.style.width="95%";
    			btn1.style.margin = "5px";
    			btn1.innerHTML = "申请广告";
    			btn1.onclick = function() {requestAdvertisement(item.id)};
    			/*加入店铺*/
    			let btn3 = document.createElement("button");
    			btn3.classList.add("btn-primary");
    			btn3.classList.add("btn");
    			btn3.innerHTML = "加入店铺";
    			btn3.style.width="95%";
    			btn3.style.margin = "5px";
    			btn3.onclick = function() {addShop(item.id);};
    			
    			/*删除商品*/
    			let btn2 = document.createElement("button");
    			btn2.classList.add("btn-danger");
    			btn2.classList.add("btn");
    			btn2.innerHTML = "删除商品";
    			btn2.style.width="95%";
    			btn2.style.margin="5px";
    			btn2.onclick = function() {test(item.id);};
    			
    			div.appendChild(btn1);
    			div.appendChild(btn3);
    			div.appendChild(btn2);
    			
    			container.appendChild(div);
    			a.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +item.id;
    		}
    	}
    </script>

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
            <h3>欢迎查看您的商品</h3>
            <div class="design" id="leftColumn">
                <ul id="myTab">
                    <li class="active">
                        <div class="linkDiv">
                            <a href="#xw1" data-toggle="tab">已卖出的</a>
                        </div>
                    </li>
                    <li>
                        <div class="linkDiv">
                            <a href="#xw2" data-toggle="tab">未卖出的</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="exchangeContainer">
        <div class="tab-content">
            <div class="tab-pane active fade in" id="xw1">
            </div>
            <div class="tab-pane" id="xw2">
            	<div id="goodsContainer">
            	
            	</div>
            </div>
        </div>
    </div>
    <div class="position">
        <img src="./images/components/line.png" alt="" width="100%">
    </div>
    <div class="pos"></div>
	<%@ include file="Footer.jsp" %>
</div>
</body>
</html>