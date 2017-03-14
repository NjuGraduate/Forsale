<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	
  </head>
  
  <body>
  
      
  
       <table>
             <tr><td>用户编号</td><td>用户名</td><td>用户邮箱</td><td>phone</td></tr>
             <c:forEach items="${alluser}" var="user">
             
                  <tr><td>${user.userId}</td><td>${user.userName}</td><td>${user.email}</td><td>${user.phone}</td></tr>
             
             </c:forEach>
       
       </table>
  </body>
</html>
