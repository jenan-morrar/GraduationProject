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
<h1>All Venues</h1>
<table>
    <thead>
        <tr>
            <th>name</th>
            <th>Description</th>
            <th>Location</th>
            <th>Price</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${venues}" var="venue">
        <tr>
            <td><c:out value="${venue.name}"/></td>
            <td><c:out value="${venue.description}"/></td>
            <td><c:out value="${venue.location}"/></td>
            <td><c:out value="${venue.price}"/></td>
        </tr>
        </c:forEach>
    </tbody>
</table>
<a href="/superAdmin/venues/new">New Venue</a>
</body>
</html>