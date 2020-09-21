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
<title>新增书籍分类信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">

	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">新增书籍分类信息</h>
		
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<form style="margin-top: 50px; margin-left: 300px"
		action="<%=basePath%>/manager/ManagerServlet?op=addCategory"
		method="post">
		<div class="form-group">
			<label>书籍分类名称：</label> <input type="text" class="form-control"
				id="category_name" name="category_name" placeholder="书籍分类名称"
				style="width: 700px">
		</div>
		<div class="form-group">
			<label>书籍分类描述：</label>
			<textarea class="form-control" rows="3" id="category_desc"
				name="category_desc" placeholder="书籍分类描述" style="width: 700px"></textarea>
		</div>
		<br>
		<button type="submit" class="btn btn-primary">提交</button>
		<button type="button" class="btn btn-default" data-dismiss="modal"
			style="margin-left: 100px"
			onclick="window.location='managerIndex.jsp'">关闭</button>
	</form>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>

