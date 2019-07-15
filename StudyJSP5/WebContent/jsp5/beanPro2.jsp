<%@page import="bean.BeanTest2"%>
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

//id, num request에 저장된 파라미터 가져와서 변수 저장
String id = request.getParameter("id");
int num = Integer.parseInt(request.getParameter("num"));

// 회원정보를 저장할 공간(바구니)만들어서 저장(자바파일)
//  패키지 bean 파일이름 BeanTest2
// BeanTest2파일안에 id, num변수에 파라미터값 을 저장

BeanTest2 bt2 = new BeanTest2();
bt2.setId(id);
bt2.setNum(num);




out.print(bt2.getId() + "   "  + bt2.getNum());




// 자바파일 객체생성하고 insert메서드(회원정보) 호출


// name 파라미터 가져와서 변수에 저장
// 1,2,3sql ? name,4 -> 자바 MemberDAO insert메서드()
%>
<br>


<jsp:useBean id="bt22" class="bean.BeanTest2"></jsp:useBean>
<jsp:setProperty property="*" name="bt22"/>

useBean액션태그 이용 BeanTest2 id변수 : 
<jsp:getProperty property="id" name="bt22"/>
useBean액션태그 이용 BeanTest2 num 변수 :
<jsp:getProperty property="num" name="bt22"/> 










</body>
</html>