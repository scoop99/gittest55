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
//폼에서 가져온 값 비교
String id = request.getParameter("id");
String pass = request.getParameter("pass");

%>

폼에서 가져온 ID : <%=id %><br>
폼에서 가져온 비밀번호 : <%=pass %><br>

<%

//디비에 저장된 아이디 비밀번호
String dbId="kim";
String dbPass="p123";

%>
디비에 저장된 ID : <%=dbId %><br>
디비에 저장된 비밀번호 : <%=dbPass %><br>

<%
	if(id.equals(dbId)){
		out.print("아이디 일치");
		 if(pass.equals(dbPass)){
			 out.print("<br>비번일치 일치");
			 session.setAttribute("id", id);
			 session.setAttribute("pass", pass);
			 %>
			 <script type="text/javascript">
				alert("이동");
				location.href="sessionMain.jsp";
			</script>
			 <%
		 }else{
			 
			 
		 }
	}
	else{
		out.print("아이디 불일치");
	}

%>
 




</body>
</html>