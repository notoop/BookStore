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
<title>内容Cover</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">
	<div style="margin:0 auto;width:200px;margin-top:15%">
		<span class = "glyphicon glyphicon-cog" style ="font-size:200px"></span>
	</div>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>