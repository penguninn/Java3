<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body class="h-screen">
	
	<c:url value="/SignupServlet" var="path"></c:url>

	<div class="flex justify-center items-center w-screen h-screen">
		<div class="w-full h-full flex flex-col justify-start items-center gap-6" >
			<a href="./home.jsp"><img alt="" src="../assets/logo.png" class="w-40"></a> 
			<form action="${path}" method="post" style="background-color: #f6f8fa" class="flex flex-col border rounded w-1/3 px-6 py-4 gap-6">
				<span class="text-xl">Quên Mật Khẩu</span>
				<p class="text-md">Bạn quên mật khẩu của mình? Đừng lo lắng! Hãy cung cấp cho chúng tôi email bạn sử dụng để đăng ký tài khoản FpolyNews. Chúng tôi sẽ gửi cho bạn một liên kết để đặt lại mật khẩu của bạn qua email đó.</p>
				<input type="email" required="required" name="email" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Email" >
				<button class="rounded bg-green-600 py-2 px-4 text-neutral-100 font-bold" type="submit">Gửi Email</button>
			</form>
		</div>
	</div>

</body>
</html>