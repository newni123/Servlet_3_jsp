<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>SignIn</h2>
		<form action = "memberJoinResult.jsp" method="post" id="form">
			<div class="form-group">
				<label for="id">아이디:</label> <input type="text"
					class="form-control" id="id" name ="id">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호:</label> <input type="password"
					class="form-control" id="pw" name = "pw">
			</div>
			<div class="form-group">
				<label for="pwCheck">비밀번호 확인:</label> <input type="password"
					class="form-control" id="pwCheck" name = "pwCheck">
			</div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name" name = "name">
			</div>
			<div class="form-group">
				<label for="email">이메일:</label> <input type="text"
					class="form-control" id="email" name = "email">
			</div>
			<div class="form-group">
				<label for="phone">연락처:</label> <input type="text"
					class="form-control" id="phone" name = "phone">
			</div>
			<button type="submit" class="btn btn-default">SignIn</button>
		</form>
	</div>

</body>
</html>