<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../layout/nav.jsp"%>
<%@ include file="../layout/boot.jsp"%>
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
		<ul class="list-group">
			<li class="list-group-item">아이디 : <%=memberDTO.getId()%></li>
			<li class="list-group-item">이름 : <%=memberDTO.getName()%></li>
			<li class="list-group-item">이메일 : <%=memberDTO.getEmail()%></li>
			<li class="list-group-item">연락처 : <%=memberDTO.getPhone()%></li>
			<li class="list-group-item">등급 : <%=memberDTO.getGrade()%></li>
		</ul>
		<a href="./memberUpdateForm.jsp" class="btn btn-primary">Update</a>
		<a href="./memberDeleteResult.jsp" id="del" class="btn btn-danger">Delete</a>
	</div>
	<script type="text/javascript">
		$("#del").click(function() {
			var check = confirm('탈퇴하시겠습니까?')
			if(check)
				location.href="./noticeDeleteResult.jsp";
		});
	</script>
</body>
</html>