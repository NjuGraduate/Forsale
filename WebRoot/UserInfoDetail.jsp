<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户中心</title>
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
    <script>
    	$(document).ready(function () {
			userText(${user});
			
		});
		function userText(user){
			let pUsername = document.getElementsByClassName("pUsername")[0];
			let pAccount = document.getElementsByClassName("pAccount")[0];
			let pPhone = document.getElementsByClassName("pPhone")[0];
			let userLogo = document.getElementsByClassName("userLogo")[0];
			let userDesc = document.getElementsByClassName("userDesc")[0];
			let userName = document.getElementsByClassName("userName")[0];
			if(!user){
				pUsername.innerHTML = "当前无用户登录";
				pAccount.innerHTML = "当前无用户登录";
				userDesc.innerHTML = "设置昵称";
			}else{
				pUsername.innerHTML ="用  户  名  : "+ user.name;
				pAccount.innerHTML ="当前账户邮箱:  "+ user.account;
				if(!user.phonenumber){
					pPhone.innerHTML = "手机号码： 当前未绑定手机";
				}else{
					pPhone.innerHTML = user.phonenumber;
				}
				userLogo = user.logo;
				userDesc.value = user.des;
				userName.value = user.name;
			}
			
		}
    </script>
</head>
<body>
    <div class="container">
        <%@ include file="Header.jsp" %>
        <div class="nav nav-tabs useTab">
            <img src="./images/userLogo/logo1.jpg" class="userLogo">
            <div class="design" id="leftColumn">
                <ul id="myTab">
                    <li class="active"><a href="#xw1" data-toggle="tab">个人资料<span>&raquo;</span></a></li>
                    <li><a href="#xw2" data-toggle="tab">密码修改<span>&raquo;</span></a></li>
                    <li><a href="#xw3" data-toggle="tab">个人交易信息<span>&raquo;</span></a></li>
                    <li><a href="#xw4" data-toggle="tab">我的积分<span>&raquo;</span></a></li>
                    <li><a href="#xw5" data-toggle="tab">举报中心<span>&raquo;</span></a></li>
                </ul>
            </div>
        </div>
        <div class="userInfoDetailMapper">
            <p class="detailTitle">您的基本信息</p>
            <div class="detailBase">
                <p class="pUsername">用户名：</p>
                <p class="pAccount">登录邮箱：</p>
                <p class="pPhone">绑定手机：</p>
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
	                <form role="form" action="userinfo/update.do" method="post">
	                	<p><strong>个人资料</strong></p>
	                    <p>请您输入准确的个人信息便于您完成交易<p/>
	           	         	当前头像：<img src="./images/userLogo/logo1.jpg" class="userLogo"><br><br>
	                   		个性签名：<input type="text" class="userDesc"><br><br>
	                    	真实姓名：<input type="text" class="userName"><br><br>
	                       	 性&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;
	                    <input type="radio" name="sex" value="男" class="sexMale" checked>男
	                    <input type="radio" name="sex" value="女" class="sexFemale">女
	                    <br>
	                   	 出生日期：
	                    <input type="text" value="1994-09-03" id="datetimepicker" data-date-format="yyyy-mm-dd">
	                    <br><br>
	                    <button class="btn btn-primary" type="submit">保存</button>
	                </form>
                </div>
                <div class="tab-pane fade in" id="xw2">
                	<form role="form" action="userinfo/update.do">
                		<p>密码修改</p>
                    	当前密码：<input type="password" placeholder="请输入当前密码···"><br><br>
                 	  	新&nbsp;密&nbsp;码&nbsp;： <input type="password" placeholder="请输入新密码"><br><br>
                    	重复密码： <input type="password" placeholder="请再次输入新密码"><br><br>
                    	<button class="btn btn-primary" type="submit">确定</button>
                	</form>
                </div>
                <div class="tab-pane fade in" id="xw3"><p>个人交易信息</p></div>
                <div class="tab-pane fade in" id="xw4"><p>我的积分</p></div>
                <div class="tab-pane fade in" id="xw5"><p>举报中心</p></div>
            </div>
        </div>
        <%@ include file="Footer.jsp" %>
    </div>
    <script type="text/javascript">
        $('#datetimepicker').datetimepicker();
    </script>
</body>
</html>
