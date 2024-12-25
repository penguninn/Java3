<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Update</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/form-update-1" method="get">
        <div>Fullname:</div>
        <input name="fullname" value="${user.fullname}" ${editabled ? 'readonly="readonly"' : ''}><br>
        
        <div>Gender:</div>
        <input type="radio" name="gender" value="true" ${user.gender ? 'checked="checked"' : ''}> Male<br>
        <input type="radio" name="gender" value="false" ${!user.gender ? 'checked="checked"' : ''}> Female<br>
        
        <div>Country:</div>
        <select name="country">
            <option value="VN" ${user.country == 'VN' ? 'selected="selected"' : ''}>Việt Nam</option>
            <option value="US" ${user.country == 'US' ? 'selected="selected"' : ''}>United States</option>
            <option value="CN" ${user.country == 'CN' ? 'selected="selected"' : ''}>China</option>
        </select>
        
        <hr>
   
        <button type="submit" ${editabled ? 'disabled="disabled"' : ''}>Create</button>
        <button type="submit">Update</button>
    </form>
</body>
</html>
