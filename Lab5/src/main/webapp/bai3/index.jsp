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
<c:url value="/login" var="url"/>
<form action="${url}" method="post">
    <input name="username" value="${username}"> <br> <input
        name="password" value="${password}"> <br> <input
        type="checkbox" name="remember-me"> Remember me?
    <hr>
    <button>Login</button>
</form>
${message}
</body>
</html>