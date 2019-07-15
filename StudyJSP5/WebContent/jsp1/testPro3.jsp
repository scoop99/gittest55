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
//request 사용전에 한글처리
request.setCharacterEncoding("utf-8");

//request : 서버에 기억장소 자동생성 요청정보 저장 내장객체(기억장소)
//request.getParameter("파라미터이름,태그이름") => String 형
String name = request.getParameter("name");
String gen = request.getParameter("gen");
//String hob = request.getParameter("hob");
String[] hob = request.getParameterValues("hob");
String hob2="";


if(hob!=null){
	for(int i=0;i<hob.length;i++){
		if(hob2==""){
			hob2 += hob[i];
		}
		else{
			hob2 += ","+hob[i];	
		}	
}

	
	

}

String har = request.getParameter("har");

String intro = request.getParameter("intro");
int num = Integer.parseInt(request.getParameter("num"));
%>

이름 : <%=name %><br>
좋아하는 숫자 :<%=num %><br>
성별 : <%=gen %><br>
취미 : <%=hob2 %><br>
취미2 : 
<%
if(hob!=null){
	for(int i=0;i<hob.length;i++){
		out.println(hob[i]);
	}	
}

	
%><br>

자기소개 :<%=intro %><br>
학년 : <%=har %><br>
</body>
</html>