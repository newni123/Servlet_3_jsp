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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/layout.css" rel="stylesheet">
</head>
</head>
<body>
	<h1 class="pad"><a href="./noticeList.jsp">NOTICE</a></h1>
	<br />
	<div class="container">
		<table class="t1">
			<thead>
				<tr class="head">
					<th class=no>NO</th>
					<th class=sub>SUBJECT</th>
					<th class=name>WRITE</th>
					<th class=date>DATE</th>
					<th class=hit>HIT</th>
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
				<tr>
					<td colspan="5"><a href="./noticeWrite.jsp"
						style="float: right; margin-right: 20px;" class="btn btn-primary">Write</a></td>
				</tr>
			</tbody>
		</table>

	</div>
</body>
</html>