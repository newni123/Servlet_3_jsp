<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>Point Input Result</h1>
		<form action="./pointInsertResult.jsp" method="post" id = "form">
			<div class="form-group">
				<label for="email">Name:</label> <input type="text" 
					class="form-control" id="name" placeholder="Enter Name" name="name">
			</div>
			<div class="form-group">
				<label for="pwd">Kor:</label> <input type="text"
					class="form-control" id="kor" placeholder="Enter kor" name="kor">
			</div>
			<div class="form-group">
				<label for="pwd">Eng:</label> <input type="text"
					class="form-control" id="eng" placeholder="Enter Eng" name="eng">
			</div>
			<div class="form-group">
				<label for="pwd">Mat:</label> <input type="text"
					class="form-control" id="mat" placeholder="Enter Mat" name="mat">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</body>
</html>