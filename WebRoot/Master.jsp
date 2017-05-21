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
    			
    			let userDelete = document.creatwElement("td");
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
    		url:"advertisementInfo/getAllAds.do",
    		success: advertisement
    	});
    	function advertisement(json){
    		let data = JSON.parse(json);
    		let adBody = document.getElementsByClassName("advertisementBody")[0];
    		for(var i = 0; i <data.length; i++){
    			let adtr = document.createElement("tr");
    			let adAccount = document.createElement("td");
    			adAccount.innerHTML = data[i].user_account;
    			
    			let adCheck = document.createElement("td");
    			let checkBtn = document.createElement("button");
    			checkBtn.innerHTML = "查看";
    			checkBtn.classList.add("btn-primary");
    			adCheck.appendChild(checkBtn);
    			
    			let adagree = document.createElement("td");
    			let agreeBtn = document.createElement("button");
    			agreeBtn.innerHTML = "通过";
    			agreeBtn.classList.add("btn-primary");
    			adagree.appendChild(agreeBtn);
    			
    			let adDeny = document.creatwElement("td");
    			let denyBtn = document.createElement("button");
    			denyBtn.innerHTML = "删除";
    			denyBtn.classList.add("btn-danger");
    			adDeny.appendChild(denyBtn);
    			
    			adtr.appendChild(adAccount);
    			adtr.appendChild(adCheck);
    			adtr.appendChild(adagree);
    			adtr.appendChild(adDeny);
    			adBody.appendChild(adtr);    			
    		}
    	}
    	
    	$.getJSON({
    		url:"commodityInfo/getCommodities.do",
    		success: commodities
    	});
		
    	function commodities(json){
    		let data = JSON.parse(json);
    		
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
	                            	<a href="#xw2" data-toggle="tab">广告管理</a>
	                        	</div>
	                    	</li>
	                    	<li>
	                        	<div class="linkDiv">
	                            	<a href="#xw3" data-toggle="tab">商品管理</a>
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
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td><button class="btn-primary">修改</button></td>
						      	<td><button class="btn-danger">踢出</button></td>
						    	</tr>
						  </tbody>
						</table>
		            </div>
		            <div class="tab-pane" id="xw2">
		                <table class="table table-hover">
							<caption>广告列表</caption>
						  	<thead>
						    	<tr>
						      	<th>账号</th>
						      	<th>查看</th>
						      	<th>通过</th>
						      	<th>不通过</th>
						    	</tr>
						  	</thead>
						  	<tbody class="advertisementBody">
						    	<tr>
						      	<td>lcx@nju.edu.cn</td>
						      	<td><button class="btn-primary">查看</button></td>
						      	<td><button class="btn-primary">通过</button></td>
						      	<td><button class="btn-danger">不通过</button></td>
						    	</tr>
						  </tbody>
						</table>
		            </div>
		            <div class="tab-pane" id="xw3">
		                21
		            </div>
		        </div>
		    </div>
		</div>
		<div class="pos"></div>
		<%@ include file="Footer.jsp" %>
	</div>
</body>
</html>