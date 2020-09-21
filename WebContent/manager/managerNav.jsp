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
		<div style="height:70px;border-bottom: #DDDDDD 1px solid;"><h3 style="color:#666666;letter-spacing:3px;margin-top:30px;font-weight:bolder;">管理员后台</h3></div>
		<ul class="nav nav-pills nav-stacked" style="text-align: center; letter-spacing: 4px; font-weight: bold; font-size:17px;background-color: #CCCCCC;margin-top:5px">
			<li role="presentation"><a href="managerInfo.jsp" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-user"></span>修改个人信息</a></li>
			<li role="presentation"><a href="managerPWD.jsp" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-lock"></span>修改登录密码</a></li>
			<li role="presentation"><a href="<%=basePath%>manager/ManagerServlet?op=loadAll" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-book"></span>维护书籍信息</a></li>
			<li role="presentation"><a href="<%=basePath%>manager/ManagerServlet?op=categoryList" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-bookmark"></span>维护书籍分类</a></li>
			<li role="presentation"><a href="<%=basePath%>manager/ManagerServlet?op=addBookUI" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-list"></span>新增书籍信息</a></li>
			<li role="presentation"><a href="managerAddCategory.jsp" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-align-justify"></span>新增书籍分类</a></li>
			<li role="presentation"><a href="<%=basePath%>order/OrderServlet?op=findOrders" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-list-alt"></span>销售订单管理</a></li>
			<li role="presentation"><a href="<%=basePath%>manager/ManagerServlet?op=findUsers" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-info-sign"></span>用户信息管理</a></li>
			<li role="presentation"><a href="<%=basePath%>manager/ManagerServlet?op=sales" target="content" style="color: #555555;" ><span class = "glyphicon glyphicon-signal"></span>书籍销售情况</a></li>
			
		</ul>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>