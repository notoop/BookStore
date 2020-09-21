<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>跳转中...</title>
</head>
<body style="background: #181818; background-size: 100%;">
	<div
		style="width: 800px; height: 300px; margin: 10% auto; background: #262626">
		<h1 style="background: #444444; letter-spacing: 50px; color: #EEEEEE; text-align: center">跳转中</h1>
		<c:if test="${message1 eq '欢迎登陆' }">
			<h2 style="color: #AAAAAA; letter-spacing: 10px; margin-left: 5%">欢迎登陆：</h2>
			<c:if test="${message2 eq '用户'}">
				<h3 style="color: #AAAAAA; margin-left: 25%">
					用户：<span style="color: #d9534f"> ${user.username} </span>
				</h3>
				<h4 style="color: #AAAAAA; margin-left: 25%">
					页面即将跳转，或是点击 <a href="/BookStore/index.jsp">这里</a>，立即跳转。
				</h4>
				<%
					response.setHeader("refresh", "3;URL=/BookStore/index.jsp");
				%>
			</c:if>
			<c:if test="${message2 eq '管理员'}">
				<h3 style="color: #AAAAAA; margin-left: 25%">
					管理员：<span style="color: #d9534f">${admin.username}</span>
				</h3>
				<h4 style="color: #AAAAAA; margin-left: 25%">
					页面即将跳转，或是点击 <a href="/BookStore/manager/manager.jsp">这里</a>，立即跳转。
				</h4>
				<%
					response.setHeader("refresh", "3;URL=/BookStore/manager/manager.jsp");
				%>
			</c:if>
		</c:if>
		<c:if test="${message1 eq '注册成功' }">
			<h2 style="color: #AAAAAA; letter-spacing: 10px; margin-left: 5%">注册成功：</h2>
			<h3 style="color: #AAAAAA; margin-left: 25%">正在返回登录</h3>
			<h4 style="color: #AAAAAA; margin-left: 25%">
					页面即将跳转，或是点击 <a href="/BookStore/index.jsp">这里</a>，立即跳转。
			</h4>
			<%
					response.setHeader("refresh", "3;URL=/BookStore/index.jsp");
			%>
		</c:if>
		<c:if test="${message1 eq '该用户名已被注册' }">
			<h2 style="color: #AAAAAA; letter-spacing: 10px; margin-left: 5%">该用户名已被注册:</h2>
			<h3 style="color: #AAAAAA; margin-left: 25%">请直接登录！</h3>
			<h4 style="color: #AAAAAA; margin-left: 25%">
					页面即将跳转，或是点击 <a href="/BookStore/index.jsp">这里</a>，立即跳转。
			</h4>
			<%
					response.setHeader("refresh", "3;URL=/BookStore/index.jsp");
			%>
		</c:if>
		<c:if test="${message1 eq '账号或密码错误'}">
			<h2 style="color: #AAAAAA; letter-spacing: 10px; margin-left: 5%">账号或秘密错误：</h2>
			<h3 style="color: #AAAAAA; margin-left: 25%">请返回登录页面，重新输入。</h3>
			<h4 style="color: #AAAAAA; margin-left: 25%">
					页面即将跳转，或是点击 <a href="/BookStore/index.jsp">这里</a>，立即跳转。
			</h4>
			<%
					response.setHeader("refresh", "3;URL=/BookStore/index.jsp");
			%>
		</c:if>
		<c:if test="${message1 eq '注销成功'}">
			<h2 style="color: #AAAAAA; letter-spacing: 10px; margin-left: 5%">注销成功：</h2>
			<h3 style="color: #AAAAAA; margin-left: 25%">正在返回主页中！</h3>
			<h4 style="color: #AAAAAA; margin-left: 25%">
					页面即将跳转，或是点击 <a href="/BookStore/index.jsp">这里</a>，立即跳转。
			</h4>
			<%
					response.setHeader("refresh", "3;URL=/BookStore/index.jsp");
			%>
		</c:if>
	</div>
</body>
</html>