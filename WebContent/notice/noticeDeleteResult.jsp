<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	Connection conn = DBConnector.getConnection();
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.noticeDelete(conn, num);
	String msg = "삭제 실패";
	if(result > 0){
		msg = "삭제 성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path","./noticeList.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
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