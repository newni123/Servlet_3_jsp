<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Notice input</h1>
		<form action="./noticeWriteResult.jsp" method="post" id="form">
			<div class="form-group">
				<label for="title">아이디:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title" name="title">
			</div>
				<div class="form-group">
				<label for="writer">비밀번호:</label> <input type="text"
					class="form-control" id="writer" placeholder="Enter writer" name="writer">
			</div>
			<div class="form-group">
				<label for="contents">비밀번호 확인:</label> 
				<textarea style="height: 300px"class="form-control" id="contents" placeholder="Enter contents" name="contents"> </textarea>
			</div>
			<div class="form-group">
	      <label for="pwd">이름:</label>
	      <input type="password" class="form-control" id="pwd">
	    </div>
	    <div class="form-group">
	      <label for="pwd">이메일:</label>
	      <input type="password" class="form-control" id="pwd">
	    </div>
	    <div class="form-group">
	      <label for="pwd">전화번호:</label>
	      <input type="password" class="form-control" id="pwd">
	    </div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</body>
</html>