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
			<c:if test="${empty user}">
				<div class="col-md-4 col-md-push-8">
					<div class="btn-group" style="margin-top: 18px">
						<button style="background-color: #d15a56;border:none;" type="button"
							class="btn btn-default dropdown-toggle btn-primary"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							登录/注册 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" style="background-color: rgba(209,90,86,0.6);">
							<li ><a href="#" data-toggle="modal" data-target="#Login-Modal" style = "color:#FFFFFF">登录</a></li>
							<li role="separator" class="divider"></li>
							<li ><a href="#" data-toggle="modal" data-target="#Reg-Modal" style = "color:#FFFFFF">注册</a></li>
						</ul>
						<div style="float: left; margin: 0 15px; padding-top: 5px; width: 3px; height: 35px; background-color: #DDDDDD"></div>
						<a href="#" data-toggle="modal" data-target="#M-Login-Modal" style="background-color: #d15a56;border:none; type="button"
							class="btn btn-default dropdown-toggle btn-primary"> 
							管理员登录 
						</a>
					</div>
				</div>
			</c:if>
			<!-- 用户登录模态框 -->
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" id="Login-Modal" >
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content" style="background-color: rgba(209,90,86,0.8);">
						<form action="<%=basePath%>client/ClientServlet?op=login" method="post">
							<div class="modal-body">
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputName2">用户名： </label> 
									<input type="text" name="username" class="form-control" id="InputName2" placeholder="用户名">
								</div>
								<br>
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputPassword1">密码：</label> 
									<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="密码">
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
			<!--用户注册模态  -->
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" id="Reg-Modal">
				<div class="modal-dialog role="document">
					<div class="modal-content" style="background-color: rgba(209,90,86,0.8);">
						<form action="<%=basePath%>client/ClientServlet?op=register" method="post">
							<div class="modal-body">
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputName2">用户名:</label> 
									<input type="text" id="username" name="username" class="form-control" id="exampleInputName2" placeholder="请输入用户名">
								</div>
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputPassword1">密码:</label> 
									<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
								</div>
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputName2">名字:</label> 
									<input type="text" name="name" class="form-control" id="exampleInputName2" placeholder="请输入你的名字">
								</div>
								<label style = "color:#FFFFFF" for="Ssex">性别:</label> 
								<input type="radio" name="sex" value="男">男 
								<input type="radio" name="sex" value="女">女
								<br>
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputName2">电话:</label> 
									<input type="text" name="tel" class="form-control" id="exampleInputName2" placeholder="请输入你的电话">
								</div>
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputName2">地址:</label> 
									<input type="text" name="address" class="form-control" id="exampleInputName2" placeholder="请输入你的地址">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">注册</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--管理员登录模态  -->
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" id="M-Login-Modal">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content" style="background-color: rgba(209,90,86,0.8);">
						<form action="<%=basePath%>manager/ManagerServlet?op=login" method="post">
							<div class="modal-body">
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputName2">用户名： </label> 
									<input type="text" name="username" class="form-control" id="exampleInputName2" placeholder="用户名">
								</div>
								<br>
								<div class="form-group">
									<label style = "color:#FFFFFF" for="exampleInputPassword1">密码：</label> 
									<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="密码">
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
			<!--如果用户登录后  -->
			<c:if test="${!empty user}">
				<div class="col-md-4 col-md-push-7">
					<div class="row" style="margin-top: 18px">
						<h5
							style="float: left; color: #DDDDDD; width: 25%; overflow: hidden;">
							欢迎登录：<span style="color: white; font-size: 16px">${user.username}</span>
						</h5>
						<a href="<%=basePath%>client/person.jsp" target="_top" style="background-color: #d15a56;border:none;" type="button" class="btn btn-default dropdown-toggle btn-primary"> 个人 </a> 
						<a href="<%=basePath%>client/showCart.jsp" target="_top" style="background-color: #d15a56;border:none;" type="button" class="btn btn-default dropdown-toggle btn-primary"> 购物车 </a> 
						<a href="<%=basePath%>client/ClientServlet?op=showfavorite" target="_top" style="background-color: #d15a56;border:none;"type="button" class="btn btn-default dropdown-toggle btn-primary"> 收藏 </a> 
						<a href="<%=basePath%>client/ClientServlet?op=layout" target="_top" style="background-color: #d15a56;border:none;" type="button" class="btn btn-default dropdown-toggle btn-primary"> 注销 </a>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	
<!-- 	<script>
		function closeFrame(){
			parent.close();
		}
	</script> -->
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>