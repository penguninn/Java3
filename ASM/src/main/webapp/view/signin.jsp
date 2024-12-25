<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body class="h-screen">
	
	<c:url value="/user" var="path"></c:url>
	<c:url value="/assets" var="assets" />
	<c:url value="/news" var="news" />

	<div class="flex justify-center items-center w-screen h-2/3">
		<div class="w-full flex flex-col justify-center items-center gap-6" >
			<a href="${news}/home"><img alt="Logo" src="${assets}/logo.png" class="w-40"></a> 
			<span class="text-2xl">Đăng nhập vào FpolyNews</span>

			<form action="${path}/submitLogin" method="post" style="background-color: #f6f8fa" class="flex flex-col border rounded w-96 px-6 py-4 gap-6">
				<div class="flex flex-col gap-2">
					<span class="text-lg">Tên đăng nhập hoặc email</span> 
					<input type="text" required="required" class="w-full h-8 border rounded" name="username">
				</div>
				<div class="flex flex-col gap-2">
					<div class="flex justify-between items-center">
						<span class="text-lg">Mật khẩu</span> 
						<a href="${path}/forgot-password" class="text-blue-700">Quên mật khẩu?</a>
					</div>
					<input type="password" required="required" class="w-full h-8 border rounded" name="password">
				</div>
				<button class="rounded bg-green-600 py-2 px-4 text-neutral-100 font-bold" type="submit">Đăng nhập</button>
			</form>

			<div class="flex flex-col justify-center items-center border rounded w-96 px-6 py-4 gap-6">
				<a href="#" class="text-blue-600 font-bold">Đăng nhập bằng Google</a>
				<div>
					<span>Chưa có tài khoản?</span> 
					<a href="${path}/register" class="text-blue-700">Tạo tài khoản mới</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>