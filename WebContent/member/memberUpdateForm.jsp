<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../layout/nav.jsp" %>
<%@ include file="../layout/boot.jsp" %>
<%
	if (memberDTO == null) {
		request.setAttribute("msg", "권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>
</head>
<body>
	<div class="container">
		<h2>Mypage</h2>
		<form action="memberUpdateResult.jsp" method="post" id="form">
			<div class="form-group">
				<label for="id">아이디:</label> <input type="text" class="form-control"
					id="id" name="id" required = "required" value="<%=memberDTO.getId()%>" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호:</label> <input type="password"
					class="form-control" id="pw" name="pw" required = "required">
			</div>
			<div class="form-group">
				<label for="pwCheck">비밀번호 확인:</label> <input type="password"
					class="form-control" id="pwCheck" name="pwCheck" required = "required">
			</div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name1" name="name"  value="<%=memberDTO.getName()%>" required = "required">
			</div>
			<div class="form-group">
				<label for="email">이메일:</label> <input type="email"
					class="form-control" id="email" name="email"  value="<%=memberDTO.getEmail()%>" required = "required">
			</div>
			<div class="form-group">
				<label for="phone">연락처:</label> <input type="tel"
					class="form-control" id="phone" name="phone"  value="<%=memberDTO.getPhone()%>" required = "required">
			</div>
			<div class="form-group">
				<label for="grade">등급:</label> <input type="tel"
					class="form-control" id="grade" name="grade"  value="<%=memberDTO.getGrade()%>" readonly="readonly" required = "required">
			</div>
			<button type = "submit" class="btn btn-default">Update</button>
		</form>
	</div>

</body>
</html>