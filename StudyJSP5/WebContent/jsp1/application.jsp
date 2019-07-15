<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/application.jsp</h3>
<%
//application : 서버에 정보를 저장하는 내장객체
//            : 서버 start 유지 서버 stop 삭제

%>
서버 정보 : <%=application.getServerInfo() %><br>
물리적 경로 : <%=application.getRealPath("/") %><br>
application에 값을 저장(&lt;%application.setAttribute("aname", "application값"); %&gt;) :  
<%application.setAttribute("aname", "application값"); %><br>
application에 저장된 값 가져오기(&lt;%=application.getAttribute("aname") %&gt;) :    
<%=application.getAttribute("aname") %><br>
<%out.println("출력정보 저장객체"); %><br>
출력정보저장하는 out내장객체 버퍼의 크기(&lt;%=out.getBufferSize() %&gt;) : <%=out.getBufferSize() %><br>
출력정보저장하는 out내장객체 남은버퍼의 크기(&lt;%=out.getRemaining() %&gt;) : <%=out.getRemaining() %><br>
기억정보를 닫음(&lt;%=out.close() %&gt;) : <%out.close(); %><br>
&lt;%out.println("테스트"); %&gt; : <%out.println("테스트"); %> 

<%
//pageContext 내장객체 현페이지의 모든 정보를 저장
//config 초기설정정보, page, execption 내장객체
%>


</body>
</html>