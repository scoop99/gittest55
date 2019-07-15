<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="col.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col2%>">
<h1>jsp2/includeMain.jsp</h1>
<table border="1">
<tr>
	<td colspan="2" height="100">
		<jsp:include page="top.jsp">
			<jsp:param value="park" name="id"/>
		</jsp:include>
	</td>
</tr>
<tr>
	<td width="100" height="600">왼쪽매뉴
		<jsp:include page="left.jsp"></jsp:include>
	</td>
	<td width="600">
		본문
	</td>
</tr>
<tr>
	<td colspan="2" height="100">
	카피라이터
	<jsp:include page="bottom.jsp"></jsp:include>
	</td>
</tr>
</table>








</body>
</html>