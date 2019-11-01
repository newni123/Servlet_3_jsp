<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../layout/boot.jsp" %>
<%@ include file="../layout/nav.jsp" %>
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
					<p id="input_pw" class="btn_check"></p>
			</div>
			<div class="form-group">
				<label for="pwCheck">비밀번호 확인:</label> <input type="password"
					class="form-control" id="pwCheck" name="pwCheck" required = "required">
					<p id="input_pwCheck" class="btn_check"></p>
			</div>
			<div class="form-group">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name1" name="name"  value="<%=memberDTO.getName()%>" required = "required">
					<p id="input_name1" class="btn_check"></p>
			</div>
			<div class="form-group">
				<label for="email">이메일:</label> <input type="email"
					class="form-control" id="email" name="email"  value="<%=memberDTO.getEmail()%>" required = "required">
					<p id="input_email" class="btn_check"></p>
			</div>
			<div class="form-group">
				<label for="phone">연락처:</label> <input type="tel"
					class="form-control" id="phone" name="phone"  value="<%=memberDTO.getPhone()%>" required = "required">
					<p id="input_phone" class="btn_check"></p>
			</div>
			<div class="form-group">
				<label for="grade">등급:</label> <input type="tel"
					class="form-control" id="grade" name="grade"  value="<%=memberDTO.getGrade()%>" readonly="readonly" required = "required">
			</div>
			<button type = "submit" class="btn btn-default">Update</button>
		</form>
	</div>
	<script type="text/javascript">
	
		$("#pw").blur(function() {
			if ($("#pw").val() == "") {
				input_pw.innerText = "비밀번호를 입력하세요.";
				pw.style.border = "1px solid red";
			} else if ($("#pw").val().length < 8) {
				input_pw.innerText = "8자리 이상 입력하세요.";
				pw.style.border = "1px solid red";
			} else {
				input_pw.innerText = "";
				pw.style.border = "1px solid #ccc";
			}
		});
		$("#pw").change(function() {
			pwCheck.style.border = "1px solid #ccc";
			pwCheck.value = "";
			input_pwCheck.innerText = "";
		});
		$("#pwCheck").blur(function() {
			if ($("#pw").val() != $("#pwCheck").val() || $("#pw").val().length < 8){
				input_pwCheck.innerText = "비밀번호가 일치하지 않습니다";
				pwCheck.style.border = "1px solid red";
			}
			else{
				input_pwCheck.innerText = "";
				pwCheck.style.border = "1px solid #ccc";
			}
		})
		$("#name1").blur(function() {
			if ($("#name1").val() == "") {
				input_name1.innerText = "이름을 입력하세요.";
				name1.style.border = "1px solid red";
			}
			else {
				input_name1.innerText = "";
				name1.style.border = "1px solid #ccc";
			}
		})
		$("#email").blur(function() {
			if ($("#email").val() == "") {
				input_email.innerText = "이메일을 입력하세요.";
				email.style.border = "1px solid red";
			}
			else {
				input_email.innerText = "";
				email.style.border = "1px solid #ccc";
			}
		})
		$("#phone").blur(function() {
			if ($("#phone").val() == "") {
				input_phone.innerText = "전화번호를 입력하세요.";
				phone.style.border = "1px solid red";
			}
			else {
				input_phone.innerText = "";
				phone.style.border = "1px solid #ccc";
			}
		})
	</script>
</body>
</html>