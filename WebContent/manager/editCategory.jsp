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
<title>编辑分类信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/ajaxUtil.js"></script>
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">
	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">编辑分类信息</h>
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<div style="margin-top: 50px; margin-left: 300px">
		<form action="<%=basePath%>manager/ManagerServlet?op=editCategory"
			method="post">
			<div class="form-group">
				<input type="hidden" class="form-control" id="category_id"
					name="category_id" value="${category.category_id}"
					style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍分类名称：</label> <input type="text" class="form-control"
					id="category_name" name="category_name"
					value="${category.category_name}" style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍分类描述：</label> <input type="text" class="form-control"
					id="category_desc" name="category_desc"
					value="${category.category_desc}" style="width: 700px">
			</div>
			<br>
			<button type="submit" class="btn btn-primary" >提交</button>
			<button type="button" class="btn btn-default" data-dismiss="modal"
				style="margin-left: 100px" onclick="javascript :history.go(-1);">关闭</button>
		</form>
	</div>
	
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>