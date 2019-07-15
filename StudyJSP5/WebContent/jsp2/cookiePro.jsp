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

// String lang = lang 파라미터 가져오기
String lang = request.getParameter("lang");
//out.print(request.getParameter("lang"));

//쿠키객체생성 "clang" , 파라미터값
Cookie cookie = new Cookie("clang",lang);
//쿠키시간설정
cookie.setMaxAge(30*60); //30분
//쿠키->클라이언트에 저장
response.addCookie(cookie);


%>
<h1>jsp2/cookiePro.jsp</h1>
<script type="text/javascript">
alert("언어설정완료");
location.href="cookieForm.jsp";
</script>
</body>
</html>