<%@page import="code.CodeDAO"%>
<%@page import="code.CodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<title>list</title>
</head>
<body>
<%
/* String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}
else{
	if(!id.equals("admin")){
		response.sendRedirect("main.jsp");
	}	
}
 */


//MemberDAO 객체 생성
BoardDAO bd = new BoardDAO();
 


//게시판 전체 글 개수
int count = bd.getBoardCount();
// 한 페이지에 보여줄 글개수
int pageSize=2;

//현페이지 번호
String pageNum=request.getParameter("pageNum");

//페이지번호가 없으면 "1" 설정
if(pageNum==null){
	pageNum="1";
}

int currentPage = Integer.parseInt(pageNum);
//시작하는 행번호 구하기 - * + 
// currentPage pageSize 조합 ->  시작하는 행번호
int strtRow = (currentPage -1)*pageSize +1;

// 끝나는 행번호 구하기 1페이지 10 2페이지 20 3페이지 30
int endRow = currentPage*pageSize;


//자바 API 배열행태의 컬렉션 자료형
//리스트 출력
List boardList = new ArrayList();

if(count!=0){
	boardList = bd.getBoradList(strtRow,pageSize);	
}
else{
	
}




CodeDAO cd = new CodeDAO();

CodeBean cb = new CodeBean();
cb.setCodeDiv("a");
cb.setCode("b");
cb.setCodeName("코드이름");

cd.insertCode(cb);




%>

<table border="1">
<tr>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>조회수</td>
	<td>작성일</td>
</tr>
<%
if(count!=0){
for(int i=0;i<boardList.size();i++){
	BoardBean bb = (BoardBean)boardList.get(i);
	%>
		<tr>
			<td>
				<input type="checkbox" name="delCheck" value="<%=bb.getNum()%>">
			</td>
			<td>
				<%=bb.getNum()%>
			</td>
			<td>
			<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
			<%=bb.getSubject() %>
			</a>
				
			</td>
			<td>
				<%=bb.getName() %>
			</td>
			<td>
				<%=bb.getReadcont() %>
			</td>
			<td>
				<%=bb.getReg_date() %>
			</td>
		</tr>
	<%
	}
}%>
</table><br>
전체글의 개수 <%=count %>
<br>
<%
	if(count!=0){
		//전체 페이지 수 구하기
		int pageCount = count % pageSize == 0 ? count / pageSize : count / pageSize+1;
		/* int pageCount;
		if(count % pageSize==0){
			pageCount = count / pageSize;
		}
		else{
			pageCount = count / pageSize+1;
		} */
			
		
		// 한화면에 보여줄 페이지 개수 설정
		int pageBlock = 2;
		
		// 한화면에 보여줄 시작페이지번호 구하기
		// 현페이지 번호 1~10 -> 1 11~20 -> 11
		// currentPage pageBlock ->  한화면에 보여줄 시작페이지번호
		//  1 ~ 10       10      -> 1
		//  11 ~ 20      10      -> 11
		//  21 ~ 30      10      -> 21
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		// 한화면에 보여줄 끝페이지번호 구하기
		int endPage;
		endPage = startPage + pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > pageBlock){
			%>
			<a href="list.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
			
			<%
			}
		
		
		// 한화면에 보여줄 시작페이지번호 구하기
		for(int i=startPage;i<=endPage;i++){
			%>
			<a href="list.jsp?pageNum=<%=i %>"><%=i %></a> 
			<%
		}
		
		if(endPage < pageCount){
		%>
		<a href="list.jsp?pageNum=<%=endPage+pageBlock-1 %>">[다음]</a>
		
		<%
		}
		
	}
%>
<br>


 
<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
</body>
</html>




























