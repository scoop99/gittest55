<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookieSet.jsp</h1>
<%

//쿠키객체생성
Cookie cookie = new Cookie("cook","Cookie Value");
//쿠키시간설정
cookie.setMaxAge(30*60); //30분
//쿠키->클라이언트에 저장
response.addCookie(cookie);
%>
 <script type="text/javascript">
alert("쿠키설정");
location.href="cookieTest.jsp";
</script>
</body>
</html>