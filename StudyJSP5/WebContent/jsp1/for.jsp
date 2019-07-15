<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jsp1/for.jsp</h3>
arr[0] = java<br>
arr[1] = jsp<br>
arr[2] = html<br>
arr[3] = oracle<br>


=======println으로 출력==========<br>
<%
//배열변수 arr 
String[] arr = {"java","jsp","html","oracle"};
for(int i=0;i<arr.length;i++){
	out.println("arr["+i+"] = " + arr[i]+"<br>");
}

%>
=====%로 출력==========<br>
<%
//배열변수 arr 
String[] arr2 = {"java","jsp","html","oracle"};
for(int i=0;i<arr2.length;i++){
	%>
	arr2[<%=i %>]= <%=arr2[i] %><br>
	<%
}

%>
=====출력==========<br>
<table border="1">
<tr><td>번호</td><td>과목</td></tr>
<tr><td>0</td><td>java</td></tr>
<tr><td>1</td><td>jsp</td></tr>
<tr><td>2</td><td>html</td></tr>
<tr><td>3</td><td>oracle</td></tr>
</table>

=====table로 출력==========<br>
<table border="1">
<tr><td>번호</td><td>과목</td></tr>
<%
for(int i=0;i<arr.length;i++){
	%><tr><td><%=i%></td><td><%=arr[i]%></td></tr><%
}
%>
</table>
</body>
</html>

























