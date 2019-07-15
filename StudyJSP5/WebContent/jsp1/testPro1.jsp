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

out.println("out.println 를 이용한 아이디 :"+request.getParameter("id")+"<br>");
out.println("out.println 를 이용한 비밀번호 :"+request.getParameter("pass")+"<br>");


String id = request.getParameter("id");
String pass = request.getParameter("pass");
%>

<br>
변수를 통한 폼에서 받아온 아이디 : <%=id %><br>
변수를 통한 폼에서 받아온 비밀번호 : <%=pass %>

</body>
</html>