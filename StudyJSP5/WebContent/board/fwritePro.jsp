<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
//request.setCharacterEncoding("utf-8");
// id, pass, name request에 저장된 파라미터 가져와서 변수 저장
// 파일업로드 cos.jar 설치
// MultipartRequest mulit = new MultipartRequest(request,업로드할 폴더경로, 최대 파일 크기, 한글처리, 동일파일이름 처리);
String uploadPath = request.getRealPath("/upload");
int maxSize=5*1024*1025;//5M

MultipartRequest mulit = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

String name = mulit.getParameter("name");
String pass = mulit.getParameter("pass");
String subject = mulit.getParameter("subject");
String content = mulit.getParameter("content");
String file = mulit.getFilesystemName("file");


System.out.println(uploadPath);
System.out.println(file);




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
bb.setFile(file);
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