<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");

	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setTitle(title);
	noticeDTO.setWriter(writer);
	noticeDTO.setContents(contents);
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection conn = DBConnector.getConnection();
	int result = noticeDAO.noticeWrite(conn, noticeDTO);
	conn.close();
	String msg = "등록 실패";
	if(result > 0){
		msg = "등록 성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
	else
		response.sendRedirect("./noticeList.jsp");
	
	
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