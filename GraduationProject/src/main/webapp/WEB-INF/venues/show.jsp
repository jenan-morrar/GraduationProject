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
<h1><c:out value="${venue.name}"/></h1>
<p>Description: <c:out value="${venue.description}"/></p>
<p>Location: <c:out value="${venue.location}"/></p>
<p>Price: <c:out value="${venue.price}"/></p>

<a href="/admin/venues/${venue.id}/edit">Edit Venue</a>
</body>
</html>