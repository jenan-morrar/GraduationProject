<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Edit Venue</h1>
	<form:form action="/adminVenuePage/${venue.id}" method="post"
		modelAttribute="venue">
		<input type="hidden" name="_method" value="put">
		<p>
			<form:label path="name">name</form:label>
			<form:errors path="name" />
			<form:input path="name" />
		</p>
		<p>
			<form:label path="description">Description</form:label>
			<form:errors path="description" />
			<form:textarea path="description" />
		</p>
		<p>
			<form:label path="location">location</form:label>
			<form:errors path="location" />
			<form:input path="location" />
		</p>
		<p>
			<form:label path="price">Price</form:label>
			<form:errors path="price" />
			<form:input type="number" path="price" />
		</p>
		<input type="submit" value="Submit" />
	</form:form>

	<form:form action="/adminVenuePage/${venue.id}/services/add"
		method="post" modelAttribute="venue">

		<tr>
			<form:label path="services">Venue Services</form:label>
		</tr>
		<br>
		<c:forEach varStatus="us" var="service" items="${venue.services}">
			<tr>
				<td><form:input path="services[${us.index}].name" /></td>
				<td><form:input path="services[${us.index}].price" /></td>
				<form:input type="hidden" path="services[${us.index}].id" />
			</tr>
			<td><a
				href="/adminVenuePage/${venue.id}/services/delete/${service.id}">Delete</a></td>
			<br>
		</c:forEach>
		<br>

		<input type="text" placeholder="name" name="serviceName" />
		<input type="number" placeholder="price" name="servicePrice" />
		<input type="submit" value="add" />
	</form:form>

	<form:form action="/adminVenuePage/${venue.id}/images/add"
		method="post" enctype="multipart/form-data" modelAttribute="venue">

		<tr>
			<form:label path="services">Venue images</form:label>
		</tr>
		<br>
		<c:forEach varStatus="us" var="images" items="${venue.images}">
			<tr>
				<td><img
					src="<c:out value="/user-photos/${venue.id}/${images.image}"/>"
					width="50px" height="50px"></td>
				<form:input type="hidden" path="images[${us.index}].id" />
			</tr>
			<td><a
				href="/adminVenuePage/${venue.id}/images/delete/${images.id}">Delete</a></td>
			<br>
		</c:forEach>
		<br>

		<input type="file" name="image" accept="image/png, image/jpeg" />
		<input type="submit" value="add" />
	</form:form>

</body>
</html>