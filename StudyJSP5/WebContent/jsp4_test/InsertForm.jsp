<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="InsertPro.jsp" method="post" name="fr">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
성별 : 
	<input type="radio" name="sex" value="1" checked="checked">남
	<input type="radio" name="sex" value="2">여<br>
나이 : <input type="text" name="age"><br>
메일주소 : <input type="text" name="email"><br>
<input type="submit" value="가입">
</form>
</body>
</html>