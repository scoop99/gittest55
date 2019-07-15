<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
/* String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
} */

String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
if(num == null){
	response.sendRedirect("list.jsp");
	num="1";
}
BoardBean bb = new BoardBean();


bb.setNum(Integer.parseInt(num));
BoardDAO bd = new BoardDAO();

//조회수 증가
bd.updateReadcont(bb);

//해당 게시판 글 내용 가져 오기
bb = bd.getBoard(bb);


%>
<form action="edit.jsp" method="post" name="fr">
<table border="1">
	<tr>
		<td>글번호</td>
		<td><%=bb.getNum() %></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><%=bb.getName() %></td>
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
		<td><%=bb.getSubject() %></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %></a>
			
		</td>
	</tr>
	
	
	<tr>
		<td>글내용</td>
		<td><%=bb.getContent() %>
		<img src="../upload/<%=bb.getFile() %>" width="100" height="100">
		
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
		<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
		<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
		</td>
<!-- 		<td><input type="submit" value="글수정"></td> -->
	</tr>
</table>
</form>



</body>
</html>