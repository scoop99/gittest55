<%@page import="java.sql.Timestamp"%>
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
<%
// 한글처리
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");
// id, pass, name request에 저장된 파라미터 가져와서 변수 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String age = request.getParameter("age");
String email = request.getParameter("email");

Timestamp reg_date = new Timestamp(System.currentTimeMillis());

// reg_date 현시템 날짜시간 가져 오기

//1단계 드라이버 불러오기
//: com폴더 mysql폴더 jdbc폴더 Driver.class
Class.forName("com.mysql.jdbc.Driver");

//2단계 디비연결
// (디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
String dburl = "jdbc:mysql://scoop99.asuscomm.com:3306/jspdb5";
String dbuser = "jspid";
String dbPass="jsppass";
Connection  con=DriverManager.getConnection(dburl, dbuser, dbPass);
//3단계 sql(insert) 만들고 실행할 객체 생성
String sql = " Insert into member(id,pass,name,reg_date, sex, age, email) values(?,?,?,?,?,?,?)"; //Statement 형태
PreparedStatement pstmt = con.prepareStatement(sql);

//4단계 sql 실행
pstmt.setString(1, id); //첫번째 물음표 값
pstmt.setString(2, pass); //두번째물음표, 값
pstmt.setString(3, name); //세번째물음표, 값
pstmt.setTimestamp(4, reg_date); //네번째물음표, 값
pstmt.setString(5, sex); //5째물음표, 값
pstmt.setString(6, age); //6째물음표, 값
pstmt.setString(7, email); //7째물음표, 값


//4단계 : sql 구분 실행 (insert, update, delete)
pstmt.executeUpdate();

%>

<script type="text/javascript">
alert("가입성공");
location.href ="loginForm.jsp";
</script>

</body>
</html>