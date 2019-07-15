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
<h1>jsp3/updatePro.jsp</h1>
<%
//post방식일때 request 한글 처리 getParameten하기전에 처리
request.setCharacterEncoding("utf-8");
//String num = request.getParameter("num");

String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
if(num == null){
	response.sendRedirect("list.jsp");
	num ="1";
}

String pass = request.getParameter("pass");

BoardBean bb = new BoardBean();
bb.setNum(Integer.parseInt(num));
bb.setPass(pass);

BoardDAO bd = new BoardDAO();

// 해당 글 비밀번호가 맞는지 확인
int result = bd.boardCheckPass(bb);

// 비밀번호가 맞으면 삭제
if(result==1){
	//삭제
	result = bd.deleteBoard(bb);
	if(result==1){
		//업데이트가 성공이면 이동
		//response.sendRedirect("content.jsp?num="+num);
		%>
		<script type="text/javascript">
		alert("글삭제완료.");
		location.href ="list.jsp?pageNum="<%=pageNum%>;
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("오류발생.");
		history.back();
		</script>
		<%
	}
}
//비밀번호 틀림
else if(result==0){
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
	alert("실패하였습니다.");
	//location.href ="loginForm.jsp";
	history.back();
	</script>
	<%
}

%>

</body>
</html>
