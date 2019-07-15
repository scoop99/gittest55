<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/session.jsp</h3>
<%
// session : 서버에 처음 접속했을때 서버기억공간 session생성 접속 정보저장
//         : id 부여
%>
접속정보 세션 id : <%=session.getId() %><br>
세션생성된시간 : <%=session.getCreationTime() %><br>
세션최근접속시간 : <%=session.getLastAccessedTime() %><br>
접속유지시간 : <%=session.getMaxInactiveInterval() %><br>
접속유지시간변경 : <%session.setMaxInactiveInterval(3600); %><br>
변경후 접속유지시간 : <%=session.getMaxInactiveInterval() %><br>
세션기억공간에 값 저장 : session.setAttribute("sname","세션값")
<%
// session.setAttribute(이름, 값);
session.setAttribute("sname","세션값");
%>
<br>
세션기억공간에 저장된 "sname"이름에 값 가져오기 : <%=session.getAttribute("sname") %><br>

접속정보 세션값 삭제(초기화) 로그아웃 :
<%
	//session.invalidate(); 
%>
<br>



</body>
</html>