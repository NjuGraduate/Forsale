<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>ForSale 登录</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/master.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    
    <script>
    	$.getJSON({
    		url:"userinfo/getAllUsers.do",
    		success: user
    	});
    	
    	function user(json){
    		let data = JSON.parse(json);
    		let userBody = document.getElementsByClassName("userBody")[0];
    		for(var i = 0; i <data.length; i++){
    			let usertr = document.createElement("tr");
    			let username = document.createElement("td");
    			username.innerHTML = data[i].name;
    			let userAccount = document.createElement("td");
    			userAccount.innerHTML = data[i].account;
    			
    			let userChange = document.createElement("td");
    			let changeBtn = document.createElement("button");
    			changeBtn.innerHTML = "修改";
    			changeBtn.classList.add("btn-primary");
    			userChange.appendChild(changeBtn);
    			
    			let userDelete = document.createElement("td");
    			let deleteBtn = document.createElement("button");
    			deleteBtn.innerHTML = "踢出";
    			deleteBtn.classList.add("btn-danger");
    			userDelete.appendChild(deleteBtn);
    			
    			usertr.appendChild(username);
    			usertr.appendChild(userAccount);
    			usertr.appendChild(userChange);
    			usertr.appendChild(userDelete);
				userBody.appendChild(usertr);    			
    		}
    	}
    	
    	$.getJSON({
    		url:"advertisementInfo/manageAds.do",
    		success: advertisement
    	});
    	function advertisement(json){
    		let data = JSON.parse(json);
    		let adBody = document.getElementsByClassName("advertisementBody")[0];
    		for(var i = 0; i <data.length; i++){
    			
    			let adtr = document.createElement("tr");
    			
    			let adId = document.createElement("td");
    			adId.innerHTML = data[i].id;
    			
    			let adAccount = document.createElement("td");
    			adAccount.innerHTML = data[i].seller_account;
    			
    			let adCheck = document.createElement("td");
    			let checkBtn = document.createElement("button");
    			checkBtn.innerHTML = "查看";
    			checkBtn.classList.add("btn-primary");
    			let adA = document.createElement("a");
    			adA.href= "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    			adA.appendChild(checkBtn);
    			adCheck.appendChild(adA);
    			
    			let adagree = document.createElement("td");
    			let agreeBtn = document.createElement("button");
    			agreeBtn.innerHTML = "通过";
    			agreeBtn.classList.add("btn-primary");
    			adagree.appendChild(agreeBtn);
    			
    			let adDeny = document.createElement("td");
    			let denyBtn = document.createElement("button");
    			denyBtn.innerHTML = "删除";
    			denyBtn.classList.add("btn-danger");
    			adDeny.appendChild(denyBtn);
    			
    			adtr.appendChild(adId);
    			adtr.appendChild(adAccount);
    			adtr.appendChild(adCheck);
    			adtr.appendChild(adagree);
    			adtr.appendChild(adDeny);
    			adBody.appendChild(adtr);    			
    		}
    	}
    	
    	$.getJSON({
    		url:"commodityInfo/getAllCommodities.do",
    		success: commodities
    	});
		
    	function commodities(json){
    		let data = JSON.parse(json);
    		let comBody = document.getElementsByClassName("commodityBody")[0];
    		for(var i = 0; i <data.length; i++){
    			
    			let comtr = document.createElement("tr");
    			
    			let comId = document.createElement("td");
    			comId.innerHTML = data[i].id;
    			
    			let comAccount = document.createElement("td");
    			comAccount.innerHTML = data[i].seller_account;
    			
    			let comDes = document.createElement("td");
    			comDes.innerHTML = data[i].des;
    			
    			let comCheck = document.createElement("td");
    			let comBtn = document.createElement("button");
    			comBtn.innerHTML = "查看";
    			comBtn.classList.add("btn-primary");
    			let adA = document.createElement("a");
    			adA.href= "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    			adA.appendChild(comBtn);
    			comCheck.appendChild(adA);
    			
    			let comDeny = document.createElement("td");
    			let denyBtn = document.createElement("button");
    			denyBtn.innerHTML = "删除";
    			denyBtn.classList.add("btn-danger");
    			
    			denyBtn.onclick = function(){deleteCommodity(data[i].id)}
    			
    			comDeny.appendChild(denyBtn);
    			
    			comtr.appendChild(comId);
    			comtr.appendChild(comAccount);
    			comtr.appendChild(comDes);
    			comtr.appendChild(comCheck);
    			comtr.appendChild(comDeny);
    			comBody.appendChild(comtr);    			
    		}
    	}
    	
    	function deleteCommodity(id){
    		$.post({
    			url:"commodityInfo/removeCommodity.do",
    			data: { id: id },
    			success:refresh
    		})
    	}
    	function refresh(){
    		window.location.reload();
    	}
    	
    	
    	
    	$.getJSON({
    		url:"advertisementInfo/getAllAds.do",
    		success: advertisement2
    	});
    	function advertisement2(json){
    		let data = JSON.parse(json);
    		let adBody = document.getElementsByClassName("advertisementBody2")[0];
    		for(var i = 0; i <data.length; i++){
    			
    			let adtr = document.createElement("tr");
    			
    			let adId = document.createElement("td");
    			adId.innerHTML = data[i].id;
    			
    			let adAccount = document.createElement("td");
    			adAccount.innerHTML = data[i].seller_account;
    			
    			let adCheck = document.createElement("td");
    			let checkBtn = document.createElement("button");
    			checkBtn.innerHTML = "查看";
    			checkBtn.classList.add("btn-primary");
    			let adA = document.createElement("a");
    			adA.href = "${pageContext.request.contextPath}/commodityInfo/goodsDetail.do?id=" +data[i].id;
    			adA.appendChild(checkBtn);
    			adCheck.appendChild(adA);
    			
    			let adDeny = document.createElement("td");
    			let denyBtn = document.createElement("button");
    			denyBtn.innerHTML = "删除";
    			denyBtn.classList.add("btn-danger");
    			adDeny.appendChild(denyBtn);
    			
    			denyBtn.onclick = function (){deleteAds(data[i].id)}
    			
    			adtr.appendChild(adId);
    			adtr.appendChild(adAccount);
    			adtr.appendChild(adCheck);
    			adtr.appendChild(adDeny);
    			adBody.appendChild(adtr);    			
    		}
    	}
    	
    	function deleteAds(id){
    		$.post({
    			url:"managerActionInfo/reviewAdFail.do",
    			data: { id: id },
    			success:refresh
    		})
    	}
    	
    </script>

