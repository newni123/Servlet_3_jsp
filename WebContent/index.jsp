<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="./layout/boot.jsp"%>
<%@ include file="./layout/nav.jsp"%>
<body>
	<div class="container">
		<% if (memberDTO != null) {%>
		<h1>After Success Login</h1>
		<%}else{ %>
		<h1>Before Login</h1>
		<%} %>
	</div>
	<div class="container">
		<%
			Cookie[] cookies = request.getCookies();
			for(int i = 0 ; i < cookies.length ; i++){
		%>
			<h1>Name : <%=cookies[i].getName() %></h1>
			<h1>Value : <%=cookies[i].getValue() %></h1>
		<%} %>
	</div>
</body>
</html>