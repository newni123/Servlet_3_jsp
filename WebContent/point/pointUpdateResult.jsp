<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	Connection conn = DBConnector.getConnection();
	String name = request.getParameter("name");
	int num = Integer.parseInt(request.getParameter("num"));
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
	pointDTO.setNum(num);
	
	PointDAO pointDAO = new PointDAO();
	int result = pointDAO.update(conn, pointDTO);
	String msg = "업데이트 실패";
	conn.close();
	
	if (result > 0){
		msg = "업데이트 성공";
	}
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./pointList.jsp");
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
<script type="text/javascript">
	
</script>
</body>
</html>