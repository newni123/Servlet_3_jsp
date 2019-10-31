<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = new NoticeDTO();
	NoticeDTO noticeDTO2 = new NoticeDTO(); // 이전글
	NoticeDTO noticeDTO3 = new NoticeDTO(); // 다음글
	
	Connection conn = DBConnector.getConnection();
	noticeDTO = noticeDAO.noticeSelect(conn, num);
	noticeDTO2 = noticeDAO.noticeSelectPrev(conn, num);
	noticeDTO3 = noticeDAO.noticeSelectNext(conn, num);
	int last = noticeDAO.lastSelect(conn); // 마지막 글번호
	int first = noticeDAO.firstSelect(conn); // 첫 글 번호
	conn.close();
	 if(noticeDTO == null){
			response.sendRedirect("./noticeList.jsp");
		}
	 else if(noticeDTO != null && noticeDTO.getNum() > 1 && noticeDTO.getNum() < last){ // 이전글,다음글 다있는경우
		request.setAttribute("noticeDTO",noticeDTO);
		request.setAttribute("noticeDTO2",noticeDTO2);
		request.setAttribute("noticeDTO3",noticeDTO3);
		request.setAttribute("last", last);
		request.setAttribute("first", first);
		RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
		view.forward(request, response);
		
	 }
	 else if(noticeDTO != null && noticeDTO.getNum() == 1){ // 다음글은 있는데 이전글은 없는 경우 (처음 글)
			request.setAttribute("noticeDTO",noticeDTO);
			request.setAttribute("noticeDTO3",noticeDTO3);
			request.setAttribute("last", last);
			request.setAttribute("first", first);
			RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
			view.forward(request, response);
	 } 
	 else if(noticeDTO != null && noticeDTO.getNum() == last){ // 이전글은 있는데 다음글은 없는 경우(마지막 글)
			request.setAttribute("noticeDTO",noticeDTO);
			request.setAttribute("noticeDTO2",noticeDTO2);
			request.setAttribute("last", last);
			request.setAttribute("first", first);
			RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
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