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
	
	NoticeDTO noticeDTO = new NoticeDTO();
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection conn = DBConnector.getConnection();
	noticeDTO = noticeDAO.noticeSelect(conn, num);
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Notice input</h1>
		<form action="./noticeUpdateResult.jsp" method="post" id="form">
			<input type ="text" name= "num" value ="<%=noticeDTO.getNum() %>" hidden="true">
			<div class="form-group">
				<label for="title">title:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title"
					name="title" value="<%=noticeDTO.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="writer">writer:</label> <input type="text"
					class="form-control" id="writer" placeholder="Enter writer"
					name="writer" value="<%=noticeDTO.getWriter()%>">
			</div>
			<div class="form-group">
				<label for="contents">contents:</label>
				<textarea class="form-control" id="contents"  style="height: 300px"
					placeholder="Enter contents" name="contents"><%=noticeDTO.getContents()%> </textarea>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</body>
</html>