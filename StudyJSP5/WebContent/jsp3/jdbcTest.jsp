<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp3/jdbcTest.jsp</h1>
<%
//JDBC 프로그램 설치
// WebContent - WEB -INF - lib
// mysql-connector-java-5.1.45-bin.jar JDBC 프로그램 설치

//1단계 : 설치한 JDBC 프로그램에서 디비연결할 드라이버 불러오기
//      : com폴더 mysql폴더 jdbc폴더 Driver.class
//        Driver d = new Driver(); 직접적으로 사용

Class.forName("com.mysql.jdbc.Driver");
// 2단계 : 불러온 드라이버를 이용해서 디비연결
//         (디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
String dburl = "jdbc:mysql://localhost:3306/jspdb5";
String dbuser = "root";
String dbPass="1234";


Connection con=DriverManager.getConnection(dburl, dbuser, dbPass);






%>
<%=con %>
</body>
</html>