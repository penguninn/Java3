<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Đăng Ký</h1>
	<c:url value="/bai3/register" var="url"></c:url>
	<form action="${url}" method="post">
		<label>Tên đănh nhập: </label>
		<input type="text" name="uname" value="${uname}" required="required">
		<br>
		<label>Mật khẩu: </label>
		<input type="password" name="pass" value="${pass}" required="required">
		<br>
		<label>Giới tính</label> 
		<input type="radio" name="gender" value="true" ${gender ? 'checked' : ''}> Nam
		<input type="radio" name="gender" value="false" ${!gender ? 'checked' : ''}> Nữ
		<br>
		<input type="checkbox" name="family" value="true" ${family ? 'checked' : ''}  > Đã có gia đình ?
		<br>
		<label>Quốc tịch: </label>
		<select name="country">
			<option value="VN" ${country == "VN" ? 'selected="selected"' : ''}>Việt Nam</option>
			<option value="US" ${country == "US" ? 'selected="selected"' : ''}>Mỹ</option>
			<option value="JP" ${country == "JP" ? 'selected="selected"' : ''}>Nhật Bản</option>
		</select>
		<br>
			<input type="checkbox" name="hobbies" value="read" 
			   <c:if test="${fn:contains(hobbies, 'read')}">checked="checked"</c:if>> Đọc sách<br>
			<input type="checkbox" name="hobbies" value="travel" 
			   <c:if test="${fn:contains(hobbies, 'travel')}">checked="checked"</c:if>> Du Lịch<br>
			<input type="checkbox" name="hobbies" value="music" 
			   <c:if test="${fn:contains(hobbies, 'music')}">checked="checked"</c:if>> Âm nhạc<br>
			<input type="checkbox" name="hobbies" value="diff" 
			   <c:if test="${fn:contains(hobbies, 'diff')}">checked="checked"</c:if>> Khác<br>
		 <br>
		 <label>Ghi chú: </label>
		 <input type="text" name="note" value="${note}">
		 <br>
		 <hr>
		 <br>
		 <button type="submit">Đăng ký</button>
	</form>
</body>
</html>