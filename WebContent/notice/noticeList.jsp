<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	NoticeDAO noticeDAO = new NoticeDAO();
	Connection conn = DBConnector.getConnection();
	ArrayList<NoticeDTO> noticeDTOs = noticeDAO.noticeList(conn);
	conn.close();
	
	// 쿠키 발행
	// 쿠키 생성시 생성자에 키와 밸류 입력
	Cookie cookie = new Cookie("name","iu");
	// 쿠키가 적용되는 path 설정 : 보통 context path 적용
	cookie.setPath(request.getContextPath());
	// 쿠키의 유효시간
	// 단위는 초단위
	// 설정을 하지 않으면 웹브라우저가 종료될 때 같이 종료
	cookie.setMaxAge(60*60);
	// 쿠키를 클라이언트로 전송
	response.addCookie(cookie);
	
	//MemberDTO memberDTO = (MemberDTO)session.getAttribute("member"); // include file중 nav에 있으므로 뺌
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../layout/boot.jsp"%>
<%@ include file="../layout/nav.jsp"%>
<link href="../css/layout.css" rel="stylesheet">
</head>
</head>
<body style = "padding-bottom: 60px;">
	<h1 class="pad"><a href="./noticeList.jsp">NOTICE</a></h1>
	<br />
	<div class="container">
		<table class="t1">
			<thead>
				<tr class="head">
					<th class=no style="text-align: center;">NO</th>
					<th class=sub style="text-align: center;">SUBJECT</th>
					<th class=name style="text-align: center;">WRITE</th>
					<th class=date style="text-align: center;">DATE</th>
					<th class=hit style="text-align: center;">HIT</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < noticeDTOs.size(); i++) {
						NoticeDTO noticeDTO = noticeDTOs.get(i);
				%>
				<tr>
					<td><%=noticeDTO.getNum()%></td>
					<td><a href="./noticeSelect.jsp?num=<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle()%></a></td>
					<td><%=noticeDTO.getWriter()%></td>
					<td><%=noticeDTO.getReg_date()%></td>
					<td><%=noticeDTO.getHit()%></td>
				</tr>
				<%
					}
				%>
				<%if (memberDTO != null && memberDTO.getGrade() == 0){ %>
				<tr>
					<td colspan="5"><a href="./noticeWrite.jsp"
						style="float: right; margin-right: 20px;" class="btn btn-primary">Write</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>

	</div>
</body>
</html>