<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FPT Polytechnic</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'vi'}" scope="request" />
<fmt:setBundle basename="global" scope="request"/>
<nav>
    <hr>
    <c:url value="/home" var="path" />
    <a href="${path}/index"><fmt:message key="menu.home"/></a> |
    <a href="${path}/about"><fmt:message key="menu.about"/></a> |
    <a href="${path}/contact"><fmt:message key="menu.contact"/></a>
    <hr>
</nav>


<div>
    <a href="?lang=vi">Tiếng Việt</a> |
    <a href="?lang=en">English</a>
</div>

<main>
    <jsp:include page="${view}" />
</main>

<footer>
    <hr> &copy; 2024 by FPT Polytechnic. All rights reserved.
</footer>

</body>
</html>
