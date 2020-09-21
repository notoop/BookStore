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
<title>用户信息管理</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD;overflow-x: hidden;">

	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">用户信息管理</h>
		
	</div>
	
	<hr style="color:#FFFFFF;" />
	
		<table class="table table-bordered table-hover"
		style="margin-left: 16px;">
		<tr>
			<th style="width: 5%">序号</th>
			<th style="width: 15%">用户ID</th>
			<th style="width: 5%">用户名</th>
			<th style="width: 10%">密码</th>
			<th style="width: 5%">姓名</th>
			<th style="width: 5%">性别</th>
			<th style="width: 10%">电话号码</th>
			<th style="width: 15%">地址</th>
			<th style="width: 5%">操作</th>
		</tr>
		<c:forEach items="${users}" var="u" varStatus="vs">
			<tr class="active">
				<td>${vs.index+1}</td>
				<td>${u.id}</td>
				<td>${u.username}</td>
				<td>${u.password}</td>
				<td>${u.name}</td>
				<td>${u.sex}</td>
				<td>${u.tel}</td>
				<td>${u.address}</td>
				<td><a href="<%=basePath%>manager/ManagerServlet?op=editUserUI&userId=${u.id}">编辑</a></td>
			</tr>
		</c:forEach>
	</table>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>