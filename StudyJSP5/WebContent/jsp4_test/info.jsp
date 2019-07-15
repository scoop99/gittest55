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
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}

//1단계 : 설치한 JDBC 프로그램에서 디비연결할 드라이버 불러오기
//: com폴더 mysql폴더 jdbc폴더 Driver.class

Class.forName("com.mysql.jdbc.Driver");
//2단계 : 불러온 드라이버를 이용해서 디비연결
//(디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
String dburl = "jdbc:mysql://scoop99.asuscomm.com:3306/jspdb5";
String dbuser = "jspid";
String dbPass="jsppass";


Connection  con=DriverManager.getConnection(dburl, dbuser, dbPass);
//3단계 : 연결정보를 이용하여 sql(insert)문을 만들고 실행할수 잇는 객체 생성
//Statement, PreparedStatement, CallableStatement
//String sql = " select * from student where num = ? and name = ?"; //Statement 형태

String sql = " select * from member where id = ? "; //Statement 형태

PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id); //첫째물음표, 값



//4단계 : sql 구분 실행 (insert, update, delete)
//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
ResultSet rs = pstmt.executeQuery();


// 5단계 : select 결과를 화면 출력

//while(rs.next()){
	//조건이 true이면 반복실행 false 반복을 중지
	// rs.next() 조건이  true이면 첫번째행 데이터 존재 첫번째열, 두번째열2
	
	//out.print(rs.getInt(1)+" "+rs.getString(2) +"<br>");
	//out.print(rs.getInt("num")+" "+rs.getString("name") +"<br>");	
//}
	


%>

<%
	if(rs.next()){
		out.print("아이디 : " + rs.getString("id")+"<br>");
		out.print("비밀번호 : " + rs.getString("pass")+"<br>");
		out.print("이름 : " + rs.getString("name")+"<br>");
		out.print("가입날짜 : " + rs.getString("reg_date")+"<br>");
		out.print("성별 : " + rs.getString("sex")+"<br>");
		out.print("나이 : " + rs.getString("age")+"<br>");
		out.print("메일주소 : " + rs.getString("email")+"<br>");
		
	}
%>
<a href="main.jsp">메인으로 이동</a>

<input type="button" value="회원정보 수정" onclick="location.href='updateForm.jsp'">





</body>
</html>