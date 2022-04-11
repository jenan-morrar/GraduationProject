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
	<form:form action="/admin/venues/${venue.id}" method="post"
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

		<!--<tr>
			<form:label path="services">Service name</form:label>
		</tr>
		<br>
		<c:forEach varStatus="us" var="service" items="${venue.services}">
			<table id="myTable">
				<tr>
					<td><form:input path="services[${us.index}].name" /></td>
					<td><form:input path="services[${us.index}].price" /></td>
					<form:input type="hidden" path="services[${us.index}].id" />
				</tr>
				<td><a
					href="/admin/venues/${venue.id}/services/delete/${service.id}">Delete</a></td>
			</table>
			<br>
		</c:forEach> -->
		<input type="submit" value="edit" />
	</form:form>
	<br>
	<hr>
	<form:form action="/admin/venues/${venue.id}/images/add" method="post"
		modelAttribute="venue" enctype="multipart/form-data">
		<legend>Add a Venue's images</legend>

		<c:forEach varStatus="us" var="image" items="${venue.images}">
			<table id="myTable">
				<tr>
					<td><img
						src="<c:out value="/user-photos/${venue.id}/${image.image}"/>"
						width="50px" height="50px"></td>
						<form:input type="hidden" path="images[${us.index}].id" />
					<td><a
						href="/admin/venues/${venue.id}/images/delete/${image.id}">Delete</a></td>
				</tr>

			</table>
			<br>
		</c:forEach>

		<p>
			<label for="image">Product Images: </label> <input type="file"
				name="image" accept="image/png, image/jpeg" />
		</p>
		<p>
			<input id="submit" type="submit" tabindex="5" value="Add images">
		</p>
	</form:form>
	<br>
	<hr>
	<form:form action="/admin/venues/${venue.id}/services/add"
		method="post" modelAttribute="venue">

		<tr>
			<form:label path="services">Venue's Service</form:label>
		</tr>
		<br>
		<c:forEach varStatus="us" var="service" items="${venue.services}">
			<table id="myTable">
				<tr>
					<td><form:input path="services[${us.index}].name" /></td>
					<td><form:input path="services[${us.index}].price" /></td>
					<form:input type="hidden" path="services[${us.index}].id" />
					<td><a
						href="/admin/venues/${venue.id}/services/delete/${service.id}">Delete</a></td>
				</tr>

			</table>
			<br>
		</c:forEach>
		<input type="text" placeholder="name" id="serviceName"
			name="serviceName" required />
		<input type="number" placeholder="price" id="servicePrice"
			name="servicePrice" required />
		<input type="submit" value="add" />
		<c:set var="serviceExist" scope="session" value="${serviceExist}" />
		<c:if test="${serviceExist ==\"yes\"}">
			<p>The Service already exist!</p>
		</c:if>
	</form:form>
</body>
</html>