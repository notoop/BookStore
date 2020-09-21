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
<title>用户信息编辑</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">
	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">用户信息编辑</h>
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<div style="margin-top: 50px; margin-left: 300px">
		<form action="<%=basePath%>/manager/ManagerServlet?op=editUser"
			method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">用户名：</label> <input
					class="form-control" type="text" id="username" name="username" value="${user.username}"
					 readonly
					style="width: 700px">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">名字：</label> <input
					class="form-control" type="text" id="name" name="name"
					value="${user.name}" style="width: 700px">
			</div>
			<label for="Ssex">性别:</label> 
			<c:if test="${user.sex =='男'}">
			<input type="radio" name="sex" value="男" checked="checked">男
			<input type="radio" name="sex" value="女">女
			</c:if>
			<c:if test="${user.sex=='女'}">
			<input type="radio" name="sex" value="男">男
			<input type="radio" name="sex" value="女" checked="checked">女
			</c:if>
			 <br>
			<div class="form-group">
				<label for="exampleInputEmail1">电话号码：</label> <input
					class="form-control" type="text" id="tel" name="tel"
					value="${user.tel}" style="width: 700px">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">地址：</label> <input
					class="form-control" type="text" id="address" name="address"
					value="${user.address}" style="width: 700px">
			</div>
			<br>
			<button type="submit" class="btn btn-primary" style="margin-left: 220px">提交</button>
			<button type="button" class="btn btn-default" data-dismiss="modal"
				style="margin-left: 100px"
				onclick="javascript :history.go(-1);">后退</button>
		</form>
	</div>

	
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>