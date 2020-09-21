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
<title>新增书籍信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">

	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">新增书籍信息</h>
		
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<form style="margin-top: 50px; margin-left: 300px"
		action="<%=basePath%>/manager/ManagerServlet?op=addBook" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label>书籍名称：</label> <input type="text" class="form-control"
				id="book_name" name="book_name" placeholder="书籍名称"
				style="width: 700px">
		</div>
		<div class="form-group">
			<label>书籍作者：</label> <input type="text" class="form-control"
				id="book_author" name="book_author" placeholder="书籍作者"
				style="width: 700px">
		</div>
		<div class="form-group">
			<label>书籍出版社：</label> <input type="text" class="form-control"
				id="book_press" name="book_press" placeholder="书籍出版社"
				style="width: 700px">
		</div>
		<div class="form-group">
			<label>书籍分类：</label> <select class="form-control" name="categoryid"
				title="书籍分类" style="width: 700px">
				<option selected="selected">---所属分类---</option>
				<c:forEach items="${cs}" var="c">
					<option value="${c.category_id}">${c.category_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleInputFile">图片上传：</label> <input type="file"
				id="file" name="file">
		</div>
		<div class="form-group">
			<label>书籍简介：</label>
			<textarea class="form-control" rows="3" id="book_desc"
				name="book_desc" placeholder="书籍简介" style="width: 700px"></textarea>
		</div>
		<div class="form-group">
			<label>书籍单价：</label> <input type="text" class="form-control"
				id="book_price" name="book_price" placeholder="书籍单价/￥"
				style="width: 700px">
		</div>
		<div class="form-group">
			<label>书籍库存：</label> <input type="text" class="form-control"
				id="book_kunumber" name="book_kunumber" placeholder="书籍库存"
				style="width: 700px">
		</div>
		<br>
		<button type="submit" class="btn btn-primary">提交</button>
		<button type="button" class="btn btn-default" data-dismiss="modal"
			style="margin-left: 100px"
			onclick="window.location='managerIndex.jsp'">关闭</button>
		<br/><br/><br/>
	</form>
	
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>