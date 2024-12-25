<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<c:url value="/mail" var="url"/>
<form action="${url}" method="post">
    From: <input type="email" name="from"> <br>
    To: <input type="email" name="to"> <br>
    Subject: <input type="text" name="subject"> <br>
    Body: <input type="text" name="content"> <br>
    <button type="submit">Send Email</button>
</form>
</body>
</html>