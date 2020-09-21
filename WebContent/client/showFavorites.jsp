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
<title>收藏详情</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
</head>
<body style="overflow-x: hidden">

	<jsp:include page="/comm/head-nav.jsp"></jsp:include>
	
	<c:if test="${empty favorite}">
		<div style="margin-top:100px;text-align:center">
			<div style="width:100%"><span class = "glyphicon glyphicon-heart" style = "height:200px;width:200px;display:block;margin:0 auto;font-size:200px"></span></div>
			<h4 style="margin-top:40px">
				这里好像空空如也耶！！！
			</h4>
		</div>
	</c:if>
	<c:if test="${!empty favorite}">
		<table class="table table-bordered table-hover"
			style="width: 100%">
			<tr>
				<th style="width: 5%;text-align:center;">序号</th>
				<th style="width: 20%;text-align:center;">书籍图片</th>
				<th style="width: 20%;text-align:center;">书籍名称</th>
				<th style="width: 10%;text-align:center;">书籍类型</th>
				<th style="width: 10%;text-align:center;">书籍作者</th>
				<th style="width: 10%;text-align:center;">书籍出版社</th>
				<th style="width: 5%;text-align:center;">书籍单价</th>
				<th style="width: 10%;text-align:center;">操作</th>
			</tr>
			<c:forEach items="${favorite}" var="f" varStatus="vs">
				<tr class="active">
					<td style="margin-top: 50px;text-align:center">${vs.index+1}</td>
					<td><img style="width: 80px; height: 100px;margin:0 auto;display:block;" src="<%=basePath%>/images/${f.book.path}/${f.book.filename}" /></td>
					<td style="font-weight:bold;text-align:center;">《${f.book.book_name}》</td>
					<td style="text-align:center;">${f.book.category.category_name}</td>
					<td style="text-align:center;">${f.book.book_author}</td>
					<td style="text-align:center;">${f.book.book_press}</td>
					<td style="text-align:center;"><span style="color: rgb(198, 46, 45); font-weight: bold">￥${f.book.book_price}</span></td>
					<td><a href="javascript:delOne('${f.book.book_id}')" style="text-decoration: none"><button type="button" class="btn btn-danger" style= "margin:0 auto;display:block">删除</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<script type="text/javascript">
		function delOne(book_id) {
			/* alert(book_id); */
			var sure = window.confirm("确定删除改选项吗？");
			if (sure) {
				window.location.href = "<%=basePath%>client/ClientServlet?op=delFavorite&book_id="+ book_id;
				alert("删除成功！！");
			}
		}
	</script>
	<script src="<%=basePath%>js/jquery-3.5.0.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>