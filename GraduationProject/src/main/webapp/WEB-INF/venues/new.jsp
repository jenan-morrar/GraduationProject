<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>New Venue</h1>
<form:form action="/superAdmin/venues" method="post" modelAttribute="venue">
    <p>
        <form:label path="name">name</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>
        <form:textarea path="description"/>
    </p>
    <p>
        <form:label path="location">location</form:label>
        <form:errors path="location"/>
        <form:input path="location"/>
    </p>
    <p>
        <form:label path="price">Price</form:label>
        <form:errors path="price"/>     
        <form:input type="number" path="price"/>
    </p>    
    <input type="submit" value="Submit"/>
</form:form>   
</body>
</html>