</head>
<body>
	<div class="container">
		<%@ include file="Header.jsp" %>
		<div>
			<div class="masterPanel">
	        	<div class="nav nav-tabs manageTab">
	            	<h3>ForSale 管理员操作平台</h3>
	            	<div class="design" id="leftColumn">
	                	<ul id="myTab">
	                    	<li class="active">
	                        	<div class="linkDiv">
	                            	<a href="#xw1" data-toggle="tab">用户管理</a>
	                        	</div>
	                    	</li>
	                    	<li>
	                        	<div class="linkDiv">
	                            	<a href="#xw2" data-toggle="tab">广告审核</a>
	                        	</div>
	                    	</li>
	                    	<li>
	                        	<div class="linkDiv">
	                            	<a href="#xw3" data-toggle="tab">商品管理</a>
	                        	</div>
	                    	</li>
	                    	<li>
	                        	<div class="linkDiv">
	                            	<a href="#xw4" data-toggle="tab">广告管理</a>
	                        	</div>
	                    	</li>
	                	</ul>
	            	</div>
	        	</div>
	    	</div>
		    <div class="manageContainer">
		        <div class="tab-content">
		            <div class="tab-pane active fade in" id="xw1">
			        	<table class="table table-hover">
							<caption>用户列表</caption>
						  	<thead>
						    	<tr>
						      	<th>用户名</th>
						      	<th>账号</th>
						      	<th>修改</th>
						      	<th>踢出</th>
						    	</tr>
						  	</thead>
						  	<tbody class="userBody">
						    	
						  </tbody>
						</table>
		            </div>
		            <div class="tab-pane" id="xw2">
		                <table class="table table-hover">
							<caption>广告列表</caption>
						  	<thead>
						    	<tr>
						      	<th>商品ID</th>
						      	<th>卖家账号</th>
						      	<th>查看</th>
						      	<th>通过</th>
						      	<th>删除</th>
						    	</tr>
						  	</thead>
						  	<tbody class="advertisementBody">
						    	
						  	</tbody>
						</table>
		            </div>
		            <div class="tab-pane" id="xw3">
		             	<table class="table table-hover">
		             		<caption>商品列表</caption>
		             		<thead>
		             			<tr>
						      	<th>商品ID</th>
						      	<th>卖家账号</th>
						      	<th>商品描述</th>
						      	<th>查看</th>
						      	<th>删除</th>
						    	</tr>
		             		</thead>
		             		<tbody class="commodityBody">
		             			
		             		</tbody>
		             	</table>
		            </div>
		            <div class="tab-pane" id="xw4">
		                <table class="table table-hover">
							<caption>广告列表</caption>
						  	<thead>
						    	<tr>
						      	<th>商品ID</th>
						      	<th>卖家账号</th>
						      	<th>查看</th>
						      	<th>删除</th>
						    	</tr>
						  	</thead>
						  	<tbody class="advertisementBody2">
						    	
						  	</tbody>
						</table>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="pos"></div>
		<%@ include file="Footer.jsp" %>
	</div>
</body>
</html>