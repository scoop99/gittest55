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
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}

MemberBean mb = new MemberBean();
mb.setId(id);
MemberDAO md = new MemberDAO();

//ResultSet rs = md.getMember(mb);
mb = md.getMember2(mb);

out.print("아이디 : " + mb.getId()+"<br>");
out.print("비밀번호 : " + mb.getPass()+"<br>");
out.print("이름 : " + mb.getName()+"<br>");
out.print("가입날짜 : " + mb.getReg_date()+"<br>");


%>
<%-- 
<%
	if(rs.next()){
		out.print("아이디 : " + rs.getString("id")+"<br>");
		out.print("비밀번호 : " + rs.getString("pass")+"<br>");
		out.print("이름 : " + rs.getString("name")+"<br>");
		out.print("가입날짜 : " + rs.getString("reg_date")+"<br>");
		
	}
%> --%>
<a href="main.jsp">메인으로 이동</a>

<input type="button" value="회원정보 수정" onclick="location.href='updateForm.jsp'">





</body>
</html>