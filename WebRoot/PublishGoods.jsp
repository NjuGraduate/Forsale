<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>发布商品</title>
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
    <link rel="stylesheet" href="css/publish.css">

    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/clothes/advertisement.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/checkClasses.js"></script>


</head>
<body>
    <div class="container">
        <%@ include file="Header.jsp" %>
        <div class="publishGoods">
            <div class="formContainer">
                <form role="form">
                    <div class="form-group">
                        <label for="hold" class="desc">描述</label>
                        <input type="text" class="form-control" name="form-goodsDesc" id="hold" placeholder="请输入您闲置物品的描述,最多不超过60个字" maxlength="60">
                    </div>
                    <div class="form-group">
                        <span for="price" class="desc">价格</span>
                        <input type="number" class="form-control" name="form-goodsPrice" id="price" placeholder="请输入您想要设置的价格">
                    </div>
                    <div class="form-group">
                        <span for="price" class="desc">颜色</span>
                        <input type="number" class="form-control" name="form-goodsColor" placeholder="请输入您物品的颜色">
                    </div>
                    <div class="form-group selectGroup">
                        <span for="price" class="desc">选择分类 &nbsp;</span>
                        <div class="btn-group">
                            <button type="button" id="pro" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                一级分类<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" id="proList" ></ul>
                        </div>
                        <!-- Single button -->
                        <div class="btn-group">
                            <button type="button" id="city" name="form-goodsClasses" class="btn btn-info dropdown-toggle" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                                二级分类 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" id="cityList" ></ul>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputfile1" class="desc">请上传你的闲置物品的照片</label>
                        <input type="file" id="inputfile1" class="inputFilePosition"  name="form-goodsLogoPic">
                    </div>
                    <div class="form-group">
                        <label for="inputfile2" class="desc">请上传你的闲置物品的照片</label>
                        <input type="file" id="inputfile2" class="inputFilePosition"  name="form-goodsPic">
                    </div>
                    <button type="submit" class="btn btn-primary subBtn" >提交</button>
                </form>
            </div>
        </div>
        <div class="pos"></div>
        <%@ include file="Footer.jsp" %>
    </div>
</body>
</html>