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
<title>维护分类信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/ajaxUtil.js"></script>
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">

	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">维护分类信息</h>
		
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<table class="table table-bordered table-hover" style="width: 100%">
		<tr>
			<th style="width: 100px">序号</th>
			<th style="width: 100px">分类名称</th>
			<th style="width: 100px">分类描述</th>
			<th style="width: 200px">操作</th>
		</tr>
		<c:forEach items="${categories}" var="s" varStatus="vs">
			<tr class="active">
				<td>${vs.index+1}</td>
				<td>${s.category_name}</td>
				<td>${s.category_desc}</td>
				<td><a
					href="<%=basePath%>manager/ManagerServlet?op=editCategoryUI&category_id=${s.category_id}">编辑</a>
					<a
					href="<%=basePath%>manager/ManagerServlet?op=delCategory&category_id=${s.category_id}"
					onclick="if(confirm('确定删除'+'  《${s.category_name}》'+'   分类吗'+'?')===false) return false;">删除</a>
			</tr>
		</c:forEach>
	</table>
	
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>
</body>
</html>