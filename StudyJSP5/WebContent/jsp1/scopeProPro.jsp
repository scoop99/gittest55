<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/scopeProPro.jsp</h3>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String age = request.getParameter("age");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
나이 : <%=age %><br>





pageContext : <%=pageContext.getAttribute("page") %><br>
request : <%=request.getAttribute("req") %><br>
session : <%=session.getAttribute("ses") %><br>
application : <%=application.getAttribute("app") %><br>
</body>
</html>