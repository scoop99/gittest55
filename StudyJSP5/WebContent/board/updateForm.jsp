<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
/* String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
} */

String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
if(num == null){
	response.sendRedirect("list.jsp");
	num ="1";
}

BoardBean bb = new BoardBean();
bb.setNum(Integer.parseInt(num));

BoardDAO bd = new BoardDAO();


bb = bd.getBoard(bb);


%>
<form action="updateFormPro.jsp?pageNum=<%=pageNum%>" method="post" name="fr">
<input type="hidden" name="num" value="<%=bb.getNum() %>">
<table border="1">

	<%-- <tr>
		<td>글번호</td>
		<td><%=bb.getNum() %></td>
	</tr> --%>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="name" value="<%=bb.getName() %>">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%=bb.getReadcont() %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%=bb.getReg_date() %></td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="subject" value="<%=bb.getSubject() %>">
		</td>
	</tr>
	
	<tr>
		<td>글내용</td>
		<td>
		<textarea rows="10" cols="20" name="content"><%=bb.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<td><input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
		<td><input type="submit" value="글수정"></td>
	</tr>
</table>
</form>



</body>
</html>

















