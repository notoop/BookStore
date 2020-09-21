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
<title>编辑书籍信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body{margin:0;padding:0}
</style>
</head>
<body style="background-color:#DDDDDD">
	<div style="text-align:center;margin-top:48px">
		<h style="font-size: 22px; margin-top: 20px; margin-left: 30px">编辑书籍信息</h>
	</div>
	
	<hr style="color:#FFFFFF;" />
	
	<div style="margin-top: 50px; margin-left: 300px">
		<form action="<%=basePath%>/manager/ManagerServlet?op=editBook"
			method="post">
			<div class="form-group">
				<input type="hidden" class="form-control" id="book_id" name="book_id"
					value="${map.book.book_id}" style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍名称：</label> <input type="text" class="form-control"
					id="book_name" name="book_name" value="${map.book.book_name}"
					style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍作者：</label> <input type="text" class="form-control"
					id="book_author" name="book_author" value="${map.book.book_author}"
					style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍出版社：</label> <input type="text" class="form-control"
					id="book_press" name="book_press" value="${map.book.book_press}"
					style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍分类：</label> <select class="form-control" name="categoryid"
					title="书籍分类" style="width: 700px">
					<option selected="selected">${map.book.category.category_name}</option>
					<c:forEach items="${map.category}" var="c">
						<option value="${c.category_id}">${c.category_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleInputFile">图片上传：</label> <img
					style="width: 80px; height: 100px"
					src="<%=basePath%>/images/${map.book.path}/${map.book.filename}" /><input
					type="file" id="file" name="file">
			</div>
			<div class="form-group">
				<label>书籍简介：</label>
				<textarea class="form-control" rows="3" id="book_desc"
					name="book_desc" style="width: 700px">${map.book.book_desc}</textarea>
			</div>
			<div class="form-group">
				<label>书籍单价：</label> <input type="text" class="form-control"
					id="book_price" name="book_price" value="${map.book.book_price}"
					style="width: 700px">
			</div>
			<div class="form-group">
				<label>书籍库存：</label> <input type="text" class="form-control"
					id="book_kunumber" name="book_kunumber"
					value="${map.book.book_kunumber}" style="width: 700px">
			</div>
			<br>
			<button type="submit" class="btn btn-primary" style="margin-left: 220px">提交</button>
			<button type="button" class="btn btn-default" data-dismiss="modal"
				style="margin-left: 100px"
				onclick="javascript :history.go(-1);">后退</button>
			<br/><br/><br/>
		</form>
	</div>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>