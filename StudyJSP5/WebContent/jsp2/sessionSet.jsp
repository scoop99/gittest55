<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionSet.jsp</h1>
<%
//세션값 저장
session.setAttribute("sesname", "session Value");
%>
<script type="text/javascript">
alert("이동");
location.href="sessionTest.jsp";
</script>
</body>
</html>