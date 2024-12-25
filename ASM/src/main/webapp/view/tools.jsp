<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management System</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="module"
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<%@ include file="../components/header.jsp"%>
<c:url value="/Management" var="path"></c:url>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        Boolean role = (Boolean) session.getAttribute("role");
        String username = (String) session.getAttribute("username");
        if(username == null) {
            response.sendRedirect("home.jsp");
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "news"; 
        }
    %>
    <div class="w-screen flex justify-center items-center">
        <div class="h-auto w-full max-w-screen-2xl flex gap-5 border-x"> 
            <div class="w-1/5 flex flex-shrink-0 flex-col border-r">
                <div class="mx-2 py-3 text-center uppercase text-md text-neutral-700 font-bold border-b">
                    Quản lí hệ thống bản tin
                </div>
                <div class="flex flex-col p-4 gap-2">
                    <a href="${path}?action=news" class="p-4 uppercase text-sm font-bold rounded 
                        <%= action.equals("news") ? "bg-rose-600 text-neutral-100" : "hover:bg-rose-600 hover:text-neutral-100" %>">
                        Quản lí tin tức
                    </a>
                
                    <% if(role) { %>
                        <a href="${path}?action=category" class="p-4 uppercase text-sm font-bold rounded 
                            <%= action.equals("category") ? "bg-rose-600 text-neutral-100" : "hover:bg-rose-600 hover:text-neutral-100" %>">
                            Quản lý loại tin
                        </a>
                        <a href="${path}?action=user" class="p-4 uppercase text-sm font-bold rounded 
                            <%= action.equals("user") ? "bg-rose-600 text-neutral-100" : "hover:bg-rose-600 hover:text-neutral-100" %>">
                            Quản lý người dùng
                        </a>
                        <a href="${path}?action=newsletter" class="p-4 uppercase text-sm font-bold rounded 
                            <%= action.equals("newsletter") ? "bg-rose-600 text-neutral-100" : "hover:bg-rose-600 hover:text-neutral-100" %>">
                            Quản lý Newsletter
                        </a>
                    <% } %>
                </div>
            </div>
            <div class="flex-grow p-5">
                <h1 class="text-2xl font-bold mb-5">
                    Quản lý <%= action.equals("news") ? "Tin tức" : action.equals("category") ? "Loại tin" : action.equals("user") ? "Người dùng" : "Newsletter" %>
                </h1>
                
                <% if (action.equals("news")) { %>
                <form action="${path}/news" method="post">
                    <input type="hidden" name="action" value="news">
                    <div class="mb-4">
                        <label for="id" class="block text-sm font-medium text-gray-700">ID</label>
                        <input type="text" id="id" name="id" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm" value="${item.id}">
                    </div>
                    <div class="mb-4">
                        <label for="title" class="block text-sm font-medium text-gray-700">Tiêu đề</label>
                        <input type="text" id="title" name="title" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm" value="${item.title}">
                    </div>
                    <div class="mb-4">
                        <label for="content" class="block text-sm font-medium text-gray-700">Nội dung</label>
                        <textarea id="content" name="content" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">${item.content}</textarea>
                    </div>
                    <div class="mb-4">
                        <label for="image" class="block text-sm font-medium text-gray-700">Hình ảnh</label>
                        <input type="file" id="image" name="image" accept="image/*" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="categoryId" class="block text-sm font-medium text-gray-700">Loại tin</label>
                        <select id="categoryId" name="categoryId" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                            <c:forEach var="op" items="${listCategory}">
                                <option value="${op.id}" ${item.categoryId == op.id ? 'selected' : ''}>${op.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="home" class="block text-sm font-medium text-gray-700">Hiển thị trang chủ</label>
                        <input type="checkbox" id="home" name="home" class="mt-1" ${item.home ? 'checked' : ''}>
                    </div>
                    <div class="flex space-x-2 mb-4">
                        <button type="submit" name="subaction" value="create" class="bg-green-500 text-white px-4 py-2 rounded">
                            Tạo mới
                        </button>
                        <button type="submit" name="subaction" value="update" class="bg-blue-500 text-white px-4 py-2 rounded">
                            Cập nhật
                        </button>
                        <button type="submit" name="subaction" value="delete" class="bg-red-500 text-white px-4 py-2 rounded">
                            Xóa
                        </button>
                    </div>
                </form>
                <table class="min-w-full table-auto border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-100">
                            <th class="border px-4 py-2">ID</th>
                            <th class="border px-4 py-2">Tiêu Đề</th>
                            <th class="border px-4 py-2">Nội Dung</th>
                            <th class="border px-4 py-2">Hình Ảnh</th>
                            <th class="border px-4 py-2">Ngày Đăng</th>
                            <th class="border px-4 py-2">Tác Giả</th>
                            <th class="border px-4 py-2">Lượt Xem</th>
                            <th class="border px-4 py-2">Danh Mục</th>
                            <th class="border px-4 py-2">Hiển thị trang chủ</th>
                            <th class="border px-4 py-2">Chi Tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${listNews}">
                            <tr class="hover:bg-gray-50">
                                <td class="border px-4 py-2 text-center">${n.id}</td>
                                <td class="border px-4 py-2">${n.title}</td>
                                <td class="border px-4 py-2">${n.content}</td>
                                <td class="border px-4 py-2">${n.image}</td>
                                <td class="border px-4 py-2">${n.postedDate}</td>
                                <td class="border px-4 py-2">${n.author}</td>
                                <td class="border px-4 py-2 text-center">${n.viewCount}</td>
                                <td class="border px-4 py-2">${n.categoryId}</td>
                                <td class="border px-4 py-2 text-center">${n.home ? "Có" : "Không"}</td>
                                <td class="border px-4 py-2 text-center">
                                    <a href="${path}/detail?id=${n.id}"><button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Chi Tiết</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> 
                
                <% } else if (action.equals("category")) { %>
                <form action="${path}/category" method="post">
                    <input type="hidden" name="action" value="category">
                    <div class="mb-4">
                        <label for="id" class="block text-sm font-medium text-gray-700">ID</label>
                        <input type="text" id="id" name="id" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="name" class="block text-sm font-medium text-gray-700">Tên loại tin</label>
                        <input type="text" id="name" name="name" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="flex space-x-2 mb-4">
                        <button type="submit" name="subaction" value="create" class="bg-green-500 text-white px-4 py-2 rounded">
                            Tạo mới
                        </button>
                        <button type="submit" name="subaction" value="update" class="bg-blue-500 text-white px-4 py-2 rounded">
                            Cập nhật
                        </button>
                        <button type="submit" name="subaction" value="delete" class="bg-red-500 text-white px-4 py-2 rounded">
                            Xóa
                        </button>
                    </div>
                </form>
                <table class="min-w-full table-auto border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-100">
                            <th class="border px-4 py-2">ID</th>
                            <th class="border px-4 py-2">Ten Loai Tin</th>
                            <th class="border px-4 py-2">Chi Tiet</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${listCategory}">
                            <tr class="hover:bg-gray-50">
                                <td class="border px-4 py-2 text-center">${c.id}</td>
                                <td class="border px-4 py-2">${c.name}</td>
                                <td class="border px-4 py-2 text-center">
                                    <a href="#"><button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Chi Tiết</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> 
                
                <% } else if (action.equals("user")) { %>
                <form action="${path}/user" method="post">
                    <input type="hidden" name="action" value="user">
                    <div class="mb-4">
                        <label for="id" class="block text-sm font-medium text-gray-700">ID</label>
                        <input type="text" id="id" name="id" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu</label>
                        <input type="password" id="password" name="password" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="fullName" class="block text-sm font-medium text-gray-700">Họ tên</label>
                        <input type="text" id="fullName" name="fullName" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="birthday" class="block text-sm font-medium text-gray-700">Ngày sinh</label>
                        <input type="date" id="birthday" name="birthday" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="gender" class="block text-sm font-medium text-gray-700">Giới tính</label>
                        <select id="gender" name="gender" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                            <option value="true">Nam</option>
                            <option value="false">Nữ</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="mobile" class="block text-sm font-medium text-gray-700">Số điện thoại</label>
                        <input type="tel" id="mobile" name="mobile" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                        <input type="email" id="email" name="email" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="role" class="block text-sm font-medium text-gray-700">Vai trò</label>
                        <select id="role" name="role" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                            <option value="true">Admin</option>
                            <option value="false">User</option>
                        </select>
                    </div>
                    <div class="flex space-x-2 mb-4">
                        <button type="submit" name="subaction" value="create" class="bg-green-500 text-white px-4 py-2 rounded">
                            Tạo mới
                        </button>
                        <button type="submit" name="subaction" value="update" class="bg-blue-500 text-white px-4 py-2 rounded">
                            Cập nhật
                        </button>
                        <button type="submit" name="subaction" value="delete" class="bg-red-500 text-white px-4 py-2 rounded">
                            Xóa
                        </button>
                    </div>
                </form>
                <table class="min-w-full table-auto border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-100">
                            <th class="border px-4 py-2">UserName</th>
                            <th class="border px-4 py-2">Password</th>
                            <th class="border px-4 py-2">Ho Ten</th>
                            <th class="border px-4 py-2">Ngay Sinh</th>
                            <th class="border px-4 py-2">Gioi Tinh</th>
                            <th class="border px-4 py-2">SDT</th>
                            <th class="border px-4 py-2">Mail</th>
                            <th class="border px-4 py-2">Vai Tro</th>
                            <th class="border px-4 py-2">Chi Tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${listUser}">
                            <tr class="hover:bg-gray-50">
                                <td class="border px-4 py-2 text-center">${u.id}</td>
                                <td class="border px-4 py-2">${u.password}</td>
                                <td class="border px-4 py-2">${u.fullName}</td>
                                <td class="border px-4 py-2">${u.birthday}</td>
                                <td class="border px-4 py-2">${u.gender}</td>
                                <td class="border px-4 py-2">${u.mobile}</td>
                                <td class="border px-4 py-2 text-center">${u.email}</td>
                                <td class="border px-4 py-2">${u.role ? 'admin' : 'Phong Vien'}</td>
                                <td class="border px-4 py-2 text-center">
                                    <a href="#"><button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Chi Tiết</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> 
                
                <% } else if (action.equals("newsletter")) { %>
                <form action="${path}/newsletter" method="post">
                    <input type="hidden" name="action" value="newsletter">
                    <div class="mb-4">
                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                        <input type="email" id="email" name="email" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm">
                    </div>
                    <div class="mb-4">
                        <label for="enableds" class="block text-sm font-medium text-gray-700">Kích hoạt</label>
                        <input type="checkbox" id="enableds" name="enableds" class="mt-1">
                    </div>
                    <div class="flex space-x-2 mb-4">
                        <button type="submit" name="subaction" value="create" class="bg-green-500 text-white px-4 py-2 rounded">
                            Tạo mới
                        </button>
                        <button type="submit" name="subaction" value="update" class="bg-blue-500 text-white px-4 py-2 rounded">
                            Cập nhật
                        </button>
                        <button type="submit" name="subaction" value="delete" class="bg-red-500 text-white px-4 py-2 rounded">
                            Xóa
                        </button>
                    </div>
                </form>
                <table class="min-w-full table-auto border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-100">
                            <th class="border px-4 py-2">Email</th>
                            <th class="border px-4 py-2">Trang Thai</th>
                            <th class="border px-4 py-2">Chi Tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="l" items="${listNewsletter}">
                            <tr class="hover:bg-gray-50">
                                <td class="border px-4 py-2 text-center">${l.email}</td>
                                <td class="border px-4 py-2 text-center">${l.enableds ? "Có" : "Không"}</td>
                                <td class="border px-4 py-2 text-center">
                                    <a href="#"><button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Chi Tiết</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> 
                <% } %>
            </div>
        </div>
    </div>
</body>
<%@ include file="../components/footer.jsp"%>
</html>