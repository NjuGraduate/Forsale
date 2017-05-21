<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>发起物物置换</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/exchange.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    
    <script>
    	$.getJSON({
    		url:"postInfo/getPost.do",
    		success: showAllExchange
    	});
    	
    	//显示所有置换物品的方法
    	function showAllExchange(json){
    		let data = JSON.parse(json);
    		let container = document.getElementById("xw1");
			if(!json){
    			let div = document.createElement("div");
    			div.classList.add("pos");
    			container.appendChild(div);
    		}
    		for(var i = 0;i<data.length;i++){
    			let exchangeDiv = document.createElement("div");
    			exchangeDiv.classList.add("exchangeGoods");
    			let exchangePic = document.createElement("img");
    			exchangePic.src = data[i].pic;
    			let des = document.createElement("p");
    			des.innerHTML = "我的二手物品："+data[i].des;
    			let desiregoods = document.createElement("p");
    			desiregoods.innerHTML = "我想要的："+data[i].desiregoods;
    			let contact = document.createElement("p");
    			contact.innerHTML = "请联系我："+data[i].contactInf;
    			exchangeDiv.appendChild(exchangePic);
    			exchangeDiv.appendChild(des);
    			exchangeDiv.appendChild(desiregoods);
    			exchangeDiv.appendChild(contact);
    			container.appendChild(exchangeDiv);
    		}
    	}
    </script>

</head>
<body>
<div class="container">
    <%@ include file="Header.jsp" %>
    <div class="input-group">
        <input type="text" class="form-control input-lg">
        <span class="input-group-addon btn btn-primary searchBtn"><strong>搜索</strong></span>
    </div>
    <div class="exchangeTitle">
        <div class="nav nav-tabs exchangeTab" id="tab">
                <h3>欢迎使用物物置换</h3>
                <div class="design" id="leftColumn">
                    <ul id="myTab">
                        <li class="active">
                            <div class="linkDiv">
                                <a href="#xw1" data-toggle="tab">当前所有置换</a>
                            </div>
                        </li>
                        <li>
                            <div class="linkDiv">
                                <a href="#xw2" data-toggle="tab">我要发起置换</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
    </div>
    <div class="exchangeContainer">
        <div class="tab-content">
                <div class="tab-pane active fade in" id="xw1">
                
                </div>
                <div class="tab-pane" id="xw2">
                    <div class="exchangeReq">
                        <form role="form" method="post" enctype="multipart/form-data" action="postInfo/post.do">
                            <div class="form-group">
                                <label for="hold">手头的二手物品</label>
                                <input type="text" class="form-control"  name="exchangeDesc" id="hold" placeholder="请输入您闲置物品的描述,最多不超过30个字" maxlength="30">
                            </div>
                            <div class="form-group">
                                <label for="need">需要的二手物品</label>
                                <input type="text" class="form-control"  name="needDesc" id="need" placeholder="请输入您所需物品的描述，最多不超过30个字" maxlength="30">
                            </div>
                            <div class="form-group">
                                <label for="need">联系方式</label>
                                <input type="text" class="form-control"  name="connect" id="need" placeholder="请留下您的联系方式" maxlength="30">
                            </div>
                            <div class="form-group">
                                <label for="inputfile">请上传你的闲置物品的照片一张</label>
                                <input type="file" id="inputfile"  name="exchangePic">
                            </div>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </form>
                    </div>
                    <div class="pos"></div>
                </div>
            </div>
    </div>
    <div class="position">
        <img src="./images/components/line.png" alt="" width="100%">
    </div>
    <%@ include file="Footer.jsp" %>
</div>

</body>
</html>

