<%@page import="com.dto.MemberDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%
		String pageType = (String) session.getAttribute("page"); 
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String user_email = dto.getUser_email();
		String mesg =  (String)session.getAttribute("mesg");
		if(mesg != null) {
	%>
<script> alert("<%=mesg%>")</script>
<% } 
	session.removeAttribute("mesg");
%>
	<div id="passwdCheckContainer">
		<form id="passwdCheckForm" action="passwdCheckServlet" method="post">
			<div class="logo">로고</div>
			<div class="title">시작하기</div>
			<div class="useremail"><%=user_email %></div>
			<div class="comment">계속하려면 먼저 본인임을 인증하세요.</div>
			<div class="signRow">
				<input type="password" name="user_pw" class="userPasswd" placeholder="비밀번호 입력" />
			<div class="buttonWrap">
				<button type="submit">확인</button>
			</div>
			</div>
		</form>
	</div>
	<script>
	const btn = document.querySelector("button");
	btn.addEventListener('click', (e) => {
	if('<%=pageType%>' === "delete") {
		if(confirm("정말 탈퇴하시겠습니까?") == false) {
			e.preventDefault();
		}
	}
		
	})
	</script>
</body>
</html>