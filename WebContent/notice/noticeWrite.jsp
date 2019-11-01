<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<%if (memberDTO == null || memberDTO.getGrade() != 0){ // 관리자가 아닌 일반 회원이 접근시 차단하는 역할
	request.setAttribute("msg","글 작성 권한이 없습니다.");
	request.setAttribute("path", "../index.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
}%>
<%@ include file="../layout/boot.jsp"%>
</head>
<body>
	<div class="container">
		<h1>Notice input</h1>
		<form action="./noticeWriteResult.jsp" method="post" id="form">
			<div class="form-group">
				<label for="title">title:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title" name="title">
			</div>
				<div class="form-group">
				<label for="writer">writer:</label> <input type="text"
					class="form-control" id="writer" placeholder="Enter writer" value = "<%=memberDTO.getId()%>" readonly = "readonly" name = "writer">
			</div>
			<div class="form-group">
				<label for="contents">contents:</label> 
				<textarea style="height: 300px"class="form-control" id="contents" placeholder="Enter contents" name="contents"> </textarea>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</body>
</html>