<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String check = request.getParameter("remember");

	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(id);
	memberDTO.setPw(pw);
	// 아이디 기억하기
	if(check != null){
		Cookie cookie = new Cookie("id",id);
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*60); // 초단위
		response.addCookie(cookie);
	}else{ // 체크 해제시
		Cookie cookie = new Cookie("id","");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(0); // 체크해제시 쿠키 덮어씌우자마자 삭제
		response.addCookie(cookie);
	}
	MemberDAO memberDAO = new MemberDAO();
	Connection conn = DBConnector.getConnection();
	memberDTO = memberDAO.memberLogin(conn, memberDTO);
	conn.close();

	if(memberDTO != null){
		session.setAttribute("member", memberDTO);
		response.sendRedirect("../index.jsp");
	} else {
		request.setAttribute("msg","로그인 실패");
		request.setAttribute("path","../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
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