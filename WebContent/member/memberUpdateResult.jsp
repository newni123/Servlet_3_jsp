<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	if (memberDTO == null) {
		request.setAttribute("msg", "권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
%>
<%
	memberDTO = (MemberDTO) session.getAttribute("member");
	Connection conn = DBConnector.getConnection();
	MemberDAO memberDAO = new MemberDAO();

	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));

	int result = memberDAO.memberUpdate(conn, memberDTO);
	conn.close();
	String msg = "정보 수정 실패";
	if (result > 0)
		msg = "정보 수정 완료";
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