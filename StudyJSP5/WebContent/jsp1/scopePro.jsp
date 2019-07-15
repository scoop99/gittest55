<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/scopePro.jsp</h3>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

pageContext.setAttribute("page", "pageContext");
request.setAttribute("req", "request Value");
session.setAttribute("ses", "session");
application.setAttribute("app", "application");

%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext : <%=pageContext.getAttribute("page") %><br>
request : <%=request.getAttribute("req") %><br>
session : <%=session.getAttribute("ses") %><br>
application : <%=application.getAttribute("app") %><br>



<a href="scopeProPro.jsp?id=<%=id %>&pass=<%= pass%>">scopeProPro 이동</a>
<script type="text/javascript">
<%-- alert("이동");
location.href="scopeProPro.jsp?id=<%=id %>&pass=<%= pass%>"; --%>

</script>
<%
//response.sendRedirect("scopeProPro.jsp?id="+id+"&pass="+pass);
%>


<!-- forward 이동 방식
1. 주소줄 A주소로 보임 -> 실행화면 B페이지보임
2. A페이지에 request정보를 가지고 있음 -->
<jsp:forward page="scopeProPro.jsp">
	<jsp:param value="111" name="age"/>
</jsp:forward>


</body>
</html>

























