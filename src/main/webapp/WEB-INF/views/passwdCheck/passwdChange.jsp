<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="regExpPw" value="^\S(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,15}$"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div id="passwdChangeContainer">
		<form id="passwdChangeForm" action="passwdChange" method="post">
			<div class="logo">로고</div>
			<div class="title">비밀번호 변경</div>
			<div class="comment">변경할 비밀번호를 입력하세요</div>
			<div class="signRow">
				<input type="password" name="new_pw" class="userPasswd1"
					   placeholder="비밀번호(공백을 제외한 영문, 숫자 혹은 특수문자 2가지 조합 8~15자)"
					   pattern="${regExpPw}" title="공백을 제외한 영문, 숫자, 특수문자 2가지 조합 8~15자"/>
			</div>
			<div class="signRow">
				<input type="password" name="new_pw2" class="userPasswd2"
					placeholder="비밀번호 입력" />
			</div>
			<div class="pwCheck"></div>
			<div class="buttonWrap">
				<button type="submit">확인</button>
			</div>
			<input type="hidden" name="user_email" value="${user_email}">
		</form>
	</div>
	<script>
		const pw1 = document.querySelector(".userPasswd1");
		const pw2 = document.querySelector(".userPasswd2");
		const pwCheck = document.querySelector(".pwCheck");
		const btn = document.querySelector("button");
		
		let mesg = "";
		pw2.addEventListener("keyup", () => {
			if(pw1.value !== pw2.value) {
				mesg = "비밀번호가 일치하지 않습니다.";
			} else if(pw1.value === pw2.value){
				mesg = "비밀번호가 일치합니다.";
			};
			pwCheck.innerText = mesg;
		});
		
		btn.addEventListener("click", (e) => {
			if(pwCheck.innerText === "비밀번호가 일치하지 않습니다.") {
				alert("비밀번호를 확인해주세요.");
				pw2.value = null;
				pw2.focus();
				e.preventDefault();
			};
		});
	</script>
</body>
</html>
