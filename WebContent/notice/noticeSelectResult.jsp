<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
	NoticeDTO noticeDTO2 = (NoticeDTO) request.getAttribute("noticeDTO2");
	NoticeDTO noticeDTO3 = (NoticeDTO) request.getAttribute("noticeDTO3");
	int count = (int)request.getAttribute("count");
	int first = (int)request.getAttribute("first");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/layout.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<section>
		<h1 class="pad"><a href="./noticeList.jsp">NOTICE</a></h1>
		<br />
		<table class="t1">
			<tr class="head">
				<td></td>
				<td class="sub">SUBJECT</td>
				<td class="name">NAME</td>
				<td class="date">DATE</td>
				<td class="hit">HIT</td>
			</tr>
			<tr>
				<td colspan="2"><%=noticeDTO.getTitle()%></td>
				<td><%=noticeDTO.getWriter()%></td>
				<td><%=noticeDTO.getReg_date()%></td>
				<td><%=noticeDTO.getHit()%></td>
			</tr>
			<tr>
				<%noticeDTO.setContents(noticeDTO.getContents().replace("\r\n","<br>")); %>
				<td colspan="5" class="contents"><%=noticeDTO.getContents()%></td>
			</tr>
			<tr>
				<td colspan="5"><a class="btn btn-primary"
					href="./noticeUpdate.jsp?num=<%=noticeDTO.getNum()%>"
					style="float: right; margin-right: 20px;">Update</a>
					<a href="#" id="del" style="float: left; margin-left: 20px;">Delete</a>
				</td>
			</tr>
			<%if (noticeDTO.getNum() > first && noticeDTO.getNum() < count) { // 이전글 띄우기(가장 처음글이면 띄우지 않음) %>
			<tr>
				<td>next</td>			
				<td><a href="./noticeSelect.jsp?num=<%=noticeDTO3.getNum()%>"><%=noticeDTO3.getTitle()%></a></td>
				<td><%=noticeDTO3.getWriter()%></td>
				<td><%=noticeDTO3.getReg_date()%></td>
				<td><%=noticeDTO3.getHit()%></td>
			</tr>
			<tr>
				<td>prev</td>
				<td><a href="./noticeSelect.jsp?num=<%=noticeDTO2.getNum()%>"><%=noticeDTO2.getTitle()%></a></td>
				<td><%=noticeDTO2.getWriter()%></td>
				<td><%=noticeDTO2.getReg_date()%></td>
				<td><%=noticeDTO2.getHit()%></td>
			</tr>
			<%} else if (noticeDTO.getNum() == first) {%>
				<tr>
					<td>next</td>
					<td><a href="./noticeSelect.jsp?num=<%=noticeDTO3.getNum()%>"><%=noticeDTO3.getTitle()%></a></td>
					<td><%=noticeDTO3.getWriter()%></td>
					<td><%=noticeDTO3.getReg_date()%></td>
					<td><%=noticeDTO3.getHit()%></td>
				</tr>
			<%} else if (noticeDTO.getNum() == count){%>
					<tr>
					<td>prev</td>
					<td><a href="./noticeSelect.jsp?num=<%=noticeDTO2.getNum()%>"><%=noticeDTO2.getTitle()%></a></td>
					<td><%=noticeDTO2.getWriter()%></td>
					<td><%=noticeDTO2.getReg_date()%></td>
					<td><%=noticeDTO2.getHit()%></td>
				</tr>
			<% }%>
		</table>
	</section>
	<script type="text/javascript">
		$("#del").click(function() {
			var check = confirm('삭제하시겠습니까?')
			if(check)
				location.href="./noticeDeleteResult.jsp?num=<%=noticeDTO.getNum()%>";
		});
	</script>
</body>
</html>