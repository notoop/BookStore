<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	frameset{padding:0px;margin:0px;border:none" } frame{width:100%;padding:0px;margin:0px;border:none;}
</style>
</head>
<frameset rows="68px,*" framespacing="0" frameborder="0" >
		<frame src="../comm/head-nav.jsp" frameborder="0px"  scrolling="No" noresize="noresize" framespacing="0px">
		<frameset cols="300px,*" framespacing="0" frameborder="0" >
			<frame src="personNav.jsp" name="nav"  frameborder="0px"  scrolling="No" noresize="noresize" framespacing="0px">
			<frame src="personContent.jsp" name="content" frameborder="0px"  noresize="noresize" framespacing="0px">
		</frameset>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</frameset>
</html>