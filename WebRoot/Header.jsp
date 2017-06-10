<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
    	$(document).ready(function () {
			headerText(${user}); 
		});
		
		function headerText(account){
			let temp = document.getElementsByClassName("header-text1")[0];
			let temp2 = document.getElementsByClassName("header-text2")[0];
			if(!account){
				temp.innerHTML="请登录";
				temp2.innerHTML = "免费注册";
			}else{
				temp.innerHTML = "欢迎您！ "+account.account+" (点击退出登录)";
				temp.href = "${pageContext.request.contextPath}/userinfo/logout.do";
				temp2.innerHTML = "点击重新注册";
				if(account.account == "admin@smail.nju.edu.cn"){
					let user = document.getElementById("checkUser");
					user.innerHTML = "管理员";
					user.href="./Master.jsp";
				}else{
					user.href = "./UserInfoDetail.jsp";
				}
			}
		}
</script>


<div class="header">
        <div class="header-left" >
            <span>Hi! Welcome to Forsale</span>
            <span><a href="./login.jsp" class="header-text1"></a></span>
            <span><a href="./register.jsp" class="header-text2"></a></span>
        </div>
        <div class="header-right">
            <ul id="menu">
                <li>
                    <a href="./index.jsp">二手网首页</a>
                </li>
                <li>
                    <a href="./UserInfoDetail.jsp">我的二手</a>
                    <ul id="myForSale">
                        <li><a href="./Master.jsp" id="checkUser">我的二手</a></li>
                        <li><a href="./Cart.jsp">已买的二手</a></li>
                        <li><a href="./exchangeReq.jsp">我要置换</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./Cart.jsp">购物车</a>
                    <ul id="myCart">
                        <li><a href="./Cart.jsp">查看我的购物车</a></li>
                        <li><a href="./Cart.jsp">近期购入</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./Seller.jsp">卖家中心</a>
                    <ul id="seller">
                        <li><a href="./SellOrNot.jsp">我的卖品</a></li>
                        <li><a href="./Seller.jsp">我的店铺</a></li>
                        <li><a href="./SellOrNot.jsp">已卖出的宝贝</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./UserHelp.jsp">联系客服</a>
                    <ul id="serviceCenter">
                        <li><a href="SellerHelp.jsp">卖家客服</a></li>
                        <li><a href="./UserHelp.jsp">买家客服</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./UserHelp.jsp">用户指南</a>
                    <ul id="guideBook">
                        <li><a href="SellerHelp.jsp">卖家指南</a></li>
                        <li><a href="./UserHelp.jsp">买家指南</a></li>
                    </ul>
                </li>
            </ul>
        </div>
	</div>


