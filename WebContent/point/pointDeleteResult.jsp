<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	PointDAO pointDAO = new PointDAO();
	Connection conn = DBConnector.getConnection();
	num = pointDAO.delete(conn, num);
	conn.close();
	// 성공하면 성공메시지 alert List로 
	// 실패하면 메시지 없이 List로
	String msg = "삭제 실패";
	if (num > 0){
		msg = "삭제 성공";
		request.setAttribute("msg", msg); // msg 이름으로 현재 페이지의 변수 msg를 보냄
		request.setAttribute("path", "./pointList.jsp"); // path 이름으로 주소를 보냄
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
	else
		response.sendRedirect("./pointList.jsp");
		
	
	
	 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	
</script>
</body>
</html>