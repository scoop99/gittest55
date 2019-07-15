<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionDel.jsp</h1>
<%
//하나의 세션값 삭제
session.removeAttribute("sesname");
// 
%>
<script type="text/javascript">
alert("삭제완료");
location.href ="sessionTest.jsp";
</script>
</body>
</html>