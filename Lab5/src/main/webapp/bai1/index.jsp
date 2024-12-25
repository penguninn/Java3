<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<c:url value="/save" var="url"/>
<form action="${url}" method="post">
    Full name: <input name="fullname"> <br>
    Birthday: <input name="birthday"> <br>
    <input type="radio" name="gender" value="true"> Male
    <input type="radio" name="gender" value="false"> Female <br>
    <input type="checkbox" name="hobbies" value="Reading"> Reading <input
        type="checkbox" name="hobbies" value="Traveling"> Traveling <input
        type="checkbox" name="hobbies" value="Music"> Music <br> <select
        name="country">
    <option value="VN">Việt Nam</option>
    <option value="US" selected>United States</option>
</select> <br> <input name="salary"> <br>
    <hr>
    <button>Submit</button>
</form>
</body>
</html>