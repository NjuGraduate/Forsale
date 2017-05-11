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
    <title>创建店铺</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/BuildShop.css">
    <script src="js/jquery-3.1.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>

</head>
<body>
    <div class="container">
        <%@ include file="Header.jsp" %>
        <div class="buildShopContainer">
            <h3>欢迎创建您的店铺</h3>
            <img src="images/components/line.png" alt="" class="lineInContainer">
            <form role="form" action="shopInfo/addShop.do" method="post">
                <div class="formDiv">
                    <div class="form-group">
                        <label for="name">店名</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的店铺名，最多不超过十个字" maxlength="10">
                    </div>
                    <div class="form-group">
                        <label for="need">店铺描述</label>
                        <input type="text" class="form-control" id="need" name="need" placeholder="请输入您店铺的描述，最多不超过30个字" maxlength="30">
                    </div>
                </div>
                <button type="submit" class="btn btn-default" id="subBtn">提交</button>
            </form>
        </div>
        <div class="buildSHopPos"></div>
		<%@ include file="Footer.jsp" %>
    </div>
</body>
</html>