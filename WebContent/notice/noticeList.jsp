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
<style type="text/css">
.pad {
	padding-top: 43px;
	font-size: 30px;
}

a {
	color: rgb(50, 50, 50);
	text-decoration: none;
}

h1 {
	text-align: center;
}

.head {
	background-color: rgb(37, 37, 37);
	color: white;
	font-weight: bold;
}

.t1 {
	margin: 0 auto;
	border-collapse: collapse;
	width: 920px;
}

tr {
	background-color: white;
	border-top: 3.5px solid rgb(241, 241, 241);
	padding: 20px;
	height: 50px;
	font-size: small;
}

td {
	text-align: center;
}

.no {
	width: 10%;
}

.sub {
	width: 60%;
}

.name {
	width: 10%;
}

.date {
	width: 10%;
}

.hit {
	width: 10%;
}

.td1 {
	text-align: center;
	letter-spacing: 5px;
}
.contents{
	padding: 10px;
}
body {
	background-color: rgb(241, 241, 241);
}
</style>
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