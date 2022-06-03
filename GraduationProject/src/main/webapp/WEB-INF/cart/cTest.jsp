<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Venue name</th>
				<th>status</th>
				<th>from time</th>
				<th>to time</th>
				<th>expirationDate</th>
				<th>created at</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reservations}" var="reservation">
				<tr>
				<td><c:out value="${reservation.venue.name}" /></td>
					<td><c:out value="${reservation.status}" /></td>
					<td><c:out value="${reservation.fromTime}" /></td>
					<td><c:out value="${reservation.toTime}" /></td>
					<td><c:out value="${reservation.expirationDate}" /></td>
					<td><c:out value="${reservation.createdAt}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>