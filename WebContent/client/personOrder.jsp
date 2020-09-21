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
<title>我的订单</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/ajaxUtil.js"></script>
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">
	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">我的订单</h>
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<table class="table table-bordered table-hover"
		style="margin-left: 16px; width: 1530px">
		<tr>
			<th style="width: 5%">序号</th>
			<th style="width: 15%">订单编号</th>
			<th style="width: 15%">创建时间</th>
			<th style="width: 5%">商品数量</th>
			<th style="width: 5%">支付金额</th>
			<th style="width: 10%">订单状态</th>
			<th style="width: 10%">操作</th>
		</tr>
		<c:forEach items="${orders}" var="os" varStatus="vs">
			<tr class="active">
				<td>${vs.index+1}</td>
				<td>${os.ordernum}</td>
				<td>${os.time}</td>
				<td>${os.quantity}</td>
				<td>${os.money}</td>
				<c:if test="${os.status==0}">
					<td>等待发货</td>
				</c:if>
				<c:if test="${os.status==1}">
					<td>已发货</td>
				</c:if>
				<td><a href="#">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>