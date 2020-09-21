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
<title>销售订单管理</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD;overflow-x: hidden;">

	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">销售订单管理</h>
		
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<table class="table table-bordered table-hover"
		style="margin-left: 16px;">
		<tr>
			<th style="width: 5%">序号</th>
			<th style="width: 15%">订单编号</th>
			<th style="width: 10%">创建时间</th>
			<th style="width: 10%">客户账号</th>
			<th style="width: 5%">商品数量</th>
			<th style="width: 5%">支付金额</th>
			<th style="width: 5%">订单状态</th>
			<th style="width: 5%">操作</th>
		</tr>
		<c:forEach items="${orders}" var="os" varStatus="vs">
			<tr class="active">
				<td>${vs.index+1}</td>
				<td>${os.ordernum}</td>
				<td>${os.time}</td>
				<td>${os.user.username}</td>
				<td>${os.quantity}</td>
				<td>${os.money}</td>
				<c:if test="${os.status==0}">
					<td>未发货</td>
					<td><a href="javascript:fahuo('${os.ordernum}')">发货</a></td>
				</c:if>
				<c:if test="${os.status==1}">
					<td>已发货</td>
					<td><a href="#">删除</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function fahuo(ordernum) {
			window.location.href = "${pageContext.request.contextPath}/order/OrderServlet?op=faHuo&ordernum="
					+ ordernum;
			alert("发货成功！！");
		}
	</script>
</body>
</html>