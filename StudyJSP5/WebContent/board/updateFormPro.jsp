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
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String name = request.getParameter("name");


BoardBean bb = new BoardBean();
bb.setNum(Integer.parseInt(num));
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setName(name);


BoardDAO bd = new BoardDAO();

// 해당 글 비밀번호가 맞는지 확인
int result = bd.boardCheckPass(bb);

// 비밀번호가 맞으면 업데이트
if(result==1){
	//업데이트
	result = bd.updateBoard(bb);
	if(result==1){
		//업데이트가 성공이면 이동
		//response.sendRedirect("content.jsp?num="+num);
		%>
		<script type="text/javascript">
		alert("글수정완료.");
		location.href ="content.jsp?num=<%=num%>"+&pageNum="<%=pageNum%>;
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




/*
내방법

//3단계 : 연결정보를 이용하여 sql(update)문을 만들고 실행할수 잇는 객체 생성
// Statement, PreparedStatement, CallableStatement
sql = "update member set name = ? where  id = ? and pass = ?"; //Statement 형태

pstmt = con.prepareStatement(sql);

pstmt.setString(1, name); //첫번째 물음표 값
pstmt.setString(2, id); //두번째물음표, 값
pstmt.setString(3, pass); //두번째물음표, 값

//4단계 : sql 구분 실행 (insert, update, delete)
pstmt.executeUpdate();

*/
%>


<!-- 내방법
<script type="text/javascript">
alert("수정성공");
location.href ="info.jsp";
</script> -->
</body>
</html>