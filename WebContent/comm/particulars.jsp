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
<title>书籍详情</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/ajaxUtil.js"></script>
</head>
<body style="overflow-x: hidden">

	<jsp:include page="head-nav.jsp"></jsp:include>
	
	<div style="background-color: rgb(244, 245, 244); margin-top: 50px; margin-left: 10%; width: 1150px; height: 50px">
		<div style="padding-top: 9px">
			<span style="font-size: 25px; margin-left: 20px;font-weight:bold">《${book.book_name}》</span>
			<a href="#" onClick="javascript:history.go(-1);">
				<span class="label label-default" style="float: right;font-size:16px;margin-top:5px">返回</span>
			</a>
		</div>
	</div>
	<div
		style="margin-top: 30px; margin-left: 10%; width: 1150px; height: 600px">
		<div
			style="width: 500px; height: 600px; float: left; border: 1px solid rgb(238, 238, 238);">
			<img
				style="width: 440px; height: 540px; margin-top: 25px; margin-left: 30px"
				src="<%=basePath%>images/${book.path}/${book.filename}" />
		</div>
		<div style="width: 640px; height: 600px; float: right;">
			<!-- 书籍名称 -->
			<div style="margin-top: 25px">
				<span style="font: 700 16px Arial, 'microsoft yahei'; color: #666; padding-top: 10px; line-height: 28px; margin-bottom: 5px; margin-left: 10px">《${book.book_name}》</span>
			</div>
			<!-- 作者出版社 -->
			<div style="margin-left: 18px; margin-top: 15px">
				<span style="font-size: 12px; color: #1890FF;">${book.book_press}</span>
				<strong>编</strong> 
				<span style="font-size: 12px; color: #1890FF;">${book.book_author}</span>
				<strong>著</strong>
			</div>
			<!-- 价格&销量 -->
			<div
				style="margin-top: 20px; margin-left: 18px; width: 620px; height: 270px; background-color: rgb(247, 245, 241)">
				<img alt="bg——img" src="<%=basePath%>images/seckilling.png">
				<div style="margin-top: 20px; margin-left: 30px">
					<span style="color: rgb(153, 153, 153)">所属分类:</span>&nbsp;${book.category.category_name}<br>
					<span style="color: rgb(153, 153, 153)">书籍描述:</span> 
					<textarea disabled="disabled" class="form-control" rows="4"
						id="book_desc" name="book_desc" placeholder=""
						style="width: 570px; margin-top: 7px; margin-bottom: 7px">${book.book_desc}
					</textarea>
					<span style="color: rgb(153, 153, 153)">书籍单价:</span>
					<span style="font-size: 16px; font-weight: 700; color: #C62E2D">&nbsp;￥${book.book_price}</span><br>
					<span style="color: rgb(153, 153, 153)">书籍库存:</span>&nbsp;&nbsp;&nbsp;${book.book_kunumber}&nbsp;本<br>
					<span style="color: rgb(153, 153, 153)">书籍销量:</span>&nbsp;&nbsp;&nbsp;${book.book_xiaonumber}&nbsp;本<br>
				</div>
			</div>
			<!-- 收藏 -->
			<c:if test="${!empty user}">
				<div style="margin-top: 20px; margin-left: 25px">
					<a  href="javascript:addFavorite()"
						style="text-decoration: none; color: black"><img
						src="<%=basePath%>images/shoucang.png"
						style="widows: 20px; height: 20px" />添加收藏</a>
				</div>
			</c:if>
			<c:if test="${empty user}">
				<div style="margin-top: 20px; margin-left: 25px">
					<a href="javascript:Favorite()"
						style="text-decoration: none; color: black"><img
						src="<%=basePath%>images/shoucang.png"
						style="widows: 20px; height: 20px" />添加收藏</a>
				</div>
			</c:if>
			<!-- 加入购物车和购买 -->
			<div style="margin-top: 60px; margin-left: 120px">
			<!--已经登录  -->
				<c:if test="${!empty user}">
					<button type="button" class="btn btn-default"
						style="width: 160px; height: 43px; border-color: rgb(198, 46, 45)"
						onclick = "addCart()">
						<span style="font-size: 16px; color: rgb(198, 46, 45)">加入购物车</span>
					</button>
				</c:if>
				<!--没有登录  -->
				<c:if test="${empty user}">
					<button type="button" class="btn btn-default"
						style="width: 160px; height: 43px; border-color: rgb(198, 46, 45)"
								 onclick="cart()">
						<span style="font-size: 16px; color: rgb(198, 46, 45)">加入购物车</span>
					</button>
				</c:if>
				<button type="button" class="btn btn-danger" style="background-color: rgb(198, 46, 45); width: 160px; height: 43px; margin-left: 100px">
					<span style="font-size: 16px">立即购买</span>
				</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function cart() {
			alert("你好像还没登录耶！");
		}
		function Favorite() {
			alert("你好像还没登录耶!");
		}
		
		var book_id = "${book.book_id}";
		
		function addFavorite(){
			var str = "op=addfavorite&book_id="+book_id;
			/* alert(book_id);
			alert(str); */
			myAjax("get","<%=basePath%>client/ClientServlet",str,deal200F,deal404,deal500,true);
		}
		
		function addCart(){
			var str = "op=addCart&book_id="+book_id;
			myAjax("get","<%=basePath%>client/ClientServlet",str,deal200C,deal404,deal500,true);
		}
		function deal200F(ajax){
			var s = ajax.responseText;
			if(s != ''){//不能null
				alert(s);
			}
			else{
				alert("添加收藏成功！");
			}
		}
		function deal200C(ajax){
			alert("添加购物车成功！");
		}
		function deal404(){
			$("#show-book").append("<h4 >404,资源未找到！</h4>");
		}
		function deal500(){
			$("#show-book").append("<h4 >500，服务器开小差了，稍后再试！</h4>");
		}
		
	</script>
	
</body>
</html>