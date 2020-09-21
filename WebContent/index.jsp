<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网上书店</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/ajaxUtil.js"></script>
</head>
<body style="overflow-x: hidden">

	<jsp:include page="/comm/head-nav.jsp"></jsp:include>
	<div class="containter-fluid">
		<!--  轮播图-->
		<div class="row">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/55.jpg" alt="...">
					</div>
					<div class="item">
						<img src="images/22.jpg" alt="...">
					</div>
					<div class="item">
						<img src="images/33.jpg" alt="...">
					</div>
					<div class="item">
						<img src="images/44.jpg" alt="...">
					</div>
					<div class="item">
						<img src="images/11.jpg" alt="...">
					</div>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!--  分类，书籍展示区域-->
		<div class="row" style="margin-top: 10px;position:relative">
			<div class="col-md-3" id = "book-nav" style="position:absolute;left:5px;top;0;">
				<ul class="nav nav-pills nav-stacked"
					style="text-align: center; letter-spacing: 4px; font-weight: bold; font-size:17px;background-color:rgba(209,90,86,0.7);; border-radius: 10px">
					<li role="presentation"><a href="avascript:void(0)" style="color: #EEEEEE;" onclick="loadAllBook()">全部</a></li>
					<li role="presentation"><a href="avascript:void(0)" style="color: #ffffff;" onclick="loadWXYS()">文学艺术</a></li>
					<li role="presentation"><a href="avascript:void(0)" style="color: #ffffff;" onclick="loadRWSK()">人文社科</a></li>
					<li role="presentation"><a href="avascript:void(0)" style="color: #ffffff;" onclick="loadSETS()">少儿童书</a></li>
					<li role="presentation"><a href="avascript:void(0)" style="color: #ffffff;" onclick="loadJYKS()">教育考试</a></li>
					<li role="presentation"><a href="avascript:void(0)" style="color: #ffffff;" onclick="loadJJJR()">经济金融</a></li>
					<li role="presentation"><a href="avascript:void(0)" style="color: #ffffff;" onclick="loadKXJS()">科学技术</a></li>
				</ul>
				<div class="input-group"
					style="border-radius: 10px; margin-top: 10px">
					<input type="text" class="form-control" placeholder="请输入书籍名称" aria-describedby="basic-addon2" id = "inputMessage"> 
					<span class="input-group-addon" onclick="searchBook()" style="background-color: rgba(209,90,86,0.7); color: white; font-weight: bolder; cursor: pointer">搜索</span>
				</div>
				<div
					style="font-size: 10px; text-align: center; margin-top: 10px; color: #888888">
					<p>京公网安备 11010202007572号</p>
					<p>京ICP证 京B2-20171652号</p>
					<p>出版物经营许可证 新出发 京零字第西160071号</p>
					<p>广播电视节目制作经营许可证 （京）字第07439号</p>
					<p>营业执照</p>
					<p>网络出版服务许可证 （京）字第320号</p>
					<p>Copyright © 2015 - 2020 新华互联电子商务有限责任公司 版权所有</p>
					<p>客服热线：4006666505</p>
				</div>
			</div>
			<div class="col-md-9" style="background-color: #EEEEEE; border-radius: 15px;float:right;">
				<div class="row" id = "show-book" style= "display:flex;flex-wrap: wrap;">
					<!-- <div class="col-sm-6 col-md-4"  style ="diaplay:flex"> -->
						<!-- <div class="thumbnail">
                            <img src="images/xjp.jpg" alt="..." style="width: 200px;">
                            <div class="caption">
                                <h3>习近平在厦门</h3>
                                <span style="display:inline-block;white-space: nowrap;width: 100%;overflow: hidden;text-overflow: ellipsis;"></span>
                                <p style="text-align: center"><a href="#" class="btn btn-danger" role="button">详情</a></p>
                            </div>
                        </div> -->
					</div>
					<script>
                    	/* $("#show-book").append("<h4>为什么会有问题呢</h4>"); */
                    </script>
				</div>
			</div>
	</div>

	<script type="text/javascript">
		window.onload = loadAllBook();
		function loadAllBook(){
			myAjax("get","client/ClientServlet","op=loadAll",deal200,deal404,deal500,true);
		}
		function loadWXYS(){
			myAjax("get","client/ClientServlet","op=wxys",deal200,deal404,deal500,true);
		}
		function loadRWSK(){
			myAjax("get","client/ClientServlet","op=rwsk",deal200,deal404,deal500,true);
		}
		function loadSETS(){
			myAjax("get","client/ClientServlet","op=sets",deal200,deal404,deal500,true);
		}
		function loadJYKS(){
			myAjax("get","client/ClientServlet","op=jyks",deal200,deal404,deal500,true);
		}
		function loadJJJR(){
			myAjax("get","client/ClientServlet","op=jjjr",deal200,deal404,deal500,true);
		}
		function loadKXJS(){
			var searchMessage = 
			myAjax("get","client/ClientServlet","op=kxjs",deal200,deal404,deal500,true);
		}
		function searchBook(){
			var searchMessage = $("#inputMessage").val();
			myAjax("get","client/ClientServlet","op=search&search="+searchMessage,deal200,deal404,deal500,true);
		}
		function deal200(ajax){
			var sb = $("#show-book");
			sb.empty();
			var result = ajax.responseText;
			if (result != "[]"){
				eval("var books="+result);
				for (var i=0; i < books.length; i++){
					/* alert(books[i].book_id);
					alert(books[i].book_name); */
					var path = "images/" + books[i].path + "/" + books[i].filename;
					var name = books[i].book_name;
					var des = books[i].book_desc;
					var price = books[i].book_price;
					var id = "client/ClientServlet?op=particulars&book_id="+books[i].book_id;
					sb.append(
							"<div style=\"width:265px;height:325px;margin:5px 10px;\">"+
							"<div class=\"thumbnail\" style=\"width:265px;\">\n" + "<img src=\"" + path + "\" style=\"height: 200px;\">\n" +
					        "<div class=\"caption\">\n" +
					        "<h5 style=\"font-weight:bolder;font-size:15px;\">"+ "《"+name+"》" +"</h5>\n" +
					        "<span style=\"display:inline-block;white-space: nowrap;width: 100%;overflow: hidden;text-overflow: ellipsis;font-size:12px\">" + des +"</span>\n" +
					        "<p style=\"text-align: left\">"+"<span style=\"color:black;font-weight:bolder;font-size:16px;margin-left:10px\">" + "价格：" +"</span>\n"+
					        "<span style=\"color:red;font-weight:bolder;font-size:15px;\">" + "￥"+price +"</span>\n"+
					        "<a href=\""+ id +"\" class=\"btn btn-danger\" role=\"button\" style=\"float: right\">"+"详情"+"</a></p>\n" +
					        "</div>\n" +
					        "</div>" +
					        "</div>"
					        );
				}
			}
			else{
				sb.empty();
				$("#show-book").append("<h4 >好像神马都没有找到耶！<br/><br/>换个搜索词试试</h4>");
			}
			
		}
		function deal404(){
			$("#show-book").append("<h4 >404,资源好像未找到耶！</h4>");
		}
		function deal500(){
			$("#show-book").append("<h4 >500，服务器开小差了，稍后再试吧！</h4>");
		}
		
		 $(window).scroll(
			    function(){
			        if ($(window).scrollTop() > 360){
			            $("#book-nav").css({"position":"fixed","top":"10px","left":"-10px"});
			        }
			        else{
			            $("#book-nav").css({"position":"absolute","top":"0","left":"5px"});
			        }
			    }
			); 
	</script>
	<!--重复引入会导致bootstrap下拉框失效 -->
	<!-- <script src="js/jquery-3.5.0.min.js"></script>
    <!--<script src="js/bootstrap.min.js"></script> -->
</body>
</html>