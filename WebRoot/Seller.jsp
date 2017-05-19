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
    <link rel="stylesheet" href="css/seller.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script>
    	$.getJSON({
    		url:"commodityInfo/getCommodities.do",
    		success:callback
    	});
    	
    	function callback(json) {
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
    			let btn1 = document.createElement("button");
    			btn1.classList.add("btn-primary");
    			btn1.classList.add("btn");
    			btn1.style.width="95%";
    			btn1.style.margin = "5px";
    			btn1.innerHTML = "申请广告";
    			let btn2 = document.createElement("button");
    			btn2.classList.add("btn-danger");
    			btn2.classList.add("btn");
    			btn2.innerHTML = "删除商品";
    			btn2.style.width="95%";
    			btn2.style.margin="5px";
    			
    			let adBtn = document.createElement("a");
    			adBtn.href = "${pageContext.request.contextPath}/commodityInfo/removeCommodity.do?id=" +item.id;
    			btn1.appendChild(adBtn);
    			
    			let deleteA = document.createElement("a");
    			deleteA.href = "${pageContext.request.contextPath}/advertisementInfo/addAdvertisement.do?id=" +item.id;
    			btn2.appendChild(deleteA);
    			
    			div.appendChild(btn1);
    			div.appendChild(btn2);
    			container.appendChild(div);
    			a.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +item.id;
    		}
    	}
    	
    	$.getJSON({
    		url:"/shopInfo/getShop.do",
    		success:shop
    	});
    	function shop(json){
    		if(json != null && json != ""){
    			alert(json);
    		}else{
    			alert("no shops");
    		}
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
            <div id="goodsContainer">
            	
            </div>
            <br>
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
