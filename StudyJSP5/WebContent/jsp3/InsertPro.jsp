<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<h1>jsp3/InsertPro.jsp</h1>
<%
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");
//String num = request.getParameter("num");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");


//1단계 : 설치한 JDBC 프로그램에서 디비연결할 드라이버 불러오기
//: com폴더 mysql폴더 jdbc폴더 Driver.class

Class.forName("com.mysql.jdbc.Driver");
//2단계 : 불러온 드라이버를 이용해서 디비연결
// (디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
String dburl = "jdbc:mysql://localhost:3306/jspdb5";
String dbuser = "root";
String dbPass="1234";


Connection  con=DriverManager.getConnection(dburl, dbuser, dbPass);
//3단계 : 연결정보를 이용하여 sql(insert)문을 만들고 실행할수 잇는 객체 생성
// Statement, PreparedStatement, CallableStatement
//String sql = " Insert into student(num, name) values("+num+",'"+name+"')"; //Statement 형태
String sql = " Insert into student(num, name) values(?,?)"; //Statement 형태
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setInt(1, num); //첫번째 물음표 값
pstmt.setString(2, name); //두번째물음표, 값


//4단계 : sql 구분 실행 (insert, update, delete)
pstmt.executeUpdate();


%>


<%=num%><br>
<%=name%><br>

학생입력성공 <%=pstmt %>

<%
String sql2 = " select * from student"; //Statement 형태

//String sql2 = " select * from student where num = ? and name=?"; //Statement 형태


PreparedStatement pstmt2 = con.prepareStatement(sql2);

//pstmt2.setInt(1, num); //첫번째 물음표 값
//pstmt2.setString(2, name); //두번째물음표, 값
ResultSet rs = pstmt2.executeQuery();


%>
<table border="1">
<tr>
	<td>번호(num)</td>
	<td>이름(name)</td>
</tr>
<%
while(rs.next()){
	%>
	<tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr>
<%
	}
%>
</table>
</body>
</html>
















