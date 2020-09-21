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
<title>购物车详情</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
</head>
<body style="overflow-x: hidden">


	<jsp:include page="/comm/head-nav.jsp"></jsp:include>
	
	<c:if test="${empty sessionScope.cart.itmes}">
		<div style="margin-top:100px;text-align:center">
			<div style="width:100%"><span class = "glyphicon glyphicon-shopping-cart" style = "height:200px;width:200px;display:block;margin:0 auto;font-size:200px"></span></div>
			<h4 style="margin-top:40px">
				这里好像空空如也耶！！！
			</h4>
		</div>
	</c:if>
	<c:if test="${!empty sessionScope.cart.itmes}">
		<table class="table table-bordered table-hover"
			style=" width: 100%">
			<tr>
				<th style="width: 5%;text-align:center;">序号</th>
				<th style="width: 15%;text-align:center;">书籍图片</th>
				<th style="width: 15%;text-align:center;">书籍名称</th>
				<th style="width: 10%;text-align:center;">书籍类型</th>
				<th style="width: 10%;text-align:center;">书籍作者</th>
				<th style="width: 10%;text-align:center;">书籍出版社</th>
				<th style="width: 5%;text-align:center;">书籍单价</th>
				<th style="width: 5%;text-align:center;">购买数量</th>
				<th style="width: 5%;text-align:center;">小计</th>
				<th style="width: 10%;text-align:center;">操作</th>
			</tr>
			<c:forEach items="${sessionScope.cart.itmes}" var="c" varStatus="vs">
				<tr class="active">
					<td style="margin-top: 50px;text-align:center;">${vs.index+1}</td>
					<td><img style="width: 80px; height: 100px;margin:0 auto;display:block;"src="<%=basePath%>images/${c.value.book.path}/${c.value.book.filename}" /></td>
					<td style="font-weight:bold;text-align:center;">《${c.value.book.book_name}》</td>
					<td style="text-align:center;">${c.value.book.category.category_name}</td>
					<td style="text-align:center;">${c.value.book.book_author}</td>
					<td style="text-align:center;">${c.value.book.book_press}</td>
					<td style="text-align:center;"><span style="color: rgb(198, 46, 45); font-weight: bold">￥${c.value.book.book_price}</span></td>
					<td style="text-align:center;"><input type="text" class="form-control" id="quantity"
						value="${c.value.quantity}"
						style="width: 45px; height: 30px;"
						onchange="changeNum(this,${c.value.quantity},'${c.value.book.book_id}')"></td>

					<td style="text-align:center;"><span style="color: rgb(198, 46, 45); font-weight: bold">￥${c.value.money}</span></td>
					<td><a href="javascript:delOneItem('${c.value.book.book_id}')"><button type="button" class="btn btn-danger" style= "margin:0 auto;display:block">删除</button></a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10" style="padding-left: 85%">
					<strong>总数量：
						<span style="color: rgb(198, 46, 45); font-weight: bold; font-size: 20px">${sessionScope.cart.totalQuantity}</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合计：
					</strong>
					<span style="color: rgb(198, 46, 45); font-weight: bold; font-size: 20px">￥${sessionScope.cart.totalMoney}</span>
					<button type="button" class="btn btn-danger"
						style="background-color: rgb(198, 46, 45); width: 160px; height: 43px; margin-left: 50px"
						onclick="window.location='<%=basePath%>/order/OrderServlet?op=genOrder'">
						<span style="font-size: 16px">结算</span>
					</button>
				</td>
			</tr>
		</table>
	</c:if>
	
	<script type="text/javascript">
		function changeNum(inputObj,oldNum,book_id){
			var sure = window.confirm("确定要修改数量吗?");
			if(sure){
				//修改新数量
				var num = inputObj.value;
					//验证：用户输入的必须是自然数。 字母\1.1\-1排除
				if(!/^[1-9][0-9]*$/.test(num)){
					alert("请输入正确的数量");
					return;
				}
				//提交给服务器修改该项的数量
				window.location.href="<%=basePath%>client/ClientServlet?op=changeNum&num="+num+"&book_id="+book_id;
			}else{
				//显示原来的值
				inputObj.value = oldNum;
			}
		}
		function delOneItem(book_id) {
			var sure = window.confirm("确定删除改选项吗？");
			if (sure) {
				window.location.href = "<%=basePath%>client/ClientServlet?op=delItem&book_id="+ book_id;
				alert("删除成功！！");
			}
		}
	</script>
</body>
</html>