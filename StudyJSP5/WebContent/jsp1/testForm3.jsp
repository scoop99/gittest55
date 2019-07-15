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
<h3>jsp1/testForm3.jsp</h3>
<form action="testPro3.jsp" method="get" name="fr">
이름 : <input type="text" name="name" id="name" > <br>
좋아하는 숫자 : <input type="text" name="num" id="num" ><br>
성별 : <input type="radio" name="gen" value="남">남자
		<input type="radio" name="gen" value="여">여자
	<br>
취미 : <input type="checkbox" name="hob" value="여행">여행
		<input type="checkbox" name="hob" value="독서">독서
		<input type="checkbox" name="hob" value="게임">게임
		<br>
자기소개 : <textarea name="intro" rows="10" cols="20"></textarea><br>	
학년 : 
	<select name="har">
		<option value="">학년을선택하세요</option>
		<option value="1">1학년</option>
		<option value="2">2학년</option>
		<option value="3">3학년</option>
	</select> 
<input type="submit" value="submit 전송">
</form>
</body>
</html>