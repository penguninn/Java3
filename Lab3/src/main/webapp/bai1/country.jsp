<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select name="country">
		<c:forEach items="${countries}" var="ct">
			<option value="${ct.id}">${ct.name}</option>
		</c:forEach>
	</select>
</body>
</html>