<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookieDel.jsp</h1>
<%
//쿠키값 클라이언트에서 가져오기
//쿠키값이 있으면 
//for if 을 이용하여 쿠키값 찾기
// 찾은 쿠키값 시간 0 설정
//클라이언트에 저장
// 쿠키값 삭제 메세지 이동 cookieTest.jsp
Cookie[] cookies = request.getCookies();

if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("cook")){
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
}

%>
<script type="text/javascript">
alert("쿠키삭제");
location.href="cookieTest.jsp";
</script>
</body>
</html>