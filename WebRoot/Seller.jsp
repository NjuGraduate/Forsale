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
    <script src="js/myalert.js"></script>
    <script>
    	var shopExist = 0;
    
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
    	
    	function test(id){
    		zdconfirm('确认框','确定删除此商品？',function(r){  
    		     if(r)  
    		      {  
    		         //...点确定之后执行的内容  
    		         $.post({
    					url:"commodityInfo/removeCommodity.do",
    					data: { id: id },
    					success:refresh
    				});
    		      }  
    		    });  
    		
    	}
    	function refresh(){
    		window.location.reload();
    	}
    	
    	
    	function requestAdvertisement(id){
    		zdconfirm('确认框','确定申请广告？',function(r){  
      		     if(r)  
      		      {  
      		         //...点确定之后执行的内容  
      		    	$.post({
      	    			url:"advertisementInfo/addAdvertisement.do",
      	    			data: {id:id}
      	    		});
      		      }  
      		    });
    		
    	}
    	function addShop(id){
    		zdconfirm('确认框','确定加入店铺？',function(r){  
   		     if(r)  
   		      {  
   		         //...点确定之后执行的内容  
   		    	$.post({
	    			url:"shopInfo/getIntoShop.do",
	    			data:{id:id}
	    		});
   		      }  
   		    });  
    	}
    	
    	
    	//我的店铺的判断
    	$.getJSON({
    		url:"shopInfo/getShop.do",
    		success:dealShop
    	});
    	function dealShop(json){
    		let item = JSON.parse(json);
    		if(json == "null"){
    			let add = document.getElementById("addshop");
    			let p = document.createElement("p");
    			p.classList.add("add");
    			p.innerHTML = "您当前暂无店铺，您可以选择";
    			let a = document.createElement("a");
    			a.href = "./BuildShop.jsp";
    			a.innerHTML="创建店铺";
    			a.target = "_blank";
    			p.appendChild(a);
    			add.appendChild(p);
    		}else{
    			shopExist = 1;
   				let shop = document.getElementById("addshop");
       			let table = document.createElement("table");
       			table.classList.add("table");
       			table.classList.add("table-hover");
       			let thead =document.createElement("thead");
       			let tr = document.createElement("tr");
       			let th = document.createElement("th");
       			th.innerHTML = "店铺名";
       			let th2 = document.createElement("th");
       			th2.innerHTML = "店铺描述";
       			let th3 = document.createElement("th");
       			th3.innerHTML = "查看";
       			tr.appendChild(th);
       			tr.appendChild(th2);
       			tr.appendChild(th3);
       			thead.appendChild(tr);
       			table.appendChild(thead);
       			
       			let tbody = document.createElement("tbody");
       			let tr1 = document.createElement("tr");
       			let name = document.createElement("td");
       			name.innerHTML = item.name;
       			let des = document.createElement("td");
       			des.innerHTML = item.des;
       			let che = document.createElement("td");
       			let check = document.createElement("button");
       			check.classList.add("btn-primary");
       			check.innerHTML = "查看";
       			let checkA = document.createElement("a");
       			checkA.href = "${pageContext.request.contextPath}/shopInfo/getShopContent.do?id=" +item.id;
       			checkA.appendChild(check);
       			che.appendChild(checkA);
       			tr1.appendChild(name);
       			tr1.appendChild(des);
       			tr1.appendChild(che);
       			tbody.appendChild(tr1);
       			table.appendChild(thead);
       			table.appendChild(tbody);
       			shop.appendChild(table);
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
            <div id="addshop">
            </div>
        </div>
        <%@ include file="Footer.jsp" %>
    </div>

</body>
</html>
