<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
    	$(document).ready(function () {
			headerText(${user});
			//saveCookie(${user});
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
			}
		}
		//保存表单中的信息到Cookie中
    	function saveCookie(account){
    		// 账户名
        	var accountName = account.account;
        	// 密码
        	var password = account.password;
        	// 描述
        	var desc = account.des;
        	// 名字
        	var name = account.name;
        	
        	alert(accountName+" "+password+" "+desc+" "+name);
        	var date = new Date();
        	date.setTime(date.getTime()+500000);
        	//将cookie保存50秒钟
        	setCookie("accountName",accountName,date.toGMTString(),"","","");
        	setCookie("password",password,date.toGMTString(),"","","");
        	setCookie("desc",desc,date.toGMTString(),"","","")
        	setCookie("name",name,date.toGMTString(),"","","")
        }
        // 设置cookie
       function setCookie(name,value,expires,path,domain,secure){
       		document.cookie=name+"="+encodeURI(value)+
        	((expires) ? "; expires=" + expires : "")+
        	((path) ? "; path=" + path : "")+
        	((domain) ? "; domain=" + domain : "")+
        	((secure) ? "; secure=" + secure : "");
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
                        <li><a href="./UserInfoDetail.jsp">我的二手</a></li>
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


