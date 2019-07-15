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
String sname=(String)session.getAttribute("sesname");
if(sname==null){
	sname="세션값없음";
}
%>
<h1>jsp2/sessionTest.jsp</h1>
세션 ID : <%=session.getId() %><br>
세션값 : <%=sname %><br>

<input type="button" value="세션값저장" onclick="location.href='sessionSet.jsp'">
<input type="button" value="세션값삭제" onclick="location.href='sessionDel.jsp'">
<input type="button" value="세션값초기화" onclick="location.href='sessionInval.jsp'">



</body>
</html>