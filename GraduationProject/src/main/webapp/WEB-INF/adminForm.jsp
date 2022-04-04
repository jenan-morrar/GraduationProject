<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Form Page</title>
</head>
<body>
	<form:form action="/admin/adminForm/${venue.id}" method="post"
		modelAttribute="venue">
		<input type="hidden" name="_method" value="put">
		<p>
			<form:label path="name">Title</form:label>
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
			<form:label path="price">price</form:label>
			<form:errors path="price" />
			<form:input type="number" path="price" />
		</p>

		<input type="submit" value="Submit" />
	</form:form>

</body>
</html>