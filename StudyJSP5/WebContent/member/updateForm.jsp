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
ResultSet rs = md.getMember(mb);


String pass="";
String name="";
//String reg_date="";

if(rs.next()){
	
	//out.print("아이디 : " + rs.getString("id")+"<br>");
	pass = rs.getString("pass");
	name = rs.getString("name");
	//reg_date = rs.getString("reg_date");
}
%>
<script type="text/javascript">
function chk() {
	return true;	
	
	if(document.fr.pass.value == <%=pass%>){
		return true;	
	}
	else{
		alert("비밀번호가 틀립니다.");
		return false;
	}
}
</script>
<h1>jsp4/updateForm.jsp</h1>
<h1>회원수정</h1>
<form action="updatePro.jsp" method="post" name="fr" onsubmit="return chk();">
아이디 : <input type="text" name="id" readonly="readonly" value="<%=id %>"><br>
비밀번호 : <input type="password" name="pass"><br>
수정할 이름 : <input type="text" name="name" value="<%= name%>"><br>

<input type="submit" value="회원수정">
</form>
</body>
</html>