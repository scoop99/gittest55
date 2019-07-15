<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/response.jsp</h3>

<%
//response:응답정보를 저장
//         서버의 처리 결과 -> 클라이언트 응답, 설정변경


//http header 값변경
//response.setHeader("헤더이름", "변경값");

//쿠키값변경 서버 -> 클라이언트에 보내서 값 저장
//response.addCookie("쿠키값");

//클라이언트 contentType설정
//response.setContentType("text/html; charset=UTF-8");

//클라이언트 URL주소 재정송(하이퍼 링크)
//response.sendRedirect("request.jsp");

%>

<script type="text/javascript">
//매시지 "이동"
alert("이동합니다");

//request.jsp 로 이동
//document.location.href = "request.jsp";
<%
	response.sendRedirect("request.jsp");
%>


</script>

</body>
</html>