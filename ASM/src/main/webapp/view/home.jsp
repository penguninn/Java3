<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<%@ include file="../components/header.jsp"%>
<body class="overflow-x-hidden">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
	%>
	<%@ include file="../components/navbar.jsp"%>
	<c:url value="/assets" var="assets"></c:url>
	<c:url value="/news" var="news"></c:url>
	
	<div class="w-screen flex flex-col items-center">
		<div class="w-full max-w-screen-2xl flex justify-start items-center mt-5">
			<span class="text-3xl text-neutral-500 font-bold">Tin Mới Nhất</span>
		</div>
		<div class="flex h-auto w-full max-w-screen-2xl my-5 gap-5 border-t-2 pt-5">
			<div class="flex flex-grow flex-col gap-5">
				<table class="w-full flex flex-col">
				    <c:forEach var="item" items="${list}">
					    <c:choose>
					        <c:when test="${isHomePage}">
					            <c:if test="${item.home}">
					                <tr class="flex bg-slate-200 mb-2 rounded">
					                    <td class="flex-shrink-0 w-1/4 m-2">
					                        <a href="${news}/detail?id=${item.id}" class="block w-full h-36 bg-blue-400">
					                            <img alt="" src="${assets}/${item.image}" class="object-cover h-full w-full">
					                        </a>
					                    </td>
					                    <td class="flex-grow m-2">
					                        <a href="${news}/detail?id=${item.id}" class="block">
					                            <span class="font-semibold">${item.title}</span> <br>
					                            <span>
					                                <c:choose>
					                                    <c:when test="${fn:length(item.content) > 200}">
					                                        ${fn:substring(item.content, 0, 200)}...
					                                    </c:when>
					                                    <c:otherwise>
					                                        ${item.content}
					                                    </c:otherwise>
					                                </c:choose>
					                            </span> <br>
					                            <span>Ngày đăng: ${item.postedDate}</span> <br>
					                            <span>Tác giả: ${item.author}</span> <br>
					                        </a>
					                    </td>
					                </tr>
					            </c:if>
					        </c:when>
					        <c:otherwise>
					            <tr class="flex bg-slate-200 mb-2 rounded">
					                <td class="flex-shrink-0 w-1/4 m-2">
					                    <a href="${news}/detail?id=${item.id}" class="block w-full h-36 bg-blue-400">
					                        <img alt="" src="${assets}/${item.image}" class="object-cover h-full w-full">
					                    </a>
					                </td>
					                <td class="flex-grow m-2">
					                    <a href="${news}/detail?id=${item.id}" class="block">
					                        <span class="font-semibold">${item.title}</span> <br>
					                        <span>
					                            <c:choose>
					                                <c:when test="${fn:length(item.content) > 200}">
					                                    ${fn:substring(item.content, 0, 200)}...
					                                </c:when>
					                                <c:otherwise>
					                                    ${item.content}
					                                </c:otherwise>
					                            </c:choose>
					                        </span> <br>
					                        <span>Ngày đăng: ${item.postedDate}</span> <br>
					                        <span>Tác giả: ${item.author}</span> <br>
					                    </a>
					                </td>
					            </tr>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
				</table>
			</div>
			<div class="flex flex-shrink-0 flex-col w-1/4 border-2 rounded text-neutral-600 font-semibold">
				<a href="${news}/xemnhieu" class="flex justify-items-start items-center border-b-2 p-4 hover:bg-rose-500 hover:text-neutral-100">5 Bản tin được xem nhiều</a>
				<a href="${news}/moinhat" class="flex justify-items-start items-center border-b-2 p-4 hover:bg-rose-500 hover:text-neutral-100">5 Bản tin mới nhất</a>
				<a href="${news}/daxem" class="flex justify-items-start items-center border-b-2 p-4 hover:bg-rose-500 hover:text-neutral-100">5 Bản tin bạn đã xem</a>
				<a href="#" class="flex justify-items-start items-center border-b-2 p-4 hover:bg-rose-500 hover:text-neutral-100">Đăng kí nhận tin mới</a>
			</div>
		</div>
	</div>
</body>
<%@ include file="../components/footer.jsp"%>
</html>