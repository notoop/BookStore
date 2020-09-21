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
<title>维护书籍信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/ajaxUtil.js"></script>
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">

	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">维护书籍信息</h>
	</div>
	
	<hr style="color:#FFFFFF;" />
	<!-- 书籍导航条 -->
	<nav class="navbar navbar-default" style="margin-bottom: 0px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" onclick = "window.location= '<%=basePath%>manager/ManagerServlet?op=loadAll'">All</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=basePath%>manager/ManagerServlet?op=wxys">文学艺术</a></li>
				<li><a href="<%=basePath%>manager/ManagerServlet?op=rwsk">人文社科</a></li>
				<li><a href="<%=basePath%>manager/ManagerServlet?op=sets">少儿童书</a></li>
				<li><a href="<%=basePath%>manager/ManagerServlet?op=jyks">教育考试</a></li>
				<li><a href="<%=basePath%>manager/ManagerServlet?op=jjjr">经济金融</a></li>
				<li><a href="<%=basePath%>manager/ManagerServlet?op=kxjs">科学技术</a></li>
			</ul>
			<!-- 搜索框 -->
			<div style="float: right; margin-right: 7px">
				<form class="navbar-form navbar-left"
					action="<%=basePath%>/manager/ManagerServlet?op=search"
					method="post">
					<div class="form-group">
						<input type="text" name="search" class="form-control"
							placeholder="搜索/书籍名称" id = "inputMessage">
					</div>
					<button type="submit" class="btn btn-default" onclick="searchBook()">搜索</button>
				</form>
			</div>
		</div>
	</div>
	</nav>
	<c:if test="${!empty books}">
		<table class="table table-bordered table-hover" style="width: 100%">
			<tr>
				<th style="width: 100px">书籍编号</th>
				<th style="width: 100px">书籍图片</th>
				<th style="width: 200px">书籍名称</th>
				<th style="width: 200px">书籍类型</th>
				<th style="width: 200px">书籍作者</th>
				<th style="width: 300px">书籍出版社</th>
				<th style="width: 200px">书籍价格</th>
				<th style="width: 200px">销量</th>
				<th style="width: 200px">操作</th>
			</tr>
			<c:forEach items="${books}" var="s" varStatus="vs">
				<tr class="active">
					<td>${vs.index+1}</td>
					<td><img style="width: 80px; height: 100px"
						src="<%=basePath%>/images/${s.path}/${s.filename}" />
					</td>
					<td>《${s.book_name}》</td>
					<td>${s.category.category_name}</td>
					<td>${s.book_author}</td>
					<td>${s.book_press}</td>
					<td><span style="color: rgb(198, 46, 45); font-weight: bold">￥${s.book_price}</span></td>
					<td>${s.book_xiaonumber}</td>
					<td>
					<a href="<%=basePath%>manager/ManagerServlet?op=editBookUI&book_id=${s.book_id}">编辑</a>
					<a href="<%=basePath%>manager/ManagerServlet?op=delBook&book_id=${s.book_id}"
						onclick="if(confirm('确定删除'+'《${s.book_name}》'+'?')===false) return false;">删除</a>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<script>
		function searchBook(){
			var m = $("#inputMessage").val();
			console.log(m);
			var str = "<%=basePath%>/manager/ManagertServlet?op=search&search=" + m;
			console.log(str);
			window.location=str;
		}		
	</script>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>