<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../layout/boot.jsp"%>
<%@ include file="../layout/nav.jsp"%>
<%
	Cookie[] cookies = request.getCookies();
	String remember = null;
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("id"))
			remember = cookies[i].getValue();
	}
	/*for (Cookie cookie : cookies) {
		if (cookie.getName().equals("id")) {
			remember = cookie.getValue();
			break;
		}
	}*/
%>
<body>
	<div class="container">
		<h2>LogIn</h2>
		<form action="./memberLoginResult.jsp" method="post">
			<div class="form-group">
				<label for="id">아이디:</label> <input type="text" class="form-control"
					id="id" placeholder="Enter id" name="id" <%if(remember!= null){%>value=<%=remember%><%} else{ %>value = ""<%} %>>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호:</label> <input type="password"
					class="form-control" id="pw" placeholder="Enter password" name="pw">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember" value="check" checked="checked">
					<!-- 체크시 value값이 들어감 체크 안하면 null --> Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</body>
</html>