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
	                    	<li>
	                        	<div class="linkDiv">
	                            	<a href="#xw4" data-toggle="tab">举报管理</a>
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
						      	<th>姓名</th>
						      	<th>修改</th>
						      	<th>踢出</th>
						    	</tr>
						  	</thead>
						  	<tbody>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td><button class="btn-primary">修改</button></td>
						      	<td><button class="btn-danger">踢出</button></td>
						    	</tr>
						        <tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td><button class="btn-primary">修改</button></td>
						      	<td><button class="btn-danger">踢出</button></td>
						    	</tr>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
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
						      	<th>卖家</th>
						      	<th>账号</th>
						      	<th>姓名</th>
						      	<th>查看</th>
						      	<th>通过</th>
						      	<th>不通过</th>
						    	</tr>
						  	</thead>
						  	<tbody>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td><button class="btn-primary">查看</button></td>
						      	<td><button class="btn-primary">通过</button></td>
						      	<td><button class="btn-danger">不通过</button></td>
						    	</tr>
						        <tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td><button class="btn-primary">查看</button></td>
						      	<td><button class="btn-primary">通过</button></td>
						      	<td><button class="btn-danger">不通过</button></td>
						    	</tr>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
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
		            <div class="tab-pane" id="xw4">
		                <table class="table table-hover">
							<caption>举报列表</caption>
						  	<thead>
						    	<tr>
						      	<th>举报者</th>
						      	<th>账号</th>
						      	<th>姓名</th>
						      	<th>被举报者</th>
						      	<th>帐号</th>
						      	<th>举报原因</th>
						      	<th>查看</th>
						    	</tr>
						  	</thead>
						  	<tbody>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td>朱子威</td>
						      	<td>zzw@nju.edu.cn</td>
						      	<td>太丑了</td>
						      	<td><button class="btn-danger">查看</button></td>
						    	</tr>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td>朱子威</td>
						      	<td>zzw@nju.edu.cn</td>
						      	<td>太丑了</td>
						      	<td><button class="btn-danger">查看</button></td>
						    	</tr>
						    	<tr>
						      	<td>LCX</td>
						      	<td>lcx@nju.edu.cn</td>
						      	<td>刘昌鑫</td>
						      	<td>朱子威</td>
						      	<td>zzw@nju.edu.cn</td>
						      	<td>太丑了</td>
						      	<td><button class="btn-danger">查看</button></td>
						    	</tr>
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