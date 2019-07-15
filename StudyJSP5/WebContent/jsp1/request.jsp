<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/request.jsp</h3>
<%
//파라미터 정보 가져오기
//request.getParameter("id");
//request.getParameterValues("hoddy");
//http 헤더 정보, 세션, 쿠기, 서버정보
%>

서버정보 : <%=request.getServerName() %><br>
포트번호 : <%=request.getServerPort() %><br>
요청URL : <%=request.getRequestURL() %><br>
요청URI : <%=request.getRequestURI() %><br>
프로토콜 : <%=request.getProtocol() %><br>
요청방식 : <%=request.getMethod() %><br>
프로젝트경로 : <%=request.getContextPath() %><br>
<!-- 127.0.0.1    0:0:0:0:0:0:0:1-->
사용자 주소 : <%=request.getRemoteAddr() %><br>
물리적인 경로 : <%=request.getRealPath("/") %><br>
http헤더정보 : <%=request.getHeader("accept") %><br>
http헤더정보 : <%=request.getHeader("accept-language") %><br>
http헤더정보 : <%=request.getHeader("user-agent") %><br>
 



</body>
</html>