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
<title>顶部导航</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row" style="background-color: #bd5450">
			<div class="col-md-2">
				<a href = "<%=basePath%>index.jsp" style = "text-decoration: none" target="_top"><h2 style="color: white;font-family:华文行楷;letter-spacing: 2px;font-size:35px;">网 上 书 店</h2></a>
				<!--                <img src="images/logo.png" alt="首页" class = "img-responsive">-->
			</div>
			<!--如果用户没有登录  -->
			<c:if test="${empty admin}">
				<div class="col-md-4 col-md-push-9">
					<div class="btn-group" style="margin-top: 18px">
						<a href="#" data-toggle="modal" data-target="#M-Login-Modal"
							style="background-color: #d15a56" type="button"
							class="btn btn-default dropdown-toggle btn-primary"> 管理员登录 </a>
					</div>
				</div>
			</c:if>
			<!--管理员登录模态  -->
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" id="M-Login-Modal">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content" style="background-color: rgba(209,90,86,0.6);">
						<form action="<%=basePath%>manager/ManagerServlet?op=login" method="post">
							<div class="modal-body">
								<div class="form-group">
									<label for="exampleInputName2">用户名： </label> 
									<input type="text" name="username" class="form-control" id="exampleInputName2" placeholder="请输入用户名">
								</div>
								<br>
								<div class="form-group">
									<label for="exampleInputPassword1">密码：</label> 
									<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
								</div>
								<br>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">登录</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<c:if test="${!empty admin}">
				<div class="col-md-4 col-md-push-8">
					<div class="row" style="margin-top: 18px">
						<h5
							style="float: left; color: #DDDDDD; width: 25%; overflow: hidden;">
							管理员：<span style="color: white; font-size: 16px">${admin.username}</span>
						</h5>
						<a href="<%=basePath%>manager/ManagerServlet?op=layout" target="_top" style="background-color: #d15a56;border:none" type="button" class="btn btn-default dropdown-toggle btn-primary"> 注销 </a>
					</div>
				</div>
			</c:if>

		</div>
	</div>
<!-- 	
	<script>
		function closeFrame(){
			parent.close();
		}
	</script> -->
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>