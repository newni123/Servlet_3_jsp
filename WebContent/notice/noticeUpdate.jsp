<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/boot.jsp"%>
<%@ include file="../layout/nav.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDTO noticeDTO = new NoticeDTO();
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection conn = DBConnector.getConnection();
	noticeDTO = noticeDAO.noticeSelect(conn, num);
	conn.close();
	
	if( memberDTO == null || memberDTO.getGrade() != 0 || !memberDTO.getId().equals(noticeDTO.getWriter())){
		request.setAttribute("msg", "권한이 없습니다.");
		request.setAttribute("path", "./noticeList.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
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
					name="writer" value="<%=noticeDTO.getWriter()%>" readonly="readonly">
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