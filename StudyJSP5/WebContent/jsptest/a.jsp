<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<h1>jsptest/a.jsp</h1>
<!--  html 주석 -->
<%-- jsp주석 --%>

<%
//http://localhost:8080/StudyJSP5/jsptest/
//a.jsp?
//txtJo1=111111&txtJo2=1111111&txtId=1111&txtPass=1111&txPassRe=1111&txtEmail=1&txTel=1111&txHp=&txtAddrNo1=&txtAddrNo2=&txAddr1=&txAddr2=&ssl=1
//여러줄 주석 java주석

//request(jsp 내장 객체) 기억장소 저장 : 요청 정보를 저장하는 내장객체
//내장객체.함수() 내장객체.변수
//request기억장소안에 저장되어 있는 태그이름(파라미터이름)=값을 가져오는 함수
//request.getParameter("파라미터이름=태그이름");

out.println("아이디 : "+ request.getParameter("txtId")+"<br>");


String sid= request.getParameter("txtId");


%>
아이디 : <%=sid %>
<br>
이름 <%=request.getParameter("txtName") %>
<br>
주민등록번호  <%=request.getParameter("txtJo1") %> -<%=request.getParameter("txtJo2") %> 
<br>
회원ID <%=request.getParameter("txtId") %>
<br>
비밀번호 <%=request.getParameter("txtPass") %>
<br>
비밀번호확인 <%=request.getParameter("txPassRe") %>
<br>
E-mail <%=request.getParameter("txtEmail") %>
<br>
전화번호 <%=request.getParameter("txTel") %> 
<br>
핸드폰번호 <%=request.getParameter("txHp") %>
<br>
우편번호 <%=request.getParameter("txtAddrNo1") %> <%=request.getParameter("txtAddrNo2") %>
<br>
<%=request.getParameter("txAddr1") %>
<br> 
상세주소 <%=request.getParameter("txAddr2") %>
<br>
회원분류 <%=request.getParameter("ssl") %>

</body>
</html>




































