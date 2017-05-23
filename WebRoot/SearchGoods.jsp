<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>搜索商品</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/advertisement.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <!--content的各种样式表-->
    <link rel="stylesheet" href="css/indexContent/clothes.css">
    <link rel="stylesheet" href="css/search.css">

    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script>
	    $(document).ready(function () {
	    	goodsShow(${list}); 
		});
	    function goodsShow(list){
		    let searchContainer = document.getElementsByClassName("searchContainer")[0];
	    	for(let item of list){ 
	    		let div = document.createElement("div");
	    		div.classList.add("searchRes");
		    	let img = document.createElement("img");
		    	img.src = item.pic;
		    	let p = document.createElement("p");
		    	p.innerHTML = item.des;
		    	div.appendChild(img);
		    	div.appendChild(p);
		    	searchContainer.appendChild(div);
	    	}
	    }
    </script>
   
</head>
<body>
	<div class="container">
		<%@ include file="Header.jsp" %>
	    <div class="searchContainer">
	    </div>
		<%@ include file="Footer.jsp" %>
	</div>
</body>
</html>