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
<title>个人密码修改</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/ajaxUtil.js"></script>
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">
	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">个人密码修改</h>
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<div style="margin-top: 50px; margin-left: 300px">
		<form action="<%=basePath%>/manager/ManagerServlet?op=managerPassword"
			method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">新密码：</label> <input
					class="form-control" type="password" id="password" name="password"
					style="width: 700px">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">确认密码：</label> <input
					class="form-control" type="password" id="repassword" onblur="confirmP()"
					name="repassword" style="width: 700px">
			</div>
			<div class="form-group">
				<input
					class="form-control" type="hidden" id="username" name="username" value="${sessionScope.user.username}"
					 readonly
					style="width: 700px">
			</div>
			<br>
			<button type="submit" class="btn btn-primary" style="margin-left: 220px">提交</button>
			<button type="button" class="btn btn-default" data-dismiss="modal"
				style="margin-left: 100px"
				onclick="window.location='personContent.jsp'">关闭</button>
		</form>
	</div>
	
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script>
		function confirmP(){
			var pre = $("#password").val();
			var next = $("#repassword").val();
			if (pre != next){
				alert("两次密码不一致！");
			}	
		}
	</script>
</body>
</html>