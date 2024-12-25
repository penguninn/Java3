<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodulesrc="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.2/dist/sweetalert2.all.min.js" integrity="sha256-4HdbDegPFqVsJaRNvgpTveEgxxl4KHtvqtkZeVsJNI4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.2/dist/sweetalert2.min.css" integrity="sha256-XE4NT4UAtULuSdFWQXaaLSOt0/ZqL5xbX/ObUyf2UTI=" crossorigin="anonymous">
</head>
<body class="h-screen">
	<c:url value="/user" var="path"></c:url>
	<c:url value="/news" var="news"></c:url>
	<c:url value="/assets" var="assets" />
	<%
	    String status = (String) request.getAttribute("status");
	    if ("success".equals(status)) {
	%>
	        <script>
	            Swal.fire({
	                title: 'Thành công!',
	                text: 'Đăng kí thành công!',
	                icon: 'success',
	                confirmButtonText: 'OK'
	            }).then(function() {
	                window.location.href = '${news}/home';
	            });
	        </script>
	<%
	    } else if ("error".equals(status)) {
	%>
	        <script>
	            Swal.fire({
	                title: 'Lỗi!',
	                text: 'Đăng kí không thành công. Vui lòng thử lại !',
	                icon: 'error',
	                confirmButtonText: 'OK'
	            }).then(function() {
	                window.location.href = '${path}/register';
	            });
	        </script>
	<%
	    }
	%>
	
	<div class="flex justify-center items-center w-screen h-screen">
		<div class="w-full h-full flex flex-col justify-start items-center gap-6" >
			<a href="${news}/home"><img alt="" src="${assets}/logo.png" class="w-40"></a> 
			<form action="${path}/submitRegister" method="post" style="background-color: #f6f8fa" class="flex flex-col border rounded w-1/3 px-6 py-4 gap-6">
				<span class="text-xl">Đăng ký tài khoản FpolyNews</span>
				<p class="text-md">Chào mừng bạn đến Nền tảng tin tức số 1 Việt Nam FpolyNews! Tham gia cùng chúng tôi để tìm kiếm thông tin hữu ích cần thiết để cải thiện kỹ năng IT của bạn. Vui lòng điền thông tin của bạn vào biểu mẫu bên dưới để tiếp tục.</p>
				<input type="text" required="required" name="fullName" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Tên của bạn" />
				<div class="flex justify-between items-center gap-4">
					<input type="text" required="required" name="id" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Tên tài khoản" >
					<input type="email" required="required" name="email" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Email" >
				</div>
				<div class="flex justify-between items-center gap-4">
					<div class="flex justify-between items-center gap-2 mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 w-full rounded-md sm:text-sm">
						<label>Ngày sinh : </label>
						<input type="date" required="required" name="birthday" value="2000-01-01" class="bg-transparent">
					</div>
					<div class="flex justify-between items-center gap-2 mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 w-full rounded-md sm:text-sm">
						<label>Giới tính : </label>
						<div class="flex justify-between items-center gap-2">
							<input type="radio" name="gender" value="true" checked="checked"> Nam
							<input type="radio" name="gender" value="false"> Nữ
						</div>
					</div>
				</div>
				<input type="text" required="required" name="mobile" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Số điện thoại" >
				<input type="password" required="required" name="password" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Mật khẩu" >
				<input type="password" required="required" name="confirm" class="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1" placeholder="Nhập lại mật khẩu" >
				<button class="rounded bg-green-600 py-2 px-4 text-neutral-100 font-bold" type="submit">Đăng ký</button>
			</form>

			<div class="flex flex-col justify-center items-center border rounded w-1/3 px-6 py-4 gap-6">
				<div>
					<span>Đã có tài khoản?</span> 
					<a href="${path}/login" class="text-blue-700">Đăng nhập</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>