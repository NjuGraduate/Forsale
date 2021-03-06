<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<title>ForSale 用户注册</title>
	<link rel="stylesheet" href="css/home.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/form-elements.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="js/jquery-3.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/retina-1.1.0.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/index/checkForm.js"></script>
	<style>
		.container{
			height: 800px;
		}
		#code{
			margin: 5px auto;
		}
		#code input{
			float:right;
		}
		#finish{
			float: right;
		}
	</style>
	<script>
		$(document).ready(function (){
			if( ${msg} == "fail"){
				alert("此账号已注册！"); 
			}else if(${msg} == "fail-email"){
				alert("请使用学生身份注册");
			}
		});
	</script>
</head>
<body>
	<div class="container">
		<div class="header">
			<span>您好！欢迎注册ForSale！</span>
		</div>
		<div class="content">
			<div class="top-content">
				<div class="inner-bg">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2 text">
							<h1><strong>ForSale</strong> 分步注册</h1>
							<div class="description">
								<p>
									您好！欢迎您来到ForSale二手交易网站，在这里您可以出售您的闲置物品，也可以以
									低价买入您需要的物品。祝您在ForSale得偿所愿。
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3 form-box">
								<form role="form" action="userinfo/validate.do" method="post" class="registration-form" onsubmit="return checkForm()">
									<fieldset>
										<div class="form-top">
											<div class="form-top-left">
												<h3>Step 1 / 2</h3>
												<p>请输入您的姓名和简介：</p>
											</div>
											<div class="form-top-right">
												<i class="fa fa-user"></i>
											</div>
										</div>
										<div class="form-bottom">
											<div class="form-group">
												<label class="sr-only" for="form-first-name">姓：</label>
												<input type="text" name="form-first-name" placeholder="姓：" class="form-first-name form-control" id="form-first-name">
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-last-name">名：</label>
												<input type="text" name="form-last-name" placeholder="名：" class="form-last-name form-control" id="form-last-name">
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-about-yourself">介绍一下自己吧！</label>
												<textarea name="form-about-yourself" placeholder="介绍一下自己吧！"
														  class="form-about-yourself form-control" id="form-about-yourself"></textarea>
											</div>
											<button type="button" class="btn btn-next">下一步</button>
										</div>
									</fieldset>
									<fieldset>
										<div class="form-top">
											<div class="form-top-left">
												<h3>Step 2 / 2</h3>
												<p>设置您的账户信息：</p>
											</div>
											<div class="form-top-right">
												<i class="fa fa-key"></i>
											</div>
										</div>
										<div class="form-bottom">
											<div class="form-group">
												<label class="sr-only" for="form-email">Email</label>
												<input type="text" name="form-email" placeholder="邮箱地址：" class="form-email form-control" id="form-email" onblur="checkUserEmail()">
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-password">Password</label>
												<input type="password" name="form-password" placeholder="密码：" class="form-password form-control" id="form-password">
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-repeat-password">Repeat password</label>
												<input type="password" name="form-repeat-password" placeholder="确认密码："
													   class="form-repeat-password form-control" id="form-repeat-password">
											</div>
											<button type="button" class="btn btn-previous">上一步</button>
											<button type="submit" class="btn submit">去验证</button>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>