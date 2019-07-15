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
<h1>jsp3/updatePro.jsp</h1>
<%
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");
//String num = request.getParameter("num");

String id = request.getParameter("id");
String pass = request.getParameter("pass");


//1단계 : 설치한 JDBC 프로그램에서 디비연결할 드라이버 불러오기
//: com폴더 mysql폴더 jdbc폴더 Driver.class

Class.forName("com.mysql.jdbc.Driver");
//2단계 : 불러온 드라이버를 이용해서 디비연결
// (디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
String dburl = "jdbc:mysql://scoop99.asuscomm.com:3306/jspdb5";
String dbuser = "jspid";
String dbPass="jsppass";

Connection  con=DriverManager.getConnection(dburl, dbuser, dbPass);


//3단계 sql(select 조건 id=?) 만들고 실행할 객체 생성
String sql = " select * from member where id = ?";// and pass = ? ";// where num = ? and name = ?"; //Statement 형태
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id); //첫번째 물음표 값
//pstmt.setString(2, pass); //두번째물음표, 값

//4단계 결과저장 <= sql 구문 실행 select
ResultSet rs = pstmt.executeQuery();

//5단계 select 결과를 비교해서 일치여부 확인
if(rs.next()){

	if(rs.getString("pass").equals(pass)){
		//비밀번호가 맞으면 update 4단계 실행
		sql = "delete from member where  id = ? and pass = ?"; //Statement 형태
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, id); //두번째물음표, 값
		pstmt.setString(2, pass); //두번째물음표, 값
		//4단계 : sql 구분 실행 (insert, update, delete)
		pstmt.executeUpdate();
		//세션 초기화
		session.invalidate();
		response.sendRedirect("main.jsp");
	}
	else{
		%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다.");
			//location.href ="loginForm.jsp";
			history.back();
			</script>
		<%
	}
}else
{
	%>
	<script type="text/javascript">
	alert("등록된 아이디가 없습니다.");
	//location.href ="loginForm.jsp";
	history.back();
	</script>
	
<%
}



/*
내방법

//3단계 : 연결정보를 이용하여 sql(update)문을 만들고 실행할수 잇는 객체 생성
// Statement, PreparedStatement, CallableStatement
sql = "update member set name = ? where  id = ? and pass = ?"; //Statement 형태

pstmt = con.prepareStatement(sql);

pstmt.setString(1, name); //첫번째 물음표 값
pstmt.setString(2, id); //두번째물음표, 값
pstmt.setString(3, pass); //두번째물음표, 값

//4단계 : sql 구분 실행 (insert, update, delete)
pstmt.executeUpdate();

*/
%>

<%=pstmt %>
<!-- 내방법
<script type="text/javascript">
alert("수정성공");
location.href ="info.jsp";
</script> -->
</body>
</html>