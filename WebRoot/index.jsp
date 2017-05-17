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
    				
    			}else if(data[i].classifiction1 == "数码"){
    				
    			}else if(data[i].classifiction1 == "美妆"){
    				
    			}else if(data[i].classifiction1 == "手表"){
    				
    			}else if(data[i].classifiction1 == "户外"){
    				
    			}else if(data[i].classifiction1 == "房子"){
    				
    			}else if(data[i].classifiction1 == "汽车"){
    				
    			}else{
    				
    			}
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
                        <a href="#xw7" data-toggle="tab">房产/装修/材料</a>
                        <a href="#content7" data-toggle="tab" class="a2"><span>展开&raquo;</span></a>
                    </div>

                </li>
                <li>
                    <div class="linkDiv">
                        <a href="#xw8" data-toggle="tab">汽车/二手车/用品</a>
                        <a href="#content8" class="a2"><span>展开&raquo;</span></a>
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
        <div class="tab-pane active fade in" id="xw1">
            <div class="adPic">
                <img src="./images/clothes/advertisement/018.jpg"
                     title="旗下淘宝平台" style="display: block">
                <img src="./images/clothes/advertisement/010.jpg" title="旗下新浪平台">
                <img src="./images/clothes/advertisement/015.jpg" title="旗下咸鱼平台">
                <img src="./images/clothes/advertisement/016.jpg" title="旗下58同城">
                <img src="./images/clothes/advertisement/017.jpg" title="签约艺人科比-布莱恩特">
            </div>
        </div>
        <div class="tab-pane" id="xw2">
            <div class="adPic">
                <img src="./images/shoes/advertisement/1.jpg"
                     title="旗下淘宝平台" style="display: block">
                <img src="./images/shoes/advertisement/2.jpg" title="旗下新浪平台">
                <img src="./images/shoes/advertisement/3.jpg" title="旗下咸鱼平台">
                <img src="./images/shoes/advertisement/4.jpg" title="旗下58同城">
                <img src="./images/shoes/advertisement/5.jpg" title="签约艺人科比-布莱恩特">
            </div>
        </div>
        <div class="tab-pane" id="xw3">
            <div class="adPic">
                <img src="./images/digit/advertisement/1.jpg"
                     title="查看家电广告" style="display: block">
                <img src="./images/digit/advertisement/2.jpg" title="查看家电广告">
                <img src="./images/digit/advertisement/3.jpg" title="查看家电广告">
                <img src="./images/digit/advertisement/4.jpg" title="查看家电广告">
                <img src="./images/digit/advertisement/5.jpg" title="查看家电广告">
            </div>
        </div>
        <div class="tab-pane" id="xw4">
            <div class="adPic">
                <img src="./images/cosmetics/advertisement/1.jpg"
                     title="查看化妆品广告" style="display: block">
                <img src="./images/cosmetics/advertisement/2.jpg" title="查看化妆品广告">
                <img src="./images/cosmetics/advertisement/3.jpg" title="查看化妆品广告">
                <img src="./images/cosmetics/advertisement/4.jpg" title="查看化妆品广告">
                <img src="./images/cosmetics/advertisement/5.jpg" title="查看化妆品广告">
            </div>
        </div>
        <div class="tab-pane" id="xw5">
            <div class="adPic">
                <img src="./images/watch/advertisement/1.jpg"
                     title="查看手表广告" style="display: block">
                <img src="./images/watch/advertisement/2.jpg" title="查看手表广告">
                <img src="./images/watch/advertisement/3.jpg" title="查看珠宝广告">
                <img src="./images/watch/advertisement/4.jpg" title="查看珠宝广告">
                <img src="./images/watch/advertisement/5.jpg" title="查看珠宝广告">
            </div>
        </div>
        <div class="tab-pane" id="xw6">
            <div class="adPic">
                <img src="./images/sports/advertisement/1.jpg"
                     title="查看运动品广告" style="display: block">
                <img src="./images/sports/advertisement/2.jpg" title="查看运动品广告">
                <img src="./images/sports/advertisement/3.jpg" title="查看运动品广告">
                <img src="./images/sports/advertisement/4.jpg" title="查看运动品广告">
                <img src="./images/sports/advertisement/5.jpg" title="查看运动品广告">
            </div>
        </div>
        <div class="tab-pane" id="xw7">
            <div class="adPic">
                <img src="./images/house/advertisement/1.jpg"
                     title="查看房屋广告" style="display: block">
                <img src="./images/house/advertisement/2.jpg" title="查看房屋广告">
                <img src="./images/house/advertisement/3.jpg" title="查看房屋广告">
                <img src="./images/house/advertisement/4.jpg" title="查看房屋广告">
                <img src="./images/house/advertisement/5.jpg" title="查看房屋广告">
            </div>
        </div>
        <div class="tab-pane" id="xw8">
            <div class="adPic">
                <img src="./images/cars/advertisement/1.jpg"
                     title="查看车辆广告" style="display: block">
                <img src="./images/cars/advertisement/2.jpg" title="查看车辆广告">
                <img src="./images/cars/advertisement/3.jpg" title="查看车辆广告">
                <img src="./images/cars/advertisement/4.jpg" title="查看车辆广告">
                <img src="./images/cars/advertisement/5.jpg" title="查看车辆广告">
            </div>
        </div>
        <div class="tab-pane" id="xw9">
            <div class="adPic">
                <img src="./images/furniture/advertisement/1.jpg"
                     title="查看家具家饰广告" style="display: block">
                <img src="./images/furniture/advertisement/2.jpg" title="查看衣服广告">
                <img src="./images/furniture/advertisement/3.jpg" title="查看衣服广告">
                <img src="./images/furniture/advertisement/4.jpg" title="查看衣服广告">
                <img src="./images/furniture/advertisement/5.jpg" title="查看衣服广告">
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
        	<div id="shoes_container" class="goods-container">
        		
        	</div>
            <h4>鞋靴专栏</h4>
            <div><img src="./images/shoes/shoes/001.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/shoes/002.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/shoes/003.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/shoes/004.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/shoes/005.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/shoes/006.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/shoes/007.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>箱包专栏</h4>
            <div><img src="./images/shoes/bags/001.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/bags/002.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/bags/003.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/bags/004.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/bags/005.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/bags/006.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/bags/007.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>配件专栏</h4>
            <div><img src="./images/shoes/music/001.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/music/002.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/music/003.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/music/004.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/music/005.jpg" alt=""><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/music/001.jpg" alt="暂无商品"><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
            <div><img src="./images/shoes/music/002.jpg" alt="暂无商品"><a href="./html/goodsDetail.html" target="_blank">查看详情</a></div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content3">
            <h4>数码专栏</h4>
            <div>数码</div>
            <div>数码</div>
            <div>数码</div>
            <div>数码</div>
            <div>数码</div>
            <div>数码</div>
            <div>数码</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>家电专栏</h4>
            <div>家电</div>
            <div>家电</div>
            <div>家电</div>
            <div>家电</div>
            <div>家电</div>
            <div>家电</div>
            <div>家电</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>手机专栏</h4>
            <div>手机</div>
            <div>手机</div>
            <div>手机</div>
            <div>手机</div>
            <div>手机</div>
            <div>手机</div>
            <div>手机</div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content4">
            <h4>美妆专栏</h4>
            <div>美妆</div>
            <div>美妆</div>
            <div>美妆</div>
            <div>美妆</div>
            <div>美妆</div>
            <div>美妆</div>
            <div>美妆</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>洗护用品专栏</h4>
            <div>洗护用品</div>
            <div>洗护用品</div>
            <div>洗护用品</div>
            <div>洗护用品</div>
            <div>洗护用品</div>
            <div>洗护用品</div>
            <div>洗护用品</div>
             
			<p class="line"><img src="./images/components/line.png"></p> 
            <h4>保健品专栏</h4>
            <div>保健品</div>
            <div>保健品</div>
            <div>保健品</div>
            <div>保健品</div>
            <div>保健品</div>
            <div>保健品</div>
            <div>保健品</div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content5">
            <h4>珠宝专栏</h4>
            <div>珠宝</div>
            <div>珠宝</div>
            <div>珠宝</div>
            <div>珠宝</div>
            <div>珠宝</div>
            <div>珠宝</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>眼镜专栏</h4>
            <div>眼镜</div>
            <div>眼镜</div>
            <div>眼镜</div>
            <div>眼镜</div>
            <div>眼镜</div>
            <div>眼镜</div>
            <div>眼镜</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>手表专栏</h4>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content6">
            <h4>运动专栏</h4>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>户外专栏</h4>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>乐器专栏</h4>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content7">
            <h4>房产专栏</h4>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>装修专栏</h4>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>材料专栏</h4>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content8">
            <h4>汽车专栏</h4>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>二手车专栏</h4>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>汽车用品专栏</h4>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
             
        </div>
        <div class="femaleClothes tab-pane fade in" id="content9">
            <h4>家具专栏</h4>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
            <div>鞋靴</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>家饰专栏</h4>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
            <div>箱包</div>
             
            <p class="line"><img src="./images/components/line.png"></p> 
            <h4>家纺专栏</h4>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
            <div>配件</div>
             
        </div>
    </div>
    <%@ include file="Footer.jsp" %>
</div>
</body>
</html>