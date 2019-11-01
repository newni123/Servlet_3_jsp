<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	if (session.getAttribute("member") == null) {
		request.setAttribute("msg", "잘못된 접근");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
	Connection conn = DBConnector.getConnection();
	int result = memberDAO.memberDelete(conn, memberDTO.getId());
	conn.close();
	String msg = "탈퇴 실패";
	if(result > 0)
		msg = "탈퇴 성공";
	session.invalidate();
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