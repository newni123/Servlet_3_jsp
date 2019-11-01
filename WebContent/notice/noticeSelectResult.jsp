<%@page import="com.iu.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeDTO noticeDTO = (NoticeDTO) request.getAttribute("noticeDTO");
	if (noticeDTO == null) {
		request.setAttribute("msg", "잘못된 접근");
		request.setAttribute("path", "./noticeList.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
	NoticeDTO noticeDTO2 = (NoticeDTO) request.getAttribute("noticeDTO2");
	NoticeDTO noticeDTO3 = (NoticeDTO) request.getAttribute("noticeDTO3");
	int last = (int) request.getAttribute("last");
	int first = (int) request.getAttribute("first");
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
<body>
	<section>
		<h1 class="pad"><a href="./noticeList.jsp">NOTICE</a></h1>
		<br />
		<table class="t1">
			<tr class="head">
				<td></td>
				<td class="sub" style="text-align: center;">SUBJECT</td>
				<td class="name" style="text-align: center;">NAME</td>
				<td class="date" style="text-align: center;">DATE</td>
				<td class="hit" style="text-align: center;">HIT</td>
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
			<%if (memberDTO != null && memberDTO.getGrade() == 0 && memberDTO.getId().equals(noticeDTO.getWriter())) {%>
			<tr>
				<td colspan="5"><a href="./noticeUpdate.jsp?num=<%=noticeDTO.getNum()%>"
					style="float: right; margin-right: 20px;">Update</a>
					<a href="#" id="del" style="float: left; margin-left: 20px;">Delete</a>
				</td>
			</tr>
			<%} %>
			<%if (noticeDTO.getNum() > first && noticeDTO.getNum() < last) { // 이전글 띄우기(가장 처음글이면 띄우지 않음) %>
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
			<%} else if (noticeDTO.getNum() == last){%>
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