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

String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}

//1단계 : 설치한 JDBC 프로그램에서 디비연결할 드라이버 불러오기
//: com폴더 mysql폴더 jdbc폴더 Driver.class

Class.forName("com.mysql.jdbc.Driver");
//2단계 : 불러온 드라이버를 이용해서 디비연결
//(디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
String dburl = "jdbc:mysql://scoop99.asuscomm.com:3306/jspdb5";
String dbuser = "jspid";
String dbPass="jsppass";


Connection  con=DriverManager.getConnection(dburl, dbuser, dbPass);
//3단계 : 연결정보를 이용하여 sql(insert)문을 만들고 실행할수 잇는 객체 생성
//Statement, PreparedStatement, CallableStatement
//String sql = " select * from student where num = ? and name = ?"; //Statement 형태

String sql = " select * from member where id = ? "; //Statement 형태

PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id); //첫째물음표, 값



//4단계 : sql 구분 실행 (insert, update, delete)
//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
ResultSet rs = pstmt.executeQuery();


String pass="";
String name="";
String sex="";
String age="";
String email="";
//String reg_date="";

if(rs.next()){
	
	//out.print("아이디 : " + rs.getString("id")+"<br>");
	pass = rs.getString("pass");
	name = rs.getString("name");
	
	sex = rs.getString("sex");
	age = rs.getString("age");
	email = rs.getString("email");
	//reg_date = rs.getString("reg_date");
	
	
}
if(sex==null){
	sex="1";
}
%>
<script type="text/javascript">
function chk() {
	return true;	
	
	if(document.fr.pass.value == <%=pass%>){
		return true;	
	}
	else{
		alert("비밀번호가 틀립니다.");
		return false;
	}
}
//document.fr.sex[0].checked = true;
//alert(document.fr.sex[0].checked);



<%-- if(<%=sex%> == "2"){
	document.fr.sex[1].checked = true;
}
else{
	document.fr.sex[0].checked= true;
} --%>


</script>
<h1>jsp4/updateForm.jsp</h1>
<h1>회원수정</h1>
<form action="updatePro.jsp" method="post" name="fr" onsubmit="return chk();">
아이디 : <input type="text" name="id" readonly="readonly" value="<%=id %>"><br>
비밀번호 : <input type="password" name="pass"><br>
수정할 이름 : <input type="text" name="name" value="<%=name %>"><br>
수정할 성별 : 
<%
	if(sex.equals("1")){
		%>
			<input type="radio" name="sex" value="1" checked="checked">남
			<input type="radio" name="sex" value="2">여	
		<%
	}
	else{
		%>
		<input type="radio" name="sex" value="1" >남
		<input type="radio" name="sex" value="2" checked="checked">여	
	<%
	}
%>
<br>
수정할 성별2 :
<input type="radio" name="sex" value="1" 
<%
	if(sex.equals("1")){
	%>checked<%	
	}

%>>남


<input type="radio" name="sex" value="2" 
<%
	if(sex.equals("2")){
	%>checked<%	
	}

%>>여
	
	<br>
수정할 나이 : <input type="text" name="age" value="<%=age %>"><br>
수정할 메일주소 : <input type="text" name="email" value="<%=email %>"><br>

<input type="submit" value="회원수정">
</form>
</body>
</html>