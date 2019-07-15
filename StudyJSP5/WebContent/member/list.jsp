<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("loginForm.jsp");
}
else{
	if(!id.equals("admin")){
		response.sendRedirect("main.jsp");
	}	
}

//자바 API 배열행태의 컬렉션 자료형
List list = new ArrayList();
list.add("일");
list.add("이");
list.add("3");
out.print(list.size());

for(int i=0;i<list.size();i++){
	out.print(list.get(i)+"<br>");
}

List memberList = new ArrayList();
// 한사람의 정보 id, pass, name
MemberBean bm1 = new MemberBean();
bm1.setId("admin");
bm1.setName("김딜동");
bm1.setPass("1111");
memberList.add(bm1);

MemberBean bm2 = new MemberBean();
bm2.setId("admin2");
bm2.setName("김딜동");
bm2.setPass("1111");
memberList.add(bm2);

MemberBean bm3 = new MemberBean();
bm3.setId("admin3");
bm3.setName("김딜동");
bm3.setPass("1111");
memberList.add(bm3);


out.print(memberList.size()+"<br>");

for(int i=0;i<memberList.size();i++){
	
	MemberBean bm = (MemberBean)memberList.get(i);
	out.print(bm.getId()+"<br>");
}

//MemberDAO 객체 생성
MemberDAO md = new MemberDAO();


ResultSet rs = md.lisetMember();

memberList = new ArrayList();
memberList = md.getMamberList();

%>
<%-- 
<table border="1">
<tr>
	<td>아이디</td>
	<td>비밀번호</td>
	<td>이름</td>
	<td>가입날짜</td>
</tr>
<%
while(rs.next()){
	%>
	<tr>
	<td>
		<%=rs.getString("id")%>
		
	</td>
	<td>
		<%=rs.getString("pass") %>
	</td>
	<td>
		<%=rs.getString("name") %>
	</td>
	<td>
		<%=rs.getString("reg_date") %>
	</td>
</tr>
	
	<%	
}

%>
 </table>
 --%>


<table border="1">
<tr>
	<td>아이디</td>
	<td>비밀번호</td>
	<td>이름</td>
	<td>가입날짜</td>
</tr>
<%
for(int i=0;i<memberList.size();i++){
	MemberBean bm = (MemberBean)memberList.get(i);
%>
	<tr>
		<td>
			<%=bm.getId()%>
		</td>
		<td>
			<%=bm.getPass() %>
		</td>
		<td>
			<%=bm.getName() %>
		</td>
		<td>
			<%=bm.getReg_date() %>
		</td>
	</tr>
<%
}%>
</table>
</body>
</html>




























