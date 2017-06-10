<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <!--content的各种样式表-->
    <link rel="stylesheet" href="css/indexContent/clothes.css">

    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <style>
    div.goods-container {
    	width: inherit !important;
    	height: inherit !important;
    	background-color: transparent !important;
    	display: block !important;
    }
    </style>
    <script>
	    $.getJSON({
			url:"commodityInfo/getAllCommodities.do",
			success:commodities
		});
    	function commodities(json){
    		let data = JSON.parse(json);
    		let content1 = document.getElementById("content1");
    		let content2 = document.getElementById("content2");
    		let content3 = document.getElementById("content3");
    		let content4 = document.getElementById("content4");
    		let content5 = document.getElementById("content5");
    		let content6 = document.getElementById("content6");
    		let content7 = document.getElementById("content7");
    		let content8 = document.getElementById("content8");
    		let content9 = document.getElementById("content9");
    		for(var i = 0; i < data.length;i++){
    			if(data[i].classifiction1 == "衣服"){
    				if(data[i].classifiction2 == "女装"){
    					let femaleContainer = document.getElementById("female_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "男装"){
    					let maleContainer = document.getElementById("male_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("under_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    				
    			}else if(data[i].classifiction1 == "鞋靴"){
    				if(data[i].classifiction2 == "鞋"){
    					let femaleContainer = document.getElementById("shoes_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "箱包"){
    					let maleContainer = document.getElementById("bags_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("parts_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    			}else if(data[i].classifiction1 == "数码"){
    				if(data[i].classifiction2 == "家电"){
    					let femaleContainer = document.getElementById("home_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "数码"){
    					let maleContainer = document.getElementById("digit_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("phone_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    			}else if(data[i].classifiction1 == "美妆"){
    				if(data[i].classifiction2 == "美妆"){
    					let femaleContainer = document.getElementById("cosmetics_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "洗护"){
    					let maleContainer = document.getElementById("wash_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("health_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    			}else if(data[i].classifiction1 == "手表"){
    				if(data[i].classifiction2 == "珠宝"){
    					let femaleContainer = document.getElementById("jewelry_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "眼镜"){
    					let maleContainer = document.getElementById("glasses_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("watch_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    			}else if(data[i].classifiction1 == "户外"){
    				if(data[i].classifiction2 == "运动"){
    					let femaleContainer = document.getElementById("sports_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "户外"){
    					let maleContainer = document.getElementById("outdoor_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("music_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    			}else{
    				if(data[i].classifiction2 == "家具"){
    					let femaleContainer = document.getElementById("furniture_container");
    					femaleContainer.classList.remove("hidden");
        				let femaleDiv = document.createElement("div");
        				let femaleImg = document.createElement("img");
        				let femaleA = document.createElement("a");
        				femaleA.innerHTML = "查看详情";
        				femaleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				femaleImg.src = data[i].pic;
        				femaleDiv.appendChild(femaleImg);
        				femaleDiv.appendChild(femaleA);
        				femaleContainer.appendChild(femaleDiv);
    				}else if(data[i].classifiction2 == "家饰"){
    					let maleContainer = document.getElementById("furnishing_container");
    					maleContainer.classList.remove("hidden");
        				let maleDiv = document.createElement("div");
        				let maleImg = document.createElement("img");
        				let maleA = document.createElement("a");
        				maleA.innerHTML = "查看详情";
        				maleA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				maleImg.src = data[i].pic;
        				maleDiv.appendChild(maleImg);
        				maleDiv.appendChild(maleA);
        				maleContainer.appendChild(maleDiv);
    				}else{
    					let underContainer = document.getElementById("textile_container");
    					underContainer.classList.remove("hidden");
        				let underDiv = document.createElement("div");
        				let underImg = document.createElement("img");
        				let underA = document.createElement("a");
        				underA.innerHTML = "查看详情";
        				underA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
        				underImg.src = data[i].pic;
        				underDiv.appendChild(underImg);
        				underDiv.appendChild(underA);
        				underContainer.appendChild(underDiv);
    				}
    			}
    		}
    	}
    	
    	$.getJSON({
    		url:"advertisementInfo/getAllAds.do",
    		success: addAdvertisement
    	});
    	
    	function addAdvertisement(json){
    		let data = JSON.parse(json);
    		let advertisement1 = document.getElementById("xw1");
    		for(var i = 0; i < data.length;i++){
    			if(data[i].classifiction1 == "衣服"){
    				let adDiv = document.getElementsByClassName("adPic")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}else if(data[i].classifiction1 == "鞋靴"){
    				let adDiv = document.getElementsByClassName("adPic2")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}else if(data[i].classifiction1 == "数码"){
    				let adDiv = document.getElementsByClassName("adPic3")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}else if(data[i].classifiction1 == "美妆"){
    				let adDiv = document.getElementsByClassName("adPic4")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}else if(data[i].classifiction1 == "手表"){
    				let adDiv = document.getElementsByClassName("adPic5")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}else if(data[i].classifiction1 == "户外"){
    				let adDiv = document.getElementsByClassName("adPic6")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}else{
    				let adDiv = document.getElementsByClassName("adPic7")[0];
    				let adPic = document.createElement("img");
    				let adA = document.createElement("a");
    				adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    				adA.appendChild(adPic);
    				adPic.src = data[i].pic;
    				adPic.title = data[i].des;
    				adDiv.appendChild(adA);
    			}
    		}
    	}
    	function getText(){
    		let div = document.getElementById("shopDiv");
    		let btn = document.getElementById("shopSearch");
    		let input = document.getElementById("inputText").value;
    		let a = document.createElement("a");
    		let url = "${pageContext.request.contextPath}/shopInfo/retrieveShop.do?input="+input;
    		url=encodeURI(encodeURI(url));
    		a.href = url;
    		a.appendChild(btn);
    		div.appendChild(a);
    	}
    	
    	function getText2(){
    		let div = document.getElementById("goodsDiv");
    		let btn = document.getElementById("goodsSearch");
    		let input = document.getElementById("inputText").value;
    		let a = document.createElement("a");
    		let url ="${pageContext.request.contextPath}/commodityInfo/retrieveCommodity.do?input="+input;
    		url=encodeURI(encodeURI(url));
    		a.href = url;
    		a.appendChild(btn);
    		div.appendChild(a);
    	}
    	
    </script>
    
</head>
<body>
<div class="container">
    <%@ include file="Header.jsp" %>
    <div class="input-group">
        <input type="text" class="form-control input-lg" id="inputText">
        <div style="display: inline-block;margin-top: 5px" id="shopDiv">
            <button class="btn btn-primary" id="shopSearch" onclick=getText()>搜索店铺</button>
        </div>
        <div style="display:inline-block;float: right;margin-top: 5px" id="goodsDiv">
            <button class="btn btn-primary" id="goodsSearch" type="submit" onclick=getText2()>搜索商品</button>
        </div>
    </div>
    <div class="nav nav-tabs useTab">
        <h3>主题市场</h3>
        <div class="design" id="leftColumn">
            <ul id="myTab">
                <li class="active">
                    <div class="linkDiv">
                        <a href="#xw1" data-toggle="tab">女装/男装/内衣</a>
                        <a href="#content1" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>
                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw2" data-toggle="tab">鞋靴/箱包/配件</a>
                        <a href="#content2" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>

                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw3" data-toggle="tab">家电/数码/手机</a>
                        <a href="#content3" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>

                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw4" data-toggle="tab">美妆/洗护/保健品</a>
                        <a href="#content4" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>

                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw5" data-toggle="tab">珠宝/眼镜/手表</a>
                        <a href="#content5" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>

                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw6" data-toggle="tab">运动/户外/乐器</a>
                        <a href="#content6" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>

                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw9" data-toggle="tab">家具/家饰/家纺</a>
                        <a href="#content9" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="tab-content advertisement" id="banner">
        <div class="tab-pane active" id="xw1">
            <div class="adPic">
            </div>
        </div>
        <div class="tab-pane fade in" id="xw2">
            <div class="adPic adPic2">
            </div>
        </div>
        <div class="tab-pane fade in" id="xw3">
            <div class="adPic adPic3">
            </div>
        </div>
        <div class="tab-pane fade in" id="xw4">
            <div class="adPic adPic4">
            </div>
        </div>
        <div class="tab-pane fade in" id="xw5">
            <div class="adPic adPic5">
            </div>
        </div>
        <div class="tab-pane fade in" id="xw6">
            <div class="adPic adPic6">
            </div>
        </div>
        <div class="tab-pane fade in" id="xw9">
            <div class="adPic adPic7">
            </div>
        </div>
        <div class="lib">
            <span class="defaultSpan"></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <a href="#" class="left"><img src="./images/arrow1.png" alt=""></a>
        <a href="#" class="right"><img src="./images/arrow2.png" alt=""></a>
    </div>
    <div class="tab-content clothesContent">
        <div class="tab-pane active fade in femaleClothes" id="content1">
          	<div id="goods_container" class="goods-container">
	           	<div id="female_container" class="hidden goods-container">
	           	<h4>女装专栏</h4>
	           	<p class="line"><img src="./images/components/line.png"></p>
	           	</div>
	           	<div id="male_container" class="hidden goods-container">
	           	<h4>男装专栏</h4>
	           	<p class="line"><img src="./images/components/line.png"></p>
	          	</div>
	          	<div id="under_container" class="hidden goods-container">
	           	<h4>内衣专栏</h4>
	           	<p class="line"><img src="./images/components/line.png"></p>
	          	</div>
            </div>
        </div>
        <div class="tab-pane fade in femaleClothes" id="content2">
        	<div id="shoe_container" class="goods-container">
        		<div id="shoes_container" class="hidden goods-container">
	           	<h4>鞋靴专栏</h4>
	           	<p class="line"><img src="./images/components/line.png"></p>
	           	</div>
	           	<div id="bags_container" class="hidden goods-container">
	           	<h4>箱包专栏</h4>
	           	<p class="line"><img src="./images/components/line.png"></p>
	          	</div>
	          	<div id="parts_container" class="hidden goods-container">
	           	<h4>配件专栏</h4>
	           	<p class="line"><img src="./images/components/line.png"></p>
	          	</div>
        	</div>
        </div>
        <div class="femaleClothes tab-pane fade in" id="content3">
        	<div id="digit_container" class="hidden goods-container">
	            <h4>数码专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="home_container" class="hidden goods-container">
	            <h4>家电专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="phone_container" class="hidden goods-container">
	            <h4>手机专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        </div>
        <div class="femaleClothes tab-pane fade in" id="content4">
            <div id="cosmetics_container" class="hidden goods-container">
	            <h4>美妆专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="wash_container" class="hidden goods-container">
	            <h4>洗护专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="health_container" class="hidden goods-container">
	            <h4>保健品专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        </div>
        <div class="femaleClothes tab-pane fade in" id="content5">
            <div id="jewelry_container" class="hidden goods-container">
	            <h4>珠宝专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="glasses_container" class="hidden goods-container">
	            <h4>眼镜专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="watch_container" class="hidden goods-container">
	            <h4>手表专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        </div>
        <div class="femaleClothes tab-pane fade in" id="content6">
            <div id="sports_container" class="hidden goods-container">
	            <h4>运动专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="outdoor_container" class="hidden goods-container">
	            <h4>户外专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="music_container" class="hidden goods-container">
	            <h4>乐器专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        </div>
        <div class="femaleClothes tab-pane fade in" id="content9">
            <div id="furniture_container" class="hidden goods-container">
	            <h4>家具专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="furnishing_container" class="hidden goods-container">
	            <h4>家饰专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        	<div id="textile_container" class="hidden goods-container">
	            <h4>家纺专栏</h4>
        		<p class="line"><img src="./images/components/line.png"></p>
        	</div>
        </div>
    </div>
    <%@ include file="Footer.jsp" %>
</div>
</body>
</html>