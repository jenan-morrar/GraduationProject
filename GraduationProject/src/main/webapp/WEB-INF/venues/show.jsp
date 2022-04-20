<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<c:out value="${venue.name}" />
	</h1>
	<p>
		Description:
		<c:out value="${venue.description}" />
	</p>
	<p>
		Location:
		<c:out value="${venue.location}" />
	</p>
	<p>
		Price:
		<c:out value="${venue.price}" />
	</p>

	<c:forEach items="${venue.images}" var="images">
		<tr>
			<td><img
				src="<c:out value="/user-photos/${venue.id}/${images.image}"/>"
				width="50px" height="50px"></td>
		</tr>
		<br>
	</c:forEach>
	<c:forEach items="${venue.services}" var="service">
		<tr>
			<td>Service Name: <c:out value="${service.name}" /></td>
			<td>Service Price: <c:out value="${service.price}" /></td>
		</tr>
		<br>
	</c:forEach>

	<a href="/adminVenuePage/${venue.id}/edit">Edit Venue</a>
</body>
</html>