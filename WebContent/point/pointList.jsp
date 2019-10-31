<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDAO pointDAO = new PointDAO();
	Connection conn = DBConnector.getConnection();
	ArrayList<PointDTO> pointDTOs = pointDAO.selectList(conn);
	conn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../layout/boot.jsp" %>
</head>
<%@ include file="../layout/nav.jsp" %>
<body>
	<div class = "container">
		<table class = "table">
			<thead>
				<tr><th>NUM</th><th>NAME</th><th>TOTAL</th><th>AVG</th></tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < pointDTOs.size(); i++){
						PointDTO pointDTO = pointDTOs.get(i);
				%>
					<!-- for문 안쪽 -->
					<tr>
						<td><%= pointDTO.getNum() %></td>
						<td><a href="./pointSelect.jsp?num=<%=pointDTO.getNum()%>"><%= pointDTO.getName() %></a></td>
						<td><%= pointDTO.getTotal() %></td>
						<td><%= pointDTO.getAvg() %></td>
					</tr>
				<%
					}
				%>
			</tbody>	
		</table>
				<a href="./pointInsert.jsp" style="float: right" class="btn btn-primary">Insert</a>
	</div>
</body>
</html>