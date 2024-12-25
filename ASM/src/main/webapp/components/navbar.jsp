<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/news" var="news"></c:url>
<nav class="flex justify-center items-center border-b-2 w-screen p-4 bg-white sticky top-0 z-40 shadow-md">
		<div class="flex justify-center items-center gap-4 text-neutral-600	font-semibold">
			<a href="${news}/home" class="px-2 hover:text-rose-600">Trang chủ</a>
			<c:forEach var="cat" items="${categories}">
			    <a href="${news}/catogery?idCategory=${cat.id}" class="px-2 hover:text-rose-600">${cat.name}</a>  
			</c:forEach>
		</div>
	</nav>