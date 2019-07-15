<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
String pass=(String)session.getAttribute("pass");

if(id==null){
	response.sendRedirect("sessionForm.jsp");
}
%>
<h1>jsp2/sessionMain.jsp</h1>
<%=id %> 님 로그인 하셨습니다.<br>

<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
</body>
</html>