<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
<h1>jsp4/loginForm.jsp</h1>
<form action="loginPro.jsp" method="post" name="fr">
아아디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="전송"><br>
<input type="button" value="회원가입" onclick="location.href='InsertForm.jsp'">
</form>
</body>
</html>