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
<title>结算页面</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="/comm/head-nav.jsp"></jsp:include>
	
	<div style="margin-left: 30%; margin-top: 160px">
		<table>
			<td style="width: 400px">订单编号：${order.ordernum}</td>
			<td style="width: 400px">创建时间：${order.time}</td>
		</table>
	</div>
	<div >
		<img src="<%=basePath%>images/scanCode.jpg" width="250px" style ="display:block;margin:0 auto;"></img>
		<div style="margin-left: 47%">
			<strong><span
				style="color: rgb(255, 102, 0); font-size: 30px;">￥${order.money}</span></strong>
		</div>
	</div>
</body>
</html>