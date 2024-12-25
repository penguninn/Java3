<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url var="path" value="/empoloyees"/>
	<!-- FORM -->
	<form method="post">
		<label>Id:</label><br> 
		<input name="id" value="${item.id}"><br>
		<label>Password:</label><br> 
		<input name="password" value="${item.password}"><br>
		<label>Full name:</label><br>
		<input name="fullName" value="${item.fullName}"><br>
		<label>Photo:</label><br>
		<input name="photo" value="${item.photo}"><br>
		<label>Gender:</label><br>
		<input type="radio" name="gender" ${item.gender ? 'checked' : ''}> Nam
		<input type="radio" name="gender" ${!item.gender ? 'checked' : ''}> Nu <br>
		<label>Birthday:</label><br>
		<input name="birthday" value="${item.birthday}"><br>
		<label>Salary:</label><br>
		<input type="number" name="salary" value="${item.salary}"><br>
		<label>DepartmentID:</label><br>
		<input name="departmentID" value="${item.departmentID}"><br>
		<hr>
		<button formaction="${path}/create">Create</button>
		<button formaction="${path}/update">Update</button>
		<button formaction="${path}/delete">Delete</button>
		<button formaction="${path}/reset">Reset</button>
	</form>
	<hr>
	<!-- TABLE -->
	<table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>No.</th>
				<th>Id</th>
				<th>Password</th>
				<th>Fullname</th>
				<th>Photo</th>
				<th>Gender</th>
				<th>Birthday</th>
				<th>Salary</th>
				<th>DepartmentID</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${list}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${e.id}</td>
					<td>${e.password}</td>
					<td>${e.fullName}</td>
					<td>${e.photo}</td>
					<td>${e.gender}</td>
					<td>${e.birthday}</td>
					<td>${e.salary}</td>
					<td>${e.departmentID}</td>
					<td><a href="${path}/edit/${e.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>