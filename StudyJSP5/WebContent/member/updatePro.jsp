<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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

String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");


MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);

MemberDAO md = new MemberDAO();

int result = md.userCheck(mb);

if(result==1){
	result = md.updateMember(mb);
	if(result==1){
		response.sendRedirect("info.jsp");
	}
	else{
		%>
		<script type="text/javascript">
		alert("오류발생.");
		history.back();
		</script>
		<%
	}
}
else if(result==0){
	//비밀번호 틀림
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		//location.href ="loginForm.jsp";
		history.back();
		</script>
	<%
}
else if(result==-1){
	%>
	//아이디 없음
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


<!-- 내방법
<script type="text/javascript">
alert("수정성공");
location.href ="info.jsp";
</script> -->
</body>
</html>