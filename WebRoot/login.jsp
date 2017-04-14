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
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/retina-1.1.0.min.js"></script>
    <script src="js/loginJS.js"></script>
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
                        <h1><strong>ForSale</strong> 登陆</h1>
                        <div class="description">
                            <p>
                                欢迎您登录ForSale二手交易网站。
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <form role="form" action="userinfo/login.do" method="post" class="login-form">
                                <fieldset>
                                    <div class="form-top">
                                        <div class="form-top-left">
                                            <p>输入您的账户信息：</p>
                                        </div>
                                    </div>
                                    <div class="form-bottom">
                                        <div class="form-group">
                                            <label class="sr-only" for="form-email">Email</label>
                                            <input type="text" name="form-email" placeholder="邮箱地址：" class="form-email form-control" id="form-email">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-password">Password</label>
                                            <input type="password" name="form-password" placeholder="密码：" class="form-password form-control" id="form-password">
                                        </div>
                                        <button type="button" class="btn btn-reg" id="regBtn">注册新用户</button>
                                        <button type="submit" class="btn btn-log">登录</button>
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