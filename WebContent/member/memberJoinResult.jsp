<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(request.getParameter("id"));
	if (request.getParameter("id") == null) {
		request.setAttribute("msg", "잘못된 접근");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	MemberDAO memberDAO = new MemberDAO();
	Connection conn = DBConnector.getConnection();
	int result = memberDAO.memberJoin(conn, memberDTO);
	String msg = "가입 실패";
	conn.close();
	if (result > 0) {
		msg = "가입 성공";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("path", "../index.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>