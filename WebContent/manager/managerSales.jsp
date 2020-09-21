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
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">书籍销售情况</h>
		
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<table class="table table-bordered table-hover"
			style="margin-left: 16px;">
			<tr>
				<th style="width: 5%">书籍编号</th>
				<th style="width: 10%">书籍图片</th>
				<th style="width: 10%">书籍名称</th>
				<th style="width: 10%">书籍类型</th>
				<th style="width: 5%">书籍作者</th>
				<th style="width: 10%">书籍出版社</th>
				<th style="width: 5%">销量</th>
			</tr>
			<c:forEach items="${sales}" var="s" varStatus="vs">
				<tr class="active">
					<td>${vs.index+1}</td>
					<td><img style="width: 80px; height: 100px"
						src="<%=basePath%>/images/${s.path}/${s.filename}" />
					</td>
					<td>《${s.book_name}》</td>
					<td>${s.category.category_name}</td>
					<td>${s.book_author}</td>
					<td>${s.book_press}</td>
					<td style="color: red"><strong>${s.book_xiaonumber}</strong></td>
				</tr>
			</c:forEach>
		</table>

	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>