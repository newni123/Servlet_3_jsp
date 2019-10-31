<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	int total = kor + eng + mat;
	double avg = total / 3.0;
	
	PointDTO pointDTO = new PointDTO();
	pointDTO.setName(name);
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMat(mat);
	pointDTO.setTotal(total);
	pointDTO.setAvg(avg);
	
	PointDAO pointDAO = new PointDAO();
	Connection conn = DBConnector.getConnection();
	int result = pointDAO.insert(conn, pointDTO);
	/*	
	PointDTO pointDTO = new PointDTO();
	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMat(Integer.parseInt(request.getParameter("mat")));
	pointDTO.setTotal(pointDTO.getKor() + pointDTO.getEng() + pointDTO.getMat());
	pointDTO.setAvg(pointDTO.getTotal()/3.0);
	*/
	conn.close();
	String msg = "등록 실패";
	if (result > 0){
		msg = "등록 성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./pointList.jsp");
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
</body>
</html>