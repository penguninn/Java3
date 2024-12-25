<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<footer class="flex justify-center items-center w-screen text-neutral-600 font-semibold">

	<c:url value="/assets" var="assets" />

	<div class="flex justify-between items-center w-full mx-10 p-2 border-t-2">
		<div class="flex items-center gap-2">
			<span>Báo điện tử</span>
			<img alt="" src="${assets}/logo.png" class="w-1/6">
		</div>
		<div class="flex items-center gap-4">
			<span>Theo dõi FpolyNews trên</span>
			<div class="flex items-center gap-2">
				<a href="#"><ion-icon name="logo-facebook"></ion-icon></a>
				<a href="#"><ion-icon name="logo-youtube"></ion-icon></a>
				<a href="#"><ion-icon name="logo-twitter"></ion-icon></a>
				<a href="#"><ion-icon name="logo-github"></ion-icon></a>
			</div>
		</div>
	</div>
</footer>