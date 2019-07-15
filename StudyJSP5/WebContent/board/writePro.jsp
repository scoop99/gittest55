<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.Date"%>
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
// 한글처리
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");
// id, pass, name request에 저장된 파라미터 가져와서 변수 저장
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
//Date reg_date = new Date(System.currentTimeMillis());
int readcont = 0;
//int num =2;

// 패키지  board
BoardBean bb = new BoardBean();
//bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcont(readcont);
//bb.setReg_date(reg_date);

%>



<%
// 자바디비작업 패키지 member 파일이름 MomberDAO
BoardDAO bd = new BoardDAO();

/* out.print(bd.boardCount());
bd.insertBoard(bb); */

if(bd.insertBoard(bb)==1){
%>
<h1>board/writePro.jps</h1>
<script type="text/javascript">
	alert("작성완료");
	location.href ="list.jsp";
</script>
<%
}

%>
<script type="text/javascript">
	alert("작성실패");
	location.href ="list.jsp";
</script>


</body>
</html>