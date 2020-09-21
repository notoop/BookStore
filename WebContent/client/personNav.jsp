<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心导航</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color: #BBBBBB;text-align:center;">
		<div style="height:70px;border-bottom: #DDDDDD 1px solid;"><h3 style="color:#666666;letter-spacing:3px;margin-top:30px;font-weight:bolder;">个人中心</h3></div>
		<ul class="nav nav-pills nav-stacked" style="text-align: center; letter-spacing: 4px; font-weight: bold; font-size:17px;background-color: #CCCCCC;margin-top:5px">
			<li role="presentation"><a href="personInfo.jsp" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-user"></span>修改个人信息</a></li>
			<li role="presentation"><a href="personPWD.jsp" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-lock"></span>修改登录密码</a></li>
			<li role="presentation"><a href="<%=basePath%>order/OrderServlet?op=findAllOrders" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-list"></span>我的订单管理</a></li>
		</ul>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>