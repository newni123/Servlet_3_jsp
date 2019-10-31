<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setNum(num);
	noticeDTO.setTitle(title);
	noticeDTO.setWriter(writer);
	noticeDTO.setContents(contents);
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection conn = DBConnector.getConnection();
	int result = noticeDAO.noticeUpdate(conn, noticeDTO);
	String msg = "업데이트 실패";
	conn.close();
	
	if(result>0){
		msg = "업데이트 성공";
	}
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeSelect.jsp?num="+num);
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
	<%noticeDTO.setContents(noticeDTO.getContents().replace("\r\n","<br>")); %>
</body>
</html>