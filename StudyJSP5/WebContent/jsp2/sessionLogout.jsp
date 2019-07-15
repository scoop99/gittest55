<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>jsp2/sessionLogout.jsp</h1>
<%
//세션 초기화
session.invalidate();
%>

 <script type="text/javascript">
alert("이동");
location.href="sessionMain.jsp";
</script>
</body>
</html>