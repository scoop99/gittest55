<%@page import="java.awt.Paint"%>
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
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String age = request.getParameter("age");

//Integer.parseInt(age) //문자열을 숫자로 변경

out.println("out.println 으로 출력 이름: " + name+" 나이 : "+age+"<br>"); 

%>

이름 : <%=name %><br>
나이+100 : <%=age+100 %><br>
나이+100 : <%=Integer.parseInt(age)+100 %>
<%
int a= Integer.parseInt(age);
if(a>=20){
	out.println("성인");
}
else{
	out.println("미성인");
}
%>
</body>
</html>