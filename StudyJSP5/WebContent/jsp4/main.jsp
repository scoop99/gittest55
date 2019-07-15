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

if(id==null){
	response.sendRedirect("loginForm.jsp");
}

%>
<h1>jsp4/Main.jsp</h1>
<%=id %> 님 로그인 하셨습니다.<br>

<a href="info.jsp">회원정보로 이동</a><br>

<input type="button" value="회원가입" onclick="location.href='InsertForm.jsp'">
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<input type="button" value="회원정보 수정" onclick="location.href='updateForm.jsp'">
<input type="button" value="회원정보 삭제" onclick="location.href='deleteForm.jsp'">
<%
	//세션값이 존재하면
	//세션삾이 "admin" 이면 회원 리스트 나오도록
	if(id!=null){
		if(id.equals("admin")){
			%>
				<input type="button" value="회원리스트" onclick="location.href='list.jsp'">		
			<%
		}
	}
%>


</body>
</html>