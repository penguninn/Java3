<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Sản Phẩm</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<%@ include file="../components/header.jsp"%>
<body>
	<%@ include file="../components/navbar.jsp"%>
	<c:url value="/assets" var="assets"></c:url>
	<c:url value="/news" var="news"></c:url>
	
	<div class="w-screen h-dvh flex justify-center">
		<div class="w-full max-w-screen-2xl flex justify-center mt-5">
			<div class="flex flex-col flex-grow gap-3 px-5">
				<div class="w-full flex justify-between items-center border-b pb-3">
					<a href="${news}/home" class="text-2xl">Tin mới nhất</a>
				</div>
				<span class="text-2xl text-neutral-800 font-semibold">${item.title}</span>
				<div class="">
					<div class="w-1/4 bg-blue-400 float-left mr-4 mb-2">
						<img alt="" src="${assets}/${item.image}">
					</div>
					<div class="text-justify">
						${item.content}
					</div>
					<div class="text-end flex flex-col">
						<span>Ngày đăng: ${item.postedDate}</span>
						<span>Tác giả: ${item.author}</span>
					</div>
				</div>
				<div>
					<span class="text-lg font-bold" >Tin cùng loại</span>
					<ul class="list-outside space-y-2 m-2">
					    <c:forEach var="cat" items="${sameCatogery}">
					        <li>
					            <a 
					                href="${news}/detail?id=${cat.id}" 
					                class="block p-4 rounded-lg bg-white shadow hover:bg-gray-100 transition-colors duration-200 ease-in-out"
					            >
					                ${cat.title}
					            </a>
					        </li>
					    </c:forEach>
					</ul>
				</div>
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