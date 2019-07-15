<%@page import="bean.BeanTest1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp5/beanPro1.jsp</h1>
<%
//한글처리
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");

//name request에 저장된 파라미터 가져와서 변수 저장
String name = request.getParameter("name");

// 회원정보를 저장할 공간(바구니)만들어서 저장(자바파일)
//  패키지 bean 파일이름 BeanTest1
// BeanTest1파일안에 name변수에 파라미터값 을 저장

BeanTest1 bt1 = new BeanTest1();
bt1.setName(name);



out.print(bt1.getName());




// 자바파일 객체생성하고 insert메서드(회원정보) 호출


// name 파라미터 가져와서 변수에 저장
// 1,2,3sql ? name,4 -> 자바 MemberDAO insert메서드()
%>
</body>
</html>