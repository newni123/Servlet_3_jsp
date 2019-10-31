<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	PointDAO pointDAO = new PointDAO();
	Connection conn = DBConnector.getConnection();
	PointDTO pointDTO = pointDAO.selectOne(conn, num);
	conn.close();
	
	if(pointDTO == null){
		response.sendRedirect("./pointList.jsp");
	} else {
		request.setAttribute("pointDTO", pointDTO);
		RequestDispatcher view = request.getRequestDispatcher("./pointSelectResult.jsp");
		view.forward(request, response);
	}
%>
