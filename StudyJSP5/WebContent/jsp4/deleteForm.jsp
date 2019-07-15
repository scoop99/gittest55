<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}
%>
<h1>jsp4/loginForm.jsp</h1>
<form action="deletePro.jsp" method="post" name="fr">
아아디 : <input type="text" name="id" value="<%=id %>" readonly="readonly"><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="회원삭제">
</form>
</body>
</html>