<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息修改</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/UserInfoDetail.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
    <script src="js/accordion.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/bootstrap-datetimepicker.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-left">
                <span>Hi! Welcome to Forsale</span>
                <span><a href="./login.html">请登录</a></span>
                <span><a href="./register.html">免费注册</a></span>
            </div>
            <div class="header-right">
                <ul id="menu">
                    <li>
                        <a href="">二手网首页</a>
                        <ul><li><a href="index.html">回到首页</a></li></ul>
                    </li>
                    <li>
                        <a href="">我的二手</a>
                        <ul id="myForSale">
                            <li><a href="">我的二手</a></li>
                            <li><a href="">已买的二手</a></li>
                            <li><a href="">我要置换</a></li>
                            <li><a href="">浏览足迹</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">购物车</a>
                        <ul id="myCart">
                            <li><a href="">查看我的购物车</a></li>
                            <li><a href="">近期购入</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">卖家中心</a>
                        <ul id="seller">
                            <li><a href="">我的卖品</a></li>
                            <li><a href="">我的店铺</a></li>
                            <li><a href="">已卖出的宝贝</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">联系客服</a>
                        <ul id="serviceCenter">
                            <li><a href="">卖家客服</a></li>
                            <li><a href="">买家客服</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">用户指南</a>
                        <ul id="guideBook">
                            <li><a href="">卖家指南</a></li>
                            <li><a href="">买家指南</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="nav nav-tabs useTab">
            <img src="./images/userLogo/logo1.jpg" class="userLogo">
            <div class="design" id="leftColumn">
                <ul id="myTab">
                    <li class="active"><a href="#xw1" data-toggle="tab">个人资料<span>&raquo;</span></a></li>
                    <li><a href="#xw2" data-toggle="tab">密码修改<span>&raquo;</span></a></li>
                    <li><a href="#xw3" data-toggle="tab">个人交易信息<span>&raquo;</span></a></li>
                    <li><a href="#xw4" data-toggle="tab">我的积分<span>&raquo;</span></a></li>
                    <li><a href="#xw5" data-toggle="tab">退款维护<span>&raquo;</span></a></li>
                    <li><a href="#xw6" data-toggle="tab">举报中心<span>&raquo;</span></a></li>
                </ul>
            </div>
        </div>
        <div class="userInfoDetailMapper">
            <p class="detailTitle">您的基本信息</p>
            <div class="detailBase">
                <p>用户名：</p>
                <p>登录邮箱：</p>
                <p>绑定手机：</p>
            </div>
            <img src="./images/components/line.png" class="line">
            <p class="detailTitle">您的安全服务</p>
            <div class="detailBase">
                <div id="accordion">
                    <h2>实名认证 <span>查看</span></h2>
                    <div>
                        <p>用于提升账号的安全性和信任级别。认证后的有卖家记录的账号不能修改认证信息。</p>
                    </div>
                    <h2>登录密码 <span>修改密码</span></h2>
                    <div>
                        <p>
                            安全性高的密码可以使账号更安全。建议您定期更换密码，且设置一个包含数字和字母，并长度超过6位以上的密码。
                        </p>
                    </div>
                    <h2>密保问题<span>设置</span></h2>
                    <div>
                        <p>
                            是您找回登录密码的方式之一。建议您设置一个容易记住，且最不容易被他人获取的问题及答案，更有效保障您的密码安全。
                        </p>
                    </div>
                    <h2>绑定手机 <span>设置</span></h2>
                    <div>
                        <p>
                            绑定手机后，您即可享受淘宝丰富的手机服务，如手机找回密码等。
                        </p>
                    </div>
                </div>
            </div>
            <img src="./images/components/line.png" class="line">
            <div class="tab-content">
                <div class="tab-pane active fade in" id="xw1">
                    <p><strong>个人资料</strong></p>
                    <p>请您输入准确的个人信息便于您完成交易<p/>
                    当前头像：<img src="./images/userLogo/logo1.jpg" class="userLogo"><br><br>
                    当前昵称：<input type="text" placeholder="查无此人"><br><br>
                    真实姓名：<input type="text" placeholder="刘昌鑫"><br><br>
                    <form>
                        性&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;
                        <input type="radio" name="sex" value="男" checked>男
                        <input type="radio" name="sex" value="女">女
                    </form><br>
                    出生日期：
                    <input type="text" value="2012-05-15 21:05" id="datetimepicker" data-date-format="yyyy-mm-dd hh:ii">
                    <br><br>
                    <button class="btn btn-primary">保存</button>
                </div>
                <div class="tab-pane fade in" id="xw2">
                    <p>密码修改</p>
                    当前密码：<input type="password" placeholder="请输入当前密码···"><br><br>
                    新&nbsp;密&nbsp;码&nbsp;： <input type="password" placeholder="请输入新密码"><br><br>
                    重复密码： <input type="password" placeholder="请再次输入新密码"><br><br>
                </div>
                <div class="tab-pane fade in" id="xw3"><p>个人交易信息</p></div>
                <div class="tab-pane fade in" id="xw4"><p>我的积分</p></div>
                <div class="tab-pane fade in" id="xw5"><p>退款维护</p></div>
                <div class="tab-pane fade in" id="xw6"><p>举报中心</p></div>
            </div>
        </div>
        <div class="footerWrapper">
            <footer class="container-fluid foot-wrap">
                <div class="row">
                    <div class="row-content col-lg-3 col-sm-3 col-xs-6">
                        <h3>关于我们</h3>
                        <ul>
                            <li><a href="#">客服中心</a></li>
                            <li><a href="#">用户须知</a></li>
                        </ul>
                    </div>
                    <div class="row-content col-lg-3 col-sm-3 col-xs-6">
                        <h3>浏览器支持</h3>
                        <ul>
                            <li><a href="#">opera</a></li>
                            <li><a href="#">chrome</a></li>
                            <li><a href="#">ie8+</a></li>
                        </ul>
                    </div>
                    <div class="row-content col-lg-3 col-sm-3 col-xs-6">
                        <h3>举报中心</h3>
                        <ul>
                            <li><a href="#">联系电话</a></li>
                            <li><a href="#">官方QQ</a></li>
                        </ul>
                    </div>
                    <div class="row-content col-lg-3 col-sm-3 col-xs-6">
                        <h3>合作伙伴</h3>
                        <ul>
                            <li><a href="#">阿里巴巴</a></li>
                            <li><a href="#">58同城</a></li>
                        </ul>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script type="text/javascript">
        $('#datetimepicker').datetimepicker();
    </script>
</body>
</html>
