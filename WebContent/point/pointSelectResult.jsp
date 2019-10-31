<%@page import="com.iu.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PointDTO pointDTO = (PointDTO) request.getAttribute("pointDTO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Point Select Page</h1>
			<ul>
				<li>번호 : <%=pointDTO.getNum()%></li>
				<li>이름 : <%=pointDTO.getName()%></li>
				<li>국어 : <%=pointDTO.getKor()%></li>
				<li>영어 : <%=pointDTO.getEng()%></li>
				<li>수학 : <%=pointDTO.getMat()%></li>
				<li>총점 : <%=pointDTO.getTotal()%></li>
				<li>평균 : <%=pointDTO.getAvg()%></li>
			</ul>
			<div>
				<a class="btn btn-primary"
					href="./pointUpdate.jsp?num=<%=pointDTO.getNum()%>">Update</a> <a
					href="./pointDeleteResult.jsp?num=<%=pointDTO.getNum()%>"
					class="btn btn-danger">Delete</a>
			</div>
		</div>

	</div>

</body>
</html>