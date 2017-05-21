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
		
	</script>
</head>
<body>
	<div class="container">
		<div class="header">
			<span>您好！欢迎验证您的账号！</span>
		</div>
		<div class="content">
			<div class="top-content">
				<div class="inner-bg">
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2 text">
							<h1><strong>ForSale</strong> 分步注册</h1>
							<div class="description">
								<p>
									您好！欢迎您来到ForSale二手交易网站，在登录之前请您查看您的邮箱，并在此验证您的账号。
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3 form-box">
								<form role="form" action="userinfo/register.do" method="post" class="registration-form" onsubmit="return checkForm()">
									<div id="code">
										<input type="text" name = "code" placeholder="输入验证码:" class="col-sm-7">
										<button type="submit" class="btn btn-primary col-sm-4" id="code">提交验证码</button>
									</div>
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