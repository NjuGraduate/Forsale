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
    <title>搜索店铺</title>
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
    <link rel="stylesheet" href="css/search.css">

    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script>
    	$(document).ready(function(){
    		shop(${list});
    	});
    	
    	function shop(list){
    		let shopBody = document.getElementsByClassName("shopBody")[0];
    		for(let item of list){ 
				let shoptr = document.createElement("tr");
				
    			let shopId = document.createElement("td");
    			shopId.innerHTML = item.id;
    			
    			let shopName = document.createElement("td");
    			shopName.innerHTML = item.name;
    			
    			let shopAccount = document.createElement("td");
    			shopAccount.innerHTML = item.user_account;
    			
    			let shopCheck = document.createElement("td");
    			let checkBtn = document.createElement("button");
    			checkBtn.innerHTML = "查看";
    			checkBtn.classList.add("btn-primary");
    			let adA = document.createElement("a");
    			adA.href = "${pageContext.request.contextPath}/shopInfo/getShopContent.do?id=" +item.id;
    			adA.appendChild(checkBtn);
    			shopCheck.appendChild(adA);
    			shoptr.appendChild(shopId);
    			shoptr.appendChild(shopName);
    			shoptr.appendChild(shopAccount);
    			shoptr.appendChild(shopCheck);
    			shopBody.appendChild(shoptr); 
    		}
    	}
    </script>
</head>
<body>
	<div class="container">
		<%@ include file="Header.jsp" %>
	    <div class="searchContainer">
	        <table class="table table-hover">
				<caption>广告列表</caption>
				<thead>
					<tr>
						<th>店铺ID</th>
					    <th>店铺名</th>
					    <th>卖家账号</th>
					    <th>查看</th>
					</tr>
				</thead>
				<tbody class="shopBody">
					
				</tbody>
			</table>
	    </div>
		<%@ include file="Footer.jsp" %>
	</div>
</body>
</html>