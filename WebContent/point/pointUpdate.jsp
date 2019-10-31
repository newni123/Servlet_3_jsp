<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.point.PointDTO"%>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>Point Update Result</h1>
		<form action="./pointUpdateResult.jsp" method="post" id = "form">
			<input type ="text" name= "num" value ="<%=pointDTO.getNum() %>" hidden="true">
			<div class="form-group">
				<label for="email">Name:</label> <input type="text" 
					class="form-control" id="name" placeholder="Enter Name" name="name" value=<%=pointDTO.getName()%>>
			</div>
			<div class="form-group">
				<label for="pwd">Kor:</label> <input type="text"
					class="form-control" id="kor" placeholder="Enter kor" name="kor" value=<%=pointDTO.getKor()%>>
			</div>
			<div class="form-group">
				<label for="pwd">Eng:</label> <input type="text"
					class="form-control" id="eng" placeholder="Enter Eng" name="eng" value=<%=pointDTO.getEng()%>>
			</div>
			<div class="form-group">
				<label for="pwd">Mat:</label> <input type="text"
					class="form-control" id="mat" placeholder="Enter Mat" name="mat" value=<%=pointDTO.getMat()%>>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</body>
</html>