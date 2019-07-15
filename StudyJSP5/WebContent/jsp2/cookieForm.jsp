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

Cookie[] cookies = request.getCookies();
String language="";

if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("clang")){
			language = cookies[i].getValue();
		}
		
	}
}



if(language.equals("")){
	language="korea";
}
out.print(language);


%>
<% 
	if(language.equals("korea")){
	
		%>
			<h2>안녕하세요 이것은 쿠키 예제 입니다.</h2>		
		<%
		
	}
	else
	{
		%>
			<h2>Hello, This is Cooke example.</h2>
		<%
	}
	
	
	%>




<h1>jsp2/cookieForm.jsp</h1>
<form action="cookiePro.jsp" method="post" name="fr">
<input type="radio" name="lang" value="korea"
<%
	if(language.equals("korea")){
		%>
			checked
		<%
	}
%>
>한국어페이지 보기
<input type="radio" name="lang" value="english"
<%
	if(language.equals("english")){
		%>
			checked
		<%
	}
%>
>영어페이지 보기
<br>
<input type="submit" value="언어설정">
</form>
</body>
</html>