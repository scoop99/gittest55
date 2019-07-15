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
<%
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");
//String num = request.getParameter("num");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
// id pass 비교 일치 하면
// MemberDAO 객체 생성
// userChech()


MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);

MemberDAO md = new MemberDAO();

int result = md.userCheck(mb);

//out.print(result);

if(result==1){
	//성공
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
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
	


%>







</body>
</html>