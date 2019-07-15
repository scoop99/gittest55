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

String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);

MemberDAO md = new MemberDAO();
ResultSet rs = md.getMember(mb);

if(rs.next()){

	if(rs.getString("pass").equals(pass)){
		int result = md.deleteMember(mb);
		if(result==1){
			session.invalidate();
			response.sendRedirect("main.jsp");
		}
		else{
			%>
			<script type="text/javascript">
			alert("탈퇴 실패");
			history.back();
			</script>
			
		<%
		}
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
}
else
{
	%>
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